#!/bin/bash

# Configuration
CONFIG_FILE="../config/agents.conf"
SOURCE_AGENTS_MD="../templates/AGENTS.md"
SOURCE_SKILLS_DIR="../templates/skills"

# Get the absolute path of the script directory to ensure relative paths work
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file not found at $CONFIG_FILE"
    exit 1
fi

# Parse Global Settings
# Extract USE_CHEZMOI value, default to false if not found
USE_CHEZMOI=$(grep "^USE_CHEZMOI=" "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
if [[ "$USE_CHEZMOI" != "true" ]]; then
    USE_CHEZMOI="false"
fi

echo "Starting deployment of agent configurations..."
echo "Chezmoi Integration: $USE_CHEZMOI"

# Read config file line by line
while IFS='|' read -r agent_name target_agents_md target_skills_dir || [ -n "$agent_name" ]; do
    # Skip comments, empty lines, and setting lines
    [[ "$agent_name" =~ ^#.*$ ]] && continue
    [[ "$agent_name" =~ ^USE_CHEZMOI=.*$ ]] && continue
    [[ -z "$agent_name" ]] && continue

    echo "---------------------------------------------------"
    echo "Processing Agent: $agent_name"

    # Expand tilde in paths
    # Note: eval is used here to expand ~ safely for the current user.
    # We check if variables are set before eval to avoid evaling empty strings which might be harmless but messy.
    
    # 1. Update AGENTS.md
    if [ -n "$target_agents_md" ]; then
        eval target_agents_md="$target_agents_md"
        echo "  -> Updating AGENTS.md at $target_agents_md"
        
        # Ensure parent directory exists (optional but good practice)
        agent_dir=$(dirname "$target_agents_md")
        if [ ! -d "$agent_dir" ]; then
            echo "     [INFO] Parent directory $agent_dir does not exist. Creating..."
            mkdir -p "$agent_dir"
        fi

        should_copy=true
        if [ -f "$target_agents_md" ]; then
            # Check for differences
            if diff "$target_agents_md" "$SOURCE_AGENTS_MD" > /dev/null; then
                echo "     [SKIP] Files are identical."
                should_copy=false
            else
                echo "     [DIFF] Changes detected in AGENTS.md"
            fi
        else
            echo "     [NEW] Target file does not exist. Will create."
        fi

        if [ "$should_copy" = "true" ]; then
            cp "$SOURCE_AGENTS_MD" "$target_agents_md"
            if [ $? -eq 0 ]; then
                echo "     [OK] Copied AGENTS.md"
                # Add to chezmoi if enabled
                if [ "$USE_CHEZMOI" = "true" ]; then
                    if command -v chezmoi &> /dev/null; then
                        chezmoi add "$target_agents_md"
                        echo "     [OK] Added to chezmoi"
                    else
                        echo "     [WARN] chezmoi not found, skipping 'chezmoi add'"
                    fi
                fi
            else
                echo "     [ERROR] Failed to copy AGENTS.md"
            fi
        fi
    else
        echo "  -> Skipping AGENTS.md (not configured)"
    fi

    # 2. Update Skills
    if [ -n "$target_skills_dir" ]; then
        eval target_skills_dir="$target_skills_dir"
        echo "  -> Updating Skills in $target_skills_dir"
        
        # Create directory if it doesn't exist
        if [ ! -d "$target_skills_dir" ]; then
            echo "     [INFO] Directory does not exist. Creating: $target_skills_dir"
            mkdir -p "$target_skills_dir"
        fi

        if [ -d "$target_skills_dir" ]; then
            # Iterate over each skill in the source template directory
            # We assume subdirectories in templates/skills correspond to individual skills
            for source_skill_path in "$SOURCE_SKILLS_DIR"/*; do
                if [ -d "$source_skill_path" ]; then
                    skill_name=$(basename "$source_skill_path")
                    target_skill_path="$target_skills_dir/$skill_name"
                    should_copy_skill=true

                    if [ -d "$target_skill_path" ]; then
                        # Compare specific skill directory
                        if diff -qr "$target_skill_path" "$source_skill_path" > /dev/null 2>&1; then
                            echo "     [SKIP] Skill '$skill_name' is identical."
                            should_copy_skill=false
                        else
                            echo "     [DIFF] Changes detected in skill '$skill_name'"
                        fi
                    else
                        echo "     [NEW]  Skill '$skill_name' does not exist in target. Will create."
                    fi

                    if [ "$should_copy_skill" = "true" ]; then
                        # Copy specific skill directory
                        # cp -R source_dir target_parent/ copies source_dir into target_parent/source_dir
                        cp -R "$source_skill_path" "$target_skills_dir/"
                        
                        if [ $? -eq 0 ]; then
                            echo "     [OK]   Copied skill '$skill_name'"
                            # Add to chezmoi if enabled
                            if [ "$USE_CHEZMOI" = "true" ]; then
                                if command -v chezmoi &> /dev/null; then
                                    chezmoi add "$target_skill_path"
                                    echo "     [OK]   Added '$skill_name' to chezmoi"
                                else
                                    echo "     [WARN] chezmoi not found, skipping 'chezmoi add'"
                                fi
                            fi
                        else
                            echo "     [ERROR] Failed to copy skill '$skill_name'"
                        fi
                    fi
                fi
            done
        else
             echo "     [ERROR] Failed to create target directory $target_skills_dir"
        fi
    else
        echo "  -> Skipping Skills (not configured)"
    fi

done < "$CONFIG_FILE"

echo "---------------------------------------------------"
echo "Deployment complete."
# Populate Coding Agents Config

This utility centralizes and automates the management of configuration files (`AGENTS.md` and skills) for various coding agent CLIs. It allows you to maintain a single source of truth for your agent configurations and automatically distributes them to the correct locations. It can optionally sync these changes with `chezmoi`.

## Key Features

- **Centralized Management**: Maintain one `AGENTS.md` and one set of skills for all your agents.
- **Smart Diffing**: The script compares source and target files before copying. It only updates files that have actually changed, preserving timestamps and reducing unnecessary operations.
- **Granular Skill Updates**: Skills are managed at the subdirectory level. If you have multiple skills in your target directory, the script will only update the ones present in your templates, leaving others untouched.
- **Chezmoi Integration**: Automatically runs `chezmoi add` on updated files to keep your dotfiles in sync.

## Project Structure

- **`config/`**: Contains the configuration mapping file.
    - `agents.conf`: Defines global settings and where the configuration files should be deployed for each agent.
- **`templates/`**: Source of truth for your configuration files.
    - `AGENTS.md`: The master agents configuration file.
    - `skills/`: Directory containing your master skill markdown files. Subdirectories are supported and will be copied recursively.
- **`scripts/`**: Contains the automation scripts.
    - `deploy.sh`: The main script that reads the config, copies files to target locations, and optionally adds them to `chezmoi`.

## Configuration

The configuration is managed in `config/agents.conf`.

### Global Settings
You can control whether `chezmoi` is invoked using the `USE_CHEZMOI` variable at the top of the file:

```properties
USE_CHEZMOI=true
```
Set to `false` to disable `chezmoi` integration.

### Agent Mapping
Each subsequent line represents a target agent configuration in the following format:

```text
AgentName|Target AGENTS.md Path|Target Skills Directory Path
```

- **AgentName**: Identifier for the agent (logging only).
- **Target AGENTS.md Path**: Absolute path (supports `~`) to the agent's specific configuration file. Leave empty to skip.
- **Target Skills Directory Path**: Absolute path (supports `~`) to the agent's skills directory. Leave empty to skip.

**Examples:**
```text
# Full configuration
Gemini|~/.gemini/AGENTS.md|~/.gemini/skills/

# Config only, no skills
droid|~/.config/AGENTS.md|

# Skills only, no config
CustomAgent||~/.custom/skills/
```

Lines starting with `#` are treated as comments.

## Usage

1.  **Populate Templates**:
    - Edit `templates/AGENTS.md` with your desired global agents configuration.
    - Add your skill markdown files to `templates/skills/`. You can organize them into subfolders.

2.  **Configure Targets**:
    - Specify your agents and their config paths in `config/agents.conf`.

3.  **Run Deployment**:
    Execute the deployment script to copy the files.

    ```bash
    ./scripts/deploy.sh
    ```

    **Note:** The script uses `eval` to expand tilde (`~`) paths in your configuration file. Ensure your paths are safe.

## Prerequisites

- **Bash**: The script is written in Bash and compatible with macOS and Linux.
- **chezmoi**: (Optional) If `USE_CHEZMOI=true`, the script attempts to run `chezmoi add` on the updated files/directories.
# Repository Guidelines

This repository centralizes and deploys coding-agent configuration files and skills to target locations. It is a small Bash-based utility with templates stored in-repo.

## Project Structure & Module Organization

- `config/agents.conf`: Mapping of agent names to target `AGENTS.md` and skills directories.
- `templates/AGENTS.md`: Source-of-truth agent configuration content.
- `templates/skills/`: Master skill directories copied to agent skill locations.
- `scripts/deploy.sh`: Main deployment script (copy + optional `chezmoi add`).
- `README.md`: User-facing overview and usage notes.

## Build, Test, and Development Commands

- `./scripts/deploy.sh`: Deploys templates to targets defined in `config/agents.conf`.
  - Example: `./scripts/deploy.sh`
- No build system or test runner is configured for this repository.

## Coding Style & Naming Conventions

- Shell scripts should be POSIX-compatible where practical and remain readable.
- Use simple, explicit logic; avoid clever constructs.
- Configuration file format: `AgentName|Target AGENTS.md Path|Target Skills Directory Path`.
  - Example: `Gemini|~/.gemini/AGENTS.md|~/.gemini/skills/`

## Testing Guidelines

- No automated tests are currently defined.
- Validate changes manually by running `./scripts/deploy.sh` and confirming file updates.

## Commit & Pull Request Guidelines

- Use Conventional Commits: `feat|fix|refactor|build|ci|chore|docs|style|perf|test|revert`.
  - Example: `docs: update deployment instructions`
- Pull requests should include:
  - A concise description of the change.
  - Any relevant command output or before/after notes.
  - Linked issues if applicable.

## Security & Configuration Tips

- `scripts/deploy.sh` uses `eval` to expand `~` in paths; only use trusted values in `config/agents.conf`.
- Keep target paths explicit and avoid shell metacharacters.

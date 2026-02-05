---
name: shell-script-builder
description: Build or modify portable Bash/Zsh scripts, installers, and shell-config hooks. Use when the user asks for shell scripts, login/greeting scripts, installer scripts, or shell-compatibility fixes.
---

# Shell Script Builder

## Overview
Create cross-shell scripts that are safe, idempotent, and clear in their output.

## Required Inputs
- Target shells (Bash, Zsh, or POSIX sh).
- OS constraints and required tools.
- Install locations and config files to modify.
- Whether the script should be non-interactive.

## Workflow
1. Confirm compatibility constraints.
   - Prefer POSIX-compatible syntax when possible.
   - Avoid arrays and bashisms unless explicitly allowed.
2. Design idempotence and safety.
   - Use `command -v` for existence checks.
   - Guard file edits with checks to avoid duplicate lines.
3. Implement predictable output.
   - Use clear status messages and exit codes.
   - For reminder scripts, print literal reminders instead of executing commands.
4. Handle installation steps.
   - Prefer `~/.local/bin` and explicit shell-config edits.
   - Do not modify configs without explicit approval.

## Guardrails
- Keep scripts non-interactive by default unless the user requests otherwise.
- Minimize use of `sudo` and explain when it is required.
- Ensure scripts are safe to run multiple times.

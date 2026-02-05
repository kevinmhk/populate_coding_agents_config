---
name: gh-private-repo-bootstrap
description: Create a private GitHub repository from the current folder, link it as origin, and push the main branch. Use when the user asks to create a private repo, connect remotes, or push main to origin.
---

# GitHub Private Repo Bootstrap

## Overview
Create a private GitHub repo with `gh`, set `origin`, and push `main` with upstream tracking.

## Required Inputs
- Repo name (default to current folder name).
- Visibility (default private).
- Branch name (default `main`).

## Workflow
1. Preflight checks.
   - Run `gh auth status` and confirm authentication.
   - Run `git status` and confirm branch name.
   - Check existing remotes to avoid overwriting.
2. Create repo.
   - Use `gh repo create <name> --private --source . --remote origin`.
3. Push main.
   - `git push -u origin main` (or specified branch).
4. Verify.
   - Show remote URL and tracking status.

## Guardrails
- If `origin` exists, ask before overwriting.
- Do not change visibility unless explicitly requested.
- Do not push if the user has not asked to push.

---
name: git-release-ops
description: Execute safe git release operations, including staging, committing, pushing, tagging, and creating GitHub releases. Use when the user requests stage/commit/push, tags/releases, or release troubleshooting.
---

# Git Release Ops

## Overview
Run a safe, predictable git release workflow with status checks and clear summaries.

## Required Inputs
- Files or paths to stage.
- Commit message (must follow Conventional Commits).
- Whether to push.
- Release version and title (if a release is requested).

## Workflow
1. Inspect repo state.
   - Run `git status` and summarize modified/staged files.
   - If unrelated changes exist, confirm scope before proceeding.
2. Stage changes.
   - Stage only requested files or paths.
   - Reconfirm `git status` and summarize the staged diff.
3. Commit.
   - Use Conventional Commits format.
   - Avoid `git config` changes.
4. Push (only if explicitly requested).
   - Push to the current branch and report results.
5. Tag and release (if requested).
   - Create a `vX.Y.Z` tag.
   - Use `gh release create` with a short title after tagging.

## Guardrails
- Never stage, commit, or push unless explicitly instructed.
- Summarize staged changes before committing.
- Avoid destructive commands (reset/force-push) unless the user explicitly asks.

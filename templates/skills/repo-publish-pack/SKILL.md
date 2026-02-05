---
name: repo-publish-pack
description: Prepare a repository for public release by creating or updating AGENTS.md, README.md, LICENSE, and .gitignore, and optionally initializing git, creating a GitHub repo with gh, and tagging a release. Use when the user asks to publish, make public, create repo docs, add a license, set up a GitHub repo, or cut a release.
---

# Repo Publish Pack

## Overview
Prepare a repo for publishing with consistent docs, licensing, ignore rules, and optional GitHub setup.

## Required Inputs
- Repo name and desired visibility (default to private unless explicitly public).
- License choice (default to MIT unless explicitly overridden).
- README scope (at minimum: Overview, Install, Usage, License).
- Whether to create a GitHub repo and/or a release tag.

## Workflow
1. Inspect repo state.
   - List top-level files and run `git status` if git exists.
2. Ensure documentation baseline.
   - Create or update `AGENTS.md` and `README.md` (Overview, Install, Usage, License).
   - Add a `LICENSE` file that matches the chosen license.
   - Add or validate `.gitignore` for the stack.
3. Confirm any overwrites.
   - If files already exist, show a brief diff summary and confirm changes.
4. Optional GitHub setup.
   - If requested, create the repo via `gh repo create` with the chosen visibility.
   - Add or verify `origin` remote.
5. Optional release.
   - If requested, tag with `vX.Y.Z` and create a release title.
   - Use `gh release create` after the tag exists.

## Guardrails
- Never stage, commit, or push unless explicitly instructed.
- Summarize staged changes before any commit or push.
- Default to private visibility and MIT unless overridden.
- When asked to create a private GitHub repo and connect `origin`, use the `gh-private-repo-bootstrap` skill.

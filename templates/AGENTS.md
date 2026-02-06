# Purpose
- This file defines global policies and defaults across all repositories
- Operational workflows should be handled via skills when available

# The User's Favorites and Preferences
- IDE: Visual Studio Code
- Editor: nvim, vim, micro
- Language: Python, TypeScript, JavaScript
- Python Linter: ruff
- Python Code Formatter: `ruff format`
- Python Type Checker: ty
- Python Test Runner: Pytest
- JavaScript Runtime: Node.js, Bun
- JavaScript Framework: React, Next.js, Vue.js
- JavaScript Package Manager: npm
- JavaScript Linter: ESLint
- TypeScript Linter: ESLint + typescript-eslint
- TypeScript Type Checker: `tsc -p tsconfig.json --noEmit`
- JavaScript and TypeScript Code Formatter: Prettier
- JavaScript and TypeScript Test Runner: node:test, Vitest, Jest
- CSS Framework: Bootstrap, Tailwind
- Component Library: Ant Design
- CLI Library: Typer
- TUI Library: Bubble Tea
- Backend: Firebase
- Cloud Providers: GCP, AWS
- Deployment: Vercel, Cloudflare Pages
- Cross-Platform UI Framework: Flutter
- Source Control: Git
- Database: SQLite, PostgreSQL, DuckDB, Supabase
- Diagram and Chart: Mermaid
- Web Crawler: Crawlee
- Browser Automation: Playwright, agent-browser

# Global Settings
- Workspace: The global workspace that contains all my projects is located at `~/workspaces`

# Skill Index
- Use `repo-publish-pack` for repo publishing prep (AGENTS/README/LICENSE/.gitignore) and optional release setup
- Use `gh-private-repo-bootstrap` for private GitHub repo creation and `origin` setup
- Use `git-release-ops` for stage/commit/push/tag/release workflows
- Use `shell-script-builder` for Bash/Zsh scripts and installers
- Use `csv-transformer` for CSV transformations and validation
- Use `playwright-link-extractor` for link scraping with Playwright
- Use `flutter-firebase-webapp-bootstrap` for Flutter + Firebase scaffolding
- Use `agent-browser` for browser automation, screenshots, and web extraction
- Use `playwright-cli` for Playwright-based browser automation tasks
- Use `frontend-design` for high-quality frontend UI design and implementation
- Use `pdf` for PDF extraction, edits, and form handling
- Use `create-plan` only when the user explicitly asks for a plan

# Global Defaults
- License: default to `MIT` for public repositories unless explicitly overridden
- README: include `Overview`, `Install`, `Usage`, and `License` sections by default
- GitHub repo visibility: default to private unless the user explicitly requests public
- Releases/tags: use `vX.Y.Z` semantic tags with short release titles

# Tone
In all of your conversations with the user:
- Adopt a formal, professional, serious tone 
- Be direct, concise, precise, safe, factual, and helpful
- Avoid emojis, filler, and casual language

# Decisions and Assumptions
- Make reasonable assumptions when risk is low, but state them explicitly
- For high-risk ambiguity, ask before proceeding
- Record key decisions in docs when they affect behavior or workflow
- Ask for approval before installing or upgrading system/global packages or modifying shell configs
- Proactively install project-local dependencies and dev tooling without asking, using the project package manager or venv; only ask for system/global installs or shell config changes

# General Guiding Principles
The following principles are applicable for all task type and project type:
- Whatever you are being asked to do, first consider and adopt the Latest Industry Standards and Best Practices for the concerned domain, before actually carrying out the task
- Research, think, and plan before you act
- When in doubt, pause and ask the user for details, clarifications, confirmations, and approvals. No question is a stupid question
- **KISS** - Adopt the "Keep it simple, stupid!" principle
- Adopt the **"If it ain't broke, don't fix it"** principle unless changes are required for correctness, tests, security, or requirements

# Software Development Philosophies
The following philosophies are applicable when the task type and project type is software development related:
- Follow the **Spec Driven Development** approach and the **Test Driven Development** approach when applicable
- Follow the **Iterative and Incremental** development model
- Adopt **Progressive Elaboration** during the software development lifecycle
- **Evergreen Documents** - ALL project documentation is a living document (also known as an evergreen document or dynamic document). Proactively propose/carry out updates of any and all relevant documentations during the development lifecycle and tasks
- Update docs when requirements, behavior, interfaces, or operational steps change; keep README/architecture/deploy/usage docs aligned
- Adopt the **Unix philosophy** when design and implementing function/class/module/file/package: **"Do One Thing and Do It Well"**
- Adopt **Defensive programming** during design and implementation
- Whenever applicable, prefer incremental, small changes over big changes
- Avoid clever or complex tricks (syntax or otherwise) that reduce human readability of the source code. Be boring, detailed, obvious, and clear
- Proactively setup Linters, Formatters, Type Checkers, and Test Runners. Follow the Quality Gates order
- Always fix root causes and not just applying band-aid
- Write docstrings for public APIs and comments only for non-obvious logic
- Prefer the **Functional programming** paradigm: implement pure function whenever possible for identical returns with identical arguments, and avoid side effects
- **YAGNI** - Adopt the "You aren't gonna need it" principle
- **DRY** - Adopt the "Don't repeat yourself" principle
- Adopt **Design by contract** (DbC), also known as **contract programming**, **programming by contract** and **design-by-contract programming**
- Adopt **SOLID** when working on object-oriented programming: - Single responsibility principle, Open-closed principle, Liskov substitution principle, Interface segregation principle, and Dependency inversion principle

# Planning and ExecPlans
- Use Checkboxes on Plans written in Markdown for progress tracking
- When writing complex features or significant refactors, use an ExecPlan (as described in ~/.agents/PLANS.md) from design to implementation.
- Try to plan / design / build a Minimum Viable Product (MVP) for internal use as a Proof-of-Concept quickly
- Proactively add a task to Review and Update Project Documentations during each Major Phase when making a Plan

# Execution Loop
- For each assigned task: define acceptance criteria, then write or update tests first where applicable
- Implement the smallest change that satisfies the tests
- Run Quality Gates in order: format → lint → typecheck → test
- Fix failures and repeat until all tests pass
- Update docs and plan checkboxes after each task
- Summarize results and remaining work at each checkpoint

# Quality Gates
- Order: format → lint → typecheck → test
- If a tool is missing, install and configure it locally by default (add minimal config + dev deps). Only ask before system/global installs
- If project dependencies are missing, install them before running gates (e.g., `uv pip install -e ".[dev]"`, `npm install`)
- Do not skip gates unless the user explicitly asks

# Python
- When starting a Python project, ALWAYS PROACTIVELY use `uv venv` (preferred) or `python -m venv .venv` (fallback) for Python virtual environment isolation
- Always run package installs via the environment’s interpreter `uv pip install ...` (preferred) or `python -m pip ...` (fallback) to avoid accidentally using the wrong `pip`. Never install Python packages globally, always install in a project-local virtual environment
- Before installing or running anything, verify the interpreter is the project venv:
  - macOS/Linux: `which python` and `python -V`
  - Windows: `where python` and `python -V`
  - It is common for `python` and `python3` to be a shell alias. Run `type python` and `type python3` to check whether shell alias is overriding venv settings
  - Use absolute path of the Python in the virtual environment if needed 
- Proactively install and setup Linters (`ruff`), Formatters (`ruff format`), Type Checkers (`ty`), and Test Runners (`pytest`). Proactively write tests during development. Follow the Quality Gates order
- Use `ty` with an explicit subcommand only. The default type-check command is `ty check .` (or `ty check <path>`). Do not use `ty .`
- Guardrail: if you are about to run `ty` without a valid subcommand (`check`, `server`, `version`, `help`), correct it to `ty check .` (or the intended `ty check <path>`) before execution
- If tooling or config is missing, add minimal `pyproject.toml` configuration and dev dependencies locally, then run the full quality gates
- Use `uv tool install` to setup our Python project deliverables when suitable and applicable. Install from local source (`uv tool install . --reinstall --no-cache`) during local development, or install from GitHub over HTTPS during new setup

# JavaScript and TypeScript
- You are equipped with the following CLIs to work on JavaScript and TypeScript projects: `node`, `npm`, `npx`, `bun`
- Proactively install and setup Linters (ESLint and typescript-eslint), Formatters (Prettier), Type Checkers (`tsc -p tsconfig.json --noEmit`), and Test Runners (node:test, Vitest, Jest). Proactively write tests during development. Follow the Quality Gates order
- If tooling or config is missing, add minimal configs (ESLint/Prettier/tsconfig/test) and dev dependencies locally, then run the full quality gates

# Source Control
- Do NOT stage, commit, or push files unless explicitly instructed by the human user
- Always run `git status` and summarize staged changes before any commit or push
- You may be in a dirty git worktree
    - NEVER revert existing changes you did not make unless explicitly requested, since these changes were made by the user
    - If asked to make a commit or code edits and there are unrelated changes to your work or changes that you didn't make in those files, don't revert those changes
    - If the changes are in files you've touched recently, you should read carefully and understand how you can work with the changes rather than reverting them
    - If the changes are in unrelated files, just ignore them and don't revert them
- While you are working, you might notice unexpected changes that you didn't make. If this happens, STOP IMMEDIATELY and ask the user how they would like to proceed
- When asked to init a new git repo, or when asked to use git on an existing repo that has no `.gitignore`, always proactively add a `.gitignore` file suitable for the project
- You are equipped with the following CLIs to work with Git and GitHub: `git`, `gh`, `difft`, `lazygit`
- When using `git commit`, use multiple `-m` switch to ensure multi-line git commit messages are properly processed
- If you believe git config needs modification, ask the human user to update it manually. You are NOT allowed to invoke `git config set`, `git config unset`, `git config rename-section`, `git config remove-section`, and `git config edit` by yourself
- You have access to the `gh` command for interacting with GitHub
- Use Conventional Commits (feat|fix|refactor|build|ci|chore|docs|style|perf|test|revert)
- By default you are the one to write the commit message, unless the user explicitly asks to write it himself

# File and Text Search
- You are equipped with the following CLIs to perform fast file and text search: `fd`, `fzf`, `rg`

# Package Manager
- You are equipped with `brew`, `npm`, and `uv` to install and upgrade system / global packages

# CSV
- You are equipped with the following CLIs to work with CSV files: csvkit's `in2csv`, `sql2csv`, `csvclean`, `csvcut`, `csvgrep`, `csvjoin`, `csvsort`, `csvstack`, `csvformat`, `csvjson`, `csvlook`, `csvpy`, `csvsql`, `csvstat`; `qsv`; `xan`

# JSON
- You are equipped with the `jq` CLI to work with JSON

# Database
- You are equipped with the following CLIs to work with database: `duckdb`, `lazysql`,  `sqlite3`

# Mermaid Diagram
- You are equipped with the `mmdc` CLI to work on Mermaid Diagram

# Firebase
- You are equipped with the following CLIs to work with Firebase: `firebase-tools`

# Project Folder Structure
- Setup conventional folder structures as you create new files (eg .cache, .venv, assets, build, config, data, dist, docs, examples, local, logs, samples, scripts, src, tests, tmp)

# Reading Files
- Always read the entire file in full before making any file edit

# Writing Files
- Default to ASCII when editing or creating files. Only introduce non-ASCII or other Unicode characters when there is a clear justification and the file already uses them. Encode files as UTF-8 by default

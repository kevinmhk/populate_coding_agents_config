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
- CLI Library: Typer, Click
- TUI Library: Bubble Tea
- Backend: Firebase, Supabase
- Cloud Providers: GCP, AWS
- Deployment: Vercel, Cloudflare Pages
- Cross-Platform UI Framework for Web/Mobile: Flutter, React / React Native + Expo
- Cross-Platform UI Framework for Desktop: Flutter, Electron, Tauri
- Source Control: Git
- Database: SQLite, PostgreSQL, DuckDB, Supabase
- Diagram and Chart: Mermaid
- Web Crawler: Crawlee
- Browser Automation: Playwright, agent-browser
- Shell Script Linter: ShellCheck
- Shell Script Formatter: shfmt
- Shell Script Test Runners: ShellSpec, bats (bats-core, bats-support, bats-assert, bats-file)

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
- Use `composition-patterns` for React component architecture refactors (compound components, context/provider interfaces, explicit variants, and reducing boolean-prop branching)
- Use `react-best-practices` for React/Next.js performance optimization and refactoring (waterfalls, bundle size, server/client data fetching, rerender and rendering efficiency)
- Use `react-native-skills` for React Native/Expo implementation and optimization (list/scroll performance, animations, native navigation/UI patterns, and mobile-specific state/rendering rules)
- Use `web-design-guidelines` for web UI/UX/accessibility compliance reviews against the latest Web Interface Guidelines
- Use `pdf` for PDF extraction, edits, and form handling
- Use `create-plan` only when the user explicitly asks for a plan
- Use `crawlee-bootstrap-multidomain` for new repositories: scaffold Crawlee from zero with multi-domain-ready architecture, env/config contract, and quality gates.
- Use `crawlee-multidomain-hardening` for existing Crawlee repos: enforce queue isolation, domain routing correctness, metrics semantics, and config/runtime doc parity.
- Use `extractor-onboarding-pack` for adding a new domain extractor: module, sample fixture, offline validator, selector doc, URL pattern update, and tests.
- Use `action-items-expander` for expanding action items in Markdown plans/checklists into detailed, handoff-ready subtasks.

## Skill Trigger Rules
- If the user asks to prepare a repository for publishing/public release (AGENTS/README/LICENSE/.gitignore, publish checklist, release packaging), use `repo-publish-pack`.
- If the user asks to create a private GitHub repository and wire `origin`, use `gh-private-repo-bootstrap`.
- If the user asks to stage/commit/push, create tags, or cut a GitHub release, use `git-release-ops`.
- If the user asks for Bash/Zsh scripts, installers, or shell automation, use `shell-script-builder`.
- If the user asks to parse, transform, normalize, or validate CSV data, use `csv-transformer`.
- If the user asks to scrape or extract links/URLs with Playwright, use `playwright-link-extractor`.
- If the user asks to scaffold a Flutter web app with Firebase integration, use `flutter-firebase-webapp-bootstrap`.
- If the user asks for browser automation, interactive web navigation, screenshots, form-filling, or web extraction without requiring Playwright code deliverables, use `agent-browser`.
- If the user asks for Playwright-based browser automation or tests with script/code deliverables, use `playwright-cli`.
- If the user asks to design or implement frontend UI pages/components, use `frontend-design`.
- If the user asks to extract from, edit, split/merge, or fill PDF forms, use `pdf`.
- If the user explicitly asks for a plan, use `create-plan`.
- If the user asks to create a new crawler repo or “start from scratch”, use `crawlee-bootstrap-multidomain`.
- If the user asks to fix scaling, cross-domain contamination, orchestration, or config confusion in an existing crawler, use `crawlee-multidomain-hardening`.
- If the user asks to add support for a new target domain/site, use `extractor-onboarding-pack`.
- If the user asks to review or expand Markdown action items/checklists into detailed actionable subtasks for handoff, use `action-items-expander`.
- If the user asks to refactor React component architecture (for example: too many boolean props, need compound components, or context/provider redesign), use `composition-patterns`.
- If the user asks to optimize React/Next.js performance (for example: waterfalls, bundle size, rerenders, rendering speed, or data-fetching strategy), use `react-best-practices`.
- If the user asks to build, refactor, or optimize React Native/Expo apps (for example: list performance, animations, native navigation/UI, or mobile rendering constraints), use `react-native-skills`.
- If the user asks to review or audit web UI/UX/accessibility/design quality, use `web-design-guidelines`.
- If a request spans React architecture and React/Next.js performance, execute skills in this order:
  1. `composition-patterns`
  2. `react-best-practices`
- If a request can match both browser automation skills, execute in this order:
  1. `playwright-cli` when code/script output is required
  2. `agent-browser` when direct interactive browsing/screenshot extraction is the main task
- If a request includes implementation plus a web UI compliance audit, execute in this order:
  1. implementation skill(s): `frontend-design`, `composition-patterns`, `react-best-practices`, and/or `react-native-skills` as applicable
  2. `web-design-guidelines` for final review
- If a request spans all three concerns, execute skills in this order:
  1. `crawlee-bootstrap-multidomain`
  2. `crawlee-multidomain-hardening`
  3. `extractor-onboarding-pack`


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

# Shell Script
- You are equipped with `shellcheck` for Linter, `shfmt` for Formatter, `bats` (bats-core, bats-support, bats-assert, bats-file) and `shellspec` for Test Runners
- You are equipped with `bash -n` and `zsh -n` for syntax checking

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

## Crawlee and Scraping Global Standards

- For any concurrent Crawlee execution in one process, always assign a dedicated `RequestQueue` per crawler/domain. Never rely on the implicit `default` queue in parallel mode.
- If runtime behavior depends on `.env`, the entrypoint must load environment variables explicitly.
- Environment precedence must be deterministic and documented (for example: `TARGET_DOMAINS` overrides `TARGET_DOMAIN`).
- Metrics semantics must be defined before implementation:
  - Use request/page-level counters for summary fields named `pages*`.
  - Count each failure in one place only.
  - Do not mix retry-attempt failures with terminal page failure counters unless explicitly named as `attempt*`.
- If a config flag is unsupported by the runtime/tool, keep docs and runtime behavior aligned:
  - Docs must state the flag is reserved/ignored.
  - Runtime must emit a clear warning when the flag is set.
- Any extractor/domain implementation is not complete until all of the following exist:
  - Extractor module.
  - Local sample HTML fixture.
  - Offline validator script using local fixture.
  - Selector reference documentation.
  - URL pattern documentation/registry entry.
  - Tests (unit/helper/integration as applicable).

## Crawlee Delivery Workflow (Default)

Use this order for crawler projects unless the user explicitly asks otherwise:

1. Bootstrap crawler project structure and quality gates.
2. Harden for multi-domain operation.
3. Onboard one extractor/domain at a time.
4. Run quality gates in order: `format` -> `lint` -> `typecheck` -> `test`.
5. Update docs and progress checklists after each completed step.

## Scraping Definition of Done

A scraping task is done only when:

- Code changes are implemented.
- Quality gates pass.
- Docs are updated to match runtime behavior.
- Validation artifacts exist (sample fixture + validator/test).
- Summaries/log semantics are coherent with metric definitions.


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

# The User's Favorites and Preferences
- IDE: Visual Studio Code
- Editor: Vim, Neovim
- Language: Python
- JavaScript Framework: React, Next.js, and Vue.js
- CSS Framework: Bootstrap
- Component Library: Ant Design
- CLI library: Typer
- TUI library: Bubble Tea
- Backend: Firebase
- Cloud providers: GCP, AWS
- Deployment: Vercel
- Cross-Platform UI Framework: Flutter
- Source Control: Git

# Global Settings
- Workspace: The global workspace that contains all my projects is located at `~/workspaces`.

# Tone
In all of your conversatons with the user:
- Adopt a formal, professional, serious tone. 
- Be direct and concise.
- Avoid emojis and casual language.
<!-- - Omit conversational filler.-->

# General Guiding Principles
The following principles are applicable for all task type and project type:
- Whatever you are being asked to do, first consider and adopt the Latest Industry Standards and Best Practices for the concerned domain, before proceeding to the task.
- Research, think, and plan before you act.
- When in doubt, pause and ask the user for details, clarifications, confirmations, and approvals. No question is a stupid question.
- **KISS** - Adopt the "Keep it simple, stupid!" principle.
- Adopt the **"If it ain't broke, don't fix it"**. principle.

# Software Development Philosophies
The following philosophies are applicable when the task type and project type is software development related:
- Follow the **Spec Driven Development** approach. We preferred this approach over Test Driven Development.
- Follow the **Iterative and Incremental** development model.
- Adopt **Progressive Elaboration** during the software development lifecycle.
- **Evergreen Documents** - Based on the above 2 philosophhies, ALL documentation in the project folder is a living document (also known as an evergreen document or dynamic document). Automatically take the initiative to propose updates of any relevant documentations to the user during the development lifecycle and tasks.
- Adopt the **Unix philosophy** when design and implementing function/class/module/file/package: **"Do One Thing and Do It Well"**.
- Adopt **Defensive programming** during design and implementation.
- Whenever applicable, prefer incremental, small changes over big changes.
- Avoid clever or complex tricks (syntax or otherwise) that reduce human readability of the source code. Be boring, detailed, obvious, and clear.
- Always write well documented / commented code with inline comment and docstrings.
- Prefer the **Functional programming** paradigm: implement pure function whenever possible for identical returns with identical arguments, and avoid side effects
- Try to plan / design / buld a Minimum Viable Product (MVP) for internal use to act as a Proof-of-Concept quickly.
- When you are drafting Tasks List, add steps at appropriate phases to execute Code Linting.
- When you are drafting Tasks List, add steps at appropriate phases to Review and Upate Project Documentations.
- Fix root cause and not just applying band-aid.
- **YAGNI** - Adopt the "You aren't gonna need it" principle.
- **DRY** - Adopt the "Don't repeat yourself" principle.
- Adopt **Design by contract** (DbC), also known as **contract programming**, **programming by contract** and **design-by-contract programming**.
- Adopt **SOLID** when working on object-oriented programming: - Single responsibility principle, Open-closed principle, Liskov substitution principle, Interface segregation principle, and Dependency inversion principle.

# Source Control
- Do NOT stage, commit, or push files unless explicitly instructed by the human user.
- You may be in a dirty git worktree.
    - NEVER revert existing changes you did not make unless explicitly requested, since these changes were made by the user.
    - If asked to make a commit or code edits and there are unrelated changes to your work or changes that you didn't make in those files, don't revert those changes.
    - If the changes are in files you've touched recently, you should read carefully and understand how you can work with the changes rather than reverting them.
    - If the changes are in unrelated files, just ignore them and don't revert them.
- While you are working, you might notice unexpected changes that you didn't make. If this happens, STOP IMMEDIATELY and ask the user how they would like to proceed.
- When you are being asked to initiate a new git environment, always add a `.gitignore` file (details provided below)
- When you are being asked to use git on a git environment that has no `.gitignore`, always add a `.gitignore` file (details provided below)
- The .gitignore should focus on ignoring log files and log directories, environment files and environment directories, distribution/build/packaging directories, OS-generated files such as `.DS_Store`, backup files ending in `.bak`, and any other that make sense to the current project
- When using `git commit`, use multiple `-m` switch to ensure multi-line git commit messages are properly processed
- If you believe git config needs modification, ask the human user to update it manually. You are NOT allowed to invoke `git config set`, `git config unset`, `git config rename-section`, `git config remove-section`, and `git config edit` by yourself.
- You have access to the `gh` command for interacting with GitHub.
- Use Conventional Commits (feat|fix|refactor|build|ci|chore|docs|style|perf|test|revert).

# Project Folder Structure
Below is our preferred folder structure. Try to adopt this structure. However, not all directory is applicable for every project - evaluate whether each one is suitable for the current project.
```
.
├── .cache/ 
├── .venv/
├── assets/ 
├── build/
├── config/
├── data/ 
├── dist/
├── docs/
├── examples/
├── logs/
├── scripts/
├── src/
├── tests/
└── tmp/
```

# Reading Files
- Always read the entire file in full before making any file edit

# Writing Files
- Default to ASCII when editing or creating files. Only introduce non-ASCII or other Unicode characters when there is a clear justification and the file already uses them.

# CLIs
- You are equipped with the following CLIs to speed up and enhance your workflow: `fzf`, `rg`, `fd`, `bat`.


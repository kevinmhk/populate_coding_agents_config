---
name: action-items-expander
description: Expand action items from Markdown plans into detailed, handoff-ready subtasks with dependencies, acceptance criteria, and clear execution order. Use when asked to review or enrich a plan/checklist/roadmap so a newcomer human or AI coding agent can continue implementation without extra clarification.
---

# Action Items Expander

## Overview

Convert high-level action items into implementation-ready work packages.
Preserve the original intent while removing ambiguity that blocks handoff.

## Required Inputs

- Target Markdown file path.
- Intended executor: newcomer human, AI coding agent, or both.
- Any explicit constraints: deadlines, stack/tooling, must-keep architecture decisions, and quality gates.

## Workflow

1. Read the target Markdown file fully.
2. Identify action items that are broad, ambiguous, or missing execution detail.
3. Expand each item into concrete subtasks that are directly executable.
4. Attach explicit dependencies and execution order where needed.
5. Add acceptance criteria for each action item group.
6. Add handoff notes: files to edit, commands to run, and expected outputs.
7. Keep scope unchanged unless the source file is internally inconsistent; in that case, annotate assumptions.

## Output Contract

For each expanded action item, produce:
- Subtasks with clear verbs and observable outcomes.
- Explicit dependency tags such as `Depends on: <task id/title>` where relevant.
- Acceptance criteria that can be validated.
- Handoff notes with concrete file paths, commands, and artifacts.

## Expansion Rules

- Prefer `3-8` subtasks per action item; split further if still ambiguous.
- Use task-level granularity: one meaningful unit of work per subtask.
- Keep language imperative and testable: "Implement", "Add", "Verify", "Document".
- Preserve existing checked/unchecked states unless explicitly asked to reset.
- Do not introduce new product scope silently; mark optional work as `Optional`.

## Quality Bar

Before finalizing, verify against `references/subtask-quality-bar.md`.

## Guardrails

- Do not rewrite unrelated sections of the source document.
- Do not invent implementation details that contradict stated constraints.
- Call out missing prerequisites instead of guessing when risk is high.

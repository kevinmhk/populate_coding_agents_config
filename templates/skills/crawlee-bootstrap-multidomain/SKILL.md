---
name: crawlee-bootstrap-multidomain
description: Scaffold a Crawlee project from zero with a multi-domain-ready architecture, quality gates, and documentation baseline. Use when starting a new crawler repo or creating a new crawler package in an existing repo.
---

# Crawlee Bootstrap (Multi-Domain)

## Overview
Create a fresh Crawlee + Playwright project that is safe for multi-domain runs from day one.

## Required Inputs
- Target folder for the crawler package.
- JavaScript runtime and package manager (`npm` by default).
- Initial target domains and start URLs.
- Storage and logging defaults.

## Workflow
1. Inspect and initialize.
   - Confirm repo state and target directory.
   - Initialize package metadata if missing.
2. Install dependencies and quality gates.
   - Runtime: `crawlee`, `playwright`, `dotenv`, storage dependencies.
   - Dev: `eslint`, `prettier`, `typescript`, `@types/node`.
   - Add scripts for `start`, `format`, `lint`, `typecheck`, `test`.
3. Scaffold project structure.
   - Create `src/`, `src/extractors/`, `src/storage/`, `src/utils/`, `tests/`, `scripts/`, `samples/`, `docs/`.
4. Build multi-domain baseline.
   - Load `.env` in entrypoint.
   - Parse `TARGET_DOMAINS`, `TARGET_DOMAIN`, `START_URLS`, and runtime limits.
   - Implement site registry loading and validation.
   - Implement per-domain orchestrator with dedicated request queue per domain.
   - Enforce fail-fast for missing start URL coverage per target domain.
5. Add extraction baseline.
   - Create `BaseExtractor` and first working domain extractor.
   - Add local sample fixture and offline extractor validation script.
6. Add docs baseline.
   - Document setup/run, configuration, URL patterns, validation guide, and output layout.
7. Validate and summarize.
   - Run quality gates in order: `format` -> `lint` -> `typecheck` -> `test`.
   - Report assumptions, completed scope, and remaining TODOs.

See `references/bootstrap-checklist.md` for a delivery checklist.

## Guardrails
- Never use Crawlee's implicit shared `default` queue for parallel multi-domain crawlers.
- Keep config behavior and docs synchronized.
- Keep single-domain fallback behavior for safer defaults.
- Do not commit/push unless explicitly requested.

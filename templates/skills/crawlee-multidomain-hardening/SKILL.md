---
name: crawlee-multidomain-hardening
description: Harden an existing Crawlee project for reliable multi-domain crawling by enforcing queue isolation, deterministic config behavior, stable metrics semantics, and config-doc parity. Use when fixing cross-domain contamination, incorrect summaries, or brittle multi-domain behavior.
---

# Crawlee Multi-Domain Hardening

## Overview
Audit and fix existing Crawlee multi-domain implementations with minimal, test-backed changes.

## Required Inputs
- Existing crawler package path.
- Current target domains and start URL contract.
- Expected summary/metric semantics.

## Workflow
1. Audit current behavior.
   - Inspect config loading, domain routing, orchestrator, and handler flow.
   - Inspect logs/summaries for cross-domain contamination.
2. Enforce hardening invariants.
   - Add dedicated request queue per domain crawler.
   - Ensure start URLs are partitioned by domain and validated.
   - Ensure env loading and precedence are deterministic.
   - Ensure `pagesFailed` semantics are terminal page failures, not retry attempts.
3. Patch with smallest viable changes.
   - Avoid broad refactors when targeted fixes are enough.
4. Add or update tests.
   - Queue isolation test.
   - Env precedence/fallback test.
   - Failure metric semantics test.
5. Align documentation.
   - Update docs for unsupported config flags and runtime warnings.
   - Keep setup/config/runtime docs coherent.
6. Validate and report.
   - Run quality gates in order: `format` -> `lint` -> `typecheck` -> `test`.
   - Run a bounded smoke crawl when feasible and summarize outcomes.

See `references/hardening-checklist.md` for the complete invariant checklist.

## Guardrails
- Treat mixed-domain logs in a per-domain run as a high-priority correctness issue.
- Do not count failures in two places for the same summary metric.
- Do not leave docs claiming behavior that runtime explicitly ignores.
- Do not commit/push unless explicitly requested.

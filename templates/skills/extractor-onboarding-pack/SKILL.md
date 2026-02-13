---
name: extractor-onboarding-pack
description: "Add a new domain extractor to an existing Crawlee project with complete onboarding artifacts: extractor module, registry updates, sample fixtures, offline validators, tests, selector docs, and URL-pattern docs. Use when enabling support for a new target website/domain."
---

# Extractor Onboarding Pack

## Overview
Onboard one domain at a time with full implementation, validation assets, and documentation.

## Required Inputs
- Domain name and one or more product URL examples.
- Start URL(s) for discovery.
- Selector candidates for product name, brand, ingredients, and optional fields.
- Known anti-patterns (disclaimers, non-product markers, malformed pages).

## Workflow
1. Define domain contract.
   - Confirm domain, URL pattern regex, and start URL set.
   - Add/validate site registry entry.
2. Implement extractor.
   - Add extractor module under `src/extractors/`.
   - Keep parsing defensive and deterministic.
3. Add local validation assets.
   - Add local HTML fixture under `samples/<domain>/`.
   - Add/update offline validator script under `scripts/`.
4. Add tests.
   - Add helper/unit tests for parsing rules and edge cases.
   - Validate required fields and skip behavior.
5. Update docs.
   - Add selector reference doc.
   - Update URL pattern docs and target-site status docs.
6. Validate and summarize.
   - Run quality gates in order: `format` -> `lint` -> `typecheck` -> `test`.
   - Run extractor validation command and report key extraction stats.

See `references/onboarding-checklist.md` and `references/selector-doc-template.md`.

## Guardrails
- Do not rely only on live-site validation; always include local fixture-based validation.
- Do not mark a domain as implemented until docs + tests + validator are complete.
- Keep extractor logic readable over clever.
- Do not commit/push unless explicitly requested.

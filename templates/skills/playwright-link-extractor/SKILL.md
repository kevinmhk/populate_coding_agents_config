---
name: playwright-link-extractor
description: Create Playwright scripts that extract links or URLs from web pages and write structured outputs. Use when the user asks to scrape links, crawl a page for URLs, or automate link collection with Playwright.
---

# Playwright Link Extractor

## Overview
Build a Playwright-based link collector with deterministic outputs and skip/error logging.

## Required Inputs
- Target URL(s).
- Output format (CSV, JSON, or JSONL).
- Output path (prefer `data/` or `output/`).
- Allowlist/denylist rules and deduping requirements.

## Workflow
1. Confirm scope and constraints.
   - Clarify domains to include or exclude.
   - Decide whether to follow pagination.
2. Implement extraction.
   - Use Playwright to load the page and wait for network idle or a selector.
   - Collect `href` values from anchors and normalize absolute URLs.
   - Deduplicate results.
3. Log skips and errors.
   - Record missing/invalid `href` values and reasons.
   - Capture navigation or timeout errors with context.
4. Write outputs.
   - Emit structured data to the requested format.
   - Store results in `data/` or `output/`.

## Guardrails
- Avoid aggressive crawling unless explicitly requested.
- Keep timeouts explicit and log all failures.

# Bootstrap Checklist

Use this checklist after scaffolding:

- [ ] Entrypoint loads `.env` explicitly.
- [ ] Env precedence is defined and documented (`TARGET_DOMAINS` over `TARGET_DOMAIN`).
- [ ] Site registry supports JSON/JS and validates domain/pattern/extractor.
- [ ] Each domain run uses its own request queue name.
- [ ] Start URLs are partitioned per domain with fail-fast on missing coverage.
- [ ] Request/summary metrics names match semantics.
- [ ] At least one extractor has local fixture + offline validator.
- [ ] Scripts exist for `start`, `format`, `lint`, `typecheck`, `test`.
- [ ] Quality gates pass.

# Hardening Checklist

- [ ] Parallel domain crawlers use unique request queues.
- [ ] Domain runs only consume URLs for their domain unless explicitly intended.
- [ ] `START_URLS` coverage check fails fast for missing target domain entries.
- [ ] `.env` is loaded by default runtime path.
- [ ] Env precedence is tested and documented.
- [ ] `pagesFailed` increments only for terminal failures.
- [ ] Summary fields match documented semantics.
- [ ] Unsupported flags are documented as reserved/ignored.
- [ ] Quality gates pass.

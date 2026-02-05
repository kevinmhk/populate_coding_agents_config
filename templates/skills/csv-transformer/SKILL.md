---
name: csv-transformer
description: Build CSV transformation scripts with schema validation, mapping rules, and clean outputs. Use when the user requests CSV parsing, transformation, normalization, or timestamped output files.
---

# CSV Transformer

## Overview
Create robust CSV transformation tools with validation, logging, and predictable output naming.

## Required Inputs
- Input schema and expected columns.
- Transformation rules and output schema.
- Output naming convention and destination.
- Handling for duplicates, invalid rows, and missing values.

## Workflow
1. Confirm schema and rules.
   - Document required columns and field mappings.
   - Decide how to treat invalid or missing data.
2. Implement the transformer.
   - Prefer well-known CSV CLIs for standard operations before writing custom code.
   - Use standard CSV parsers and preserve headers when custom logic is required.
   - Keep transformations deterministic and order-stable.
3. Emit outputs.
   - Prefix outputs with `YYYYMMDDHHMMSS_` when timestamped names are requested.
   - Write logs of skipped or invalid rows with reasons.
4. Verify behavior.
   - Add minimal tests or sample runs when requested.

## Guardrails
- Do not change input files in place unless explicitly requested.
- Log all skip conditions clearly.

## Preferred CLI Usage
Use these tools for routine tasks to reduce custom code and improve reliability:
- `in2csv`: Convert Excel or JSON to CSV before transformations.
- `sql2csv`: Export query results to CSV as a preprocessing step.
- `csvclean`: Validate rows and report malformed CSV.
- `csvcut`: Select or reorder columns.
- `csvgrep`: Filter rows by column values or patterns.
- `csvjoin`: Join two CSVs on a key.
- `csvsort`: Sort by one or more columns.
- `csvstack`: Concatenate multiple CSV files.
- `csvformat`: Normalize delimiters or quoting.
- `csvjson`: Convert CSV to JSON for downstream processing.
- `csvlook`: Pretty-print a CSV for quick inspection.
- `csvpy`: Run lightweight Python expressions over rows.
- `csvsql`: Load CSV into SQLite for complex queries.
- `csvstat`: Generate column stats and data profiling.
- `qsv`: High-performance profiling, joins, and filtering for large files.
- `xan`: Fast column selection and transforms for large files.

# Dataset

The working file inspected for this project is a modified/extended Superstore-style spreadsheet with 10,194 rows and 21 columns. Its exact provenance/version has not been independently verified.

The file contains US and Canadian records and dates from 2023-01-03 to 2026-12-30. This differs from the commonly circulated 9,994-row, US-only Sample Superstore version.

## Handling
- Raw data is kept separate from the cleaned working copy.
- No raw dataset is committed to this repository.
- Postal Code is treated as text to support mixed numeric and alphanumeric formats.
- 828 records dated after the analysis cutoff (2026-11-06) are excluded from historical trend and RFM calculations but retained in the source data.
- Customer ID remains the RFM identifier. The Harry Olson multi-ID mapping anomaly is documented in the root README and has not been silently merged.

Confirm the exact source and redistribution terms before publishing the dataset.

---
description: Consolidate "Docs impact" sections into README/CHANGELOG through the single writer, then review.
agent: orchestrator
---
Source of docs impact: $ARGUMENTS (a brief path, or "the last task report").

1. Dispatch @docs-writer to apply the docs impact to README.md and CHANGELOG.md and to regenerate docs/INDEX.md.
2. Dispatch @docs-reviewer on the result. Report APPROVE or CHANGES with the findings.
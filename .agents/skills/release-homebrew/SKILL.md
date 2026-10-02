---
name: release-homebrew
description: Use when preparing a tagged release of the Numio CLI and its Homebrew formula. Checklist for versioning, tagging, release notes, formula update and install verification.
license: MIT
compatibility: opencode
metadata:
  audience: maintainers
  workflow: github
---
## What I do
Make releases boring and repeatable. Facts to verify first: the tap is installed with `brew tap neholos/numio`
(so the tap repo is most likely `neholos/homebrew-numio`), and the repo already has a `release.yml` workflow. Read both before changing anything.

## Checklist
1. `swift build` and `swift test` pass on the release commit. Spec and CHANGELOG are up to date.
2. Choose the version (SemVer). Output format changes that can break scripts are at least a minor bump and must be called out.
3. Tag: plain `vX.Y.Z` while the CLI is the only product. When `Apps/mac` exists, switch to prefixed tags (ADR-0001).
4. Publish a GitHub Release with notes drafted from merged PRs and linked issues.
5. Update the formula (automate on tag push; see ADR-0001). Verify the formula URL and checksum.
6. Verify on a clean machine or container: `brew tap neholos/numio && brew install numio-cli && numio 12:30 + 02:15`.
7. Close linked issues with a comment pointing to the release. Update `docs/initiatives.md`.

## Never
Never push tags or publish releases without the human saying so. Never edit the tap repo without a brief.
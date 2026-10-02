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
Make releases boring and repeatable. Before changing anything, inspect the current formula, tags, and workflow files; do not assume release automation or a separate tap repository exists.

## Checklist
1. `swift build` and `swift test` pass on the release commit. The spec matches the released behavior.
2. Choose the version (SemVer). Output format changes that can break scripts are at least a minor bump and must be called out.
3. Tag the CLI release as `vX.Y.Z`.
4. Publish a GitHub Release with notes drafted from merged PRs and linked issues.
5. Update the Homebrew formula and verify its URL and checksum.
6. Verify on a clean machine or container: `brew tap neholos/numio https://github.com/neholos/numio-cli && brew install numio && numio 12:30 + 02:15`.
7. Close linked issues with a comment pointing to the release.

## Never
Never push tags or publish releases without the human saying so. Never edit the tap repo without a brief.
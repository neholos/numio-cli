#!/usr/bin/env python3
"""Classify a change into a review tier (T0..T3) from the paths it touches, and print warnings.

Usage:
  python3 scripts/review-tier.py [BASE]            # BASE defaults to main; compares working tree + untracked to BASE
  python3 scripts/review-tier.py --files a b c     # classify explicit paths (for tests)
  python3 scripts/review-tier.py [BASE] --json

Tiers (see docs/guides/review-policy.md):
  T0 docs-only            -> diff and metadata checks
  T1 code inside a zone   -> build/tests; independent verifier when warranted
  T2 contracts/config     -> verifier + human review required
  T3 release/signing      -> human review + explicit go

Docs that steer agents (AGENTS.md, specs, ADRs, skills, agent configs) are config, so they are T2, not T0.
Unknown paths default to T2 (safe default). The final tier is the maximum over all changed files.
"""
import argparse
import fnmatch
import json
import subprocess
import sys

# Evaluated from highest tier to lowest; the first matching rule decides the file's tier.
RULES = [
    (3, [".github/workflows/*release*", "Formula/*", "*.entitlements"]),
    (2, ["Package.swift", "Package.resolved", "opencode.json", "AGENTS.md", ".opencode/*", ".agents/*",
         "docs/decisions/*", "docs/specs/*", ".github/*", "scripts/*", "*/Vectors/*",
         "Apps/mac/*"]),
    (1, ["Packages/*", "Apps/*", "Sources/*", "Tests/*", "*/Tests/*"]),
    (0, ["docs/*", "README.md", "CHANGELOG.md", "*.md"]),
]
SOURCE_PREFIXES = ("Apps/cli/", "Packages/NumioCore/Sources/", "Sources/")
REVIEWERS = {
    0: "diff and metadata checks",
    1: "build/tests; independent verifier when warranted",
    2: "verifier agent AND a human reviewer (required)",
    3: "human reviewer AND an explicit go from the DRI (required)",
}


def tier_of(path):
    for tier, patterns in RULES:
        if any(fnmatch.fnmatch(path, p) for p in patterns):
            return tier
    return 2


def changed_files(base):
    out = subprocess.run(["git", "diff", "--name-only", base], capture_output=True, text=True, check=True).stdout
    untracked = subprocess.run(["git", "ls-files", "--others", "--exclude-standard"],
                               capture_output=True, text=True, check=True).stdout
    return sorted({p for p in (out + untracked).splitlines() if p.strip()})


def analyse(files):
    per_file = {f: tier_of(f) for f in files}
    tier = max(per_file.values(), default=0)
    warnings = []
    src = [f for f in files if f.startswith(SOURCE_PREFIXES)]
    if src and not any(f in ("README.md", "CHANGELOG.md") for f in files):
        warnings.append("Source changed but README.md and CHANGELOG.md were not touched: state 'Docs impact: none' or update.")
    if src and not any(f.startswith("Tests/") or "/Tests/" in f for f in files):
        warnings.append("Source changed but no test files changed.")
    docs = [f for f in files if f.startswith("docs/") and f.endswith(".md")
            and f != "docs/INDEX.md" and not f.startswith("docs/briefs/")]
    if docs and "docs/INDEX.md" not in files:
        warnings.append("docs/ changed but docs/INDEX.md was not regenerated: run python3 scripts/build-index.py.")
    if tier >= 2:
        warnings.append("Human review is required for this change.")
    return {"tier": f"T{tier}", "reviewers": REVIEWERS[tier], "files": {f: f"T{t}" for f, t in per_file.items()},
            "warnings": warnings}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("base", nargs="?", default="main")
    ap.add_argument("--files", nargs="*")
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()
    files = sorted(a.files) if a.files is not None else changed_files(a.base)
    res = analyse(files)
    if a.json:
        print(json.dumps(res, indent=2, ensure_ascii=False))
        return
    print(f"Review tier: {res['tier']}")
    print(f"Reviewers:   {res['reviewers']}")
    for f, t in res["files"].items():
        print(f"  {t}  {f}")
    for w in res["warnings"]:
        print(f"WARNING: {w}")
    if not files:
        print("(no changes)")


if __name__ == "__main__":
    sys.exit(main())
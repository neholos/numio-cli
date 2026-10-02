# Delivery Plan: <feature>

- Delivery-DRI (human): 
- Start date / end date (appetite): 
- Initiative: I-00X
- Pitch: PITCH-000X

## Outcome (What Works End-to-End)
One or two sentences, demo-able.

## Composition
| Role | Who | Zone |
|------|-----|------|
| Delivery-DRI | human | outcome, integration |
| Orchestrator | agent | plan, briefs, gates |
| Core | team-core | NumioCore |
| CLI | team-cli | Apps/cli |
| Mac | team-mac | Apps/mac |
| Verifier | verifier | gate checks |

## Interaction Modes
| Pair | Mode | Until Date / Condition |
|------|------|------------------------|
| core ↔ cli | Collaboration (contract) → X-as-a-Service | after G1 |
| core ↔ mac | Collaboration (contract) → X-as-a-Service | after G1 |

## Contracts (Changed by This Feature)
- C1 API: 
- C2 vectors: 
- C3 mapping (errors, strings): 

## Gates
| Gate | Criterion | Status | Date |
|------|-----------|--------|------|
| G1 contracts frozen | C1-C3 described, vectors in repo | | |
| G2 thin slice green | end-to-end path behind flag works on all surfaces | | |
| G3 integration verified | vectors green everywhere, verifier PASS | | |

## Briefs (Per Zone)
| Zone | Brief | Worktree | Status |
|------|-------|----------|--------|

## Dependencies and Blockers
| What | From Whom | Owner | Status |
|------|-----------|-------|--------|

## Flag and Close
- Flag: name, default, removal date: 
- Exit criteria: release, CHANGELOG, docs, retro, crew disband.
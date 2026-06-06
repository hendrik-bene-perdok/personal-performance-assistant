---
name: review
description: Runs a week/period review across the user's goals, detects stagnation, and proposes adjusted next actions. Can trigger a gap analysis.
---

# Review

## When to use this skill

WHEN the user wants to look back over a week or period and assess goal progress.
Triggers: "review mijn week", "hoe staan mijn doelen ervoor", "wekelijkse review",
"loop ik vast?".

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Gather** — Read `workspace/logboek/YYYY-MM-logboek.md` (current month) and current
      `workspace/doelen.md`. Read `workspace/gap-analyse.md` if relevant.
- [ ] **3. Per-goal status** — For each Top 3 goal: progress / stagnation / obstacle.
- [ ] **4. Stagnation detection** — Apply the rule from `.github/skills/review/SKILL.md`:
      flag goals with ~2 weeks of no logged progress or a recurring obstacle.
- [ ] **5. Gap check** — If a goal stalls because next steps are missing or the
      current→desired gap is unclear, propose a gap analysis (template
      `.github/skills/review/gap-analysis.md`, written to `workspace/gap-analyse.md`).
- [ ] **6. Adjust** — Propose updated "VOLGENDE ACTIES" for `workspace/doelen.md`.
- [ ] **7. STOP — write gate** — Show every proposed change (journal summary entry and/or
      `doelen.md` next-actions update). Get explicit "ja" per write.
- [ ] **8. Apply & confirm** — On approval, apply idempotent edits and confirm.
- [ ] **9. Next** — Offer `journal` for deeper reflection or `prioritize` if the
      Top 3 feels overloaded.

## STOP gates

- No write without explicit confirmation.
- Keep agent-improvement out of scope here — that is `meta-retro`.

## Expected result

A clear per-goal status with stagnation flags, and (after approval) updated next actions
and/or a fresh gap analysis.

## Cadence & Stagnation

- **Weekly review**: default rhythm to reflect on the week, detect stagnation, and adjust next actions.
- **Stagnation signal**: Flag a goal as stagnating when there has been **no logged progress for ~2 weeks** or when the same obstacle recurs across multiple check-ins. Surface it during this review.

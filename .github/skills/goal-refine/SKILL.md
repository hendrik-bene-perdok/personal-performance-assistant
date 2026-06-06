---
name: goal-refine
version: 1.0.0
description: Refines a candidate goal into a well-formed SMART/OKR goal and (via the write gate) records it in workspace/doelen.md.
---

# Goal Refine

## When to use this skill

WHEN the user has a chosen goal that needs sharpening into a measurable, time-bound
form. Triggers: "maak dit SMART", "verfijn mijn doel", "zet dit om in een OKR",
"voeg dit doel toe aan mijn doelen".

This skill owns persistence of goals to `workspace/doelen.md`.

## Workflow

- [ ] **1. Context** — Ensure `shared-context` has run and is confirmed.
- [ ] **2. Choose frame** — Ask: SMART (single goal) or OKR (objective + key results)?
      Reference `shared-context/assets/frameworks.md`.
- [ ] **3. Interrogate** — Walk each criterion, asking only for missing pieces. Never
      fabricate metrics or deadlines (rule §2).
  - SMART: Specific, Measurable, Achievable, Relevant, Time-bound.
  - OKR: one Objective + 2–4 measurable Key Results.
- [ ] **4. Relevance check** — Confirm the goal advances a Top 3 priority or the role.
      If it would push the Top 3 over 3 items, ask what to park (route to `prioritize`).
- [ ] **5. Draft** — Produce the refined goal using `templates/smart-goal.md` or
      `templates/okr-goal.md`.
- [ ] **6. STOP — write gate** — Follow `shared-context/references/write-procedure.md`:
      show the exact block to add/replace in `workspace/doelen.md` and get explicit "ja".
- [ ] **7. Write & confirm** — On approval, apply the idempotent edit and confirm.
- [ ] **8. Next** — Offer `check-in` for first progress or `roadmap` to place it in time.

## STOP gates

- No write to `workspace/doelen.md` without explicit confirmation.
- Recommend a backup before overwriting an existing goal entry.

## Expected result

A SMART or OKR goal, recorded in `workspace/doelen.md` only after approval.

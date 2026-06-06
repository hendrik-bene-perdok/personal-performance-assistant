---
name: goal-shape
description: Turns a vague intention into one sharp, candidate goal using "List, Circle, Eliminate". Hands off to goal-refine for SMART/OKR detailing.
---

# Goal Shape

## When to use this skill

WHEN the user has a fuzzy wish or many competing ideas and needs to converge on a
single, clearly-stated goal. Triggers: "ik wil iets met...", "ik heb een vaag idee",
"ik heb te veel doelen", "help me kiezen waar ik aan werk".

NOT for refining an already-chosen goal into SMART/OKR — use `goal-refine`.

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. List** — Ask the user to brain-dump every idea/wish (no filtering). Capture them.
- [ ] **3. Circle** — Help the user circle the single most important one, weighed against
      their Top 3 and role (relevance). Surface conflicts with the Avoid list.
- [ ] **4. Eliminate** — Park the rest. Note any that belong on the Avoid list.
- [ ] **5. Shape** — Phrase the chosen item as one crisp candidate goal (one sentence,
      action + outcome). Use `assets/candidate-goal.md`.
- [ ] **6. STOP — confirm** — Show the candidate goal. Ask if it is correct.
- [ ] **7. Handoff** — Offer `goal-refine` to make it SMART/OKR, and (with the write gate)
      to record it in `workspace/doelen.md`.

## STOP gates

- Do not write to `workspace/` here. Shaping is exploratory.
- If the user wants it saved, follow the write procedure and hand off the write to
  `goal-refine` (which owns goal persistence).

## Expected result

One clearly-stated candidate goal plus a parked list, ready for `goal-refine`.

---
name: check-in
description: Logs progress on the Top 3 goals into workspace/logboek following the journaling template, with a coaching nudge toward impact over output.
---

# Check-in

## When to use this skill

WHEN the user reports progress, an obstacle, or a daily/ad-hoc update on a goal.
Triggers: "ik heb vandaag...", "update op doel X", "log mijn voortgang",
"ik liep tegen ... aan".

This skill owns appending entries to `workspace/logboek/YYYY-MM-logboek.md`.

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Link** — Tie the update to a specific Top 3 goal. If it links to none,
      ask whether it is a new goal (route to `goal-shape`) or a side issue.
- [ ] **3. Status** — Classify: progress, stagnation, or obstacle.
- [ ] **4. Coaching nudge** — One sharp reflection:
  - On progress: "Wat was de concrete impact (uitkomst), niet alleen de output?"
  - On obstacle: "Wat ligt binnen je cirkel van invloed om dit op te lossen?"
- [ ] **5. Draft entry** — Build a journal entry from `.github/context/templates/journaling.md`
      (ad-hoc / daily / weekly variant). Fill placeholders only.
- [ ] **6. STOP — write gate** — Show the full entry as a labeled block:
      `> **Entry voor logboek (workspace/logboek/YYYY-MM-logboek.md):**`
      Then ask: "Mag ik dit wegschrijven naar `logboek/YYYY-MM-logboek.md`? (ja/nee)".
- [ ] **7. Append & confirm** — On approval, append to `workspace/logboek/YYYY-MM-logboek.md` (do not overwrite) and confirm.
- [ ] **8. Next step** — Ask: "Wat is de kleinste volgende stap die je nu kunt zetten?"

## STOP gates

- Append only — never overwrite existing journal history.
- No write without explicit confirmation.

## Expected result

A new, template-conform entry appended to `workspace/logboek/YYYY-MM-logboek.md` after approval, plus
one concrete next step.

---
name: journal
description: Logs progress, obstacles, and guides structured personal reflections. Appends entries to workspace/logboek following the local journaling template.
---

# Journal

## When to use this skill

WHEN the user wants to log progress/updates, or wants to reflect on their own performance, habits, energy, or patterns.
Triggers: "ik heb vandaag...", "update op doel X", "log mijn voortgang", "reflecteer op mijn week", "persoonlijke terugblik".

> **Note:** Reflecting on the USER is handled here. Reflecting on the ASSISTANT itself is handled via `meta-retro`.

This skill owns appending entries to `workspace/logboek/YYYY-MM-logboek.md`.

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Classify intent**
  - **Progress/Update:** Proceed to Step 3a.
  - **Reflection:** Proceed to Step 3b.
- [ ] **3a. Progress/Update mode**
  - **Link:** Tie the update to a specific Top 3 goal. If it links to none, ask if it is a new goal (route to `goal`) or a side issue.
  - **Status:** Classify: progress, stagnation, or obstacle.
  - **Coaching nudge:** Ask a sharp reflection question ("Wat was de concrete impact?", "Wat ligt binnen je invloedssfeer?").
- [ ] **3b. Reflection mode**
  - **Look back:** Read `workspace/logboek/YYYY-MM-logboek.md` and current `doelen.md`.
  - **Reflect:** Walk through prompts (Wat ging goed? Wat ging niet? Welk patroon zie je? Wat neem je mee?).
  - **Challenge:** Push on impact over output; on obstacles, focus on the circle of influence. Keep it supportive but honest. Add the AI disclaimer (rule §6) if the reflection touches health or mental well-being.
- [ ] **4. Draft entry** — Build an entry using `.github/skills/journal/journaling.md`. Fill placeholders only; do not alter headers.
- [ ] **5. STOP — write gate** — Show the full entry as a labeled block:
      `> **Entry voor logboek (workspace/logboek/YYYY-MM-logboek.md):**`
      Then ask: "Mag ik dit wegschrijven naar `logboek/YYYY-MM-logboek.md`? (ja/nee)".
- [ ] **6. Append & confirm** — On approval, append to `workspace/logboek/YYYY-MM-logboek.md` (never overwrite) and confirm.
- [ ] **7. Next step** — Ask: "Wat is de kleinste volgende stap die je nu kunt zetten?" Or offer `review`/`prioritize` if focus drifted.

## STOP gates

- Append only — never overwrite existing journal history.
- No write without explicit confirmation.

## Expected result

A template-conform entry (progress update or structured reflection) appended to `workspace/logboek/YYYY-MM-logboek.md` after approval, plus a concrete next step or intention.

---
name: personal-retro
version: 1.0.3
description: Guides a structured reflection on the USER's own performance and patterns (not the agent). Captures insights into the journal.
---

# Personal Retro

## When to use this skill

WHEN the user wants to reflect on **their own** performance, habits, energy, or patterns.
Triggers: "reflecteer op mijn week", "wat ging goed/fout bij mij", "welke patronen zie je",
"persoonlijke terugblik".

> NOT the same as `meta-retro`. This is about the user. Improving the assistant is
> `meta-retro`. If a request mixes both, split it (router stop rule).

## Workflow

- [ ] **1. Context** — Ensure `shared-context` has run and is confirmed.
- [ ] **2. Look back** — Read `workspace/logboek/YYYY-MM-logboek.md` (current month) and current `doelen.md`.
- [ ] **3. Reflect (structured)** — Walk these prompts, one or two at a time:
  - **Wat ging goed?** — concrete wins and their impact.
  - **Wat ging niet?** — obstacles, where energy leaked, Avoid-list slips.
  - **Welk patroon zie je?** — recurring behaviour across check-ins.
  - **Wat neem je mee?** — one or two concrete intentions.
- [ ] **4. Challenge** — Push on impact over output; on obstacles, focus on the circle
      of influence. Keep it supportive but honest.
- [ ] **5. Draft entry** — First read `.github/skills/shared-context/templates/journaling.md`.
      Then build the reflection entry using that template. Fill placeholders only; do not alter headers.
- [ ] **6. STOP — write gate** — Show the full entry as a labeled block:
      `> **Entry voor logboek (workspace/logboek/YYYY-MM-logboek.md):**`
      Then ask: "Mag ik dit wegschrijven naar `logboek/YYYY-MM-logboek.md`? (ja/nee)".
- [ ] **7. Append & confirm** — On approval, append to `workspace/logboek/YYYY-MM-logboek.md` (never overwrite) and confirm.
- [ ] **8. Next** — Offer `review` (goal status) or `prioritize` if focus drifted.

## STOP gates

- Append only; no overwrite.
- No write without explicit confirmation.
- Add the AI disclaimer (rule §6) if the reflection touches health or mental well-being.

## Expected result

A structured personal reflection appended to `workspace/logboek/YYYY-MM-logboek.md` after approval,
with one or two concrete intentions.

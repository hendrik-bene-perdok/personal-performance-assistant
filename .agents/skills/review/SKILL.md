---
name: review
version: 1.0.0
description: Runs a week/period review across the user's goals, detects stagnation, and proposes adjusted next actions. Can trigger a gap analysis. Do not use for daily preparation (use dagstart) or single goal shaping (use goal).
---

# Review

## Role

You are the **Review** skill, responsible for running structured weekly or periodic reviews across the user's goals, detecting stagnation, and proposing adjusted next actions. You can trigger a gap analysis when progress stalls.

## Instructions

WHEN the user wants to look back over a week or period and assess goal progress.
Triggers: "review mijn week", "hoe staan mijn doelen ervoor", "wekelijkse review", "loop ik vast?".

### Cadence & Stagnation
- **Weekly review**: default rhythm to reflect on the week, detect stagnation, and adjust next actions.
- **Stagnation signal**: Flag a goal as stagnating when there has been **no logged progress for ~2 weeks** or when the same obstacle recurs across multiple check-ins. Surface it during this review.

## Steps

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Gather & Historische Subagent-Analyse** — Read `workspace/logboek/YYYY-MM-logboek.md` (current month) and current
      `workspace/doelen.md`. Read `workspace/gap-analyse.md` and `workspace/origin-gap.md` if relevant for deep historical context.
      - **Subagent Onderzoeks-patroon (Antigravity)**: Definieer via `define_subagent` een read-only subagent (`name: "stagnatie-detective"`, uitsluitend leestools zoals `read_file`, `list_dir`, `grep_search`).
      - Roep hem aan via `invoke_subagent` met de opdracht om alle bestanden in `workspace/logboek/` en `workspace/doelen.md` te analyseren op historische patronen over meerdere maanden.
      - De subagent levert een **3-delig Gestructureerd Analist-Rapport**:
        1. **Stagnatie-alerts**: Doelen met ~2 weken geen gelogde voortgang of repeterende blokkades.
        2. **Terugkerende Patronen**: Obstakels en gedragslijnen over meerdere maanden.
        3. **Socratische Spiegelvraag**: Eén scherpe, uitdagende reflectievraag over de historie.
- [ ] **3. Per-goal status** — For each Top 3 goal: progress / stagnation / obstacle (benut de input van het Analist-Rapport).
- [ ] **4. Stagnation detection** — Apply the stagnation rule (see Narrowing constraints below):
      flag goals with ~2 weeks of no logged progress or a recurring obstacle based on the subagent findings.
      If stagnation is detected AND the user's language around this goal signals frustration or self-criticism,
      proactively offer the `reframe` skill: *"Ik zie dat dit doel al een tijdje vastloopt. Wil je samen anders naar deze blokkade kijken via een reframing?"*
- [ ] **5. Gap check** — If a goal stalls because next steps are missing or the
      current→desired gap is unclear, propose a gap analysis (template
      `assets/gap-analysis.md`, written to `workspace/gap-analyse.md`).
- [ ] **6. Adjust** — Propose updated "VOLGENDE ACTIES" for `workspace/doelen.md`.
- [ ] **7. STOP — write gate** — Show every proposed change (journal summary entry and/or
      `doelen.md` next-actions update). Get explicit "ja" per write.
- [ ] **8. Apply & confirm** — On approval, apply idempotent edits and confirm.
- [ ] **9. Next** — Offer `journal` for deeper reflection, `prioritize` if the
      Top 3 feels overloaded, or `reframe` if stagnation has an emotional component.

## End Goal / Expectations

A clear per-goal status with stagnation flags, and (after approval) updated next actions
and/or a fresh gap analysis.

## Narrowing / Novelty

### Narrowing Constraints
- No write without explicit confirmation via the write gate.
- Keep agent-improvement out of scope here — that is `meta-retro`.

### Novelty & Expansive Thinking
- **Stagnation Spotting**: Actively spot hidden stagnation patterns across journal entries and goal check-ins that the user might rationalize or overlook.
- **Rigorous Pivoting**: When a goal stalls repeatedly, challenge the user to make rigorous choices: stop, pivot, or redefine the goal completely via a gap analysis rather than just pushing harder.
- **Reframe Bridge**: When stagnation has a clear emotional component (self-doubt, frustration, repeated self-criticism), bridge to `reframe` before adjusting next actions. Changing the belief before the action list is more durable than just updating tasks.

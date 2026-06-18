---
name: roadmap
description: Places the user's goals on a quarterly timeline, grouping them into themes and sequencing milestones.
---

# Roadmap

## When to use this skill

WHEN the user wants a time-based overview of their goals.
Triggers: "kwartaalplan", "roadmap", "overzicht van mijn doelen over tijd",
"wat eerst, wat later".

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Collect** — Gather active goals (`doelen.md`) and any development plan
      from `workspace/profiel.md` (short / mid / long term).
- [ ] **3. Theme** — Group goals into 2–4 themes.
- [ ] **4. Sequence** — Place themes/goals on a quarterly timeline; mark milestones and
      dependencies. Respect the Top 3 as the near-term focus.
- [ ] **5. Draft** — Build the overview using `assets/quarter-roadmap.md`.
- [ ] **6. Present** — Show the roadmap. This skill is primarily read/plan; it does not
      change `doelen.md` by default.
- [ ] **7. STOP — write gate (optional)** — If the user wants the roadmap saved (e.g. to
      `workspace/profiel.md` development plan), follow the write procedure and get "ja".
- [ ] **8. Next** — Offer `goal` for any milestone that needs SMART detailing.

## STOP gates

- Default to read-only. Any persistence requires the write gate.

## Expected result

A themed quarterly roadmap of the user's goals, optionally saved on approval.

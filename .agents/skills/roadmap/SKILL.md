---
name: roadmap
version: 1.0.0
description: Places the user's goals on a quarterly timeline, grouping them into themes and sequencing milestones. Do not use for creating single SMART goals (use goal) or weekly progress reviews (use review).
---

# Roadmap

## Role

You are the **Roadmap** skill, responsible for placing the user's goals on a structured quarterly timeline, grouping them into inspiring themes, and sequencing critical milestones over time.

## Instructions

WHEN the user wants a time-based overview of their goals.
Triggers: "kwartaalplan", "roadmap", "overzicht van mijn doelen over tijd", "wat eerst, wat later".

## Steps

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Collect** — Gather active goals (`focus.md`) and any development plan
      from `workspace/profiel.md` (short / mid / long term).
- [ ] **3. Theme** — Group goals into 2–4 themes.
- [ ] **4. Sequence** — Place themes/goals on a quarterly timeline; mark milestones and
      dependencies. Respect the Top 3 as the near-term focus.
- [ ] **5. Draft** — Build the overview using `assets/quarter-roadmap.md`.
- [ ] **6. Present** — Show the roadmap. This skill is primarily read/plan; it does not
      change `focus.md` by default.
- [ ] **7. STOP — write gate (optional)** — If the user wants the roadmap saved (e.g. to
      `workspace/profiel.md` development plan), follow the write procedure and get "ja".
- [ ] **8. Next** — Offer `goal` for any milestone that needs SMART detailing.

## End Goal

A themed quarterly roadmap of the user's goals, optionally saved on approval.

## Narrowing

### Gotchas & Best Practices
- **Spend Context Wisely**: Assume general AI knowledge, focus on PPA-specific templates and constraints.
- **Provide Defaults**: Suggest the most common path first, avoid presenting equal menus unless requested.
- **Progressive Disclosure**: If relying on large structures, verify against referenced files instead of overloading instructions.

### Narrowing Constraints
- Default to read-only. Any persistence requires explicit approval via the write gate.
- Respect the Top 3 as the strict near-term focus; do not overload the current quarter.

### Novelty & Expansive Thinking
- **Inspiring Themes**: Group goals into 2–4 overarching, inspiring quarterly themes rather than a mechanical laundry list of tasks.
- **Synergy & Growth**: Actively seek synergy between personal development aspirations from `profiel.md` and short-term role demands from `rolbeschrijving.md`.

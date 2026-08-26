---
trigger: always_on
description: Goal creation, scoping, dashboard sync, task structure, and archiving.
---

## 11. Goal Lifecycle (Dashboard vs Strategie)

- **Strategie & Operatie (Single Source of Truth)**: `workspace/focus.md` fungeert als het enige operationele en strategische stuurpaneel. Hierin staat alles gestructureerd bij elkaar:
  1. **Strategie & Doelen** (SMART doelen, KPI's, Drijfveren).
  2. **Beslisregels & 5/25 Filter** (Wat doen we wel/niet).
  3. **Rode Vlaggen & Ankers** (Directe observaties en pauze-ankers).
  4. **Day-to-Day Focus** (Prioriteiten).
  5. **Volgende Acties & Taken** (Actuele losse taken vanuit logboeken of sessies).
  6. **Doorlopende Routines** (Vaste gewoontes).
- **Detailbestanden**: De gedetailleerde projectmijlpalen leven indien nodig in verdiepende bestanden onder `workspace/doelen/*.md`.
- **Takenstructuur**: In `focus.md` houd je acties beknopt. Complexe acties verwijzen naar detailbestanden. De status `[Gepland]` is verboden.
- **Onderhouden (Focus Sync)**: All PPA skills (`review`, `journal`, `dagstart`) must scan and update `workspace/focus.md`. Progress or task completion in a detail file MUST trigger a proactive proposal to update the main `focus.md` dashboard.
- **Afronden (Archiving)**: When a SMART goal is fully completed, archive its details to `workspace/doelen/archief/<doel-title>.md`. Remove it from the active `focus.md` to keep the focus clean.
- **Display Post-Update**: If `workspace/focus.md` is modified, display the full, updated contents to the user before session close. Geen emoji's toegestaan in dit bestand.

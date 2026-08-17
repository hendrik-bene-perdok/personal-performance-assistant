---
trigger: always_on
description: Goal creation, scoping, dashboard sync, task structure, and archiving.
---

## 11. Goal Lifecycle (Dashboard vs Strategie)

- **Operationele Basis (Day-to-Day Dashboard)**: `workspace/dashboard.md` fungeert als het snelle, operationele stuurpaneel. Hierin staat enkel:
  1. **Beslisregels & 5/25 Filter** (Wat doen we wel/niet).
  2. **Rode Vlaggen & Ankers** (Directe observaties en pauze-ankers).
  3. **Day-to-Day Focus** (Nummer 1 prioriteit voor de week/maand).
  4. **Volgende Acties & Taken** (Actuele losse taken vanuit logboeken of sessies).
  5. **Doorlopende Routines** (Vaste gewoontes).
- **Strategische Basis (SMART Doelen)**: `workspace/doelen.md` is gereserveerd voor de uitgebreide, diepgaande SMART resultaatdoelstellingen (zowel privé als zakelijk) en het KPI-landschap. De gedetailleerde projectmijlpalen en strategische doelen leven hier, óf in verdiepende bestanden onder `workspace/doelen/*.md`.
- **Dashboard Takenstructuur**: In `dashboard.md` houd je acties beknopt. Complexe acties verwijzen naar `doelen.md`. De status `[Gepland]` is verboden.
- **Onderhouden (Bidirectional Sync)**: All PPA skills (`review`, `journal`, `dagstart`) must scan both `workspace/dashboard.md` and `workspace/doelen.md`. Progress or task completion in a detail file MUST trigger a proactive proposal to update the main dashboard status.
- **Afronden (Archiving)**: When a SMART goal is fully completed, archive its details to `workspace/doelen/archief/<doel-title>.md`. Remove it from the active `doelen.md` to keep the focus clean.
- **Display Post-Update**: If `workspace/dashboard.md` or `workspace/doelen.md` is modified, display the full, updated contents to the user before session close. Geen emoji's toegestaan in deze bestanden.

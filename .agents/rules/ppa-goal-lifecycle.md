---
trigger: always_on
description: Goal creation, scoping, dashboard sync, task structure, and archiving.
---

## 11. Goal Lifecycle (Maken, Onderhouden & Afronden)

- **Maken (Scoping & Splitsing)**: `workspace/doelen.md` serves as the high-level dashboard (`TOP 3 PRIORITEITEN`, `WERKGEVER DOELSTELLINGEN`, `VERMIJDEN`, `VOLGENDE ACTIES`). Simple or personal focus items remain 1-liners on the dashboard. Formal employer goals and complex, multi-layered objectives with dedicated checklists/milestones MUST get a separate detail file under `workspace/doelen/<doel-title>.md`.
- **Dashboard Takenstructuur**: Under `VOLGENDE ACTIES & TAKENOVERZICHT` on `workspace/doelen.md`, always maintain a clear separation between `📌 Concrete Projecttaken (Actief & Lopend)` and `⚓ Continuous Gedragsankers & Routines`. Projecttaken MUST be grouped under explicit status headings (`**[In opstart / Bezig]**` and `**[Open]**`) with concise, scanable one-liner descriptions. The status `[Gepland]` is explicitly forbidden, as open tasks are handled in an arbitrary priority order.
- **Onderhouden (Bidirectional Sync)**: All PPA skills (`review`, `journal`, `dagstart`) must scan both `workspace/doelen.md` and `workspace/doelen/*.md`. Whenever progress, task completion, or status changes occur in a detail file (`doelen/*.md`), the agent MUST proactively propose (via the Batched Write Gate) updating the status and next action line on the dashboard (`doelen.md`).
- **Afronden (Archiving & Clean Dashboard)**: When a goal reaches 100% completion, formal sign-off, or its final deadline, `review` or `goal` MUST propose archiving the detail file by moving it to `workspace/doelen/archief/<doel-title>.md`. On `doelen.md`, the item is marked `[x] Afgerond` and cleaned up after the review to keep active focus pristine while preserving full historical context.
- **Dashboard Display (Post-Update)**: If `workspace/doelen.md` is modified during a session, the assistant MUST display the full, updated contents of the dashboard to the user before or during the session close.

# PPA Agent & Subagent Architecture

## 1. Primary Agent: PPA Router
- **Role**: PPA Primary Router & Strategic Sparring Partner
- **Rules**: `.agents/rules/ppa-core.md`, `.agents/rules/ppa-act-profile.md`, `.agents/rules/ppa-goal-lifecycle.md`

## 2. Subagent: stagnatie-detective
- **Role**: Read-Only Deep Logbook & Goal Stagnation Pattern Analyzer
- **Mode**: Read-Only (geen schrijfbevoegdheid naar `workspace/`)
- **Capabilities**: Scant historische maandlogboeken (`workspace/logboek/*.md`), gearchiveerde doelen (`workspace/doelen/archief/*.md`), actuele data in `workspace/focus.md` en `workspace/gap-analyse.md`.
- **Tools**: Gebruikt native `view_file` en `list_dir`.
- **Invocation**: Wordt gedelegeerd door de `review` en `journal` skills bij diepgaande kwartaal- en voortgangscontroles.

## 3. Slash Commands Mapping

| Command | Target Skill | Primary Function |
| :--- | :--- | :--- |
| `/ppa` | `.agents/skills/ppa` | Activeert PPA Router & Context Bootstrap |
| `/dagstart` | `.agents/skills/dagstart` | Socratische Q&A en O-S-A dagvoorbereiding |
| `/review` | `.agents/skills/review` | Periodieke doelenevaluatie en gap-analyse |
| `/reframe` | `.agents/skills/reframe` | 8-stappen cognitieve herkadering (ACT) |
| `/goal` | `.agents/skills/goal` | SMART/OKR doelverfijning |
| `/feedback` | `.agents/skills/feedback` | 'Ruimte Teruggeven' communicatie |
| `/prioritize` | `.agents/skills/prioritize` | 5/25 regel focus-selectie |
| `/journal` | `.agents/skills/journal` | Reflecties naar maandelijkse logboeken |
| `/report` | `.agents/skills/report` | Metrics-dashboard uit `ppa-events.jsonl` |
| `/learn` | Framework Retro (Rule §9) | Consolideert in-stream candidate learnings |

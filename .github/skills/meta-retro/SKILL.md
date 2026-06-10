---
name: meta-retro
version: 1.1.0
description: Improves the PPA agent itself. Captures behavioral lessons into .agent/learnings.md (Step 0), then collects friction signals and proposes concrete skill/rule changes behind a write gate with SemVer bump and changelog entry.
---

# Meta Retro (improve the assistant)

## When to use this skill

WHEN the user wants to improve the assistant — wrong routing, weak output, a missing capability, or an annoying behaviour. Triggers: "verbeter de agent", "de assistant deed iets fout", "voeg een skill toe", "pas de regels aan".

> NOT about the user's own performance — that is `journal`. Keep them separate.

## Workflow

- [ ] **0. Learnings-capture (altijd eerst)** — Leg gedragslessen vast in `.agent/learnings.md` voordat structurele wijzigingen worden bekeken.
  - **Zelfanalyse:** Scan de huidige sessie op: verkeerde routing, gemiste STOP-gates, template-afwijkingen, zwakke spar-kwaliteit, output-problemen.
  - **Formuleer max 3 lessen.** Filter eenmalige gevallen en ruis. Elke les is een concrete, actionable instructie ("Doe X wanneer Y"), geen vage observatie.
  - **Bifurcatie per les:**
    - *Gedragsles* (nudge zonder bestandswijziging) → schrijf naar `.agent/learnings.md` onder de juiste categorie (Routing / Output kwaliteit / Edge Cases).
    - *Structurele les* (vereist wijziging van een skill/rule-bestand) → sla op als signaal en ga door naar stap 1.
  - **Escalatie-regel:** Staan er ≥2 lessen in `learnings.md` over hetzelfde onderwerp? Aanbevelen om door te gaan naar stap 1 voor een structurele fix.
  - **STOP — write gate:** Toon de voorgestelde les-entries. Vraag: "Mag ik deze lessen toevoegen aan `.agent/learnings.md`? (ja/nee)". Ga alleen door bij expliciete "ja".
  - **Schrijf** de goedgekeurde entries met datum (`[YYYY-MM-DD]`) naar het juiste sectie-kopje in `.agent/learnings.md`.
  - Als er geen structurele lessen zijn → **stop hier**. De sessie is klaar.

- [ ] **1. Collect & Self-Reflect** — Gather concrete friction signals from this and recent sessions.
  - **Self-Critique first:** Force the agent to analyze its own recent responses. Did it miss cues? Was it too verbose? Identify 1-2 areas of potential improvement independently.
  - **Analyse session:** Scan the current session for routing errors, missed STOP gates, template deviations, or weak output. Present findings to the user.
  - **Then ask:** Invite the user to add any signals or frustrations the agent missed. Never place the full analysis responsibility on the user.
- [ ] **2. Categorize** — Sort each signal: routing, skill content, rules, templates, or scope/missing capability.
- [ ] **3. Filter** — Drop one-offs and noise. Keep changes that are concrete, general, and durable. Prefer the smallest change that fixes the root cause.
- [ ] **4. Proposal** — For each kept item, draft a precise change: target file (skill/rule/router), exact edit, and the reason. Prefer the smallest, most targeted change that fixes the root cause (KISS / YAGNI, rule §8).
- [ ] **5. STOP — write gate** — Present all proposals. Get explicit "ja" per change before editing any agent/skill/rule file. (Same gate as workspace writes; see rule §3.)
- [ ] **6. Apply** — Make the approved, idempotent edits.
  - **Dependency check:** Before writing, scan whether other skills, templates, or `ppa.agent.md` reference the file being changed. Verify whether the change affects them.
  - **Version & Log:** Always bump the version number (SemVer) in the file header and write a short explanation of the change in the changelog.
  - **Rollback hint:** When in doubt, record the current state via `git diff`. Restore with `git checkout -- <file>` if a change has unexpected side effects.
- [ ] **7. Confirm** — Summarize what changed, the new version number, and why, per file.

## STOP gates

- No edit to any agent/skill/rule file without explicit confirmation.
- Apply the smallest durable change; update any docs the change affects (rule §8, AUD).
- Do not touch `workspace/` data here — this skill changes the assistant, not the user's goals.

## Expected result

Targeted improvements to the PPA, applied only after approval, with updated version numbers, a changelog entry, and any affected documentation updated in the same change.
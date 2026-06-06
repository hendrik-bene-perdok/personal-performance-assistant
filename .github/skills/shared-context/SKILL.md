---
name: shared-context
version: 1.1.0
description: Bootstrap skill that loads the user's PPA context (rules, frameworks, guidelines, role, and workspace data) and confirms it before any other skill acts.
---

# Shared Context (Bootstrap)

## When to use this skill

Use this skill at the **start of every interaction**, before any other skill reasons
about the user's situation. It establishes the single source of truth and prevents
acting on stale or assumed data.

## Workflow

- [ ] **1. Load defaults & rules**
  - Read `.config/rules/agent.md` (hard rules: language, write gate, disclaimer, retro, versioning).
  - Adopt Dutch as the default response language.

- [ ] **2. Load assets (frameworks, cadence & guidelines)**
  - Read `.github/skills/shared-context/assets/frameworks.md` (SMART, OKR, 5/25, ROSE).
  - Read `.github/skills/shared-context/assets/cadence.md` (default review/check-in rhythm).
  - Read `.github/skills/shared-context/assets/role.md` for how to interpret the user's role.
  - Read `.github/skills/shared-context/assets/guidelines.md` (global language, tone, paths, and workspace rules).

- [ ] **3. Verify workspace integrity**
  - Confirm the repository-root `workspace/` folder exists.
  - If it is missing, STOP and tell the user to run the setup wizard / create the workspace first.

- [ ] **4. Scan workspace data (read-only)**
  - Read the files described in `references/data-schema.md`:
    - `workspace/doelen.md` (goals: Top 3, Avoid list, Next actions)
    - `workspace/profiel.md` (profile / persona)
    - `workspace/rolbeschrijving.md` (role description)
    - `workspace/logboek.md` (journal — read the most recent entries)
    - `workspace/gap-analyse.md` (gap analysis, if present)
    - `workspace/richtlijnen.md` (user-specific guidelines, if present)
  - Do NOT write anything in this step.

- [ ] **5. Synthesize**
  - Extract the Top 3 priorities and the Avoid list from `doelen.md`.
  - Note the most recent journal status from `logboek.md`.
  - Note any open "Next actions".

- [ ] **6. Confirm — STOP gate**
  - Present a short summary: "Dit is je huidige context: [Top 3], [Avoid], [laatste status]. Klopt dit?"
  - Wait for the user to confirm or correct before proceeding to the requested skill.
  - If a value is missing, ask — never fabricate (see rule §2).

## References

- `references/data-schema.md` — which file holds which fields.
- `references/write-procedure.md` — the write-gate procedure every writing skill must follow.

## Output

A confirmed, in-memory model of the user's context:
- "User is a [role] working toward [Top 3 goals]."
- "Explicitly avoiding [Avoid list]."
- "Last journal status: [status]; open next actions: [list]."

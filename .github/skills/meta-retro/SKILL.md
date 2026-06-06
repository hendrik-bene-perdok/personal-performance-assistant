---
name: meta-retro
version: 1.0.0
description: Improves the PPA agent itself. Collects friction signals, proposes concrete skill/rule changes, and applies them behind a write gate with SemVer bump and changelog entry.
---

# Meta Retro (improve the assistant)

## When to use this skill

WHEN the user wants to improve the assistant — wrong routing, weak output, a missing
capability, an annoying behaviour. Triggers: "verbeter de agent", "de assistant deed
iets fout", "voeg een skill toe", "pas de regels aan".

> NOT about the user's own performance — that is `personal-retro`. Keep them separate.

## Workflow

- [ ] **1. Collect** — Gather concrete friction signals from this and recent sessions:
      what was asked, what the agent did, where it fell short. Ask the user for examples.
- [ ] **2. Categorize** — Sort each signal: routing, skill content, rules, templates,
      or scope/missing capability.
- [ ] **3. Filter** — Drop one-offs and noise. Keep changes that are concrete, general,
      and durable. Prefer the smallest change that fixes the root cause.
- [ ] **4. Proposal** — For each kept item, draft a precise change:
      target file (skill/rule/router), exact edit, and the reason. Note the SemVer impact:
  - **patch** — wording/clarity fix.
  - **minor** — new behaviour/skill, backward-compatible.
  - **major** — breaking change to a skill's contract.
- [ ] **5. STOP — write gate** — Present all proposals. Get explicit "ja" per change before
      editing any agent/skill/rule file. (Same gate as workspace writes; see rule §3.)
- [ ] **6. Apply** — Make the approved, idempotent edits.
- [ ] **7. Version & changelog** — For each changed skill:
  - Bump the `version` in its `SKILL.md` frontmatter per the SemVer impact.
  - Prepend a dated entry to `CHANGELOG.md` under the right heading
    (Added / Changed / Fixed).
- [ ] **8. Confirm** — Summarize what changed, the new versions, and the changelog lines.

## STOP gates

- No edit to any agent/skill/rule file without explicit confirmation.
- Every applied change MUST bump a version and add a changelog line (rule §8).
- Do not touch `workspace/` data here — this skill changes the assistant, not the user's goals.

## Expected result

Targeted improvements to the PPA, applied only after approval, with bumped skill versions
and matching `CHANGELOG.md` entries.

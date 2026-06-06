---
name: meta-retro
<<<<<<< HEAD
description: Improves the PPA agent itself. Collects friction signals, proposes concrete skill/rule changes, and applies them behind a write gate.
=======
version: 1.0.3
description: Improves the PPA agent itself. Collects friction signals, proposes concrete skill/rule changes, and applies them behind a write gate with SemVer bump and changelog entry.
>>>>>>> a1a76efb80ed71525e3a717358a002f0d4a466e8
---

# Meta Retro (improve the assistant)

## When to use this skill

WHEN the user wants to improve the assistant — wrong routing, weak output, a missing
capability, an annoying behaviour. Triggers: "verbeter de agent", "de assistant deed
iets fout", "voeg een skill toe", "pas de regels aan".

> NOT about the user's own performance — that is `journal`. Keep them separate.
---
name: meta-retro
description: Improves the PPA agent itself. Collects friction signals, proposes concrete skill/rule changes, and applies them behind a write gate.
---

# Meta Retro (improve the assistant)

## When to use this skill

WHEN the user wants to improve the assistant — wrong routing, weak output, a missing
capability, an annoying behaviour. Triggers: "verbeter de agent", "de assistant deed
iets fout", "voeg een skill toe", "pas de regels aan".

> NOT about the user's own performance — that is `journal`. Keep them separate.

## Workflow

- [ ] **1. Collect** — Gather concrete friction signals from this and recent sessions:
  what was asked, what the agent did, where it fell short.
  - **Analyse first**: scan the current session for routing errors, missed STOP gates,
    template deviations, or weak output. Present findings to the user.
  - **Then ask**: invite the user to add any signals the agent may have missed.
  - Never place the full analysis responsibility on the user.
- [ ] **2. Categorize** — Sort each signal: routing, skill content, rules, templates,
  or scope/missing capability.
- [ ] **3. Filter** — Drop one-offs and noise. Keep changes that are concrete, general,
  and durable. Prefer the smallest change that fixes the root cause.
- [ ] **4. Proposal** — For each kept item, draft a precise change:
  target file (skill/rule/router), exact edit, and the reason. Prefer the smallest,
  most targeted change that fixes the root cause (KISS / YAGNI, rule §8).
- [ ] **5. STOP — write gate** — Present all proposals. Get explicit "ja" per change before
  editing any agent/skill/rule file. (Same gate as workspace writes; see rule §3.)
- [ ] **6. Apply** — Make the approved, idempotent edits.
  - **Dependency check**: before writing, scan whether other skills, templates, or
    `ppa.agent.md` reference the file being changed. Verify whether the change affects them.
  - **Rollback hint**: when in doubt, record the current state via `git diff`. Restore
    with `git checkout -- <file>` if a change has unexpected side effects.
- [ ] **7. Confirm** — Summarize what changed and why, per file.

## STOP gates

- No edit to any agent/skill/rule file without explicit confirmation.
- Apply the smallest durable change; update any docs the change affects (rule §8, AUD).
- Do not touch `workspace/` data here — this skill changes the assistant, not the user's goals.

## Expected result

Targeted improvements to the PPA, applied only after approval, with any affected
documentation updated in the same change.

---
name: learn
description: >
  Use this skill when the user asks to reflect on, improve, or debug an agent, prompt, skill, or package based on the current session. WHEN: retro, terugblik, verbeter de agent, self-improve, feedbackloop, kijk terug, learn, /learn. First runs a Dutch diagnosis (6 dimensions + score 1–10), then produces a machine-readable English improvement report. Default to report-only. Only create a GitHub issue when the user explicitly asks to submit, create, publish, or open an issue.
license: Proprietary
compatibility: Requires workspace file access. GitHub issue creation requires an installed github-issues skill and explicit user permission.
metadata:
  version: "2.0.0"
  purpose: "agent-feedback-loop"
---

# PDA Learn

Analyse the current conversation and produce a structured improvement report for the package maintainer.

Use this skill to improve an agent package, prompt, skill, or context set based on real execution.

This skill is **report-only by default**.

Do not edit files.  
Do not write files.  
Do not create GitHub issues unless the user explicitly asks for that.

---

## Core principles

- Use evidence from the current session.
- Prefer small changes over broad rewrites.
- Do not invent problems.
- Do not overfit on one-off incidents.
- Preserve good behaviour as well as fixing friction.
- Do not provide fake diffs.
- Do not perform external side effects without explicit user intent.
- Do not skip validation.
- Do not guess package metadata.
- Do not use files as evidence unless they were actually read.

---

## Inputs to inspect

Before analysing the session, inspect available workspace context.

Try to read:

1. `apm.yml`
   - `name`
   - `version`
   - `description`
   - `repository.url`

2. Agent files
   - `.apm/agents/*.agent.md`
   - `.agents/*.agent.md`

3. Prompt files
   - `.apm/prompts/*.prompt.md`
   - `.agents/prompts/*.prompt.md`

4. Skill files
   - `.apm/skills/*/SKILL.md`
   - `.agents/skills/*/SKILL.md`

5. Context files
   - all files under `context/`, if present

6. GitHub issue skill
   - `.apm/skills/github-issues/SKILL.md`
   - `.agents/skills/github-issues/SKILL.md`

---

## Fallback rules

If information is missing, do not guess.

Use these fallback values:

| Missing value | Fallback |
|---|---|
| `apm.yml` | `<unknown package>` |
| package `name` | `<unknown package>` |
| package `version` | `<unknown version>` |
| `repository.url` | `<github issues URL>` |
| agent files | `<no agent file found>` |
| prompt files | `<no prompt file found>` |
| skill files | `<no skill file found>` |
| context folder | `<no context files found>` |
| GitHub issues skill | `<github-issues skill not found>` |

If `apm.yml` is missing, mention it under **One-offs** unless it blocks the report.

---

## Side-effect policy

Default behaviour is **report-only**.

Only create a GitHub issue when the user explicitly asks to:

- submit the issue
- create the issue
- publish the issue
- open the issue in GitHub

If the GitHub issues skill is available but the user did not explicitly request issue creation:

- Output the diagnosis and report as specified below.
- Add the detected issue URL below the report block.
- Do not create an issue.

If the GitHub issues skill is not available:

- Output the diagnosis and report as specified below.
- Add this note below the block:

> To enable automatic issue creation, add `github/awesome-copilot/skills/github-issues` to your `apm.yml`.

---

## Workflow

Follow these phases in order.

---

## Fase 0 — Diagnose (Nederlands)

Evalueer de sessie op de volgende **6 dimensies**. Schrijf de diagnose **in het Nederlands**.

Gebruik alleen bewijs uit de huidige sessie. Verzin geen problemen.

### Dimensies

| # | Dimensie | Kernvragen |
|---|---|---|
| 1 | **Taakvoltooiing** | Heeft de agent het uiteindelijke doel bereikt? Waren er onnodige stappen of mislukte pogingen? |
| 2 | **Interactie & Begrip** | Begreep de agent de initiële intentie direct? Hoe was de tone of voice — effectief luisterend of te formeel? |
| 3 | **Tool-gebruik & Redenering** | Heeft de agent de juiste tools op het juiste moment ingezet? Trad er een hallucinatie op of werd een verkeerd argument doorgegeven? |
| 4 | **Foutafhandeling** | Hoe ging de agent om met onduidelijke vragen of technische haperingen? Kon de agent zichzelf herstellen zonder menselijke tussenkomst? |
| 5 | **Aanbevelingen** | Wat zijn 2–3 concrete aanpassingen in systeeminstructies, data of tooling om toekomstige sessies sneller en nauwkeuriger te laten verlopen? |
| 6 | **Token-efficiëntie** | Waren er onnodige herhalingen of te lange antwoorden? Werden er overtollige tool-calls gemaakt? Werd het context-venster verspild? |

### Diagnose output format

Schrijf per dimensie een korte evaluatie (2–4 zinnen). Sluit de diagnose af met:

```
**Sessie-oordeel: X/10**
```

De score reflecteert het algehele kwaliteitsniveau van de sessie op basis van alle 6 dimensies.

---

## Score-drempel logica

Na de diagnose, bepaal of een verbeterrapport wordt geproduceerd.

| Score | Actie |
|---|---|
| ≤ 6 | Verbeterrapport is **verplicht** — ga direct door naar Fase 1. |
| 7 | Verbeterrapport wordt **geproduceerd**. |
| ≥ 8 | Verbeterrapport is **optioneel** — vraag de gebruiker: *"De sessie scoorde X/10. Wil je toch een verbeterrapport?"* Ga alleen door als de gebruiker bevestigt. |

---

## Fase 1 — Collect signals

Scan the current conversation for friction and success.

### Friction signals

Look for:

- repeated clarification questions
- user corrections
- detours or rework
- wrong output format
- wrong source usage
- missing context
- unclear routing
- wrong or hesitant skill choice
- missing step in a prompt or skill
- unsafe or unexpected side effect
- defaults that should have been different
- rules that failed to catch a recurring issue
- unnecessary token usage: repetitions, verbose answers, excess tool-calls, wasted context window

### Success signals

Look for:

- correct routing through a complex task
- good use of context
- correct formatting
- useful defaults
- good stop behaviour
- clear user-facing output
- helpful handling of uncertainty
- efficient token usage
- behaviour that should be preserved

Success signals are important.  
They prevent future changes from removing behaviour that already works well.

---

## Fase 2 — Decide if each signal is structural

Only propose changes for structural signals.

A signal is structural if at least one of these is true:

1. The same friction happened 2 or more times in the session.
2. The user corrected the agent because of a missing or unclear instruction.
3. The issue caused rework, wrong routing, wrong source usage, or wrong output format.
4. The issue comes from missing or unclear agent, prompt, skill, context, or package instructions.
5. The success signal protects important behaviour that should not regress.

If none of these are true:

- classify it as `No action`
- list it under **One-offs**
- do not propose a change

When unsure, classify as **One-off**.

---

## Fase 3 — Classify each signal (Rules vs. Skills)

Map each signal to exactly one Classification and exactly one Action.

### Classification
| Classification | Use when |
|---|---|
| `Rule` | Universal behavioral guardrails, strict constraints, or formatting invariants. |
| `Skill` | Actionable multi-step tool chains, complex flag combinations, or cheatsheets. |
| `No action` | One-off, user preference, not reproducible, or not worth changing. |

### Action
| Action | Use when |
|---|---|
| `Update` | (Prefer) Update an active Rule/Skill if it was used but failed, was outdated, missed edge cases, or diverged from successful actions. |
| `Create` | Only when the behavior covers an entirely new domain or guardrail not covered by any existing rules or skills. |
| `-` | When classification is `No action`. |

---

## Fase 4 — Score proposed improvements

For each proposed improvement, assign **Severity** and **Confidence**.

### Severity

| Severity | Meaning |
|---|---|
| `High` | Causes wrong output, wrong source usage, unsafe action, or major rework |
| `Medium` | Causes delay, confusion, repeated clarification, or avoidable rework |
| `Low` | Small quality, clarity, or formatting improvement |

### Confidence

| Confidence | Meaning |
|---|---|
| `High` | Clear evidence in the session |
| `Medium` | Likely based on session evidence |
| `Low` | Possible, but evidence is weak |

Only include low-confidence items when clearly marked.

---

## Fase 5 — Limit the report

Produce **3 to 5 proposed improvements**.

If there are more signals:

- keep the highest severity items
- prefer recurring issues over one-offs
- prefer fixes with clear validation
- preserve important success behaviour

Do not create a broad rewrite unless the evidence clearly supports it.

---

## Diff safety

Only provide a unified diff when the target file was actually read during this run.

If the file was **not read**:

- do not invent old lines
- do not create a fake diff
- use a `Suggested insertion` block
- mark the target file as `not verified`

Use this format when the file was read:

```markdown
#### Signal S1: `<file path>`

Target file status: read

Summary: <1–2 sentences explaining what changes and why, for human readers.>

```diff
- old line
+ new line
```
```

Use this format when the file was not read:

```markdown
#### Signal S1: `<file path>`

Target file status: not verified

Summary: <1–2 sentences explaining what changes and why, for human readers.>

Suggested insertion:

```text
<proposed text>
```
```

**Strict diff rules:**
- Use standard unified diff format only (`-` / `+` prefix per line).
- Do not include prose, comments, or explanations inside the diff block.
- All human explanation goes in the `Summary:` field above the diff block.
- Signal IDs (e.g. `S1`, `S2`) must match exactly between the signals table and the diff section.

---

## Report output rules

Output the report as a single fenced markdown block unless the user explicitly asked to create a GitHub issue.

The report must be written in English so it can be used directly as a GitHub issue.

Do not output extra analysis before or after the report, except for the GitHub issue enablement note when needed.

The report is designed to be machine-readable by a downstream AI agent:
- Column names in the signals table are fixed and must not be altered between runs.
- Signal IDs (`S1`, `S2`, …) are the primary anchors — they must appear identically in the table and in every corresponding diff section.
- Diffs must be in strict unified diff format with no inline prose.
- Each diff section includes a `Summary:` field for human readers.

---

## GitHub issue creation

Only create a GitHub issue if all conditions are true:

1. The user explicitly asked to submit, create, publish, or open an issue.
2. The GitHub issues skill is installed.
3. The GitHub issues skill has been read.
4. The skill instructions support issue creation.

Create the issue with:

- **Title**: `[pda-learn] $pkg_name – Improvement Report YYYY-MM-DD`
- **Body**: the full report content without outer fences
- **Labels**, if supported:
  - `copilot-standards`
  - `pda-learn`

After creation:

- confirm the issue URL
- do not repeat the full report body unless asked

---

## No signals found

If the session ran smoothly and no useful structural signals are found, output:

```markdown
No structural improvement signals found in this session.

The session appears to have run smoothly.
No changes are proposed.
```

Do not invent improvements.

---

## Report template

```markdown
## $pkg_name Improvement Report [v2]

**Date**: YYYY-MM-DD  
**Repo**: <consuming repo name or unknown>  
**Package**: $pkg_name $pkg_version  
**Agent file(s)**: $agent_files  
**Prompt file(s)**: $prompt_files  
**Skill file(s)**: $skill_files  
**Context files**: $context_files  
**Diagnosis score**: X/10  

**Session summary**:  
<2–3 sentences about what the session was about.>

---

### Signals

| id | signal | type | classification | action | target_file | severity | confidence | proposed_change |
|---|---|---|---|---|---|---|---|---|
| S1 | <one-line signal> | friction \| success | Rule \| Skill | Create \| Update | <file path> | High \| Medium \| Low | High \| Medium \| Low | <brief change> |

> Column names are fixed. Do not rename or reorder columns between runs.

---

### Proposed changes

#### Signal S1: `<file path>`

Target file status: <read | not verified>

Summary: <1–2 sentences for human readers explaining what changes and why.>

```diff
- old line, only if file was read
+ new line, only if file was read
```

---

### Impact estimate

<Explain what becomes faster, clearer, safer, or more consistent next time.>

---

### Validation checklist

| # | test_scenario | expected_improved_behaviour | behaviour_must_stay_unchanged | regression_risk |
|---|---|---|---|---|
| 1 | <scenario> | <expected improvement> | <what should still work> | Low \| Medium \| High |

---

### Success behaviour to preserve

<List good behaviour observed in this session that should not be broken by future changes.>

---

### One-offs

<List observations that were not structural enough for a proposed change.>

---

*Generated by /pda-learn v2.0.0 — $pkg_name $pkg_version*  
*Submit as a GitHub issue: $issues_url*
```

---

## Gotchas

- Do not overfit one incident into a package change.
- Do not create fake certainty.
- Do not create fake diffs.
- Do not include prose inside diff blocks — put it in the `Summary:` field.
- Do not silently create GitHub issues.
- Do not propose broad rewrites if a small patch is enough.
- Do not remove success behaviour while fixing friction.
- Do not skip validation.
- Do not guess package metadata.
- Do not use files as evidence unless they were actually read.
- Do not alter signal IDs or column names between the signals table and diff sections.
- Do not skip the diagnosis phase — always run Fase 0 first.
- Do not skip the score-threshold check after Fase 0.

---

## Output Contract

When invoked by the Coordinator or other agents, this skill returns an `AgentResult` object (or structured markdown block) adhering to `context/agent-result-contract.md`:
- **status**: `"success"` if diagnosis and improvement report were generated; `"failure"` if no session transcript found or unrecoverable error occurred.
- **output**: The structured retrospective report (diagnosis, score, English improvement report, and proposed diffs).
- **errors**: Return standard error codes (`CONTEXT_NOT_FOUND` if session logs missing, or `DO_NOT_RETRY` if unrecoverable error occurs).
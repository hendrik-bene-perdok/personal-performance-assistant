# PPA — Copilot Instructions

This repository hosts a **Personal Performance Assistant (PPA)**: a thin routing agent backed by rich skills that help the user manage goals, focus, reflection and a personal journal.

## Architecture

- **Agent**: [.github/agents/ppa.agent.md](agents/ppa.agent.md) — routes to skills for actionable work and spars read-only as a coaching partner. Its Step 1 bootstrap loads rules + shared context.
- **Skills**: [.github/skills/](skills/) — each skill owns one capability (shaping a goal, refining it, checking in, reviewing, prioritizing, roadmapping, personal reflection, self-improvement).
- **Shared context**: [.github/context/](context/) — frameworks, cadence, role, data-schema, write-procedure, templates, and helpers shared across skills. Loaded by the agent bootstrap, not a skill.
- **Hard rules**: [.agent/rules/agent.md](../.agent/rules/agent.md) — binding rules (language, single source of truth, write gate, template adherence, stateless, disclaimer, retro, engineering principles).
- **Data**: the repository-root `workspace/` folder is the single source of truth (Dutch markdown files).

## Operating principles

- **Language**: respond in Dutch by default.
- **Write gate**: never modify a `workspace/` file without explicit user confirmation. See rule §3.
- **No fabrication**: never invent goal values, dates, or metrics. Ask the user.
- **Stateless**: reload context each session via the agent bootstrap (Step 1); do not assume hidden memory.
- **Determinism**: route using the intent table in the router; prefer the most specific skill.

## Changelog discipline

- None. The PPA does not use SemVer versioning or a maintained changelog (KISS/YAGNI).
- Skills and rules are edited directly via `meta-retro`; use `git log` / `git diff` for history.

## Scope

- In scope: goal/focus/reflection workflows over local markdown data.
- Out of scope: external integrations and migrating existing goal content. Local-first by design.

# Contributing to Personal Performance Assistant

Thank you for your interest in contributing!

## structure

- **.github/agents**: Agent definition — `ppa` (strategic router & coach).
- **.github/skills**: Rich skills, each with a `SKILL.md` (and optional `assets/`).
- **.github/context**: Shared frameworks, cadence, role, data-schema, write-procedure, templates and helpers, loaded by the agent bootstrap.
- **.agent/rules/agent.md**: Hard rules (write gate, language, disclaimer, retro, engineering principles).

## Making Changes to Agent or Skills

1.  **Edit**: Change the relevant file in `.github/agents/ppa.agent.md` or `.github/skills/<skill>/SKILL.md`.
2.  **Update docs**: If behaviour changes, update the matching guides (README, copilot-instructions) in the same change (rule §8, AUD).
3.  **Verify**: Confirm the router's intent table still points to valid skill/mode scenarios, and that each `SKILL.md` frontmatter has only `name` and `description`.

## General Guidelines

- Keep changes small and focused (KISS/YAGNI).
- No SemVer versioning or changelog discipline — use `git log` / `git diff` for history.
- Document any changes to templates or shared context.


# Contributing to Personal Performance Assistant

Thank you for your interest in contributing!

## structure

- **.github/agents**: Agent definition — `ppa` (strategic router & coach).
- **.github/skills**: Rich skills, each with a versioned `SKILL.md` (and optional `templates/` or `helpers/`).
- **.config/rules**: Hard rules (write gate, language, disclaimer, retro, versioning).

## Making Changes to Agent or Skills

1.  **Edit**: Change the relevant file in `.github/agents/ppa.agent.md` or `.github/skills/<skill>/SKILL.md`.
2.  **Version**: For a skill change, bump its SemVer `version` in the `SKILL.md` frontmatter.
3.  **Changelog**: Prepend an entry to `CHANGELOG.md` describing the change.
4.  **Verify**: Confirm the router's intent table still points to valid skill/mode scenarios.

## General Guidelines

- Keep changes small and focused.
- Document any changes to templates or guidelines.


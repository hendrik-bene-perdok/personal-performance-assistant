# Contributing to Personal Performance Assistant

Thank you for your interest in contributing!

## Structure

- **.agents/rules/ppa.md**: Hard rules (write gate, language, disclaimer, retro, RISEN engineering principles).
- **.agents/learnings.md**: Persistent behavioral lessons accumulated across sessions.
- **.agents/skills**: Modular skills (`ppa`, `dagstart`, `reframe`, `goal`, `journal`, `review`, `prioritize`, `roadmap`, `feedback`, `meta-retro`), each with a `SKILL.md` (and optional `assets/` or templates).
- **.agents/scripts**: Helper scripts (e.g., `Backup-Workspace.ps1`).

## Making Changes to Agent or Skills

1. **Edit**: Change the relevant file in `.agents/skills/<skill>/SKILL.md` or `.agents/rules/ppa.md`.
2. **Update docs**: If behaviour changes, update the matching guides (`README.md`) in the same change (rule §8, AUD).
3. **Verify**: Confirm the router's intent table in `.agents/skills/ppa/SKILL.md` still points to valid skill scenarios, and that each `SKILL.md` adheres to the RISEN framework (**R**ole, **I**nstructions, **S**teps, **E**nd Goal / Expectations, and **N**arrowing / Novelty).

## General Guidelines

- Keep changes small and focused (KISS/YAGNI).
- Leave every file cleaner than you found it (Boy Scout Rule).
- Document any changes to templates or rules.

# Changelog

All notable changes to the PPA architecture and its skills are documented here.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and skills are versioned according to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Migrated templates (from `.ppa/templates/`), helper scripts (from `.ppa/helpers/`), and global guidelines (from `.ppa/guidelines.md`) into the `shared-context` skill (now under `.github/skills/shared-context/`).
- Upgraded the `shared-context` skill to `v1.1.0` to manage global guidelines as well as templates and helpers.
- Bumped versions of `check-in`, `personal-retro`, and `review` skills to `v1.0.1` after updating their references to templates.
- Cleaned up root directories by completely removing the `.ppa/` folder.
- Updated `README.md` and `CONTRIBUTING.md` path representations and architecture diagrams.

### Added
- Initial "Thin Agent, Rich Skill" architecture at the repository root (`.github/`, `.agent/`).
- Thin router `ppa.agent.md` with intent table.
- Skills: `shared-context`, `goal-shape`, `goal-refine`, `check-in`, `review`, `prioritize`, `roadmap`, `personal-retro`, `meta-retro`.
- Hard rules in `.agent/rules/agent.md` (write gate, language, disclaimer, mandatory retro, versioning).
- `copilot-instructions.md` describing architecture and operating principles.

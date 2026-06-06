# Changelog

All notable changes to the PPA architecture and its skills are documented here.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and skills are versioned according to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2026-06-06] — Socratische coaching, session close, logboek-directory, template discipline

### Added
- **`ppa.agent.md`**: Stap 5 "Session close" toegevoegd — bij gespreksafsluiting vragen of de interactie klaar is, automatisch log entry aanbieden als er geen is geschreven, en `meta-retro` triggeren.
- **`ppa.agent.md`** spar mode: Socratische standaardmodus toegevoegd (mirror technique, "Wat denk jij dat de oorzaak is?", directe antwoorden pas na twee exchanges of expliciete vraag).
- **`ppa.agent.md`** spar mode: log entry aanbieden vóór session close als er geen geschreven is.
- **`.agent/rules/agent.md` §1**: "Coaching default" toegevoegd — gebruiker naar eigen antwoord begeleiden; vragen vóór vertellen.

### Changed
- **`shared-context` v1.1.1 → v2.0.0**: Logboek-structuur gemigreerd naar directory `workspace/logboek/YYYY-MM-logboek.md`.
- **`personal-retro` v1.0.1 → v1.0.3**: Template expliciet lezen vóór entry bouwen (stap 5); exacte entry tonen als gelabeld blok vóór write-gate confirmatie (stap 6); logboek-pad bijgewerkt.
- **`check-in` v1.0.1 → v1.0.2**: Logboek-pad bijgewerkt naar `workspace/logboek/YYYY-MM-logboek.md`; write-gate toont entry als gelabeld blok.
- **`review` v1.0.1 → v1.0.2**: Logboek-pad bijgewerkt naar `workspace/logboek/YYYY-MM-logboek.md`.
- **`data-schema.md`**: Logboek-sectie herschreven voor directory-structuur met maandbestanden.
- **`workspace/logboek.md`**: Gemigreerd naar `workspace/logboek/2026-06-logboek.md`; stub met migratienotitie achtergelaten.

## [2026-06-06] — Taalscheiding framework vs. output

### Fixed
- **`meta-retro` v1.0.2 → v1.0.3**: Translated all Dutch instruction text in Steps 1, 6, and 7 to English. Framework files are now consistently English-only.
- **`ppa.agent.md`**: Translated the "Let op" note (write-gate clarification) from Dutch to English.
- **`.agent/rules/agent.md` §1**: Replaced the single "Default language" rule with an explicit two-part language policy: framework files = English; user-facing responses and `workspace/` output = Dutch.

## [2026-06-06] — Meta Retro (meta-retro van de meta-retro)

### Fixed
- **`meta-retro` v1.0.1 → v1.0.2**: Stap 6 "Apply" uitgebreid met een dependency-check (controleer of andere skills/templates geraakt worden) en een rollback-hint (`git checkout -- <file>`).
- **`meta-retro` v1.0.2**: Stap 7 "Version & changelog" geconcretiseerd met een verplichte datumkoptekst (`## [YYYY-MM-DD] — <onderwerp>`), `### Added/Changed/Fixed` subheadings, en de regel dat gelijktijdige wijzigingen gebundeld worden onder één datumkoptekst.

## [2026-06-06] — Meta Retro

### Fixed
- **`meta-retro` v1.0.0 → v1.0.1**: De Collect-stap legde de volledige analyseplicht bij de gebruiker. De agent scant nu eerst zelf de sessie op routing-fouten, gemiste STOP gates en zwakke output, en vraagt daarna de gebruiker om aanvullingen.
- **`ppa.agent.md` (router)**: Toegevoegd: een expliciete toelichting dat een schrijf-"ja" NIET geldt als context-bevestiging. Context is alleen bevestigd als "Klopt dit?" is gevraagd én beantwoord in de lopende sessie.

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

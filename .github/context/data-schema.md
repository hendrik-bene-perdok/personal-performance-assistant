# Data Schema — workspace/ files

Maps each workspace file to the fields skills read and write. The `workspace/`
folder at the repository root is the single source of truth (rule §2).

> Filenames are Dutch by default. If a referenced file does not exist, use the
> matching template in `.github/context/templates/` and follow the write gate before creating it.

## workspace/doelen.md (goals)
| Section | Meaning |
| --- | --- |
| `TOP 3 PRIORITEITEN (FOCUS)` | The active focus goals. Maximum 3. |
| `VERMIJDEN (AVOID-AT-ALL-COSTS)` | Parked goals/habits that steal focus. |
| `VOLGENDE ACTIES` | Concrete next-step checklist items. |

## workspace/profiel.md (profile)
Persona, professional context, and (optionally) a development plan
(short / mid / long term). Read-only for most skills; updated via `roadmap`/career work.

## workspace/rolbeschrijving.md (role description)
The user's role, responsibilities and constraints. Used to judge goal relevance.

## workspace/logboek/ (journal directory)
Chronological journal, split into monthly files with the naming convention
`YYYY-MM-logboek.md` (e.g. `2026-06-logboek.md`). `check-in`, `review` and
`personal-retro` append entries to the current month's file,
following the template in `.github/context/templates/journaling.md`.
Newest entries are most relevant. When reading, open the current month's file;
when a new month starts, create a new file using the same naming convention.

## workspace/gap-analyse.md (gap analysis)
Discrepancy between current and desired state for a goal/domain. Read during `review`.

## workspace/origin-gap.md
Historical/origin gap reference. Read-only context.

## workspace/richtlijnen.md (user guidelines)
User-specific overrides on tone, format, or rules. Respect alongside the hard rules.

## Templates (.github/context/templates/)
`goal.md`, `profile.md`, `role_description.md`, `journaling.md`, `gap-analysis.md`.
Fill placeholders only; never change headers or order (rule §4).

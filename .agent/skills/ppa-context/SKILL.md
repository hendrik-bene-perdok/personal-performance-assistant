---
name: ppa-context
description: Loads the core Personal Performance Assistant (PPA) context files (Guidelines, Profile, Goals, Logbook).
---

# PPA Context Loader

## When to use this skill
Use this skill at the beginning of **every** interaction to load the user's strategic context. This ensures you always act according to their latest goals and rules.

## How to load context
1.  **Verify Integrity**: Check if `workspace/guidelines.md` exists. If not, stop and tell the user to run the setup wizard.
2.  **Read Core Files**:
    -   Read `workspace/guidelines.md` (Global Rules).
    -   Read `workspace/profile.md` (User Persona).
    -   Read `workspace/goals.md` (Current Objectives).
    -   Read `workspace/logbook.md` (Recent History).
3.  **Synthesize**:
    -   Extract the "Top 3 Goals" from `goals.md`.
    -   Extract the "Avoid List" from `goals.md`.
    -   Check the last entry in `logbook.md` for immediate context.

## Example output
After running this skill, you should have a mental model like:
*   "User is a [Role] aiming for [Goal A, B, C]."
*   "They explicitly want to avoid [Distraction X, Y]."
*   "Last session ended with [Status]."

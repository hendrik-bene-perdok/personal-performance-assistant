---
name: goal
description: Turns a fuzzy wish into a concrete objective, refines it using SMART/OKR frameworks, and writes it to workspace/doelen.md following the local goal template.
---

# Goal

## When to use this skill

WHEN the user has a vague idea ("ik wil iets met...", "ik wil vaker...") AND/OR when the user wants to formalize, sharpen, or refine an existing goal ("maak dit doel SMART", "verfijn mijn doel").

This skill owns creating and modifying blocks in `workspace/doelen.md`.

## Shared Frameworks

**SMART (goal quality)**
A goal is well-formed when it is:
- **S**pecific — clearly defined, unambiguous.
- **M**easurable — has an observable indicator of progress/done.
- **A**chievable — realistic given current capacity.
- **R**elevant — tied to a higher priority or role objective.
- **T**ime-bound — has a deadline or cadence.

**OKR (objective + key results)**
- **Objective**: a qualitative, inspiring statement of *what* to achieve.
- **Key Results**: 2–4 quantitative outcomes that prove the objective is met.
- Key results measure *outcomes*, not activity/output.

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. Classify intent**
  - **Shape (fuzzy wish):** Proceed to Step 3a.
  - **Refine (existing goal):** Proceed to Step 3b.
- [ ] **3a. Shape mode**
  - **Explore:** Ask ONE open question to drill down. "Waarom is dit belangrijk?", "Wat verandert er als dit lukt?".
  - **Draft:** Propose 2-3 distinct, concrete directions or angles for the goal.
  - **Select:** Let the user pick one.
- [ ] **3b. Refine mode**
  - **Analyze:** Evaluate the goal against the SMART and OKR frameworks.
  - **Challenge:** Ask one question to strengthen the weakest element. "Hoe meten we of dit gelukt is (niet alleen dat je het gedaan hebt)?", "Wat is de harde deadline?".
  - **Re-draft:** Propose a refined OKR/SMART version of the goal.
- [ ] **4. Template fill** — Once the goal is sharp and agreed upon, build the final block using `.github/skills/goal/goal.md`. Fill placeholders only; do not invent dates or metrics. Ask if anything is missing.
- [ ] **5. STOP — write gate** — Show the exact proposed addition/change for `workspace/doelen.md`.
      Ask: "Mag ik dit wegschrijven naar `doelen.md`? (ja/nee)".
- [ ] **6. Apply & confirm** — On affirmative consent, apply the change idempotently and confirm.
- [ ] **7. Next step** — Ask: "Wat is de eerste concrete actie die we op de 'volgende acties'-lijst kunnen zetten?"

## STOP gates

- Do not provide a polished goal immediately; iterate with the user.
- Do not fabricate dates or metrics. Ask.
- No write without explicit confirmation.

## Expected result

A vague idea or raw goal is refined into a SMART/OKR structure, and written to `workspace/doelen.md` as a template-conform block after user approval.

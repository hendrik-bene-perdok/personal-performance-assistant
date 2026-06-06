---
name: prioritize
description: Applies the 5/25 rule to bring the user's focus back to a Top 3, moving the rest to the Avoid-at-all-costs list in workspace/doelen.md.
---

# Prioritize

## When to use this skill

WHEN the user feels overloaded, scattered, or unsure where to focus.
Triggers: "te veel op mijn bord", "waar moet ik op focussen", "help me prioriteren",
"mijn Top 3 klopt niet meer".

## Workflow

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. List** — Surface all current goals/commitments (from `doelen.md` + anything new).
- [ ] **3. Circle (5/25)** — Apply the 5/25 rule from `.github/skills/prioritize/SKILL.md`,
      adapted to PPA's Top 3. Help the user pick the vital few.
- [ ] **4. Avoid** — Everything not chosen becomes an explicit Avoid-at-all-costs item —
      not a "later" list. Name the focus cost of each.
- [ ] **5. Draft** — Build the updated `TOP 3 PRIORITEITEN` and `VERMIJDEN` sections using
      `assets/focus-set.md`.
- [ ] **6. STOP — write gate** — Show the exact replacement for those sections in
      `workspace/doelen.md`. Get explicit "ja". Recommend a backup before overwriting.
- [ ] **7. Apply & confirm** — On approval, apply the idempotent edit and confirm.

## STOP gates

- No write without explicit confirmation.
- Never silently drop a goal — moving it to Avoid is an explicit, shown decision.

## Expected result

A focused Top 3 and an honest Avoid list, recorded in `workspace/doelen.md` after approval.

## Frameworks

**5/25 Rule (focus / prioritization)**

Attributed to a Warren Buffett anecdote:
1. List your top 25 goals/wishes.
2. Circle the 5 most important.
3. The other 20 become an **avoid-at-all-costs** list — they steal focus from the top 5.

In PPA, the Top 3 in `doelen.md` are the active focus; everything parked goes to the Avoid list.

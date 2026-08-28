---
name: prioritize
version: 1.0.0
description: Applies the 5/25 rule to bring the user's focus back to a Top 3, moving the rest to the Vermijden (Afleiding) list in workspace/focus.md. Do not use for weekly progress reviews (use review) or daily agenda planning (use dagstart).
---

# Prioritize

## Role

You are the **Prioritize** skill, responsible for applying ruthless focus to the user's workload. You help the user select a vital Top 3 and move everything else to an explicit Vermijden (Afleiding) list in `workspace/focus.md`.

## Instructions

WHEN the user feels overloaded, scattered, or unsure where to focus.
Triggers: "te veel op mijn bord", "waar moet ik op focussen", "help me prioriteren", "mijn Top 3 klopt niet meer".

### Frameworks

**5/25 Rule (focus / prioritization)**
Attributed to a Warren Buffett anecdote:
1. List your top 25 goals/wishes.
2. Circle the 5 most important.
3. The other 20 become a **vermijden** list — they steal focus from the top 5.

In PPA, the Focus in `focus.md` is the active focus; everything parked goes to the Vermijden list.

## Steps

- [ ] **1. Context** — Ensure the agent bootstrap has loaded context and the user confirmed it.
- [ ] **2. List** — Surface all current goals/commitments (from `focus.md` + anything new).
- [ ] **3. Circle (5/25)** — Apply the 5/25 rule (see Instructions and Narrowing below),
      adapted to PPA's Top 3. Help the user pick the vital few.
- [ ] **4. Avoid** — Everything not chosen becomes an explicit Vermijden item —
      not a "later" list. Name the focus cost of each.
- [ ] **5. Draft** — Build the updated `FOCUS` and `VERMIJDEN` sections using
      `assets/focus-set.md`.
- [ ] **6. STOP — write gate** — Show the exact replacement for those sections in
      `workspace/focus.md`. Get explicit "ja". Recommend a backup before overwriting.
- [ ] **7. Apply & confirm** — On approval, apply the idempotent edit and confirm.

## End Goal

A clear Focus and an honest Vermijden list, recorded in `workspace/focus.md` after approval.

## Narrowing

### Gotchas & Best Practices
- **Spend Context Wisely**: Assume general AI knowledge, focus on PPA-specific templates and constraints.
- **Provide Defaults**: Suggest the most common path first, avoid presenting equal menus unless requested.
- **Progressive Disclosure**: If relying on large structures, verify against referenced files instead of overloading instructions.

### Narrowing Constraints
- No write without explicit confirmation via the write gate.
- Never silently drop a goal — moving it to Avoid is an explicit, shown decision.

### Novelty & Expansive Thinking
- **Opportunity Cost Naming**: For every item moved to the Avoid list, explicitly name the specific focus cost or distraction it would create if pursued now.
- **Counter-Intuitive Pruning**: Challenge the user to drop even seemingly "good" or "urgent" tasks if they do not directly serve the Top 3 focus.

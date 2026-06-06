# Write Procedure (the write gate)

Every skill that creates, modifies, or deletes a `workspace/` file MUST follow this
procedure. It implements hard rule §3.

## Steps

1. **Prepare the change**
   - Determine the exact target file (and template, if creating new).
   - Build the precise content block or diff. Keep edits idempotent (rule §3): re-applying
     the same change must not duplicate or corrupt content.

2. **Present for confirmation — STOP**
   - Show the user: the target file, and the exact text to add/replace/remove.
   - For appends (e.g. journal), show the new entry only.
   - Ask explicitly: "Mag ik dit wegschrijven naar `[bestand]`? (ja/nee)".

3. **Wait for explicit consent**
   - Proceed only on a clear affirmative ("ja", "akkoord", "doe maar", "yes").
   - Ambiguous, partial, or absent answers count as **no**. Do not write.

4. **Protect existing content**
   - If the change overwrites or deletes existing user content, first recommend a backup:
     run `.github/skills/shared-context/helpers/Backup-Workspace.ps1`.
   - Prefer appending or targeted replacement over wholesale rewrites.

5. **Apply & confirm**
   - Write the approved change exactly as shown.
   - Confirm back to the user what was written and where.

## Never

- Never write without showing the change first.
- Never fabricate values to fill a file (rule §2). Ask instead.
- Never alter template headers or their order (rule §4).

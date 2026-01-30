# LANGUAGE AND STYLE GUIDELINES

- **Tone**: Professional and concise.
- **Reading level**: B1 (clear and accessible language).
- **Structure**: Keep sentences short and direct.
- **Default language**: English. Unless the user explicitly requests another language, generate filenames and file contents in English.

# WORKSPACE GUIDELINES

- All filenames and file content created or updated in the `workspace/` folder MUST follow the Default language.

# TEMPLATE ADHERENCE

- Always check if a template exists in `.ppa/templates/` for the target file.
- If a template exists, use it and preserve the section order.

# CONTEXT AWARENESS

- Treat `workspace/profile.md` as the primary user context document; read it before generating content.
- Avoid exposing or sharing sensitive personal data; if content appears sensitive, warn the user and request explicit confirmation.

# CUSTOM GUIDELINES

- Use relative paths when referencing workspace files.
- Prefer short lists and examples; keep generated files concise and actionable.

# Language Migration Note

This repository previously used Dutch as the default language. The default language has been switched to English. Keep original Dutch files as backups (append `.nl.md` or move to `workspace/archive/`) when translating or renaming files.

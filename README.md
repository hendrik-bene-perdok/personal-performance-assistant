# Personal Performance Assistant (PPA)

A simple, framework for tracking goals and reflections in Markdown, designed to work agents in VSCode.

## Contents

- About this project
- Quick Start
- Structure
- Usage
- Contributing

## About this project

This repository provides a compact structure and templates to capture SMART goals, maintain a profile, and keep a regular logbook with guided reflection. It is optimized for local use with an AI assistant (for example inside VS Code).

## Quick Start

1. Clone the repository:

```bash
git clone <repo-url>
cd personal-performance-assistant
```

2. Open the folder in VS Code.

3. Toggle your AI chat/assistant integration (for example Copilot Chat or another AI extension).

4. In the chat input, type the command or prompt:

```
/ppa-init-constraints
```

This will run the initialization prompt which helps set up or update the assistant constraints and apply templates to your workspace files.

## Structure

- .ppa/ — assistant constraints and templates
- .github/prompts/ — conversational prompts for the assistant
- workspace/ — your personal Markdown documents (DO NOT COMMIT SENSITIVE DATA)
- README.md — this file

## Usage

- Use the prompts in `.github/prompts/` via your AI chat to create or update files under `workspace/` using templates in `.ppa/templates/`.

## Simple flow

```mermaid
flowchart LR
  A[User clones repo] --> B[Open in VS Code]
  B --> C[Toggle AI chat]
  C --> D[Run `/ppa-init-constraints` prompt/command]
  D --> E[Assistant applies templates to workspace files]
```

## Contributing

Fork → branch → PR. Keep changes small and document template or guideline updates.

## Note

If you prefer English as the default workspace language, run the `/ppa-init-constraints` prompt and select English during setup to update `.ppa/Guidelines.md` accordingly.


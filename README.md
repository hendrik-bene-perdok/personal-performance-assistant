# Personal Performance Assistant (PPA)

A simple, framework for tracking goals and reflections in Markdown, designed to work agents in VSCode.

> ⚠️ **Warning:** This repository is a work in progress. Use at your own risk. Do not commit sensitive data to the workspace folder.

## Contents

- About this project
- Quick Start
- Structure
- Usage
- Contributing

## About this project

This repository provides a compact structure and templates to capture SMART goals, maintain a profile, and keep a regular logbook with guided reflection. It is optimized for local use with an AI assistant inside VS Code.

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
/ppa-wizard
```

This will run the initialization prompt which helps set up or update the assistant guidelines and apply templates to your workspace files.

## Structure

- .ppa/ — assistant guidelines and templates
- .github/prompts/ — conversational prompts for the assistant
- workspace/ — your personal Markdown documents (DO NOT COMMIT SENSITIVE DATA)
- README.md — this file

## Usage

- Use the prompts in `.github/prompts/` via your AI chat to create or update files under `workspace/` using templates in `.ppa/templates/`.


## Simple flow

```mermaid
flowchart TD
  Init[0. One-time Init (Wizard)] --> Profile[1. Create Profile]
  Profile --> Goal[2. Create Goal]
  Goal --> Cycle[3. Continuous Cycle<br/>(Performance Coach, Reflections, etc.)]
  Cycle --> Cycle
```

## Contributing

Fork → branch → PR. Keep changes small and document template or guideline updates.

## Note

If you prefer English as the default workspace language, run the `/ppa-init-constraints` prompt and select English during setup to update `.ppa/guidelines.md` accordingly.


## Roadmap
- refactor constitution for other agents (e.g., Reflection Guide, Goal Evaluator)


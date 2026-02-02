# Contributing to Personal Performance Assistant

Thank you for your interest in contributing!

## structure

- **.github/agents**: The primary source of truth for agent definitions.
- **.agent/workflows**: The directory used by the agent runtime. **Do not edit files here directly.**
- **.ppa/helpers**: Helper scripts for maintenance.

## Making Changes to Agents

1.  **Edit**: Make your changes in `.github/agents/*.agent.md`.
2.  **Sync**: Run the sync script to update `.agent/workflows`.

    **Windows:**
    ```powershell
    .ppa/helpers/sync-agents.ps1
    ```

    **Linux/Mac:**
    ```bash
    chmod +x .ppa/helpers/sync-agents.sh
    ./.ppa/helpers/sync-agents.sh
    ```

3.  **Verify**: Ensure the changes are correctly reflected in `.agent/workflows`.
4.  **Commit**: Commit both the source files in `.github/agents` and the synced files in `.agent/workflows`.

## General Guidelines

- Keep changes small and focused.
- Document any changes to templates or guidelines.

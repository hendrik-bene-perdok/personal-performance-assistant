# Personal Performance Assistant (PPA)

> ⚠️ **WARNING:** This repository is a work in progress. Use at your own risk. Do not commit sensitive data.


A lightweight framework for managing SMART goals, maintaining a personal profile, and keeping a structured logbook with guided reflections. Designed for seamless use with AI agents in VS Code or Antigravity.

## Quick Start (VS Code)

1. Clone the repository:

```
git clone <repo-url>
cd personal-performance-assistant
code .
```
2. Open the folder in VS Code.

3. Toggle your AI chat/assistant integration (for example Copilot Chat or another AI extension).

4. In the chat input, type the command.
    - to initialize: `/ppa-wizard` (this will run the initialization prompt)
    - to set goal: `/goal setter(simple)` (this will run the goal setting prompt)
    - etc.

## Available Agents (Usage)

| Slash Command | Description |
| :--- | :--- |
| `/PPA Wizard` | Initializes and updates personal assistant workspaces. |
| `/Goal Setter(simple)` | A 3-step goal setting agent using the "List, Circle, Eliminate" method. |
| `/Coach(simple)` | Strategic prioritization coach using the 5/25 rule. |
| `/Goal Setter(performance)` | Helps formulate and refine SMART goals. |
| `/Coach(performance)` | Partner for professional growth, focus, and reflection. |
| `/Career Coach` | Expert in personal branding and profile optimization. |
| `/Gap Analysis` | Performs gap analyses to identify discrepancies between current and desired states. |


## Workflow

```mermaid
flowchart TD
   %% Flow
    Agents---|Reads|Templates
    Agents---|Reads/Updates|Workspace


    
    %% Connections between agents
    Wizard --> Choose{Choose} --> GoalSetter
    GoalSetter -- input--> Coach
    Coach -- feedback--> GoalSetter
    Coach --> GapAgent

    subgraph Templates [Templates .ppa/templates]
        T_Templates
    end

    subgraph Workspace [Workspace State workspace/]
        W_Docs
    end

    subgraph Agents [Active agents workflow]
        Wizard[Wizard: Init / Update]:::agent
        Choose[Choose: Simple / Performance]:::agent
        GoalSetter[Goal Setter]:::agent
        Coach[Coach]:::agent
        GapAgent[Gap Analysis]:::agent
    end

    Choose@{ shape: diamond, label: "Choose<br>simple or performance" }
    W_Docs@{ shape: docs, label: "Documents<br>profile.md<br>goals.md<br>logbook.md<br>gap-analysis.md" }
    T_Templates@{ shape: docs, label: "Templates<br>profile.template.md<br>goal.template.md<br>gap-analysis.template.md<br>journal.template.md" }
 
```

## Templates & Workspace

The PPA uses a clear distinction between **Templates** (blueprints) and **Workspace** (your data):

-   **Templates** (`.ppa/templates/`): These are the structural starting points. Agents read these to understand how to format new files.
-   **Workspace** (`workspace/`): This is where your personal data lives.
    -   `profiel.md`: Your user profile and context.
    -   `doelen.md`: Your active goals.
    -   `logboek.md`: Your daily journal and reflection log.
    -   *Note: Do not commit sensitive data in this folder.*


## Structure

- `.agent/workflows/` — Agent workflows and prompts.
- `.agent/rules/` — Specific rules for agents (e.g., Gap Analysis).
- `.github/agents/` — Source of truth for agent definitions.
- `.ppa/` — Assistant guidelines and templates.
    - `templates/` — Markdown templates for profiles, goals, etc.
    - `helpers/` — Maintenance scripts (backup, sync).
- `workspace/` — Your personal Markdown documents (DO NOT COMMIT SENSITIVE DATA).
- `README.md` — This file.


## Roadmap

- refactor constitution for other agents (e.g., Reflection Guide, Goal Evaluator)
- add development plan to profile template

    ```markdown
    ## Development Plan 

    ### Short term (1–3 months)
    [Skills, tools and certifications to acquire.]

    ### Mid term (3–12 months)
    [Career evolution and leadership/governance goals.]

    ### Long term (greater than 1 year)
    [Career evolution and leadership/governance goals.]
    ```


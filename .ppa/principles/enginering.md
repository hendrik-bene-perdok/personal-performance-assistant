Here is the complete, standardized **AI Agent & Prompt Engineering Principles** document. This version integrates the simplified model framework, the **ROSE** prompt architecture, and advanced reasoning protocols into a cohesive engineering standard.

---

# AI Agent & Prompt Engineering Principles

**Version:** 2.0 | **Type:** Engineering Standard
**Scope:** Autonomous Agents, System Prompts, and Model Orchestration.

---

## 1. Model Selection Framework

*Principle: Categorize tasks by their cognitive load (Speed vs. Thought vs. Precision) to optimize for cost and latency.*

| Task Archetype | Recommended Models | Use Case Definition |
| --- | --- | --- |
| **1. Routine & High-Velocity**<br>

<br>*(The Router)* | **GPT-5 Mini**<br>

<br>*(Fallback: GPT-4o)* | **Low Latency:** Real-time orchestration, simple summarization, intent classification, and fast data processing. |
| **2. Strategic Reasoning & Research**<br>

<br>*(The Architect)* | **GPT-5, Claude Opus 4.5**<br>

<br>*(Deep Research for data)* | **High Intelligence:** Complex planning, math/logic proofs, creative ideation, and multi-source literature reviews. |
| **3. Technical Execution & Multimodal**<br>

<br>*(The Engineer)* | **Claude Sonnet 4.5, Gemini 3 Pro** | **High Precision:** Deterministic coding, strict JSON/YAML generation, web browsing, and vision/audio analysis. |

---

## 2. Universal Prompt Architecture

*Principle: All system prompts must adhere to the **R-O-S-E** Standard (Role, Objective, Steps, Expectation) to ensure consistent behavior.*

### 2.1 The Standard Components

* **R — Role:** The persona and domain boundary (e.g., "Act as a Senior QA Engineer").
* **O — Objective:** The primary goal using active verbs (e.g., "Audit this codebase").
* **S — Steps:** Specific context, input data, and sequential actions.
* **E — Expectation:** Output format (JSON, Markdown) and success metrics ("Win Metric").

### 2.2 Archetype Templates

Copy these templates as starting points for your agents.

#### A. The Router Template (Speed)

Goal: Fast, machine-readable intent classification.
```markdown
# ROLE
Act as a Request Classifier Gateway.

# OBJECTIVE
Analyze user input and route it to the correct downstream agent.

# STEPS
1. Receive user text.
2. Classify intent into: [Data_Analysis, Creative, Support].
3. Extract entities.

# EXPECTATION
- Output: Raw JSON only.
- Schema: {"intent": "string", "confidence": float}
```

#### B. The Architect Template (Reasoning)

Goal: Deep thought and risk analysis.
```markdown
# ROLE
Act as a Chief Systems Architect. You are cautious and comprehensive.

# OBJECTIVE
Design a scalable strategy for [Project Name].

# STEPS
1. Review requirements.
2. Skeptic Inversion: List 3 reasons why the obvious solution fails.
3. Synthesize the optimal path based on this critique.

# EXPECTATION
- Output: Strategic Brief (Executive Summary -> Risk Matrix -> Roadmap).
```

#### C. The Engineer Template (Precision)

Goal: Flawless code or technical specs.
```markdown
# ROLE
Act as a Senior Frontend Developer (React/TS).

# OBJECTIVE
Convert the attached UI screenshot into production code.

# STEPS
1. Analyze the image for layout/hierarchy.
2. Write code using Tailwind CSS.

# EXPECTATION
- Constraint: Do NOT use arbitrary CSS values; use Tailwind utility classes.
- Output: Single code block.
```

---

## 3. Cognitive Strategies & Reasoning Patterns

*Principle: Use dialectic patterns to improve reasoning quality beyond simple Q&A.*

| Strategy | Implementation Prompt | Goal |
| --- | --- | --- |
| **Skeptic Inversion** | "After generating the solution, assume the role of a critic. Identify 3 blind spots." | Mitigate confirmation bias. |
| **Expert Pair** | "Answer as a consensus between a [Role A] and a [Role B]." | Force multi-disciplinary synthesis. |
| **Opposite-Day** | "Describe how **not** to build this system to highlight vulnerabilities." | Expose hidden constraints. |
| **Reality Filter** | "If verification is impossible, explicitly state: 'I cannot verify'." | Reduce hallucination. |

---

## 4. Verification & QA Loops

*Principle: Agents must strictly validate their own outputs before final presentation.*

* **Fact-Checklist:** "After the answer, output a **CLAIMS** list of every factual assertion made."
* **Reference Injection:** "Every statistic must be immediately followed by a citation/URL. If no source exists, omit the stat."
* **Contradiction Scan:** "Run a self-consistency check. If step A conflicts with step C, flag it."

---

## 5. Stylistic Standards

*Principle: Eliminate "AI-ese" to ensure natural, professional communication.*

* **The "No Robot" Rule:** Explicitly ban giveaway phrases in the system prompt.
* *Banned:* "Let's dive in," "In conclusion," "As an AI language model," "It is important to note."


* **Iterative Refinement:** Use the **Rewrite** technique.
* *Instruction:* "Draft an initial answer, then rewrite it to be 30% more concise."

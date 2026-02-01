
# AI Agent & Prompt Engineering Principles

**Document Type:** Engineering Standard | **Scope:** System Prompts & Autonomous Agents

## 1. Model Selection Framework

*Principle: Match model architecture to task complexity to optimize for latency, reasoning depth, multimodal needs, and cost.*

| Task Classification | Recommended Model(s) | Use Case Definition |
| --- | --- | --- |
| **High-Velocity / Routine** | **GPT-5 Mini** | Fast data processing, simple coding, summarization, and real-time orchestration. |
| **Deep Reasoning & Planning** | **GPT-5**, **Claude Opus 4.5** | Complex logic chains, architecture design, high-stakes decisions, and math. Expect higher latency. |
| **Deterministic Coding & Structured Output** | **Claude Sonnet 4.5**, **Claude Sonnet 4** | Spec-following, refactors, JSON/YAML generation, longer context adherence. |
| **Creative Exploration** | **GPT-5**, **Claude Sonnet 4.5** | Nuanced ideation, tone control, narrative, and concept development. |
| **Multimodal (Vision/Audio/Image)** | **GPT-4o**, **Gemini 3 Pro** | Screenshots/UI analysis, OCR, charts/figures, light vision reasoning. Fall back: **Gemini 2.5 Pro**. |
| **Web/Browse & Tool-Use Heavy** | **Gemini 3 Pro** | Link-heavy tasks, code search assistance, web-grounded synthesis. |
| **Deep Retrieval / Long-Form Synthesis** | **Deep Research** | Multi-source aggregation with citations across web/PDFs; comprehensive literature review. |
| **Math & Formal Analysis** | **GPT-5** | Symbolic math, proofs, algorithm analysis, and precise calculations. |
| **Restricted / Avoid** | *N/A* | Do not use mini variants (e.g., GPT-5 Mini) for complex, agentic workflows. Prefer stable releases over previews where reliability is critical. |

---

## 2. Universal Prompt Architecture

*Principle: Every system prompt must adhere to a structured schema to minimize hallucination and maximize instruction following.*

### 2.1 The Core Structure (R-O-S-E Standard)

While various frameworks exist (RAIN, FLOW, PIVO), the **R-O-S-E** standard is recommended for general agents:

1. **R - Role:** Establish the persona (e.g., "Act as a Senior Python Engineer").
2. **O - Objective:** Define the specific goal using active verbs.
3. **S - Steps:** Provide the specific input data and required actions.
4. **E - Expectation:** Define the format and "Win Metric" for the output.

### 2.2 Operational Directives

* **Context Injection:** Always include personalized context. Generic prompts yield generic results.
* **Incentive Shaping:** Use **Tips and Penalties**.
* *Example:* "Award yourself points for extreme brevity; penalize responses that use fluff."


* **Transition & Iteration:** Instructions should allow for refinement. "Draft an initial response, then rewrite it to be more concise."

---

## 3. Advanced Reasoning Strategies

*Principle: Use dialectic prompting patterns to uncover blind spots and improve output quality.*

### 3.1 The Perspective Mirror

* **Expert Pair:** Do not rely on a single voice. Instruct the agent to simulate a debate.
* *Prompt:* "Answer as a consensus between a [Role A] and a [Role B]."


* **Skeptic Inversion:** Force the model to attack its own logic.
* *Prompt:* "After generating the plan, identify 3 objections a skeptic would raise."


* **Opposite-Day Logic:** Expose hidden constraints by asking for the negative.
* *Prompt:* "Describe how **not** to build this system to highlight anti-patterns."


* **Reality Filter:** Enforce grounding.
* *Prompt:* "If you cannot verify this information directly, state: 'I cannot verify'."



---

## 4. Quality Assurance (Verification Loops)

*Principle: Agents must self-correct before presenting final data.*

| Verification Type | Implementation Instruction |
| --- | --- |
| **Fact-Checklist** | "After the answer, generate a bulleted **CLAIMS** list of every factual assertion made." |
| **Reference Injection** | "Every statistic must be immediately followed by a citation or URL. If no source exists, omit the stat." |
| **Counter-Example Hunt** | "Identify one scenario where this advice would fail or break." |
| **Contradiction Scan** | "Review your response. If step A conflicts with step C, flag the error." |

---

## 5. Stylistic Guidelines

*Principle: Output must be indistinguishable from professional human writing.*

* **The "No Robot" Rule:** Explicitly ban AI-giveaway phrases in the system prompt.
* **Prohibited:** "Let's dive in," "In conclusion," "As an AI language model," "It is important to note," "Tapestry."
* **Required:** Plain, direct, professional tone.


* **Show, Don't Just Tell:** Always provide **Few-Shot Examples** (past good outputs) within the prompt to guide style and formatting.

---

### Would you like me to...

* Convert this into a **JSON template** for your codebase?
* Write a specific **System Prompt** for one of your agents using these principles?
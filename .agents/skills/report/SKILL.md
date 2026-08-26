---
name: report
version: 1.0.0
description: Genereert een dashboard en rapportage van de PPA metrics (skill-gebruik, energie-scores, streaks) op basis van workspace/ppa-events.jsonl. Gebruik deze skill als de gebruiker inzicht wil in zijn AI-gebruik of statistieken.
---

# Report / Dashboard

## Role
Jij bent de **Report** skill binnen de Personal Performance Assistant (PPA). Je bent verantwoordelijk voor het analyseren van de opgebouwde data in `workspace/ppa-events.jsonl` en dit te presenteren in een visueel aantrekkelijk overzicht of dashboard.

## Instructions
Wanneer de gebruiker vraagt om statistieken, inzicht in skill-gebruik, streaks, of het dashboard wil zien (bijv. `/report` of `/dashboard`):

1. **Lees Data in**: Lees de inhoud van `workspace/ppa-events.jsonl` (indien het bestand bestaat).
2. **Analyseer Metrics**:
   - **Skill-gebruik**: Tel hoe vaak elke skill (dagstart, journal, goal, etc.) is gebruikt.
   - **Energie & Focus**: Bereken de gemiddelde score of toon de trend van de laatste metingen.
   - **Consistentie/Streaks**: Bepaal het aantal opeenvolgende dagen (of frequentie) dat een actie is uitgevoerd.
3. **Directe Presentatie & Sync**: Genereer direct het overzichtelijke dashboard in het chatvenster via Markdown tabellen én werk `workspace/statistieken.md` direct bij (impliciete toestemming bij aanroep van `/report`), zonder voorafgaande stappenplan-poort of extra tussenbevestiging.

## Steps
- [ ] **1. Bestand uitlezen**: Lees `workspace/ppa-events.jsonl`. Als het niet bestaat of leeg is, informeer de gebruiker dat er nog geen data is verzameld.
- [ ] **2. Data Aggregatie**: Voer een basale tekstanalyse of parsing uit op de JSON lines om de hierboven genoemde metrics te berekenen.
- [ ] **3. Directe Rapportage & Sync**: Presenteer het Markdown-rapport direct in de chat en werk `workspace/statistieken.md` direct bij.

## End Goal / Expectations
De gebruiker krijgt direct en helder inzicht in zijn gebruik van het PPA-framework, de ontwikkeling van zijn energie, en eventuele gedragspatronen (streaks), gebaseerd op keiharde data uit het eigen framework.

## Narrowing / Novelty

### Narrowing Constraints
- Pas geen event-logs of ruwe bronbestanden aan. Het dashboard presenteert de data direct en synchroniseert `workspace/statistieken.md`.
- Trek geen extreme psychologische conclusies uit beperkte data (e.g. "Je had gisteren een score van 4, je hebt een burn-out").

### Novelty & Expansive Thinking
- **Gamificatie**: Als je een hoge "streak" ziet in `dagstart` of `journal`, spreek dan waardering uit om de motivatie te versterken.
- **Correlaties**: Probeer zachte verbanden te leggen. Als je ziet dat dagen met een `dagstart` gepaard gaan met hogere energie-scores in de `journal`, wijs de gebruiker hierop.

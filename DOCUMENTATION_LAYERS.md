# Documentation layers

The MiaCaoMigo Engineering portal separates documentation by **purpose**, not by file format. Use this page to decide where new content belongs and to avoid duplicating the same topic in multiple places.

---

## Layer map

| Layer | Directory | Audience | Typical content |
|-------|-----------|----------|-----------------|
| Planning | `01_Planning/` | Team, demos, onboarding | Sprints, user stories, operational scenarios, ecosystem narrative |
| Requirements | `02_Requirements/` | Engineering, evaluation | RF, RNF, business rules, acceptance criteria, implementation matrix |
| Diagrams | `03_Diagrams/` | Analysts, DB engineers | ER models, attribute semantics (conceptual) |
| Architecture | `04_Architecture/` | Developers, defense | System view, application flows, database governance and schemas |
| Academic deliverables | `05_Docs/` | Teachers, defense | Official statements, academic reports, presentation guides |
| Performance | `06_Performance/` | APS / quality evidence | Strategy, measurements, recommendations |
| Production | `07_Deployment/` | Teachers, defense, deployment operators | Docker production mode, startup steps, environment variables, operational checklist |

---

## What goes where

### Planning vs requirements

- **Planning** answers *who does what in the clinic story* (personas, timelines, OPS scenarios).
- **Requirements** answers *what the system must do* (RF, RN, AC) and *how far it is implemented*.

Do not copy full RF tables into planning files. Link to `02_Requirements/` instead.

### Diagrams vs database architecture

| Question | Use |
|----------|-----|
| Why does this entity exist? What does an attribute mean? | `03_Diagrams/00_ER_Model/ER_V10/Atributos/` |
| How is it implemented in PostgreSQL? | `04_Architecture/01_Database/01_Schemas/` and SchemaSpy output |
| Interactive table/column browser | `04_Architecture/01_Database/03_SchemaSpy/02_Output/` |

These views are **complementary**, not duplicates.

### Application architecture vs academic report

| Type | Location |
|------|----------|
| Technical flows, API, runtime, implementation evidence | `04_Architecture/02_Application/` |
| Defense-oriented narrative, 15 min presentation, screenshots checklist | `05_Docs/01_Academic_Reports/` and `05_Docs/02_Presentation/` |

The application report under `05_Docs` is the canonical academic document; architecture pages link to it.

### Academic vs production

| Type | Location |
|------|----------|
| Defense narrative, reports and presentation support | `05_Docs/` |
| Practical production startup guide and Docker deployment steps | `07_Deployment/` |

The production guide is written for academic demonstration first: it explains how the system would be started in a production-like Docker setup without requiring a full public cloud deployment.

It also documents **what is already production-aligned** (Docker prod compose, isolated DB, secrets via env, static docs, healthchecks) and **what would still be needed in industry** (HTTPS, reverse proxy, CI/CD, automated backups, centralized monitoring). See [Production guide](07_Deployment/README_Production_Docker.md#o-que-significa-pronto-para-produção).

---

## Related repositories

| Repository | Role |
|------------|------|
| `MiaCaoMigo_DataLayer` | Source of truth for DDL, services, seed data, QA |
| `MiaCaoMigo_` | ApplicationLayer — frontend, API, Swagger |
| `MiaCaoMigo_Engineering` | This documentation portal |

When application behaviour and database schema diverge, **DataLayer prevails** for persistence rules; **MiaCaoMigo_** prevails for mounted API and UI behaviour.

---

## Maintainer map

Detailed folder listing: [STRUCTURE.md](STRUCTURE.md).

Portal entry: [home.md](home.md).

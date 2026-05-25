# Documentation layers — MiaCaoMigo Engineering

How the Engineering repository is organized and how to read it progressively.

**Implementation truth:** [`01_MiaCaoMigo_DataLayer`](../01_MiaCaoMigo_DataLayer) (SQL, services, bootstrap, QA).  
**This repository:** planning, modeling, architecture narrative, and portal.

---

## Top-level folders

| Folder | Role | Reader question |
|--------|------|-----------------|
| [01_Planning](01_Planning/) | Sprints, ecosystem simulation, user stories | *What happens in the launch window and who is involved?* |
| [02_Requirements](02_Requirements/) | Business and functional expectations | *What must the product satisfy?* |
| [03_Diagrams](03_Diagrams/) | ER structure and **conceptual** attribute semantics | *What does the domain model mean?* |
| [04_Architecture](04_Architecture/) | **All technical implementation** documentation | *How is it built and governed?* |
| [05_Docs](05_Docs/) | Academic statements and deliverables | *What was submitted academically?* |

**Technical implementation begins in `04_Architecture/`.**  
Conceptual and operational context stay in Planning, Requirements, and Diagrams.

---

## Planning — User Stories (two layers)

| Layer | Path | Purpose |
|-------|------|---------|
| **Narrative Stories** | [01_Narrative_Stories](01_Planning/01_UserStories/01_Narrative_Stories/) | Human-readable accounts — who, why, relationships |
| **Operational Scenarios** | [02_Operational_Scenarios](01_Planning/01_UserStories/02_Operational_Scenarios/) | Validation contract — states, workflows, DemoData/QA semantics |

Operational files may reference services, procedures, and column identifiers. That is **intentional** for simulation consistency, not accidental leakage into Architecture.

**Precedence:** if Narrative and Operational disagree, trust **Operational Scenarios**.

**Entry:** [Ecosystem overview](01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md) · [Timeline](01_Planning/01_UserStories/02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md)

---

## Diagrams vs Architecture — attributes (two views)

| View | Location | Purpose |
|------|----------|---------|
| **Conceptual semantics** | [ER V10 Atributos](03_Diagrams/00_ER_Model/ER_V10/Atributos/README.md) | Business meaning, attribute justification, domain interpretation |
| **Technical implementation** | [Data Dictionary](04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md) | Physical naming, keys, enums, DataLayer navigation |

These are **not duplicates**. Read Atributos with the ER model; read the Dictionary with schemas, integrity, and DataLayer.

---

## Requirements traceability (Sprint 2)

| Document | Role |
|----------|------|
| [02_Requirements/README.md](02_Requirements/README.md) | Hub for summaries and navigation |
| [Sprint2/00_Authoritative_Source.md](02_Requirements/Sprint2/00_Authoritative_Source.md) | APS PDF index (normative RF/RN/PN) |
| [Sprint2/01_RF_Traceability_Matrix.md](02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) | **Single** RF implementation grid (do not copy into Architecture) |

**Do not duplicate:** full RF text belongs in the PDF; column-level detail belongs in the matrix; attribute semantics stay in **Atributos**; physical columns stay in the **Data Dictionary**.

---

## DemoData and simulation

The Braga launch simulation (May–June 2026) in **Operational Scenarios** defines the **semantic contract** for demo seed data. Executable seed and SQL live in **DataLayer**; Engineering documents *what must remain true*, not the seed scripts themselves.

---

## Recommended paths

| Persona | Start here |
|---------|------------|
| Academic / product reader | [home.md](home.md) → [Narrative README](01_Planning/01_UserStories/01_Narrative_Stories/README.md) → [Ecosystem](01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md) |
| QA / DemoData | [Ecosystem](01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md) → [Operational README](01_Planning/01_UserStories/02_Operational_Scenarios/README.md) → OPS guides |
| Requirements / APS validation | [Requirements hub](02_Requirements/README.md) → [RF matrix](02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) |
| Modeler | [er_model.md](03_Diagrams/00_ER_Model/er_model.md) → Atributos |
| Engineer | [Architecture](04_Architecture/README.md) → [Database hub](04_Architecture/01_Database/README.md) → Dictionary |

---

## Maintainer map

Detailed file tree: [STRUCTURE.md](STRUCTURE.md) (update when User Stories or nav paths change).

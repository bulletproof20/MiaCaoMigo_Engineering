# Requirements — MiaCaoMigo Engineering

Business and functional expectations for the platform, traced to **Sprint 2 (APS)** and **`01_MiaCaoMigo_DataLayer`**.

---

## Where to start

| Goal | Document |
|------|----------|
| Normative specification (PDF) | [Sprint 2 authoritative source](Sprint2/00_Authoritative_Source.md) |
| Implementation status per RF | [RF traceability matrix](Sprint2/01_RF_Traceability_Matrix.md) |
| Module ↔ dictionary ↔ simulation | [Traceability overview](00_Traceability.md) |
| Demo/QA behaviour | [Operational Scenarios](../01_Planning/01_UserStories/02_Operational_Scenarios/) |

**Implementation truth** remains in the DataLayer repository and [04_Architecture](../04_Architecture/) — not in generic requirement bullets.

---

## Document map

| File | Purpose |
|------|---------|
| [Sprint2/00_Authoritative_Source.md](Sprint2/00_Authoritative_Source.md) | APS PDF index (normative) |
| [Sprint2/01_RF_Traceability_Matrix.md](Sprint2/01_RF_Traceability_Matrix.md) | 109 RF × DataLayer status + evidence |
| [00_Functional_Requirements.md](00_Functional_Requirements.md) | Functional summary by module (index) |
| [01_Non_Functional_Requirements.md](01_Non_Functional_Requirements.md) | NFR split: database vs application |
| [02_User_Requirements.md](02_User_Requirements.md) | Personas → narrative & operational cast |
| [03_Business_Requirements.md](03_Business_Requirements.md) | Product needs (PN) index → PDF |
| [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) | Acceptance via launch simulation |
| [05_Constraints.md](05_Constraints.md) | Rules & structural constraints |
| [00_Traceability.md](00_Traceability.md) | Hub: modules, OPS, architecture links |

Archived generic templates: [_archive/Generic_Templates_2026-05.md](_archive/Generic_Templates_2026-05.md).

---

## What not to duplicate

| Source | Keep there |
|--------|------------|
| APS PDF | Full RF/RN/PN wording |
| [ER V10 Atributos](../03_Diagrams/00_ER_Model/ER_V10/Atributos/) | Conceptual attribute semantics |
| [Data Dictionary](../04_Architecture/01_Database/04_Data_Dictionary/) | Physical columns, enums, keys |
| [Module architecture](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/) | `sp_*`, `svc_*`, triggers, jobs |
| Operational `OPS_*.md` | Scenario-level acceptance detail |

Layer model: [DOCUMENTATION_LAYERS.md](../DOCUMENTATION_LAYERS.md).

---

[← Engineering home](../home.md)

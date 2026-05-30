# Architecture documentation

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1.25rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Engineering</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">DataLayer-aligned</span>
</div>

Index for **system**, **application** and **database** architecture. Validated against the sibling repositories **`MiaCaoMigo_`** and **`MiaCaoMigo_DataLayer`**.

---

## Entry points

| Document | Scope |
|----------|--------|
| [System architecture](00_System_Architecture.md) | DataLayer · Application · Engineering |
| [Application hub](02_Application/README.md) | Website architecture, flows, runtime setup, implementation evidence and [application documentation hub](02_Application/04_Generated_Docs/README.md) |
| [Database hub](01_Database/README.md) | PostgreSQL, M1–M4, QA, SchemaSpy link |

---

## Database (`01_Database`)

| Area | Link |
|------|------|
| Build pipeline | [00_Schema_Build_Pipeline.md](01_Database/00_Schema_Build_Pipeline.md) |
| Governance | [00_Governance/README.md](01_Database/00_Governance/README.md) |
| Schemas M1–M4 | [01_Schemas/README.md](01_Database/01_Schemas/README.md) |
| Data dictionary | [04_Data_Dictionary/00_Overview.md](01_Database/04_Data_Dictionary/00_Overview.md) |
| SchemaSpy (read-only output) | [schemaspy.md](01_Database/05_SchemaSpy/schemaspy.md) |

**Module 3 soft references:** [architecture section](01_Database/01_Schemas/00_Public_Schema/03_Module3_Architecture.md#soft-references-logical-not-physical-fk) — SchemaSpy “implied” ≠ defect.

---

## Diagrams (conceptual)

| Asset | Note |
|-------|------|
| [ER model](../03_Diagrams/00_ER_Model/er_model.md) | May diverge from DDL — **DataLayer prevails** |
| [Application](02_Application/README.md) | Frontend/API layer implemented in `MiaCaoMigo_` |
| [Sprint 2 RF matrix](../02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) | Functional coverage vs DataLayer (not duplicated here) |
| UML (`03_Diagrams/01_UML/`) | Reserved — not yet published in this repo |

---

## Protected paths (do not edit via doc tasks)

- `01_Database/05_SchemaSpy/02_Output/` — generated HTML
- `.docs/` — MkDocs infrastructure

---

[← Engineering home](../index.md)

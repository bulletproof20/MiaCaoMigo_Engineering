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
| [Academic application report](../05_Docs/01_Academic_Reports/Application_Report.md) | Compact defense-oriented report (canonical copy under `05_Docs`) |
| [Database hub](01_Database/README.md) | PostgreSQL, M1–M4, QA, SchemaSpy link |

---

## Academic report focus

The academic application report consolidates the implemented ApplicationLayer evidence for defense reading:

| Area | Evidence covered |
|------|------------------|
| Mod1 - Users | Public authentication, JWT session handling, client/staff separation, role-aware sidebars and employee management views |
| Mod2 - Animals | Catalogs, client animal area, public adoptions and staff animal operations |
| Mod3 - Commercial | Internal commercial workflows for administrators and assistants: counter sales, invoices, stock, returns, plus client invoice visibility |
| Mod4 - Appointments | Client booking, availability lookup, cancellation/rescheduling and staff lifecycle operations |

It also identifies the mounted Express API prefixes (`/api/users/*`, `/api/animals`, `/api/stock`, `/api/sales`, `/api/invoices`, `/api/appointments`) and positions Swagger/OpenAPI as the published REST contract for the current website implementation.

---

## Database (`01_Database`)

| Area | Link |
|------|------|
| Database overview | [Architecture_Overview.md](01_Database/Architecture_Overview.md) |
| Governance | [Overview.md](01_Database/00_Governance/Overview.md) |
| Schemas M1–M4 | [Schemas overview](01_Database/01_Schemas/00_Overview.md) |
| SchemaSpy (read-only output) | [SchemaSpy guide](01_Database/03_SchemaSpy/00_Guide/00_Overview.md) |

**Module 3 soft references:** see [Module 3 schema](01_Database/01_Schemas/00_Public_Schema/03_Module3.md) — SchemaSpy “implied” relationships are not always physical FKs.

---

## Diagrams (conceptual)

| Asset | Note |
|-------|------|
| [ER model](../03_Diagrams/00_ER_Model/er_model.md) | May diverge from DDL — **DataLayer prevails** |
| [Application](02_Application/README.md) | Frontend/API layer implemented in `MiaCaoMigo_` |
| [Implementation matrix](../02_Requirements/06_Implementation_Matrix.md) | Functional coverage and implementation status |
| UML (`03_Diagrams/01_UML/`) | Reserved — not yet published in this repo |

---

## Protected paths (do not edit via doc tasks)

- `01_Database/03_SchemaSpy/02_Output/` — generated HTML (do not edit)
- `.docs/` — MkDocs infrastructure

---

[← Engineering home](../index.md)

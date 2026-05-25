# Non-Functional Requirements

Quality attributes from **Sprint 2 (APS)**. Split by what the **DataLayer** enforces vs what the **application / infrastructure** must provide.

**Normative detail:** [Sprint_2.pdf](../01_Planning/00_Sprints/Sprint_2/APS/Sprint_2.pdf) · **RF implementation:** [traceability matrix](Sprint2/01_RF_Traceability_Matrix.md)

---

## Enforced or supported in DataLayer

| Area | Mechanism | Reference |
|------|-----------|-----------|
| **Authentication audit** | `login_record`, session uniqueness | [M1 integrity](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/01_Module1_Integrity/00_Structural_Integrity.md) |
| **Password verification** | `fn_validate_password` (hash from API) | `01_MiaCaoMigo_DataLayer/DataBase/Services/README.md` |
| **Data integrity** | FK, partial uniques, GiST exclusion, triggers | [Integrity strategy](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/00_Integrity_Strategy.md) |
| **Scheduled jobs** | pg_cron (`jpr_*`) | Module architecture M1, M4 |
| **Stock / invoice consistency** | Triggers M3, M4 | [Module 3](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/03_Module3_Architecture.md) |

---

## Delegated to application / operations

| Area | Note |
|------|------|
| **HTTPS, uptime, latency** | Infrastructure and API hosting (PDF RNF) |
| **Password hashing algorithm** | API before calling `svc_auth_login` |
| **Password change & history** | RF_12–14 — API; RF_14 not in schema |
| **RGPD workflows** | RF_42–43 — API + process |
| **Reporting & advanced filters** | RF_29–30 M3, dashboards |
| **UI usability** | [Application architecture](../04_Architecture/02_Application/README.md) |

---

## Engineering documentation NFR

| Tool | Role |
|------|------|
| PostgreSQL + Docker | Runtime (see [05_Constraints](05_Constraints.md)) |
| MkDocs Material | This portal |
| SchemaSpy | Generated schema browser |

---

[← Requirements hub](README.md)

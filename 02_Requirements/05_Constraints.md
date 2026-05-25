# Constraints

Technical and structural constraints for MiaCaoMigo Engineering and DataLayer.

---

## Platform dependencies

| Dependency | Usage |
|------------|--------|
| **PostgreSQL** | Primary persistence (`01_MiaCaoMigo_DataLayer`) |
| **pg_cron** | `jpr_*` jobs (M1, M4) |
| **Docker** | Local DB and documentation containers |
| **MkDocs + Material** | Engineering portal (`.docs/`) |
| **SchemaSpy** | Generated ER HTML — do not hand-edit `02_Output/` |

---

## Structural constraints (DataLayer)

Documented in governance and reflected in the [traceability matrix](Sprint2/01_RF_Traceability_Matrix.md) (**INC** rows):

| Constraint | Impact |
|------------|--------|
| No temporal `occupies` | RF_18–19 M1 require schema change |
| No animal state history table | RF_08–09 M2 |
| No `payment` entity | RF_21 M3; no `partial` invoice enum (RF_23) |
| M4 `svc_*` read-only | Appointment writes via `sp_*` only |
| Single active session / employee / clock-in | Partial uniques — [M1 integrity](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/01_Module1_Integrity/00_Structural_Integrity.md) |

**Integrity hub:** [00_Integrity_Strategy.md](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/00_Integrity_Strategy.md)

---

## Project constraints

- Academic semester delivery windows (Sprint artefacts under [00_Sprints](../01_Planning/00_Sprints/)).
- Application repository may lag DataLayer (`04_Architecture/02_Application/` stub).
- APS PDF remains normative even when DataLayer is ahead or behind on specific RF.

---

## Operational considerations

- Prefer extending existing `sp_*` / `svc_*` patterns per [SQL standards](../04_Architecture/01_Database/00_Governance/01_SQL_Standards/00_SQL_Standards.md).
- External integrations only when justified in APS or Application layer.
- Archived generic templates: [_archive/Generic_Templates_2026-05.md](_archive/Generic_Templates_2026-05.md).

---

[← Requirements hub](README.md)

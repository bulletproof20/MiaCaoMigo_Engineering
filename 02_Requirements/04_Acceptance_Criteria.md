# Acceptance Criteria

How MiaCaoMigo capabilities are **accepted** for the launch simulation and database delivery: scenario outcomes first, RF matrix second.

---

## Primary acceptance contract

| Source | Role |
|--------|------|
| [TIMELINE_LAUNCH_2026](../01_Planning/01_UserStories/02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md) | Dated outcomes in the launch window |
| [OPS_APPOINTMENT_STATES](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_APPOINTMENT_STATES.md) | Appointment states, cancel, no_show |
| [OPS_COMMERCIAL](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_COMMERCIAL.md) | Sales, returns, overdue invoices |
| [OPS_INCIDENTS](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_INCIDENTS.md) | Absences, HR edge cases |
| [OPS_NOTIFICATIONS](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_NOTIFICATIONS.md) | Notification expectations |

Executable proof: `01_MiaCaoMigo_DataLayer/DataBase/QA/01_Integrity/` and DemoData aligned with the above.

---

## RF-level acceptance

| Criterion | Reference |
|-----------|-----------|
| RF marked **IMP** in matrix | Must have DataLayer evidence path and pass related QA where exists |
| RF **PAR** | Accepted only with documented gap + OPS or API compensates |
| RF **API** | Accepted when application layer spec exists (stub: [Application](../04_Architecture/02_Application/README.md)) |
| RF **NAO** / **INC** | Not accepted as “done” in DataLayer until matrix updated |

Full grid: [01_RF_Traceability_Matrix.md](Sprint2/01_RF_Traceability_Matrix.md).

---

## General engineering criteria

- Schema/bootstrap loads without error on clean QA profile.
- Integrity scripts under `QA/01_Integrity/` pass for the module under change.
- Operational scenario docs updated when DemoData semantics change.
- Portal links (MkDocs) resolve to current paths.

---

[← Requirements hub](README.md)

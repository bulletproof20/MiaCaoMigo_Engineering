# Functional Requirements

MiaCaoMigo functional scope from **Sprint 2 (APS)** modules M1–M4. Normative text: [Sprint_2.pdf](../01_Planning/00_Sprints/Sprint_2/APS/Sprint_2.pdf). Implementation status: [RF traceability matrix](Sprint2/01_RF_Traceability_Matrix.md).

---

## Module 1 — User management (43 RF)

Accounts, authentication, RBAC, schedules, absences, attendance, preferences.

| Theme | Examples (PDF) | Matrix |
|-------|------------------|--------|
| Identity | Client/employee creation, deactivation | [M1 table](Sprint2/01_RF_Traceability_Matrix.md#module-1--user-management-43-rf) |
| Security | Login, single session, audit | ↑ |
| Workforce | Schedule, absence, clock-in | ↑ |
| Governance | Roles, vet/assistant, GDPR (gaps) | ↑ |

**Architecture:** [Module 1](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/01_Module1_Architecture.md) · **Dictionary:** [M1](../04_Architecture/01_Database/04_Data_Dictionary/01_Module1.md)

---

## Module 2 — Animal management (19 RF)

Registration, intake, ownership, concession, lifecycle.

| Theme | Matrix |
|-------|--------|
| Animals & catalog | [M2 table](Sprint2/01_RF_Traceability_Matrix.md#module-2--animal-management-19-rf) |
| Intake & external entities | ↑ |
| Ownership & concession | ↑ |

**Architecture:** [Module 2](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/02_Module2_Architecture.md) · **Simulation:** [Ecosystem](../01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md)

---

## Module 3 — Commercial management (30 RF)

Products, stock, purchases, invoicing, returns.

| Theme | Matrix |
|-------|--------|
| Catalog & stock | [M3 table](Sprint2/01_RF_Traceability_Matrix.md#module-3--commercial-management-30-rf) |
| Sales & invoices | ↑ |
| Returns & reporting gaps | ↑ |

**Architecture:** [Module 3](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/03_Module3_Architecture.md) · **OPS:** [OPS_COMMERCIAL](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_COMMERCIAL.md)

---

## Module 4 — Appointment management (17 RF)

Scheduling, clinical documentation, state machine, billing link.

| Theme | Matrix |
|-------|--------|
| Clinical workflow | [M4 table](Sprint2/01_RF_Traceability_Matrix.md#module-4--appointment-management-17-rf) |
| States & no-show | ↑ |
| M4 write API gap (`svc_*` read-only) | ↑ |

**Architecture:** [Module 4](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/04_Module4_Architecture.md) · **OPS:** [OPS_APPOINTMENT_STATES](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_APPOINTMENT_STATES.md)

---

[← Requirements hub](README.md)

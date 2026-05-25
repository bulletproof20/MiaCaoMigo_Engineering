# Business Requirements

Business goals and **product needs (PN)** from Sprint 2 APS, aligned with the MiaCaoMigo domain (veterinary clinic + shelter + retail).

**Authoritative PN/RN text:** [Sprint_2.pdf](../01_Planning/00_Sprints/Sprint_2/APS/Sprint_2.pdf)  
**Operational translation:** [Ecosystem](../01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md) · [Timeline](../01_Planning/01_UserStories/02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md)

---

## Project goals (engineering view)

| Goal | Documentation |
|------|----------------|
| Reliable clinical and commercial data | [DataLayer](../04_Architecture/01_Database/README.md), [Integrity strategy](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/00_Integrity_Strategy.md) |
| Traceable user and animal lifecycle | [M1](Sprint2/01_RF_Traceability_Matrix.md#module-1--user-management-43-rf) · [M2](Sprint2/01_RF_Traceability_Matrix.md#module-2--animal-management-19-rf) matrices |
| Launch-window demo credibility | [Operational Scenarios](../01_Planning/01_UserStories/02_Operational_Scenarios/) |
| Academic APS compliance | [Authoritative source](Sprint2/00_Authoritative_Source.md) |

---

## Business rules (where documented)

| Type | Location |
|------|----------|
| PDF business rules (RN) | APS PDF per module |
| Database constraints & triggers | [Governance / Integrity](../04_Architecture/01_Database/00_Governance/02_Integrity_Rules/) |
| RF ↔ implementation gaps | [Traceability matrix](Sprint2/01_RF_Traceability_Matrix.md) |
| Simulation-specific rules | `OPS_*.md` under Operational Scenarios |

Examples called out in validation: no fifth-visit discount in DataLayer (RN M4); no partial invoice state enum; animal state not historized as separate rows.

---

## Legal and regulatory

- Personal data: GDPR RF_42–43 — **application/process** (see [Application](../04_Architecture/02_Application/README.md)).
- Retention via inactivation and FK design — **partial** in DataLayer (RF_43 PAR).

---

[← Requirements hub](README.md)

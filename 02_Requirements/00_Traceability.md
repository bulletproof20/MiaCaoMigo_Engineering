# Requirements traceability (overview)

Hub linking **Sprint 2 RF**, **launch simulation**, **database modules**, and **architecture**.

**Full RF grid (109 rows):** [Sprint2/01_RF_Traceability_Matrix.md](Sprint2/01_RF_Traceability_Matrix.md)  
**Normative APS:** [Sprint2/00_Authoritative_Source.md](Sprint2/00_Authoritative_Source.md)

---

## Module map (DataLayer)

| Module | Domain | Dictionary | Architecture | RF matrix section |
|--------|--------|------------|--------------|-------------------|
| M1 | Users, access, HR | [Module 1](../04_Architecture/01_Database/04_Data_Dictionary/01_Module1.md) | [M1 arch](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/01_Module1_Architecture.md) | [M1 RF](Sprint2/01_RF_Traceability_Matrix.md#module-1--user-management-43-rf) |
| M2 | Animals, ownership | [Module 2](../04_Architecture/01_Database/04_Data_Dictionary/02_Module2.md) | [M2 arch](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/02_Module2_Architecture.md) | [M2 RF](Sprint2/01_RF_Traceability_Matrix.md#module-2--animal-management-19-rf) |
| M3 | Commercial | [Module 3](../04_Architecture/01_Database/04_Data_Dictionary/03_Module3.md) | [M3 arch](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/03_Module3_Architecture.md) | [M3 RF](Sprint2/01_RF_Traceability_Matrix.md#module-3--commercial-management-30-rf) |
| M4 | Appointments | [Module 4](../04_Architecture/01_Database/04_Data_Dictionary/04_Module4.md) | [M4 arch](../04_Architecture/01_Database/01_Schemas/00_Public_Schema/04_Module4_Architecture.md) | [M4 RF](Sprint2/01_RF_Traceability_Matrix.md#module-4--appointment-management-17-rf) |

---

## Simulation → operational evidence

| Capability (launch cast) | Operational entry |
|--------------------------|-------------------|
| Shelter intake & adoption | [Ecosystem](../01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md), [Rogerim](../01_Planning/01_UserStories/02_Operational_Scenarios/03_Animals/ANI_ROGERIM.md) |
| Appointments (late, no_show, cancel) | [OPS_APPOINTMENT_STATES](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_APPOINTMENT_STATES.md) |
| Retail, returns, overdue | [OPS_COMMERCIAL](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_COMMERCIAL.md) |
| Notifications | [OPS_NOTIFICATIONS](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_NOTIFICATIONS.md) |
| HR / absences | [OPS_INCIDENTS](../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_INCIDENTS.md) |

**Chronology:** [TIMELINE_LAUNCH_2026](../01_Planning/01_UserStories/02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md)

---

## Requirements summaries

| Document | Purpose |
|----------|---------|
| [README](README.md) | Requirements hub |
| [Functional](00_Functional_Requirements.md) | Index by module |
| [Non-functional](01_Non_Functional_Requirements.md) | NFR split BD vs API |
| [User](02_User_Requirements.md) | Personas → cast |
| [Business](03_Business_Requirements.md) | PN / business rules index |
| [Acceptance](04_Acceptance_Criteria.md) | OPS + QA acceptance |
| [Constraints](05_Constraints.md) | Technical and INC constraints |

---

[← Requirements hub](README.md)

# Ecosystem — MiaCaoMigo Braga launch simulation

Central index for the **first operational weeks** documented in this repository.  
Chronology: [TIMELINE_LAUNCH_2026.md](01_Chronology/TIMELINE_LAUNCH_2026.md).

---

## Simulation window

| Setting | Value |
|---------|--------|
| Clinic context | MiaCaoMigo Braga (academic engineering simulation) |
| Active window | **1 May – 15 June 2026** |
| Timezone | **Europe/Lisbon** (cron and reminders) |
| Executable seed | [`01_MiaCaoMigo_DataLayer`](../../../01_MiaCaoMigo_DataLayer) — Engineering defines *consistency*, DataLayer holds SQL |
| Sprint 2 RF status | [RF traceability matrix](../../../02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) — acceptance vs APS, not a substitute for OPS files below |

---

## How to read User Stories

| Layer | Folder | Use when you need |
|-------|--------|-------------------|
| **Narrative** | [../01_Narrative_Stories/](../01_Narrative_Stories/) | Readable stories — roles, motives, chronology in prose |
| **Operational** | `02_Operational_Scenarios/` (here) | Exact states, validation, service references for DemoData/QA |

See [User Stories README](../README.md) and [DOCUMENTATION_LAYERS.md](../../../DOCUMENTATION_LAYERS.md).

---

## Cast — customers

| ID | Operational | Narrative |
|----|-------------|-----------|
| Gonçalo Rego | [CLI_GONCALO](02_People/Customers/CLI_GONCALO.md) | [Narrative](../01_Narrative_Stories/Customers/CLI_GONCALO.md) |
| Marta Ribeiro | [CLI_MARTA_RIBEIRO](02_People/Customers/CLI_MARTA_RIBEIRO.md) | [Narrative](../01_Narrative_Stories/Customers/CLI_MARTA_RIBEIRO.md) |
| Ana Lourenço | [CLI_ANA_LOURENCO](02_People/Customers/CLI_ANA_LOURENCO.md) | [Narrative](../01_Narrative_Stories/Customers/CLI_ANA_LOURENCO.md) |
| Pedro Costa *(inactive 2 Jun)* | [CLI_PEDRO_COSTA](02_People/Customers/CLI_PEDRO_COSTA.md) | [Narrative](../01_Narrative_Stories/Customers/CLI_PEDRO_COSTA.md) |

Index: [Customers/README.md](02_People/Customers/README.md)

---

## Cast — employees

| ID | Operational | Narrative |
|----|-------------|-----------|
| Ivo Sá | [EMP_IVO](02_People/Employees/EMP_IVO.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_IVO.md) |
| Tiago Mendes | [EMP_TIAGO](02_People/Employees/EMP_TIAGO.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_TIAGO.md) |
| João Navarro | [EMP_J_NAVARRO](02_People/Employees/EMP_J_NAVARRO.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_J_NAVARRO.md) |
| João Marcelo | [EMP_J_MARCELO](02_People/Employees/EMP_J_MARCELO.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_J_MARCELO.md) |
| Isabel Carvalho *(hybrid desk + client)* | [EMP_CLI_ISABEL](02_People/Employees/EMP_CLI_ISABEL.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_CLI_ISABEL.md) |
| Bernardo Silva *(archived ≤ Mar)* | [EMP_BERNARDO](02_People/Employees/EMP_BERNARDO.md) | [Narrative](../01_Narrative_Stories/Employees/EMP_BERNARDO.md) |

Index: [Employees/README.md](02_People/Employees/README.md)

---

## Cast — animals

| ID | Operational | Narrative |
|----|-------------|-----------|
| Rogerim | [ANI_ROGERIM](03_Animals/ANI_ROGERIM.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_ROGERIM.md) |
| Jonas | [ANI_JONAS](03_Animals/ANI_JONAS.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_JONAS.md) |
| Pipoca | [ANI_PIPOCA](03_Animals/ANI_PIPOCA.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_PIPOCA.md) |
| Bento | [ANI_BENTO](03_Animals/ANI_BENTO.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_BENTO.md) |
| Felix | [ANI_FELIX](03_Animals/ANI_FELIX.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_FELIX.md) |
| Quico *(Interno)* | [ANI_QUICO](03_Animals/ANI_QUICO.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_QUICO.md) |
| Max | [ANI_MAX](03_Animals/ANI_MAX.md) | [Narrative](../01_Narrative_Stories/Animals/ANI_MAX.md) |

Index: [Animals/README.md](03_Animals/README.md)

---

## Cast — external partners

| ID | Operational | Narrative |
|----|-------------|-----------|
| Associação Patinhas do Ave | [EXT_PATINHAS_AVE](04_External/EXT_PATINHAS_AVE.md) | [Narrative](../01_Narrative_Stories/External_Entities/EXT_PATINHAS_AVE.md) |
| Resgate Minhoto | [EXT_RESCATE_MINHO](04_External/EXT_RESCATE_MINHO.md) | [Narrative](../01_Narrative_Stories/External_Entities/EXT_RESCATE_MINHO.md) |
| NorteVet Supply Lda | [EXT_NORTEVET_SUPPLY](04_External/EXT_NORTEVET_SUPPLY.md) | [Narrative](../01_Narrative_Stories/External_Entities/EXT_NORTEVET_SUPPLY.md) |

Index: [External/README.md](04_External/README.md)

---

## Operations guides

| Topic | Document |
|-------|----------|
| Appointment lifecycle | [OPS_APPOINTMENT_STATES](05_Operations/OPS_APPOINTMENT_STATES.md) |
| Commercial flows | [OPS_COMMERCIAL](05_Operations/OPS_COMMERCIAL.md) |
| Notifications / cron | [OPS_NOTIFICATIONS](05_Operations/OPS_NOTIFICATIONS.md) |
| Incidents / edge cases | [OPS_INCIDENTS](05_Operations/OPS_INCIDENTS.md) |

---

## Domain coverage (launch window)

Summarized from [TIMELINE](01_Chronology/TIMELINE_LAUNCH_2026.md):

| Domain | States / themes exercised |
|--------|---------------------------|
| Appointments | scheduled, in_progress, completed, cancelled, no_show, late |
| Animals | Interno, Adotado, Transferido, Falecido |
| Invoices | paid, pending, overdue |
| Purchases | received, pending |
| Absences | approved, detected, pending, rejected |
| Clients | active, inactive |

---

## Related engineering docs

| Topic | Location |
|-------|----------|
| Technical implementation | [04_Architecture/README.md](../../../04_Architecture/README.md) |
| Conceptual ER attributes | [ER V10 Atributos](../../../03_Diagrams/00_ER_Model/ER_V10/Atributos/README.md) |
| Physical data dictionary | [Data Dictionary](../../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md) |

Procedure and schema **detail** lives under Architecture and DataLayer — not duplicated here.

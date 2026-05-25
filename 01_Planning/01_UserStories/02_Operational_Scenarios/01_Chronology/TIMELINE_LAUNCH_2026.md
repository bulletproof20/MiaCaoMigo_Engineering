# Launch Timeline — First Weeks of MiaCaoMigo Braga

> Master index: [00_ECOSYSTEM.md](../00_ECOSYSTEM.md)

Operational window: **1 May – 15 June 2026**.  
Timezone: **Europe/Lisbon**. All cron references use this zone.

---

## Week 0 — Platform & archive

| When | Event | Links |
|---|---|---|
| ≤ 15 Mar | [Bernardo](../02_People/Employees/EMP_BERNARDO.md) deactivated | Ivo |
| 1 May | [Ivo](../02_People/Employees/EMP_IVO.md) hired; `schedule` seeded | Platform admin |
| 1 May | Demo profiles `animal_manager`, `commercial_manager`, `consultation_manager`, `public_support` inserted in `profile`/`have` | Ivo |

---

## Week 1 — Staff arrives, shelter opens (4–10 May)

| When | Event | Links |
|---|---|---|
| **4 May AM** | Tiago, João Navarro, João Marcelo onboarded | Ivo |
| **4 May PM** | [Rogerim](../03_Animals/ANI_ROGERIM.md) delivery — `Interno` | Tiago, [Patinhas do Ave](../04_External/EXT_PATINHAS_AVE.md) |
| **4 May PM** | [Quico](../03_Animals/ANI_QUICO.md) abandonment intake | Tiago |
| **5 May** | Isabel hired; begins `detected` absence stretch | Ivo |
| **5 May** | [Pipoca](../03_Animals/ANI_PIPOCA.md) transfer delivery | Tiago, Patinhas |
| **6 May** | [Gonçalo](../02_People/Customers/CLI_GONCALO.md) registered | Ivo |
| **6 May** | [Ana Lourenço](../02_People/Customers/CLI_ANA_LOURENCO.md) registered; books Pipoca visit | Isabel → Marcelo |
| **7 May** | Ivo `approved` absence | Platform admin |
| **8 May** | Rogerim → Gonçalo adoption | Tiago |
| **8 May** | Ana adopts Pipoca | Tiago |
| **9 May** | [Marta Ribeiro](../02_People/Customers/CLI_MARTA_RIBEIRO.md) first purchase | Navarro |
| **10 May** | Gonçalo purchase (food + toys) | Navarro |

---

## Week 2 — Clinical rhythm & friction (11–17 May)

| When | Event | Links |
|---|---|---|
| **11 May** | Marcelo double-books risk: Isabel schedules two `geral` slots; Marcelo reschedules one | [OPS appointments](../05_Operations/OPS_APPOINTMENT_STATES.md) |
| **12 May** | Jonas `geral` **completed** | Gonçalo, Marcelo |
| **13 May** | [Felix](../03_Animals/ANI_FELIX.md) **`in_progress`** (Marcelo delayed start) | [Marta](../02_People/Customers/CLI_MARTA_RIBEIRO.md) |
| **14 May** | Felix **completed**; prescription + invoice | Marta, Navarro |
| **15 May** | Tiago `detected` absence | System |
| **15 May** | [Pedro Costa](../02_People/Customers/CLI_PEDRO_COSTA.md) `no_show` after missed reminder read | Cron + Marcelo |
| **16 May** | Jonas `dermatology` **completed** | Gonçalo |
| **16 May** | Tiago `detected` absence | System |
| **17 May** | Marta **`late`** arrival (portal shows `late` while still `scheduled`); visit salvaged → `completed` | [OPS](../05_Operations/OPS_APPOINTMENT_STATES.md) |

---

## Week 3 — Store stress & returns (18–24 May)

| When | Event | Links |
|---|---|---|
| **18 May** | Gonçalo prescription nutrition purchase | Navarro |
| **18 May** | Marta **return** on defective toy (`return` + `invoice_line`) | Navarro |
| **19 May** | Navarro receives supplier PO (`sp_receive_purchase`) | [OPS commercial](../05_Operations/OPS_COMMERCIAL.md) |
| **20 May** | Ivo `schedule` change; Tiago `detected` | Ivo, system |
| **20 May** | [Max](../03_Animals/ANI_MAX.md) **concession** → `Transferido` | Tiago, Patinhas |
| **21 May** | Ivo `detected`; Isabel returns to desk | System |
| **21 May 08:00** | Cron reminders for 22 May | [OPS notifications](../05_Operations/OPS_NOTIFICATIONS.md) |
| **22 May** | Tico **completed** + prescription | Isabel, Marcelo, Navarro |
| **23 May** | Gonçalo auth typo cluster | Gonçalo |
| **24 May** | Marta **cancelled** surgery prep (`sp_cancel_appointment`, >24h) | Marcelo |

---

## Week 4 — HR backlog & futures (25 May – 15 Jun)

| When | Event | Links |
|---|---|---|
| **25 May** | Pending absences: Ivo, Tiago, Marcelo | Ivo |
| **28 May** | [Bento](../03_Animals/ANI_BENTO.md) euthanasia → `Falecido`, ownership closed | Marcelo, Lourenço family |
| **2 Jun** | Pedro Costa `ina_dat_cli` set (inactive) | Ivo |
| **3 Jun** | Isabel `pending` absence | Ivo |
| **5 Jun** | Marta invoice **`overdue`** on unpaid pending header | Navarro |
| **9 Jun 08:00** | Reminder for Gonçalo Jonas slot | Notifications |
| **10 Jun** | Jonas `dermatology` **scheduled** (future) | Gonçalo, Marcelo |
| **12 Jun** | Pipoca `geral` **scheduled** for Ana | Ana, Isabel |

---

## Coverage checklist

| Domain | States / scenarios in timeline |
|---|---|
| Appointments | scheduled, in_progress, completed, cancelled, no_show, late (read model) |
| Animals | Interno, Adotado, Transferido, Falecido |
| Invoices | paid, pending, overdue |
| Purchases | received, pending |
| Absences | approved, detected, pending, rejected *(see OPS incidents)* |
| Clients | active, inactive |

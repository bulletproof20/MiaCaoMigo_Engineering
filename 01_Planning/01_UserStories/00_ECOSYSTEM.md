# MiaCaoMigo — Connected Clinic Simulation

Single narrative universe for the **first operational weeks** of the Braga clinic (May–June 2026).  
Not seed SQL — operational stories for DemoData authors, QA, and demos.

---

## How to read this folder

| Path | Contents |
|---|---|
| [01_Chronology/TIMELINE_LAUNCH_2026.md](01_Chronology/TIMELINE_LAUNCH_2026.md) | Day-by-day shared timeline |
| [02_People/](02_People/) | Employees & customers |
| [03_Animals/](03_Animals/) | Animal-centric arcs |
| [04_External/](04_External/) | Shelters, rescues, suppliers |
| [05_Operations/](05_Operations/) | Appointments, commercial, notifications, incidents |

Legacy paths at repository root (`EMP_*.md`, `CLI_GONCALO.md`) redirect conceptually to `02_People/` — prefer nested paths for new work.

---

## Role vs profile

| Layer | Storage | Examples |
|---|---|---|
| **Base role** | `assistant`, `veterinarian`, plain `employee`, `client` | Tiago → `assistant` |
| **Profile** | `profile` + `occupies` + `have` | Tiago → `animal_manager` |

Permissions attach to **profiles** only. DemoData may add profiles (`id_pro` ≥ 5).

| Profile | Permissions | Typical base role |
|---|---|---|
| administrador | all nine | employee |
| veterinario | manage_animals, manage_appointments, view_reports | veterinarian |
| assistente | manage_appointments, view_reports | assistant |
| cliente | view_reports | client |
| **animal_manager** | manage_animals, view_reports | assistant |
| **commercial_manager** | manage_commercial, view_reports | assistant |
| **consultation_manager** | manage_appointments, view_reports | veterinarian |
| **public_support** | manage_appointments, view_reports | assistant |

---

## Active cast

| Person | Base role | Profile | Story |
|---|---|---|---|
| Ivo Sá | employee | administrador | [EMP_IVO](02_People/Employees/EMP_IVO.md) |
| Tiago Mendes | assistente | animal_manager | [EMP_TIAGO](02_People/Employees/EMP_TIAGO.md) |
| João Navarro | assistente | commercial_manager | [EMP_J_NAVARRO](02_People/Employees/EMP_J_NAVARRO.md) |
| João Marcelo | veterinario | consultation_manager | [EMP_J_MARCELO](02_People/Employees/EMP_J_MARCELO.md) |
| Isabel Carvalho | assistente + cliente | public_support | [EMP_CLI_ISABEL](02_People/Employees/EMP_CLI_ISABEL.md) |
| Gonçalo Rego | cliente | cliente | [CLI_GONCALO](02_People/Customers/CLI_GONCALO.md) |
| Marta Ribeiro | cliente | cliente | [CLI_MARTA](02_People/Customers/CLI_MARTA_RIBEIRO.md) |
| Ana Lourenço | cliente | cliente | [CLI_ANA](02_People/Customers/CLI_ANA_LOURENCO.md) |
| Pedro Costa | cliente *(inactive)* | cliente | [CLI_PEDRO](02_People/Customers/CLI_PEDRO_COSTA.md) |
| Bernardo Silva | assistente *(inactive)* | public_support | [EMP_BERNARDO](02_People/Employees/EMP_BERNARDO.md) |

---

## Animal registry (narrative)

| Animal | `sta_ani` | Owner / custody | Story |
|---|---|---|---|
| Rogerim | Adotado | Gonçalo | [ANI_ROGERIM](03_Animals/ANI_ROGERIM.md) |
| Jonas | Adotado | Gonçalo | [ANI_JONAS](03_Animals/ANI_JONAS.md) |
| Pipoca | Adotado | Ana Lourenço | [ANI_PIPOCA](03_Animals/ANI_PIPOCA.md) |
| Quico | Interno | shelter | [ANI_QUICO](03_Animals/ANI_QUICO.md) |
| Max | Transferido | — | [ANI_MAX](03_Animals/ANI_MAX.md) |
| Bento | Falecido | Ana (closed) | [ANI_BENTO](03_Animals/ANI_BENTO.md) |
| Felix | Adotado | Marta | [ANI_FELIX](03_Animals/ANI_FELIX.md) |
| Tico / Teco / Jerónimo | Adotado | Isabel | [EMP_CLI_ISABEL](02_People/Employees/EMP_CLI_ISABEL.md) |

---

## External partners

| Entity | Type | Story |
|---|---|---|
| Associação Patinhas do Ave | Shelter | [EXT_PATINHAS_AVE](04_External/EXT_PATINHAS_AVE.md) |
| Resgate Minhoto | Rescue | [EXT_RESCATE_MINHO](04_External/EXT_RESCATE_MINHO.md) |
| NorteVet Supply Lda | Supplier | [EXT_NORTEVET_SUPPLY](04_External/EXT_NORTEVET_SUPPLY.md) |

---

## Operational compendia

| Topic | File |
|---|---|
| All `appointment_status` paths | [OPS_APPOINTMENT_STATES](05_Operations/OPS_APPOINTMENT_STATES.md) |
| Purchases, invoices, returns | [OPS_COMMERCIAL](05_Operations/OPS_COMMERCIAL.md) |
| `appointment_notification` + cron | [OPS_NOTIFICATIONS](05_Operations/OPS_NOTIFICATIONS.md) |
| Mistakes, overload, HR friction | [OPS_INCIDENTS](05_Operations/OPS_INCIDENTS.md) |

---

## System rules (canonical)

- **Auth:** staff `{id_usr}@miacaomigo.pt`; clients personal `ema_usr`.
- **Sessions:** `login_user` + `has_active_sessions`; audit `login_record`.
- **Animals:** `Interno` → `Adotado` (`sp_assign_ownership`); `Transferido` (`sp_process_concession`); `Falecido` (clinical exit + `ina_dat_ani`).
- **Appointments:** 30 min; `sp_create_appointment` → `scheduled`; cancel/reschedule >24h; `no_show` via `sp_auto_update_no_show_appointments`; `late` is read-side when `scheduled` ∧ past `sch_dat_app`.
- **Reminders:** `daily_appointment_warnings` at **08:00** for **tomorrow** (`vw_scheduled_appointments_tomorrow`).
- **Commercial:** `invoice` + `invoice_line`; `sta_inv` ∈ paid, pending, overdue, cancelled; returns restock via `trg_return_restock`.
- **Absences:** `pending` → `approved`/`rejected`; unattended shifts → `detected` + `no_show`.

---

## Scenario coverage matrix

| Scenario | Primary story |
|---|---|
| Shelter delivery | Rogerim, Pipoca, Quico |
| Adoption | Rogerim, Pipoca, Felix |
| Concession / transfer out | Max |
| Deceased animal | Bento |
| Appointment every status | OPS_APPOINTMENT_STATES |
| Return + overdue invoice | Marta |
| Inactive client | Pedro |
| Email login failures | Gonçalo, Pedro |
| Hybrid employee-client | Isabel |
| Employee absences | Ivo, Tiago, Isabel, Marcelo |
| Prescription + billing | Tico, Felix, Jonas |
| Supplier receive | Navarro + NorteVet |
| Archive user | Bernardo |

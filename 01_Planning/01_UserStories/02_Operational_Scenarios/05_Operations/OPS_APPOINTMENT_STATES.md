# Operations — Appointment States

> Timeline: [TIMELINE_LAUNCH_2026.md](../01_Chronology/TIMELINE_LAUNCH_2026.md) · Ecosystem: [00_ECOSYSTEM.md](../00_ECOSYSTEM.md)

Platform enum `appointment_status`: `scheduled`, `in_progress`, `completed`, `cancelled`, `no_show`, `late`.

There is **no** `requested` row state — front-desk “requests” are human intake before `sp_create_appointment`.

---

## 1. Requested *(operational, pre-system)*

| Context | What happens |
|---|---|
| **Isabel → Marcelo** | Isabel captures paper form; verifies `ownership`; calls `sp_create_appointment` with Marcelo as `id_emp` |
| **Ana → Pipoca** | 6 May: Ana asks for post-adoption check; Isabel books once `id_cli` exists |
| **Gonçalo portal** | Client UI gathers slot preference; backend still ends in `scheduled` |

**Related:** [EMP_CLI_ISABEL](../02_People/Employees/EMP_CLI_ISABEL.md), [CLI_ANA](../02_People/Customers/CLI_ANA_LOURENCO.md)

---

## 2. Scheduled (`sp_create_appointment`)

| Case | Animal | Client | Vet | When |
|---|---|---|---|---|
| Future dermatology | Jonas | Gonçalo | Marcelo | 10 Jun 2026 |
| Post-adoption check | Pipoca | Ana | Marcelo | 12 Jun 2026 |
| Cancelled later | Kika proxy → Marta's Felix | Marta | Marcelo | 24 May cancel of **different** June surgery slot |

Rules enforced on insert:

- `fn_validate_animal_client_relationship`
- `fn_validate_appointment_vet_specialty` (`expert`)
- `fn_block_appointment_if_vet_unavailable`
- `ex_appointment_vet_overlap` (30 min GiST, `scheduled` only)
- `fn_block_past_appointments`

**Notification:** row appears in `vw_scheduled_appointments_tomorrow` → cron at **08:00** day before.

---

## 3. Late *(read model, still `scheduled` in DB)*

| Case | Story |
|---|---|
| Marta / Felix | 17 May: `sch_dat_app` passed while owner stuck in traffic; portal lists `late` via `fn_list_client_appointments` case expression; Marcelo starts visit anyway → `in_progress` |

DB remains `scheduled` until `sp_start_appointment`; UI may show `late` when `sch_dat_app < now()`.

---

## 4. In progress (`sp_start_appointment`)

| Case | Story |
|---|---|
| Felix / Marta | 13 May: Marcelo delayed (prior visit overran); `sta_dat_app` set; Isabel reassures waiting room |
| Stress day | 11 May: two overlapping risks taught team to stagger slots |

Only from `scheduled` (or effectively scheduled + late arrival).

---

## 5. Completed (`sp_end_appointment`)

| Case | `id_spe` | Billing |
|---|---|---|
| Jonas routine | geral | `id_inv` optional |
| Jonas dermatology | dermatology | Navarro lines 18 May |
| Tico | geral | `id_inv` + `rel_pre_prod` ×2 |
| Felix | geral | paid invoice |
| Ana / Pipoca | geral | pending → paid |

Follow-ups: `sp_prescription_for_appointment`, `overall_assessment`, `anamnesis`.

---

## 6. Cancelled (`sp_cancel_appointment`)

| Case | Cause | Rule |
|---|---|---|
| Marta surgery prep | Family travel; rebooks August verbally | Cancelled 24 May for slot >24h out |
| Historical | Bernardo-era row in archive | Terminal — no edits |

Fails if inside 24h window — Isabel must coordinate Marcelo override via reschedule narrative (not in schema).

---

## 7. No show (`sp_auto_update_no_show_appointments`)

| Case | Story |
|---|---|
| Pedro / dog Thor | 15 May 11:00: owner never arrived; cron **00:05** next day sets `no_show`; reminder was ignored |

Prior state: `scheduled`. Vet absence would have blocked booking via `fn_block_appointment_if_vet_unavailable`.

---

## State diagram

```text
[requested] ──sp_create_appointment──► scheduled
scheduled ──sp_start_appointment──► in_progress
in_progress ──sp_end_appointment──► completed
scheduled ──sp_cancel_appointment──► cancelled   (>24h)
scheduled ──cron no_show job──► no_show         (past sch_dat_app)
scheduled ──(UI)──► late                        (read-only label)
```

---

## Actor map

| State | Primary owner |
|---|---|
| scheduled | Marcelo, Isabel (`public_support`) |
| in_progress / completed | Marcelo |
| cancelled | Client + Marcelo policy |
| no_show | System job + Navarro (no charge or charge per invoice policy in demo) |
| late | Front desk + Marcelo |

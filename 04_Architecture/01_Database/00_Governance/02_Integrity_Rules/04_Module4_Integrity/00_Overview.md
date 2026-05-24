# Module 4 — Integrity overview

Appointment management: scheduling, overlap, vet absence, lifecycle, prescriptions, notifications.

**DDL:** `DataBase/Schema/04_Module4_Appointment_Management/`  
**Public API:** `DataBase/Services/04_Module4/99_Public_API.sql`  
**Domain procedures:** `05_Procedures_Mod4.sql` (e.g. `sp_create_appointment` — called by QA and `svc_*`)

**Jobs:** `06_Jobs_Mod4.sql` — pg_cron schedules where defined.

---

## Cross-module dependencies

Module 4 FK layer links to:

- Module 1 — `employee`, `client`
- Module 2 — `animal`
- Module 3 — `product`, `invoice` (where applicable)

All deferred to `01_ForeignKeys_Mod4.sql` after tables exist.

---

## Automated integrity tests (QA)

| Script | Rule focus |
|--------|------------|
| `01_Appointment_Scheduling.sql` | `sp_create_appointment` |
| `02_Appointment_Overlap.sql` | Overlap exclusion |
| `03_Vet_Absence.sql` | Vet absence vs booking |
| `04_Appointment_Lifecycle.sql` | Status transitions |
| `05_Prescription_Timing.sql` | Prescription vs appointment time |
| `06_Notifications.sql` | Notification rules |

Fixtures: `fixtures/seed/m4_appointment_slots.sql` + M1/M2 contracts (`qa_*()`).

---

## Stress (optional)

| Script | Focus |
|--------|-------|
| `01_Concurrent_Appointment_Booking.sql` | Booking contention |
| `02_Appointment_Lifecycle_Load.sql` | Lifecycle load |

---

## Related

- [Integrity strategy](../00_Integrity_Strategy.md)
- [Module 4 architecture](../../01_Schemas/00_Public_Schema/04_Module4_Architecture.md)

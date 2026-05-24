# Module 1 — Automated Integrity

## Purpose

Triggers and pg_cron jobs that enforce Module 1 rules **without** application calls.

**Source of truth:** `01_MiaCaoMigo_DataLayer/DataBase/Schema/01_Module1_User_Management/`.

---

## Trigger strategy

Triggers (`trg_*`) run **BEFORE** insert/update (and where needed, delete) to block invalid state before commit. Failed checks abort the transaction.

Defined in: `03_Triggers_Mod1.sql`  
Helper functions: `02_Functions_Mod1.sql`

---

## Triggers (implemented)

| Trigger | Table | Timing | Purpose |
|---------|-------|--------|---------|
| `trg_block_clock_in_insert` | `clock_in` | BEFORE INSERT | Attendance rules |
| `trg_block_employee_inactivation` | `employee` | BEFORE UPDATE | Block invalid inactivation |
| `trg_block_assistant_disjunction` | `assistant` | BEFORE INSERT/UPDATE | Role disjunction |
| `trg_block_veterinarian_disjunction` | `veterinarian` | BEFORE INSERT/UPDATE | Role disjunction |
| `trg_block_absence_overlap_by_user` | `absence` | BEFORE INSERT/UPDATE | Absence overlap |
| `trg_create_default_setup` | `user_account` | AFTER INSERT | Default setup row |

!!! note "QA coverage"
    Related integrity scripts: `03_Clocking_Rules.sql`, `04_Absence_Overlap.sql`, `05_Role_Disjunction.sql`, `06_Schedule_Exclusion.sql` (exclusion constraint).

---

## Scheduled jobs (pg_cron)

Jobs are registered in `06_Jobs_Mod1.sql` and invoke **`jpr_*`** procedures from `05_Procedures_Mod1.sql`.

| Cron name | Schedule | Procedure | Purpose |
|-----------|----------|-----------|---------|
| `auto_close_clockin_midnight` | `0 0 * * *` | `jpr_auto_close_clock_in_midnight()` | Close open clock-ins at day boundary |
| `auto_cancel_expired_absences` | `5 0 * * *` | `jpr_auto_cancel_expired_absences()` | Cancel stale pending absences |

**Requirements:** `pg_cron` extension (`00_Extensions.sql`), `shared_preload_libraries` in Docker command.

---

## Legacy documentation removed

The following **were never implemented** under these names and must not be used in new docs or code:

| Abandoned name | Use instead |
|----------------|-------------|
| `job_expire_sessions` | Session rules via `sp_auth_*` + `login_record` |
| `job_validate_schedule_conflicts` | `ex_schedule_overlap` + triggers |
| `trg_hash_password_*` | Password hashing handled at API layer (see Engineering auth docs) |
| `trg_normalize_email_*` | `fn_normalize_email` at write time in workflows |

---

## Automated transaction protection

When a trigger raises an exception:

- the current statement fails;
- the transaction rolls back;
- QA tests expect `unique_violation` or custom messages via `PASS:`/`FAIL:` notices.

---

## Related documents

- [Structural integrity](00_Structural_Integrity.md)
- [Procedural validation](03_Procedural_Validation.md)
- [Integrity strategy](../00_Integrity_Strategy.md)

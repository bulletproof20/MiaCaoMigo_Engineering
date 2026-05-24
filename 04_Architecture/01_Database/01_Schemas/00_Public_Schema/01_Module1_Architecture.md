# Module 1 — User and access management

!!! info "Implementation"
    **Schema DDL:** `DataBase/Schema/01_Module1_User_Management/`  
    **Business logic:** `DataBase/Services/01_Module1/`  
    **Public API:** `DataBase/Services/01_Module1/99_Public_API/`

## Purpose

Operational identity layer: accounts, RBAC, authentication audit, schedules, absences, attendance. Referenced by all other modules for `client`, `employee`, and user-linked attributes.

---

## Schema artefacts (DDL)

| File | Contents |
|------|----------|
| `00_Tables_Mod1.sql` | 16 tables (see below) |
| `01_ForeignKeys_Mod1.sql` | Internal FK graph |
| `02_Functions_Mod1.sql` | Trigger helper functions |
| `03_Triggers_Mod1.sql` | 6 `trg_*` guards |
| `04_Indexes_Mod1.sql` | Indexes + **`ex_schedule_overlap`** (GiST) |
| `05_Procedures_Mod1.sql` | **`jpr_*`** job procedures only; DROP legacy `sp_*` moved to Services |
| `06_Jobs_Mod1.sql` | pg_cron → `jpr_auto_close_clock_in_midnight`, `jpr_auto_cancel_expired_absences` |
| `07_Views_Mod1.sql` | 4 `vw_*` read models |

---

## Core entities

| Table | Role |
|-------|------|
| `user_account` | Personal identity, email, NIF |
| `profile`, `permission`, `occupies`, `have` | RBAC |
| `employee`, `assistant`, `veterinarian`, `expert`, `specialty` | Staff model |
| `client` | Client credentials (1:1 `user_account`, PK `id_cli` for FK targets) |
| `login_record` | Auth audit trail / session lifecycle |
| `schedule`, `absence` | Workforce planning |
| `clock_in` | Attendance |
| `setup` | Per-user preferences |

---

## Services layer (Module 1 specific)

Business workflows **do not** live in Schema `05_Procedures_Mod1` anymore.

```text
svc_*  (99_Public_API/*.sql)
  → sp_auth_login / sp_auth_logout
  → sp_create_* / sp_promote_* / sp_demote_*
  → sp_clock_toggle / sp_replicate_schedule
      → fn_* (00_Core, 00_Core_Mod1, 05_Query_Helpers)
      → vw_* (Schema views)
```

| API file | `svc_*` examples |
|----------|------------------|
| `01_Authentication_API.sql` | `svc_auth_login`, `svc_auth_logout` |
| `02_User_Creation_API.sql` | `svc_create_client`, `svc_create_employee`, … |
| `03_Role_Change_API.sql` | `svc_promote_to_veterinarian`, … |
| `04_Attendance_API.sql` | `svc_clock_toggle`, `svc_replicate_schedule` |

---

## Triggers (implemented)

| Trigger | Guard |
|---------|--------|
| `trg_block_clock_in_insert` | Clock-in rules |
| `trg_block_employee_inactivation` | Employee lifecycle |
| `trg_block_assistant_disjunction` | Assistant role |
| `trg_block_veterinarian_disjunction` | Veterinarian role |
| `trg_block_absence_overlap_by_user` | Absence overlap |
| `trg_create_default_setup` | Default `setup` on new user |

---

## Scheduled jobs

| Cron name | Procedure |
|-----------|-----------|
| `auto_close_clockin_midnight` | `jpr_auto_close_clock_in_midnight()` |
| `auto_cancel_expired_absences` | `jpr_auto_cancel_expired_absences()` |

---

## Views (`vw_*`)

| View | Use |
|------|-----|
| `vw_active_employee_directory` | Staff directory |
| `vw_open_clock_in_sessions` | Open attendance |
| `vw_operational_absences` | Absence board |
| `vw_active_login_sessions` | Open login rows (`sou_tim_log` null) |

---

## Cross-module role

| Consumer | Uses |
|----------|------|
| M2 | `client.id_cli`, `employee.id_emp` |
| M3 | `client`, `employee` on commercial docs |
| M4 | `client`, `employee`, vet specialty via `expert` |

FKs **into** M1 are declared in consumer modules’ `01_ForeignKeys_*` files.

---

## QA coverage

| Script | Focus |
|--------|-------|
| `01_Email_Nif_Uniqueness.sql` | `uq_ema_usr`, `uq_nif_usr` |
| `02_Login_Session_Rules.sql` | `svc_auth_*` |
| `03_Clocking_Rules.sql` | `sp_clock_toggle` |
| `04_Absence_Overlap.sql` | Absence |
| `05_Role_Disjunction.sql` | Assistant/vet |
| `06_Schedule_Exclusion.sql` | `ex_schedule_overlap` |

Fixture: `QA/fixtures/seed/m1_core_context.sql`.  
Details: [M1 integrity governance](../../00_Governance/02_Integrity_Rules/01_Module1_Integrity/).

---

## Related

- [Database architecture](00_Database_Architecture.md)
- [Module 2](02_Module2_Architecture.md)

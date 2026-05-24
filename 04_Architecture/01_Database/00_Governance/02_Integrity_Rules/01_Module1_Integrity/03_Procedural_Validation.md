# Module 1 — Procedural Validation

## Purpose

Business workflows and the public API for identity, auth, RBAC, and attendance.

**Implemented in Services**, not in Schema business procedures (Schema M1 keeps **`jpr_*`** job procedures only).

---

## Layering (Module 1)

```text
Application
    → svc_*     (Services/01_Module1/99_Public_API/)
        → sp_*  (Services/01_Module1/* workflows)
            → fn_*  (Services/00_Core, 00_Core_Mod1, 05_Query_Helpers)
            → vw_*  (Schema/07_Views_Mod1.sql)
```

---

## Public API (`svc_*`)

Official entry points — see `DataBase/Services/README.md` for the full map.

| svc_* | Workflow |
|-------|----------|
| `svc_auth_login` | `sp_auth_login` |
| `svc_auth_logout` | `sp_auth_logout` |
| `svc_create_client` | `sp_create_client` |
| `svc_create_employee` | `sp_create_employee` |
| `svc_create_assistant` | `sp_create_assistant` |
| `svc_create_veterinarian` | `sp_create_veterinarian` |
| `svc_promote_to_veterinarian` | `sp_promote_to_veterinarian` |
| `svc_promote_to_assistant` | `sp_promote_to_assistant` |
| `svc_demote_to_general_employee` | `sp_demote_to_general_employee` |
| `svc_clock_toggle` | `sp_clock_toggle` |
| `svc_replicate_schedule` | `sp_replicate_schedule` |

---

## Business workflows (`sp_*`)

| Area | Path | Examples |
|------|------|----------|
| Authentication | `01_Authentication/` | `sp_auth_login`, `sp_auth_logout` |
| User creation | `02_User_Creation/` | `sp_create_client`, `sp_create_employee`, … |
| Role change | `03_Role_Change/` | `sp_promote_to_veterinarian`, `sp_demote_to_general_employee` |
| Attendance | `04_Attendance_Management/` | `sp_clock_toggle`, `sp_replicate_schedule` |

Load order: `Bootstrap/Loaders/06_Services.sql`.

---

## Schema technical procedures (`jpr_*`)

Maintenance only — **not** callable by the application API:

| Procedure | Invoked by |
|-----------|------------|
| `jpr_auto_close_clock_in_midnight` | cron `auto_close_clockin_midnight` |
| `jpr_auto_cancel_expired_absences` | cron `auto_cancel_expired_absences` |

`05_Procedures_Mod1.sql` also **drops** legacy `sp_*` that were moved to Services to prevent duplicate definitions on re-init.

---

## QA validation

| Test | Rules exercised |
|------|-----------------|
| `02_Login_Session_Rules.sql` | `svc_auth_login` / logout, single session |
| `03_Clocking_Rules.sql` | `sp_clock_toggle`, triggers |
| `05_Role_Disjunction.sql` | assistant/vet disjunction triggers |

Contracts: `qa_login_session_emp_email()`, `qa_registrar_emp_email()`, etc. — see `QA/contracts/00_ENTITIES.md`.

---

## Transactional behaviour

Workflows that detect invalid input should:

- raise exceptions for hard failures (trigger-compatible);
- or return structured failure rows for auth-style flows (`sp_auth_login`).

QA asserts outcomes via `PASS:` / `FAIL:` notices, not by expecting silent success.

---

## Legacy names (do not use)

| Documented previously | Current implementation |
|----------------------|-------------------------|
| `fn_login_user` | `sp_auth_login` + `svc_auth_login` |
| `fn_logout_user` | `sp_auth_logout` + `svc_auth_logout` |

---

## Related documents

- [Automated integrity](01_Automated_Integrity.md)
- [SQL programming naming](../../00_Naming_Conventions/02_SQL_Programming.md)
- DataLayer `DataBase/Services/README.md` — `svc_*` delegation map

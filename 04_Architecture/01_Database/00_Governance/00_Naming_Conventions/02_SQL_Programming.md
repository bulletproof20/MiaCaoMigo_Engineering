# SQL Programming Naming Conventions

## Purpose

Naming rules for procedural SQL in MiaCaoMigo: functions, procedures, triggers, scheduled jobs, the public API, and QA contracts.

Aligned with **`01_MiaCaoMigo_DataLayer/DataBase/Services/`** and **`DataBase/Schema/`**.

---

## Prefix overview

| Prefix | Layer | Callable by application? | Typical location |
|--------|-------|--------------------------|------------------|
| **`svc_*`** | Public API | **Yes** — only official entry points | `Services/*/99_Public_API*` |
| **`sp_*`** | Business workflow | No | M1: `Services/01_Module1/**`; M2–M4: `Schema/*/05_Procedures_*` |
| **`fn_*`** | Internal / trigger helper | No | `Services/00_Core`, `Services/01_Module1`, `Schema/*/02_Functions_*` |
| **`jpr_*`** | Job procedure (pg_cron target) | No | `Schema/*/05_Procedures_*` (technical maintenance) |
| **`trg_*`** | Trigger | No | `Schema/*/03_Triggers_*` |
| **`qa_*`** | QA contract lookup | No (tests/fixtures only) | `QA/contracts/01_QA_Functions.sql` |
| **`vw_*`** | Read model (view) | No — via `svc_*` / `sp_*` | `Schema/*/07_Views_*` |

!!! note "Module 1 split"
    Module 1 **business** `sp_*` live in **Services**. Schema `05_Procedures_Mod1.sql` holds **`jpr_*`** job procedures and DROP guards for legacy `sp_*` that moved to Services.

---

## Functions (`fn_*`)

**Rules**

- Prefix `fn_`
- Lowercase `snake_case`
- Describe operation, not caller (`fn_normalize_email`, not `fn_login_user`)

**Examples (implemented)**

| Function | Role |
|----------|------|
| `fn_normalize_email` | Core identity normalization |
| `fn_pick_*` | Ranked selection helpers (M1 query helpers) |
| `fn_*` in Schema | Trigger support functions |

---

## Procedures and workflow functions (`sp_*`)

**Rules**

- Prefix `sp_`
- Represent a business or domain workflow
- Module 1: prefer **function** returning rows/status where login-style; **procedure** for multi-step writes

**Examples (Module 1 — Services)**

| Object | Kind |
|--------|------|
| `sp_auth_login` | function |
| `sp_auth_logout` | function |
| `sp_create_client` | procedure |
| `sp_create_employee` | procedure |
| `sp_clock_toggle` | procedure |
| `sp_promote_to_veterinarian` | function |

**Examples (Module 4 — Schema)**

| Object | Role |
|--------|------|
| `sp_create_appointment` | Domain scheduling workflow (integrity tests call directly) |

---

## Job procedures (`jpr_*`)

Scheduled maintenance invoked by **pg_cron** uses the **`jpr_`** prefix (job procedure), not `job_`.

| Procedure | Cron name (string) | Schedule |
|-----------|-------------------|----------|
| `jpr_auto_close_clock_in_midnight` | `auto_close_clockin_midnight` | `0 0 * * *` |
| `jpr_auto_cancel_expired_absences` | `auto_cancel_expired_absences` | `5 0 * * *` |

!!! info "Cron schedule identifier"
    The first argument to `cron.schedule()` is a **human-readable job name** (snake_case string). It is not prefixed with `job_`.

Modules 2 and 3: `06_Jobs_Mod2.sql` / `06_Jobs_Mod3.sql` are **placeholders** (skipped at bootstrap). Module 4 may define additional `jpr_*` / cron entries.

---

## Public API (`svc_*`)

**Rules**

- Only `svc_*` objects are the **application-facing contract**
- Implemented in Services; delegate to `sp_*`, `vw_*`, or controlled DML
- Modules 2–4: single `99_Public_API.sql` per module

**Examples**

| API | Delegates to |
|-----|----------------|
| `svc_auth_login` | `sp_auth_login` |
| `svc_create_client` | `sp_create_client` |
| `svc_get_animal_history` | custom read SQL |

---

## Triggers (`trg_*`)

**Rules**

- Prefix `trg_`
- Name reflects guard or action (`trg_block_clock_in_insert`, `trg_create_default_setup`)

**Module 1 triggers (implemented)**

| Trigger | Purpose |
|---------|---------|
| `trg_block_clock_in_insert` | Clock-in rules |
| `trg_block_employee_inactivation` | Lifecycle guard |
| `trg_block_assistant_disjunction` | Role disjunction |
| `trg_block_veterinarian_disjunction` | Role disjunction |
| `trg_block_absence_overlap_by_user` | Absence overlap |
| `trg_create_default_setup` | Default user setup |

---

## QA contracts (`qa_*`)

**Rules**

- Functions in `QA/contracts/01_QA_Functions.sql`
- Return stable IDs for fixture keys documented in `QA/contracts/00_ENTITIES.md`
- Loaded by `runners/stages/fixtures.ps1` before integrity tests

**Examples**

| Function | Semantic entity |
|----------|-----------------|
| `qa_client_active_id()` | `QA_CLIENT_ACTIVE` |
| `qa_vet_primary_id()` | `QA_VET_PRIMARY` |
| `qa_registrar_emp_id()` | `QA_REGISTRAR` |

---

## Parameters, variables, records

| Kind | Prefix | Example |
|------|--------|---------|
| Parameter | `p_` | `p_email`, `p_id_emp` |
| Local variable | `v_` | `v_id_usr` |
| Record | `r_` | `r_usr` (when used) |

---

## Legacy / abandoned patterns

!!! warning "Do not use in new code"
    | Pattern | Status |
    |---------|--------|
    | `job_*` as procedure prefix | **Not used** — use `jpr_*` for cron targets |
    | `fn_login_user` / `fn_logout_user` | **Replaced** by `sp_auth_login` / `sp_auth_logout` + `svc_*` |
    | Business `sp_*` only in Schema (M1) | **Moved** to Services |

---

## Dictionary

Semantic abbreviations (`ema_usr`, `id_emp`, …) are defined in the [Data Dictionary](../../04_Data_Dictionary/00_Overview.md) and column comments under `DataBase/Comments/`.

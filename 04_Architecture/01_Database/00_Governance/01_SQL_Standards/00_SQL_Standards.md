# SQL Standards

## Objective

Formatting and file organization standards for:

```text
01_MiaCaoMigo_DataLayer/DataBase/
```

These conventions support:

- Bootstrap execution
- QA validation
- Repository consistency
- Maintainability across modules

Related documentation:

- [Naming conventions](../00_Naming_Conventions/02_SQL_Programming.md)
- [Schema build pipeline](../../00_Schema_Build_Pipeline.md)
- [Templates](../03_Templates/README.md)

---

# 1. General Formatting

## 1.1 Keywords and casing

| Element | Standard |
|---|---|
| SQL keywords | lowercase |
| Identifiers | lowercase `snake_case` |
| Indentation | 4 spaces |
| Clauses | separated when readability benefits |

Example:

```sql
create table user_account (
    id_use serial primary key,
    nam_use varchar(100) not null
);
```

---

## 1.2 Section headers

### Module header

```sql
-- =========================================================
-- MODULE 1 — USER MANAGEMENT
-- =========================================================
-- FILE: Schema/01_Module1_User_Management/00_Tables_Mod1.sql
-- PURPOSE: ...
-- LOADED BY: Bootstrap/Loaders/01_Structure.sql
-- =========================================================
```

### Object header

```sql
-- =========================================================
-- 1. user_account
-- =========================================================
```

---

# 2. Repository Structure

```text
DataBase/
├── Bootstrap/
├── Schema/
├── Comments/
├── Services/
├── DataSeed/
├── QA/
├── Queries/
└── (no SQL in repository root)
```

## Folder responsibilities

| Folder | Purpose |
|---|---|
| `Bootstrap/` | Initialization and loaders |
| `Schema/` | Core DDL and structural objects |
| `Comments/` | `COMMENT ON` definitions |
| `Services/` | Public and internal SQL APIs |
| `DataSeed/` | Master and demo data |
| `QA/` | Validation, fixtures and contracts |
| `Queries/` | Reference-only queries |

!!! note "Docker mounts"
    `docker-compose.yml` mounts initialization folders under `/docker-entrypoint-initdb.d/`.

    Only the top-level `init.sql` executes automatically.

---

# 3. Module File Order

Each module follows the same execution structure:

| Order | File | Responsibility |
|---|---|---|
| 00 | `00_Tables_ModX.sql` | Tables, PK, UNIQUE, CHECK |
| 01 | `01_ForeignKeys_ModX.sql` | Foreign keys |
| 02 | `02_Functions_ModX.sql` | Functions and trigger helpers |
| 03 | `03_Triggers_ModX.sql` | Trigger definitions |
| 04 | `04_Indexes_ModX.sql` | Indexes and exclusions |
| 05 | `05_Procedures_ModX.sql` | Procedures |
| 06 | `06_Jobs_ModX.sql` | Scheduled jobs |
| 07 | `07_Views_ModX.sql` | Read models |

## Core schema

| File | Purpose |
|---|---|
| `01_Types.sql` | ENUM definitions |
| `00_Data_Cleanup.sql` | Pre-seed cleanup |

---

# 4. Bootstrap Execution Flow

Profile:

```text
Bootstrap/Profiles/init_core.sql
```

| Step | Loader | Description |
|---|---|---|
| 1 | `00_Extensions.sql` | Extensions |
| 2 | `01_Types.sql` | ENUMs |
| 3 | `01_Structure.sql` | Tables |
| 4 | `02_ForeignKeys.sql` | Foreign keys |
| 5 | `03_Integrity.sql` | Integrity layer |
| 6 | `05_Comments.sql` | Schema comments |
| 7 | `06_Services.sql` | Services |
| 8 | `08_Service_Comments.sql` | Service comments |

---

# 5. Constraints

## Table files

Inside:

```text
00_Tables_ModX.sql
```

Constraint order:

1. Primary key
2. Unique
3. Check

## Foreign keys

Foreign keys must exist only in:

```text
01_ForeignKeys_ModX.sql
```

---

# 6. Services Layer

| Rule | Standard |
|---|---|
| Public API | `svc_*` only |
| Workflows | `sp_*` |
| Core helpers | `fn_*` |
| Technical jobs | `jpr_*` |

Core helpers belong to:

```text
Services/00_Core/
```

---

# 7. Comments Layer

- Loaded after all objects exist
- Mirrors schema structure
- Maintains independent documentation responsibility

Example:

```text
Comments/Schema/01_Module1/
```

mirrors:

```text
Schema/01_Module1_User_Management/
```

---

# 8. QA Standards

| Element | Convention |
|---|---|
| Assertions | `PASS:` / `FAIL:` |
| Contracts | `qa_*()` |
| Fixtures | `fixtures/seed/` |
| Integrity scripts | `01_Integrity/` |

QA execution is external to default Docker bootstrap.

---

# 9. Queries and Manual Scripts

| Folder | Purpose |
|---|---|
| `Queries/` | Reference queries |
| `QA/05_Manual/` | Manual execution scenarios |

Guidelines:

- Explicit columns preferred
- Avoid `select *`
- Mark deprecated queries clearly

---

# 10. Loader Standards

Loaders should include:

```sql
\set ON_ERROR_STOP on
```

And:

- progress `\echo`
- absolute Docker paths
- deterministic ordering

---

# 11. Idempotency

Prefer defensive drops before recreation:

```sql
drop trigger if exists trg_* on ...;
drop function if exists fn_*(...);
drop procedure if exists sp_*(...);
```

Especially for:

- Services
- Integrity layer
- QA reload scenarios

---

# 12. Anti-Patterns

!!! warning

    Avoid the following:

    - Foreign keys inside `00_Tables_*.sql`
    - Calling `svc_*` from triggers
    - Loading `QA/` automatically in bootstrap
    - Creating unmanaged top-level loaders
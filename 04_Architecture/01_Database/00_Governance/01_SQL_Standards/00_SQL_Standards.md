# SQL Standards

## Objective

Formatting and file organization for **`01_MiaCaoMigo_DataLayer/DataBase/`**, as loaded by Bootstrap and exercised by QA.

Complements:

- [Naming conventions](../00_Naming_Conventions/02_SQL_Programming.md)
- [Schema build pipeline](../../00_Schema_Build_Pipeline.md)
- [Templates](../03_Templates/README.md)

---

## 1. General formatting

### 1.1 Keywords and casing

- SQL keywords: **lowercase** (`create table`, not `CREATE TABLE`)
- Identifiers: **lowercase** `snake_case`
- 4-space indentation
- Major clauses and columns on separate lines where readability benefits

### 1.2 Section blocks

Use standardized comment banners. Two families are valid (see [Governance README](../README.md#header-families-both-valid)):

```sql
-- =========================================================
-- MODULE 1 — USER MANAGEMENT
-- =========================================================
-- FILE: Schema/01_Module1_User_Management/00_Tables_Mod1.sql
-- PURPOSE: ...
-- LOADED BY: Bootstrap/Loaders/01_Structure.sql
-- =========================================================
```

Per-object sections:

```sql
-- =========================================================
-- 1. user_account
-- =========================================================
```

---

## 2. Repository layout (DataLayer)

```text
DataBase/
├── Bootstrap/          # init.sql, Profiles/, Loaders/, entrypoints/
├── Schema/             # DDL per module (00_Core + 01..04_Module*)
├── Comments/           # COMMENT ON (Schema + Services mirrors)
├── Services/           # sp_*, svc_*, fn_* (application layer)
├── DataSeed/           # 00_MasterData, 03_DemoData
├── QA/                 # contracts, fixtures, 01_Integrity, 04_Stress, 05_Manual
├── Queries/            # reference SELECTs (not loaded by init)
└── (no SQL in repo root)
```

!!! note "Docker mounts"
    `docker-compose.yml` mounts Bootstrap, Schema, Comments, Services, DataSeed under `/docker-entrypoint-initdb.d/`. Only **top-level** `init.sql` runs automatically; loaders `\i` the rest.

---

## 3. Per-module Schema files

Each module folder (e.g. `Schema/01_Module1_User_Management/`) uses:

| Order | File | Role |
|------:|------|------|
| 00 | `00_Tables_ModX.sql` | `CREATE TABLE`, PK, UNIQUE, CHECK — **no FK** |
| 01 | `01_ForeignKeys_ModX.sql` | `ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY` |
| 02 | `02_Functions_ModX.sql` | Functions (incl. trigger helpers) |
| 03 | `03_Triggers_ModX.sql` | `trg_*` triggers |
| 04 | `04_Indexes_ModX.sql` | Indexes + exclusion constraints |
| 05 | `05_Procedures_ModX.sql` | `sp_*` domain / `jpr_*` technical |
| 06 | `06_Jobs_ModX.sql` | `cron.schedule` → `call jpr_*()` |
| 07 | `07_Views_ModX.sql` | `vw_*` read models (where present) |

`Schema/00_Core/`: `01_Types.sql`, `00_Data_Cleanup.sql` (TRUNCATE before MasterData reload).

**Queries** under `DataBase/Queries/` are reference-only unless explicitly wired into a profile.

---

## 4. Bootstrap execution order (`init_core`)

Loaded via `Bootstrap/Profiles/init_core.sql`:

| Step | Loader | Content |
|------|--------|---------|
| 1 | `00_Extensions.sql` | pg_cron, btree_gist |
| 2 | `Schema/00_Core/01_Types.sql` | ENUMs |
| 3 | `01_Structure.sql` | All `00_Tables_Mod*` |
| 4 | `02_ForeignKeys.sql` | All `01_ForeignKeys_Mod*` |
| 5 | `03_Integrity.sql` | Functions → triggers → indexes → procedures → jobs → views |
| 6 | `05_Comments.sql` | `Comments/Schema/` |
| 7 | `06_Services.sql` | `Services/` (deterministic order) |
| 8 | `08_Service_Comments.sql` | `Comments/Services/` |

**Profiles** add data + sanity:

| Loader | When |
|--------|------|
| `11_MasterData.sql` | `init_demo`, `init_qa` |
| `12_DemoData.sql` | `init_demo` only |
| `07_Sanity_Check.sql` | After data tiers |

QA entry: `entrypoints/init_qa_entry.sql` mounted as `init.sql` in `docker-compose.qa.yml`.

---

## 5. Constraints

### Inside `00_Tables_ModX.sql`

Order when applicable: primary key → unique → check.

### Foreign keys

**Only** in `01_ForeignKeys_ModX.sql`, after all module tables exist.

---

## 6. Services layer standards

| Rule | Detail |
|------|--------|
| Public API | Only `svc_*` in `99_Public_API` |
| M1 workflows | `sp_*` under `Services/01_Module1/` subfolders |
| M2–M4 | Domain `sp_*` in Schema; thin `svc_*` in `99_Public_API.sql` |
| Core helpers | `Services/00_Core/` — `fn_normalize_*` loaded first in `06_Services.sql` |

See `DataBase/Services/README.md` in DataLayer for the delegation map.

---

## 7. Comments layer

- Loaded after DDL + Services objects exist
- Mirror paths: `Comments/Schema/01_Module1/` ↔ `Schema/01_Module1_User_Management/`
- Skipped at bootstrap: placeholders listed in `DataBase/Comments/README.md`

---

## 8. QA standards (host execution)

| Element | Convention |
|---------|------------|
| Orchestration | `QA/runners/ci.ps1` or `qa.sh` |
| Assertions | `raise notice 'PASS:'` / `'FAIL:'` in `DO $$` blocks |
| Contracts | `qa_*()` in `contracts/01_QA_Functions.sql` |
| Fixtures | `fixtures/seed/m*.sql`, resets in `fixtures/reset/` |
| Integrity | 21 scripts — `01_Integrity/**` (hard-coded in `stages/integrity.ps1`) |

QA SQL is **not** part of default Docker init.

---

## 9. Query and manual scripts

| Folder | Standard |
|--------|----------|
| `Queries/` | `QUERIES —` header; explicit columns; deprecation banner when `svc_*` replaces ad-hoc SQL |
| `QA/05_Manual/` | `QUERIES —` or reference scenarios; run manually |

---

## 10. Loader scripts

Bootstrap loaders use:

- `\set ON_ERROR_STOP on` in profiles / critical paths
- `\echo` progress markers
- Absolute paths: `/docker-entrypoint-initdb.d/...`

---

## 11. Idempotency

Prefer:

```sql
drop trigger if exists trg_* on ...;
drop function if exists fn_*(...);
drop procedure if exists sp_*(...);
```

before `create or replace`, especially in Services and integrity layers.

---

## 12. What not to do

!!! warning
    - Do not add FKs inside `00_Tables_*.sql`
    - Do not call `svc_*` from triggers (keep triggers thin)
    - Do not load `QA/` or `Queries/` from Bootstrap without an explicit profile decision
    - Do not introduce new top-level loaders without updating `init_core` and this document

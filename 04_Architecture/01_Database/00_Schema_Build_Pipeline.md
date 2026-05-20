# Schema build pipeline (SQL)

## Purpose

This document describes how the PostgreSQL schema is **loaded in order** for MiaCaoMigo. It complements `01_MiaCaoMigo_DataLayer/DataBase/Bootstrap/Profiles/init_core.sql` and `DataBase/Bootstrap/Loaders/`.

---

## Orchestration (`init_core.sql`)

Execution order (via `Bootstrap/Loaders/`):

1. **`00_Extensions.sql`** — required extensions (e.g. pg_cron, btree_gist).
2. **`Schema/00_Core/01_Types.sql`** — ENUM and domain types.
3. **`01_Structure.sql`** — **tables only**: all `00_Tables_ModX.sql` files (Modules 1–4).
4. **`02_ForeignKeys.sql`** — **foreign keys only**: all `01_ForeignKeys_ModX.sql` files, in module order.
5. **`03_Integrity.sql`** — **behavioral layer**, in this order per module:
   - `02_Functions_ModX.sql`
   - `03_Triggers_ModX.sql`
   - `04_Indexes_ModX.sql` (including exclusion constraints that use `ALTER TABLE … ADD CONSTRAINT`)
   - `05_Procedures_ModX.sql`
   - `06_Jobs_ModX.sql`
   - `07_Views_ModX.sql` (where present)
6. **`04_Data_Migration.sql`** — ETL placeholder / tier documentation.
7. **`05_Comments.sql`** — `COMMENT ON` schema objects (`DataBase/Comments/Schema/`).
8. **`06_Services.sql`** — application PL/pgSQL (`DataBase/Services/`).
9. **`08_Service_Comments.sql`** — `COMMENT ON` service functions (`DataBase/Comments/Services/`).

Data tiers and sanity are composed by **profiles** (`init_demo`, `init_test`, etc.): see `DataBase/Bootstrap/README.md`.

Reference queries under `DataBase/Queries/` are **not** loaded by default (see each module `MANIFEST.txt`).

---

## Per-module file layout

Each module under `Schema/<ModuleName>/` (e.g. `01_Module1_User_Management/`) follows:

| Order | File | Role |
|------:|------|------|
| 00 | `00_Tables_ModX.sql` | `CREATE TABLE`, PK, UNIQUE, CHECK only (no FK). |
| 01 | `01_ForeignKeys_ModX.sql` | `ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY`. |
| 02 | `02_Functions_ModX.sql` | Functions (including trigger helpers). |
| 03 | `03_Triggers_ModX.sql` | Triggers. |
| 04 | `04_Indexes_ModX.sql` | Indexes and exclusion constraints. |
| 05 | `05_Procedures_ModX.sql` | Procedures. |
| 06 | `06_Jobs_ModX.sql` | pg_cron / scheduled definitions. |
| 07 | `07_Views_ModX.sql` | Views (Module 3). |

Module 4 may include additional non-loader artifacts (e.g. `07_Tests_Mod4.sql`) for ad-hoc validation; those are **not** invoked by `init_core` unless explicitly wired in.

---

## Rationale: foreign keys in a dedicated phase

- **Predictable init**: all relations exist before any FK is declared, reducing ordering puzzles and circular `CREATE TABLE` dependencies.
- **Clear ownership**: each module’s `01_ForeignKeys_ModX.sql` lists every outgoing FK from that module’s tables.
- **Automation-friendly**: CI/docs can diff or validate the FK layer independently of table DDL.

---

## Legacy note

The former aggregate `00_Core/99_ForeignKeys.sql` has been **removed**. Valid fragments were **moved** into the owning module’s `01_ForeignKeys_ModX.sql` (e.g. deferred `product` links in Module 3, `appointment` → `animal` in Module 4).

The historical `01_DB/` tree was consolidated into `01_MiaCaoMigo_DataLayer/DataBase/`.

---

## Commercial module: purchase FK names

To avoid duplicate **constraint names** in the global schema (`fk_client` was required on `appointment` in Module 4), purchase-side links in Module 3 use:

- `fk_purchase_client`
- `fk_purchase_employee`

Semantics match the previous `purchase` table FKs; only the identifiers were disambiguated.

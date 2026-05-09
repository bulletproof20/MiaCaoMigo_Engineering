# Schema build pipeline (SQL)

## Purpose

This document describes how the PostgreSQL schema is **loaded in order** for MiaCaoMigo. It complements `01_DB/Schema/init.sql` and the contents of `03_Loaders/`.

---

## Orchestration (`init.sql`)

Execution order:

1. **`03_Loaders/00_Extensions.sql`** — required extensions (e.g. GiST helpers).
2. **`03_Loaders/01_Structure.sql`** — **tables only**: all `00_Tables_ModX.sql` files (Modules 1–4).
3. **`03_Loaders/02_ForeignKeys.sql`** — **foreign keys only**: all `01_ForeignKeys_ModX.sql` files, in module order.
4. **`03_Loaders/03_Integrity.sql`** — **behavioral layer**, in this order per module:
   - `02_Functions_ModX.sql`
   - `03_Triggers_ModX.sql`
   - `04_Indexes_ModX.sql` (including exclusion constraints that use `ALTER TABLE … ADD CONSTRAINT`)
   - `05_Procedures_ModX.sql`
   - `06_Jobs_ModX.sql`
5. **`03_Loaders/04_Data_Migration.sql`** — seed / reference data (when enabled).
6. **`03_Loaders/05_Comments.sql`** — `COMMENT ON` metadata.
7. **`03_Loaders/06_Queries.sql`** — optional packaged queries.
8. **`03_Loaders/07_Sanity_Check.sql`** — post-init checks.

---

## Per-module file layout

Each module under `01_Modules/<ModuleName>/` follows:

| Order | File | Role |
|------:|------|------|
| 00 | `00_Tables_ModX.sql` | `CREATE TABLE`, PK, UNIQUE, CHECK only (no FK). |
| 01 | `01_ForeignKeys_ModX.sql` | `ALTER TABLE … ADD CONSTRAINT … FOREIGN KEY`. |
| 02 | `02_Functions_ModX.sql` | Functions (including trigger helpers). |
| 03 | `03_Triggers_ModX.sql` | Triggers. |
| 04 | `04_Indexes_ModX.sql` | Indexes and exclusion constraints. |
| 05 | `05_Procedures_ModX.sql` | Procedures. |
| 06 | `06_Jobs_ModX.sql` | pg_cron / scheduled definitions. |

Module 4 may include additional non-loader artifacts (e.g. `07_Tests_Mod4.sql`) for ad-hoc validation; those are **not** invoked by `init.sql` unless explicitly wired in.

---

## Rationale: foreign keys in a dedicated phase

- **Predictable init**: all relations exist before any FK is declared, reducing ordering puzzles and circular `CREATE TABLE` dependencies.
- **Clear ownership**: each module’s `01_ForeignKeys_ModX.sql` lists every outgoing FK from that module’s tables.
- **Automation-friendly**: CI/docs can diff or validate the FK layer independently of table DDL.

---

## Legacy note

The former `00_Core/99_ForeignKeys.sql` aggregate has been **removed**. Its valid fragments were **moved** into the owning module’s `01_ForeignKeys_ModX.sql` (e.g. deferred `product` links in Module 3, `appointment` → `animal` in Module 4).

---

## Commercial module: purchase FK names

To avoid duplicate **constraint names** in the global schema (`fk_client` was required on `appointment` in Module 4), purchase-side links in Module 3 use:

- `fk_purchase_client`
- `fk_purchase_employee`

Semantics match the previous `purchase` table FKs; only the identifiers were disambiguated.

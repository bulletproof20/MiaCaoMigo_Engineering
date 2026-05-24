# Schema build pipeline (SQL)

!!! info "Navigation"
    [Database hub](README.md) · [Governance](00_Governance/README.md) · [SQL standards](00_Governance/01_SQL_Standards/00_SQL_Standards.md)

## Purpose

How the PostgreSQL schema is **loaded in order** for MiaCaoMigo — mirrors `DataBase/Bootstrap/Profiles/init_core.sql` and `DataBase/Bootstrap/Loaders/`.

---

## Orchestration (`init_core`)

| Step | Loader / script | Content |
|------|-----------------|--------|
| 1 | `00_Extensions.sql` | pg_cron, btree_gist |
| 2 | `Schema/00_Core/01_Types.sql` | ENUM / domain types |
| 3 | `01_Structure.sql` | All `00_Tables_ModX.sql` (modules 1–4) |
| 4 | `02_ForeignKeys.sql` | All `01_ForeignKeys_ModX.sql` |
| 5 | `03_Integrity.sql` | Per module: functions → triggers → indexes → procedures → jobs → views |
| 6 | `05_Comments.sql` | `DataBase/Comments/Schema/` |
| 7 | `06_Services.sql` | `DataBase/Services/` |
| 8 | `08_Service_Comments.sql` | `DataBase/Comments/Services/` |

**Profiles** compose data + sanity on top of `init_core`:

| Profile | Additional loaders |
|---------|-------------------|
| `init_demo` | `11_MasterData` → `12_DemoData` → `07_Sanity_Check` |
| `init_qa` | `11_MasterData` → `07_Sanity_Check` (no Demo) |

- Default Docker: `Bootstrap/init.sql` → `init_demo`
- CI Docker: `entrypoints/init_qa_entry.sql` mounted as `init.sql` (`docker-compose.qa.yml`)

`DataBase/Queries/` and `DataBase/QA/` are **not** loaded by bootstrap.

---

## Per-module file layout

Each `Schema/<ModuleName>/` folder:

| Order | File | Role |
|------:|------|------|
| 00 | `00_Tables_ModX.sql` | `CREATE TABLE`, PK, UNIQUE, CHECK — **no FK** |
| 01 | `01_ForeignKeys_ModX.sql` | `ALTER TABLE … FOREIGN KEY` |
| 02 | `02_Functions_ModX.sql` | Functions (incl. trigger helpers) |
| 03 | `03_Triggers_ModX.sql` | `trg_*` |
| 04 | `04_Indexes_ModX.sql` | Indexes + EXCLUDE |
| 05 | `05_Procedures_ModX.sql` | `sp_*` / `jpr_*` |
| 06 | `06_Jobs_ModX.sql` | pg_cron (M2/M3 placeholders skipped in loader) |
| 07 | `07_Views_ModX.sql` | `vw_*` where present |

---

## Rationale: foreign keys in a dedicated phase

- All tables exist before FK declarations
- Cross-module dependencies documented per module FK file
- CI and docs can validate FK layer independently

---

## Module 3 purchase FK names

To avoid duplicate constraint names globally:

- `fk_purchase_client`
- `fk_purchase_employee`

(Semantics unchanged; identifiers disambiguated from Module 4 `appointment` links.)

---

## Legacy notes

| Item | Status |
|------|--------|
| `00_Core/99_ForeignKeys.sql` | **Removed** — FKs moved to module `01_ForeignKeys_ModX.sql` |
| `04_Data_Migration.sql` loader | **Not present** — no ETL tier in current bootstrap |
| Historical `01_DB/` tree | Consolidated into `01_MiaCaoMigo_DataLayer/DataBase/` |

---

## QA (host, after init)

```powershell
cd DataBase/QA/runners
.\ci.ps1
```

Validates bootstrap contract, fixtures, and 21 integrity scripts against `init_qa` — see [Governance — QA](00_Governance/README.md#qa--ci-active).

# Database templates (`00_Governance/03_Templates`)

Reusable **skeletons** for artefacts in `01_MiaCaoMigo_DataLayer/DataBase/`. They mirror code already in the repo — **no new architecture**.

---

## Separation of concerns

| Location | Responsibility |
|----------|----------------|
| [Naming conventions](../00_Naming_Conventions/) | `pk_`, `fk_`, `fn_`, `sp_`, `svc_`, `qa_`, `jpr_`, `trg_` |
| [SQL standards](../01_SQL_Standards/00_SQL_Standards.md) | Layout, loader order, layers |
| **`03_Templates/`** (here) | Headers, sections, object shapes |

Placeholders: `{{OBJECT_NAME}}`, `{{FILE_PATH}}` — replace per [Naming](../00_Naming_Conventions/02_SQL_Programming.md).

---

## Layout

```text
03_Templates/
├── 00_Meta/          file headers + section blocks
├── 01_Schema/        DDL / integrity objects
├── 02_Services/      workflows + public API
├── 03_Comments/      COMMENT ON
├── 04_Bootstrap/     init, profile, loader
├── 05_DataSeed/      master + demo inserts
└── 06_QA/            integrity, stress, fixture, contract, manual
```

---

## Quick picker

| You are adding… | Start from |
|-----------------|------------|
| Module table file | `01_Schema/table.tpl` + `00_Meta/sql_file_header_schema.tpl` |
| FK layer | `01_Schema/foreign_key.tpl` |
| Trigger + function | `trigger_function.tpl` + `trigger.tpl` |
| Domain procedure (M2–M4) | `01_Schema/procedure.tpl` |
| M1 workflow | `02_Services/workflow_function.tpl` |
| M1 public API file | `public_api_folder_header.tpl` + delegate templates |
| M2–M4 public API | `public_api_module_bundle.tpl` + read/delegate templates |
| Bootstrap loader | `04_Bootstrap/loader_orchestrator.tpl` |
| Integrity test | `06_QA/integrity_test.tpl` |
| QA fixture seed | `06_QA/fixture_data.tpl` |
| Demo seed | `05_DataSeed/demo_narrative_insert.tpl` |

---

## Template → DataLayer path

| Folder | Target |
|--------|--------|
| `01_Schema/` | `DataBase/Schema/<Module>/0N_*.sql` |
| `02_Services/` | `DataBase/Services/` |
| `03_Comments/` | `DataBase/Comments/Schema\|Services/` |
| `04_Bootstrap/` | `DataBase/Bootstrap/Loaders/`, `Profiles/` |
| `05_DataSeed/` | `DataBase/DataSeed/` |
| `06_QA/` | `DataBase/QA/` |

---

## QA runner alignment (documentation headers)

When writing QA file headers, reference **current** runners:

| Template field | Live value |
|----------------|------------|
| Load / run | `QA/runners/ci.ps1` or `stages/fixtures.ps1` |
| M3 stress seed | `fixtures/seed/m3_stress_commercial.sql` |
| Not used | `04_Stress/00_Setup/` (legacy), `run_ci.ps1`, `run_full_qa.ps1` |

Pipeline: [Schema build pipeline](../../00_Schema_Build_Pipeline.md) · [Governance README](../README.md)

---

## Header variants (both valid)

| Family | Used in |
|--------|---------|
| Schema — `DESCRIPTION` + `LOAD ORDER` | Most `Schema/*` |
| Schema — `PURPOSE` + `LOADED BY` | Some core/table files |
| Services — `PURPOSE` + `DEPENDENCIES` + `LOADED BY` | M1 workflows |
| Short — `BUSINESS WORKFLOW: sp_*` | Small Services files |
| QA — `TYPE`, `REQUIRES`, `RULE`, `CONTRACT` | `01_Integrity`, `04_Stress` |
| Comments — `comments: Schema — Module N` | Pilot: M1 table comments |

Match neighbouring files in the same directory.

---

## Usage

1. Copy the closest `.tpl`.
2. Replace `{{...}}` and remove `[optional]` blocks.
3. Save under the matching `DataBase/` path.
4. Run `ci.ps1` if QA or bootstrap-touching.

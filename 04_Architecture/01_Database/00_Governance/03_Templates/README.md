# Database templates (`00_Governance/03_Templates`)

Reusable **skeletons and boilerplates** for artefacts in `01_MiaCaoMigo_DataLayer/DataBase/`.

Consolidates patterns already used in the project — it does **not** introduce a new architecture.

---

## Separation of concerns

| Location | Responsibility |
|----------|----------------|
| [`../00_Naming_Conventions/`](../00_Naming_Conventions/) | Semantic naming and object identifiers |
| [`../01_SQL_Standards/`](../01_SQL_Standards/00_SQL_Standards.md) | SQL formatting, module file layout, execution order |
| **`03_Templates/`** (here) | Reusable structure: headers, sections, object shapes |

Templates use **neutral placeholders** (`{{OBJECT_NAME}}`, `{{FILE_PATH}}`). Resolve names via Naming Conventions; validate style via SQL Standards.

---

## Layout (generated)

```text
03_Templates/
├── README.md
├── 00_Meta/          (5)  file headers + section blocks
├── 01_Schema/        (10) DDL / integrity objects
├── 02_Services/      (11) workflows + public API shapes
├── 03_Comments/      (1)  COMMENT ON
├── 04_Bootstrap/     (3)  init, profile, loader
├── 05_DataSeed/      (2)  master + demo inserts
└── 06_QA/            (5)  integrity, stress, fixture, contract, manual
```

## Quick picker

| You are adding… | Start from |
|-----------------|------------|
| New module table file | `01_Schema/table.tpl` + `sql_file_header_schema.tpl` |
| FK layer block | `01_Schema/foreign_key.tpl` |
| Trigger + function | `trigger_function.tpl` + `trigger.tpl` |
| Schema workflow | `01_Schema/procedure.tpl` |
| Read model | `01_Schema/view.tpl` |
| M1 service workflow | `workflow_function.tpl` or `workflow_procedure.tpl` |
| M1 public API file | `public_api_folder_header.tpl` + delegate templates |
| M2–M4 public API file | `public_api_module_bundle.tpl` + delegate/read templates |
| Bootstrap loader step | `04_Bootstrap/loader_orchestrator.tpl` |
| QA rule check | `06_QA/integrity_test.tpl` |
| Demo seed script | `05_DataSeed/demo_narrative_insert.tpl` |

## Usage

1. Copy the closest `.tpl` file.
2. Replace `{{...}}` placeholders.
3. Remove optional blocks marked `[optional]`.
4. Place the result under the matching `DataBase/` path (see mapping below).

## Template → DataLayer

| Folder | Target |
|--------|--------|
| `01_Schema/` | `DataBase/Schema/<Module>/0N_*.sql`, `Schema/00_Core/` |
| `02_Services/` | `DataBase/Services/` |
| `03_Comments/` | `DataBase/Comments/Schema|Services/` |
| `04_Bootstrap/` | `DataBase/Bootstrap/Loaders/`, `Profiles/` |
| `05_DataSeed/` | `DataBase/DataSeed/00_MasterData/`, `03_DemoData/` |
| `06_QA/` | `DataBase/QA/` |

Pipeline: [`../../00_Schema_Build_Pipeline.md`](../../00_Schema_Build_Pipeline.md).

## Header variants

The project uses **two stable header families** (both valid):

- **Schema integrity** — `MODULE`, `FILE`, `DESCRIPTION`, `LOAD ORDER` (see `01_Schema/*` samples).
- **Services / domain** — `PURPOSE`, `DEPENDENCIES`, `LOADED BY` (Module 1).
- **Short workflow** — title + `BUSINESS WORKFLOW` line (small Services files).
- **QA / Seed / Bootstrap** — dedicated templates in `05_DataSeed`, `06_QA`, `04_Bootstrap`.

Pick the header variant that matches neighbouring files in the same folder.

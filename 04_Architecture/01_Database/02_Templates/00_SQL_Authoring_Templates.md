# SQL Authoring Templates

## Overview

This directory defines the official SQL authoring templates adopted within the **MiaCaoMigo** database system.

The template architecture provides reusable structural patterns responsible for preserving:

- repository readability;
- deterministic SQL organization;
- standardized documentation structure;
- semantic procedural readability;
- maintainable SQL formatting;
- visual consistency across all modules.

Templates define the canonical authoring structure for SQL repository artifacts and must remain aligned with the official governance and SQL standards architecture.

> All repository implementations must preserve the readability and structural standards defined by these templates.

---

# Template Philosophy

The template architecture adopts a deterministic SQL authoring philosophy where repository artifacts preserve a consistent structural and visual organization.

Templates are designed to prioritize:

- semantic clarity;
- procedural readability;
- deterministic section organization;
- maintainable SQL structure;
- repository consistency;
- architectural alignment.

Templates standardize how SQL logic is documented, structured, and visually organized across the entire repository.

---

# Separation of Responsibilities

| Layer | Responsibility |
|---|---|
| Naming Conventions | Semantic naming standards |
| SQL Standards | Formatting and repository organization |
| SQL Authoring Templates | Structural readability and authoring patterns |

Templates implement the readability and structural standards defined within the governance architecture.

---

# Template Repository Structure

```text
03_Templates/
├── 00_Meta/
├── 01_Schema/
├── 02_Services/
├── 03_Comments/
├── 04_Bootstrap/
├── 05_DataSeed/
└── 06_QA/
```

---

# Template Layer Responsibilities

| Folder | Responsibility |
|---|---|
| `00_Meta/` | Structural headers and reusable readability blocks |
| `01_Schema/` | Declarative SQL and structural object templates |
| `02_Services/` | Procedural workflow and service templates |
| `03_Comments/` | Documentation and `COMMENT ON` templates |
| `04_Bootstrap/` | Initialization and orchestration templates |
| `05_DataSeed/` | Master and demonstration data templates |
| `06_QA/` | Validation, fixture, and QA templates |

---

# Structural Readability Standards

Templates standardize the visual organization of:

- SQL file headers;
- procedural object sections;
- workflow descriptions;
- execution flow blocks;
- validation sections;
- operational intent documentation;
- expected result sections;
- repository layer organization.

The objective is to ensure that repository artifacts remain:

- predictable;
- semantically explicit;
- visually consistent;
- operationally readable.

---

# Structural Authoring Patterns

The template architecture defines standardized patterns for:

| Pattern | Responsibility |
|---|---|
| File Headers | Repository metadata and execution context |
| Object Blocks | Procedural readability and object isolation |
| Workflow Sections | Operational flow clarity |
| Validation Sections | QA and integrity readability |
| Bootstrap Sections | Initialization orchestration clarity |
| Documentation Blocks | Semantic repository documentation |

---

# Repository Alignment

| Template Layer | Repository Target |
|---|---|
| `01_Schema/` | `DataBase/Schema/` |
| `02_Services/` | `DataBase/Services/` |
| `03_Comments/` | `DataBase/Comments/` |
| `04_Bootstrap/` | `DataBase/Bootstrap/` |
| `05_DataSeed/` | `DataBase/DataSeed/` |
| `06_QA/` | `DataBase/QA/` |

---

# Header Standardization

Multiple standardized header structures are supported depending on repository layer responsibilities.

| Header Family | Typical Usage |
|---|---|
| Schema Headers | Structural SQL files |
| Services Headers | Procedural workflows |
| QA Headers | Validation and regression scripts |
| Comments Headers | Documentation layers |

Neighbouring files within the same repository layer should preserve the same header structure whenever technically feasible.

---

# Placeholder Standardization

Templates may define deterministic placeholder structures for reusable repository authoring patterns.

Placeholder identifiers should remain:

- semantically explicit;
- structurally deterministic;
- visually distinguishable;
- repository-consistent.

---

# Template Standardization Principles

Templates must preserve:

- deterministic formatting;
- semantic readability;
- structural consistency;
- maintainable SQL organization;
- isolated repository responsibilities;
- architectural consistency across all modules.

All templates must remain aligned with the official governance and SQL standards architecture.

---

# Architectural Consistency

Modules 1, 2, 3, and 4 must preserve:

- identical readability philosophy;
- identical structural authoring standards;
- identical header organization;
- identical visual formatting patterns;
- identical documentation structures.

There are no module-specific template exceptions.

---

# Design Principles

The adopted template architecture intentionally prioritizes:

- repository readability;
- deterministic SQL authoring;
- semantic procedural clarity;
- maintainability across all modules;
- structural consistency;
- visual standardization;
- long-term repository scalability.

---

# Final Statement

SQL authoring templates are considered a core repository standardization mechanism of the **MiaCaoMigo** database system.

All repository implementations must preserve the structural, readability, and authoring standards defined by this template architecture.
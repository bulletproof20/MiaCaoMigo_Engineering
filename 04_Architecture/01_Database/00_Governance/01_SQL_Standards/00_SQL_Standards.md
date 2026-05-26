# SQL Standards

## Overview

This document defines the official SQL development standards adopted within the **MiaCaoMigo** database system.

These standards establish a consistent approach for:

- repository organization;
- SQL formatting;
- module execution order;
- bootstrap orchestration;
- integrity management;
- QA validation;
- maintainability across all modules.

The objective is to ensure:

- architectural consistency;
- predictable execution flow;
- repository readability;
- deterministic database builds;
- long-term maintainability.

> These standards are mandatory for all database modules and contributors.

---

# Related Documentation

| Document | Responsibility |
|---|---|
| Naming Conventions | Procedural naming philosophy |
| Schema Objects Naming | Structural object naming |
| Schema Build Pipeline | Bootstrap execution architecture |
| Integrity Architecture | Integrity layering and validation boundaries |

---

# Global Architectural Consistency

All modules must preserve the same structural and execution philosophy.

Modules 1, 2, 3, and 4 must maintain:

- identical execution ordering;
- identical repository organization;
- identical formatting standards;
- identical loader architecture;
- identical naming philosophy;
- identical integrity layering strategy.

There are no module-specific structural exceptions.

---

# General Formatting Standards

## SQL Formatting Rules

| Element | Standard |
|---|---|
| SQL Keywords | lowercase |
| Identifiers | lowercase `snake_case` |
| Indentation | 4 spaces |
| Clauses | separated when readability benefits |

---

## Section Header Standards

### Module Header Structure

```sql
-- =========================================================
-- MODULE <module_number> — <module_name>
-- =========================================================
-- FILE: <file_path>
-- PURPOSE: <context>
-- LOADED BY: <loader_path>
-- =========================================================
```

---

### Object Header Structure

```sql
-- =========================================================
-- <object_number>. <object_name>
-- =========================================================
```

---

# Template Standardization

All SQL files, comments, procedural sections, loaders, and repository structures must follow the official SQL template standards adopted by the MiaCaoMigo database system.

Templates are responsible for preserving:

- repository readability;
- structural consistency;
- deterministic section organization;
- standardized documentation headers;
- maintainable SQL formatting;
- visual consistency across all modules.

Template standards define the canonical formatting and readability structure for:

- schema files;
- procedural workflows;
- triggers;
- services;
- bootstrap loaders;
- comments;
- QA validation scripts.

All contributors must preserve the same template philosophy and readability standards across the entire repository.

> Official template repository location:  
> `<template_repository_path>`

---

# Repository Structure

## Root Structure

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

---

## Folder Responsibilities

| Folder | Responsibility |
|---|---|
| `Bootstrap/` | Initialization and execution loaders |
| `Schema/` | Core DDL and structural objects |
| `Comments/` | `COMMENT ON` documentation |
| `Services/` | Public and internal SQL APIs |
| `DataSeed/` | Master and demonstration data |
| `QA/` | Validation, fixtures, and contracts |
| `Queries/` | Reference-only queries |

---

## Docker Initialization Rule

Docker initialization folders must:

- mount under `/docker-entrypoint-initdb.d/`;
- preserve deterministic execution ordering;
- expose only the top-level initialization entry point.

---

# Module File Structure

Each module must preserve the same execution order.

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

---

# Core Schema Structure

| File | Responsibility |
|---|---|
| `01_Types.sql` | ENUM definitions |
| `00_Data_Cleanup.sql` | Pre-seed cleanup |

---

# Bootstrap Execution Flow

## Initialization Profile

```text
Bootstrap/Profiles/init_core.sql
```

---

## Execution Order

| Step | Loader | Responsibility |
|---|---|---|
| 1 | `00_Extensions.sql` | Extensions |
| 2 | `01_Types.sql` | ENUM definitions |
| 3 | `01_Structure.sql` | Structural objects |
| 4 | `02_ForeignKeys.sql` | Relational dependencies |
| 5 | `03_Integrity.sql` | Integrity layer |
| 6 | `05_Comments.sql` | Schema documentation |
| 7 | `06_Services.sql` | Services layer |
| 8 | `08_Service_Comments.sql` | Service documentation |

---

# Constraint Standards

## Table Constraint Order

Inside:

```text
00_Tables_ModX.sql
```

constraints must follow this order:

1. Primary key
2. Unique
3. Check

---

## Foreign Key Isolation Rule

Foreign keys must exist exclusively inside:

```text
01_ForeignKeys_ModX.sql
```

---

# Services Layer Standards

## Architectural Rules

| Layer | Prefix |
|---|---|
| Public API | `svc_*` |
| Business Workflows | `sp_*` |
| Internal Helpers | `fn_*` |
| Technical Jobs | `jpr_*` |

---

## Core Helpers Structure

Core reusable helper logic must remain inside:

```text
Services/00_Core/
```

---

# Comments Layer Standards

## Responsibilities

The comments layer must:

- load only after all objects exist;
- mirror schema structure;
- preserve isolated documentation responsibility.

---

## Structural Mirroring Rule

```text
Comments/Schema/<module_context>/
```

must mirror:

```text
Schema/<module_context>/
```

---

# QA Standards

## QA Naming Rules

| Element | Convention |
|---|---|
| Assertions | `PASS:` / `FAIL:` |
| Contracts | `qa_*()` |
| Fixtures | `fixtures/seed/` |
| Integrity Scripts | `01_Integrity/` |

---

## QA Isolation Rule

QA execution must remain external to the default Docker bootstrap process.

---

# Queries and Manual Scripts

## Repository Responsibilities

| Folder | Responsibility |
|---|---|
| `Queries/` | Reference queries |
| `QA/05_Manual/` | Manual execution scenarios |

---

## Query Standards

Queries should:

- prefer explicit column selection;
- avoid `select *`;
- clearly identify deprecated logic.

---

# Loader Standards

## Loader Requirements

All loaders must include:

```sql
\set ON_ERROR_STOP on
```

---

## Loader Responsibilities

Loaders must preserve:

- progress visibility through `\echo`;
- absolute Docker paths;
- deterministic execution ordering.

---

# Idempotency Standards

## Defensive Recreation Strategy

Database objects should prefer defensive drops before recreation.

---

## Structure

```sql
drop trigger if exists trg_<context> on <table>;

drop function if exists fn_<context>(...);

drop procedure if exists sp_<context>(...);
```

---

## Recommended Usage

Defensive recreation is especially recommended for:

- services;
- integrity layers;
- QA reload scenarios.

---

# Anti-Patterns

The following practices are prohibited:

- foreign keys inside `00_Tables_*.sql`;
- calling `svc_*` objects from triggers;
- automatically loading `QA/` during bootstrap;
- unmanaged top-level loaders;
- inconsistent execution ordering;
- module-specific structural exceptions.

---

# Dictionary Standardization

All repository structures, prefixes, execution layers, and architectural patterns must be formally documented within the system dictionary and architecture documentation.

The documentation is responsible for defining:

- structural responsibilities;
- execution ordering;
- naming standards;
- layer isolation rules;
- repository organization principles.

---

# Design Principles

The adopted standards intentionally prioritize:

- architectural consistency;
- deterministic execution;
- repository readability;
- maintainability across all modules;
- relational integrity;
- procedural clarity;
- long-term scalability.

---

# Final Statement

Consistency across the entire SQL architecture is considered a core system requirement.

All standards defined in this documentation must be preserved across:

- all modules;
- all services;
- all integrity layers;
- all bootstrap processes;
- all future system extensions.
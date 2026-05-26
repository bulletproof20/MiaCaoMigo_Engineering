# SQL Programming Naming Conventions

## Overview

This document defines the official naming conventions adopted for procedural SQL development within the **MiaCaoMigo** database system.

The convention standardizes the naming of:

- functions;
- procedures;
- triggers;
- scheduled jobs;
- public APIs;
- QA contracts;
- procedural variables and records.

The primary goals are:

- semantic consistency;
- procedural readability;
- architectural predictability;
- maintainability across all modules;
- standardized SQL programming practices.

> These conventions are mandatory for all database modules and contributors.

---

# Global Architectural Consistency

All modules must follow the exact same procedural naming philosophy and architectural organization.

There are no module-specific naming exceptions.

Modules 1, 2, 3, and 4 must preserve:

- identical prefix semantics;
- identical structural organization;
- identical procedural classification rules;
- identical API exposure philosophy;
- identical naming consistency standards.

---

# Prefix Architecture Overview

| Prefix | Layer | Application Callable |
|---|---|---|
| `svc_*` | Public API | Yes |
| `sp_*` | Business workflow | No |
| `fn_*` | Internal helper / utility | No |
| `jpr_*` | Scheduled job procedure | No |
| `trg_*` | Trigger | No |
| `qa_*` | QA contract lookup | No |
| `vw_*` | Read model (view) | No |

---

# Services Layer

Business-facing operations must be exposed through the `svc_*` public API layer.

Internal workflows must remain encapsulated through:

- `sp_*` business workflows;
- `fn_*` internal helper functions;
- `vw_*` read models;
- controlled relational operations.

---

# Schema Responsibilities

Schema modules are responsible for maintaining:

- procedural definitions;
- triggers;
- scheduled jobs;
- read models;
- integrity rules;
- relational consistency.

All modules must preserve the same structural organization philosophy across the entire system.

---

# Functions (`fn_*`)

## Purpose

Functions represent reusable internal logic and helper operations.

---

## Naming Rules

Functions must:

- use the `fn_` prefix;
- use lowercase `snake_case`;
- describe the operation being performed;
- avoid caller-oriented naming.

---

## Structure

```text
fn_<operation_context>
```

---

# Procedures and Workflow Functions (`sp_*`)

## Purpose

Procedures and workflow functions represent business-domain operations.

---

## Naming Rules

Objects must:

- use the `sp_` prefix;
- represent a business workflow;
- remain semantically descriptive.

---

## Structure

```text
sp_<workflow_context>
```

---

## Workflow Strategy

| Object Type | Recommended Usage |
|---|---|
| Function | Operations returning rows, status, or computed data |
| Procedure | Multi-step transactional write workflows |

---

# Job Procedures (`jpr_*`)

## Purpose

Scheduled maintenance operations executed through **pg_cron**.

---

## Naming Rules

Job procedures must:

- use the `jpr_` prefix;
- represent automated maintenance tasks;
- remain operationally descriptive.

---

## Structure

```text
jpr_<job_context>
```

---

## Cron Naming Rule

The first argument of `cron.schedule()` must:

- remain human-readable;
- use plain `snake_case`;
- avoid object prefixes.

---

# Public API (`svc_*`)

## Purpose

`svc_*` objects define the official application-facing contract.

Applications must only communicate with the database through this layer.

---

## Naming Rules

Public API objects must:

- use the `svc_` prefix;
- remain application-oriented;
- avoid exposing internal implementation details.

---

## Structure

```text
svc_<service_context>
```

---

# Triggers (`trg_*`)

## Purpose

Triggers enforce automated integrity rules and lifecycle protections.

---

## Naming Rules

Triggers must:

- use the `trg_` prefix;
- clearly describe the guarded action or behavior;
- remain semantically explicit.

---

## Structure

```text
trg_<trigger_context>
```

---

# QA Contracts (`qa_*`)

## Purpose

QA contract functions provide stable identifiers for fixtures and integrity testing.

---

## Naming Rules

QA contracts must:

- use the `qa_` prefix;
- identify semantic fixture entities;
- preserve deterministic testing references.

---

## Structure

```text
qa_<fixture_context>
```

---

# Views (`vw_*`)

## Purpose

Views represent read models and reporting abstractions.

---

## Naming Rules

Views must:

- use the `vw_` prefix;
- represent a read-model context;
- remain semantically descriptive.

---

## Structure

```text
vw_<read_model_context>
```

---

# Parameters, Variables and Records

## Naming Standards

| Element Type | Prefix | Structure |
|---|---|---|
| Parameter | `p_` | `p_<context>` |
| Local Variable | `v_` | `v_<context>` |
| Record | `r_` | `r_<context>` |

---

# Dictionary Standardization

All semantic abbreviations, prefixes, and naming structures must be formally documented within the system dictionary.

The dictionary is responsible for defining:

- semantic meanings;
- approved abbreviations;
- contextual identifiers;
- structural naming references.

---

# Design Principles

The adopted convention prioritizes:

- semantic compactness;
- procedural readability;
- architectural consistency;
- relational clarity;
- maintainability across all modules;
- long-term scalability.

---

# Final Statement

Consistency across procedural SQL is considered a core architectural requirement.

A predictable naming architecture improves:

- debugging;
- onboarding;
- development speed;
- code review quality;
- module interoperability;
- long-term system sustainability.
# Schema Objects Naming Conventions

## Overview

This document defines the official naming conventions adopted for **structural database objects** within the **MiaCaoMigo** database system.

The objective of these conventions is to establish a database architecture that is:

- semantically consistent;
- structurally predictable;
- easy to navigate;
- scalable over time;
- maintainable across all modules.

These standards are mandatory for all contributors and database components.

---

# Global Naming Standards

All schema objects must comply with the following standards.

| Category | Standard |
|---|---|
| Language | Technical English |
| Letter Case | Lowercase only |
| Naming Style | `snake_case` |
| Characters | ASCII-compatible only |
| Philosophy | Compact semantic identification |

---

# Tables

## Purpose

Tables represent semantic business entities within the system.

---

## Naming Rules

Table names must:

- use singular form;
- remain descriptive and compact;
- follow `snake_case` notation;
- represent a clear business concept.

---

## Structure

```text
<entity_name>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| User Account | `user_account` |
| Pet Appointment | `pet_appointment` |
| Medical Record | `medical_record` |

---

# Columns

## Purpose

Columns identify semantic attributes associated with an entity.

---

## Naming Rules

Column names must:

- identify the semantic role of the attribute;
- identify the associated entity;
- remain compact and standardized;
- follow the global semantic naming structure.

---

## Structure

```text
<prefix>_<entity_suffix>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| User Email | `ema_usr` |
| Pet Birth Date | `dte_pet_birth` |
| Employee Status | `sts_emp` |

---

# Primary Keys

## Purpose

Primary keys uniquely identify table records.

---

## Naming Rules

Primary key constraints must:

- use the `pk_` prefix;
- explicitly identify the associated entity;
- remain globally consistent.

---

## Structure

```text
pk_<entity_name>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| User Account Primary Key | `pk_user_account` |
| Pet Primary Key | `pk_pet` |

---

# Foreign Keys

## Purpose

Foreign keys define relationships between entities.

---

## Naming Rules

Foreign key constraints must:

- use the `fk_` prefix;
- identify the referencing entity;
- identify the referenced entity;
- preserve relational clarity.

---

## Structure

```text
fk_<source_entity>_<target_entity>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| Employee User Reference | `fk_employee_user_account` |
| Pet Owner Relationship | `fk_pet_customer` |

---

# Check Constraints

## Purpose

Check constraints validate business rules and data integrity conditions.

---

## Naming Rules

Check constraints must:

- use the `ck_` prefix;
- identify the validated entity or attribute;
- remain semantically descriptive.

---

## Structure

```text
ck_<validation_context>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| User Email Validation | `ck_usr_email` |
| Positive Price Validation | `ck_product_price_positive` |

---

# Unique Constraints

## Purpose

Unique constraints prevent duplicated values within a defined context.

---

## Naming Rules

Unique constraints must:

- use the `uq_` prefix;
- identify the protected entity or attribute;
- preserve semantic consistency.

---

## Structure

```text
uq_<validation_context>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| Unique User Email | `uq_usr_email` |
| Unique Employee Tax Number | `uq_emp_tax_number` |

---

# Exclusion Constraints

## Purpose

Exclusion constraints prevent conflicting operational scenarios.

---

## Naming Rules

Exclusion constraints must:

- use the `ex_` prefix;
- identify the protected operational context;
- remain semantically explicit.

---

## Structure

```text
ex_<validation_context>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| Schedule Overlap Prevention | `ex_schedule_overlap` |
| Reservation Conflict Prevention | `ex_reservation_conflict` |

---

# Indexes

## Purpose

Indexes optimize query performance and access efficiency.

---

## Naming Rules

Indexes must:

- use the `idx_` prefix;
- identify the indexed entity or attribute;
- remain structurally descriptive.

---

## Structure

```text
idx_<index_context>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| User Email Index | `idx_usr_email` |
| Pet Status Index | `idx_pet_status` |

---

# Views

## Purpose

Views represent read models and reporting abstractions.

---

## Naming Rules

Views must:

- use the `vw_` prefix;
- represent a reporting or read-model context;
- remain inside `Schema/*/07_Views_ModX.sql`;
- be exposed through `svc_*` services rather than directly consumed as a public contract.

---

## Structure

```text
vw_<read_model_context>
```

---

## Examples

| Business Concept | Standardized Naming |
|---|---|
| Active Customers View | `vw_active_customer` |
| Monthly Revenue View | `vw_monthly_revenue` |

---

# Structural Consistency

All schema objects must preserve:

- semantic consistency;
- compact identification;
- structural readability;
- naming uniformity across all modules.

---

## Standardization Requirement

Any new naming pattern introduced into the system must be:

1. formally standardized;
2. documented within the system dictionary;
3. approved before adoption.

---

# Naming Exceptions

## Contextual Expansion Rules

In situations where semantic ambiguity or contextual redundancy may occur, additional contextual identifiers may be appended to preserve naming clarity and relational distinction.

---

## Expansion Guidelines

Contextual expansion must:

- remain semantically consistent;
- preserve the compact naming philosophy;
- avoid unnecessary verbosity;
- maintain structural standardization.

---

## Examples

```text
idx_usr_email_active
fk_pet_customer_owner
vw_monthly_financial_summary
```

---

# Dictionary Standardization

All database attributes, objects, abbreviations, and semantic identifiers must be formally documented within the **System Naming Dictionary**.

---

## Dictionary Responsibilities

The dictionary is responsible for defining:

- semantic meanings;
- approved abbreviations;
- contextual identifiers;
- structural naming references;
- object descriptions.

---

## Responsibility Separation

| Component | Responsibility |
|---|---|
| Naming Convention | Defines structural philosophy |
| System Dictionary | Defines semantic interpretation |

---

# Design Principles

The adopted convention intentionally prioritizes:

- semantic compactness;
- SQL efficiency;
- procedural readability;
- relational consistency;
- long-term maintainability;
- architectural uniformity.

---

# Final Statement

Consistency across the entire database system takes priority over individual stylistic preferences.

A predictable and standardized naming architecture improves:

- scalability;
- onboarding efficiency;
- query readability;
- debugging processes;
- collaborative development;
- long-term software sustainability.
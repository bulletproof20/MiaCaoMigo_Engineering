# Schema Objects Naming Conventions

!!! tip "Views and API"
    Read models use prefix `vw_*` in `Schema/*/07_Views_*.sql`.  
    Application entry points use `svc_*` in `Services/` (not schema objects).

## Purpose

This document defines the naming conventions adopted for structural database objects within the MiaCaoMigo database system.

The purpose of these conventions is to ensure:
- structural consistency;
- semantic identification;
- schema readability;
- maintainability of relational structures;
- standardized database object organization.

These conventions are mandatory for all database modules and contributors.

---

# Tables

## Naming Rules

Table names must:
- represent a semantic business entity;
- use singular form;
- remain descriptive and compact;
- follow snake_case notation.

## Structure

```text
<entity_name>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Account | `user_account` |

---

# Columns

## Naming Rules

Column names must:
- identify the semantic role of the attribute;
- identify the associated entity;
- remain compact and consistent;
- follow the global semantic structure.

## Structure

```text
<prefix>_<entity_suffix>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Email | `ema_usr` |

---

# Primary Keys

## Naming Rules

Primary key constraints must:
- use the `pk_` prefix;
- explicitly identify the associated entity;
- remain globally consistent.

## Structure

```text
pk_<entity_name>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Account Primary Key | `pk_user_account` |

---

# Foreign Keys

## Naming Rules

Foreign key constraints must:
- use the `fk_` prefix;
- identify the referencing entity;
- identify the referenced entity;
- preserve relational clarity.

## Structure

```text
fk_<source_entity>_<target_entity>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Employee User Reference | `fk_employee_user_account` |

---

# Check Constraints

## Naming Rules

Check constraints must:
- use the `ck_` prefix;
- identify the validated entity or attribute;
- remain semantically descriptive.

## Structure

```text
ck_<validation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Email Validation | `ck_usr_email` |

---

# Unique Constraints

## Naming Rules

Unique constraints must:
- use the `uq_` prefix;
- identify the protected entity or attribute;
- preserve semantic consistency.

## Structure

```text
uq_<validation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Unique User Email | `uq_usr_email` |

---

# Exclusion Constraints

## Naming Rules

Exclusion constraints must:
- use the `ex_` prefix;
- identify the protected operational context;
- remain semantically explicit.

## Structure

```text
ex_<validation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Schedule Overlap Prevention | `ex_schedule_overlap` |

---

# Indexes

## Naming Rules

Indexes must:
- use the `idx_` prefix;
- identify the indexed entity or attribute;
- remain structurally descriptive.

## Structure

```text
idx_<index_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Email Index | `idx_usr_email` |

---

# Views

## Naming Rules

Views must:
- use the `vw_` prefix;
- represent a read model or reporting shape;
- remain in `Schema/*/07_Views_ModX.sql`;
- be exposed to applications through `svc_*` (not called directly as the public contract).

## Structure

```text
vw_<read_model_context>
```

---

# Structural Consistency

All schema objects must:
- preserve semantic consistency;
- preserve compact identification;
- preserve structural readability;
- preserve naming uniformity across all modules.

Any new schema object naming pattern introduced into the system must first be standardized and documented before adoption.

---

# Naming Exceptions

## Contextual Expansion Rules

In specific scenarios where semantic ambiguity or contextual redundancy may occur, additional contextual identifiers may be appended to preserve naming clarity and relational distinction.

This contextual expansion must:
- remain semantically consistent;
- preserve the compact naming philosophy;
- avoid unnecessary verbosity;
- remain structurally standardized.

---

# Dictionary Standardization

All database attributes, objects, abbreviations and semantic identifiers must be formally documented within the system dictionary.

The dictionary is responsible for defining:
- semantic meanings;
- approved abbreviations;
- contextual identifiers;
- structural naming references;
- object descriptions.

The naming convention defines the structural philosophy.  
The dictionary defines the semantic interpretation.
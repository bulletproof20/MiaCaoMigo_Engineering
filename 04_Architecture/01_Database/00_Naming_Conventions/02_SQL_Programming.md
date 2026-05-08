# SQL Programming Naming Conventions

## Purpose

This document defines the naming conventions adopted for procedural SQL programming components within the MiaCaoMigo database system.

The purpose of these conventions is to ensure:
- procedural readability;
- semantic consistency;
- maintainability of database logic;
- operational clarity;
- standardized SQL programming practices.

These conventions are mandatory for all database modules and contributors.

---

# Functions

## Naming Rules

Functions must:
- use the `fn_` prefix;
- represent a semantic operation;
- remain compact and descriptive;
- preserve operational clarity.

## Structure

```text
fn_<operation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Login Validation | `fn_login_user` |

---

# Procedures

## Naming Rules

Procedures must:
- use the `sp_` prefix;
- represent an operational process;
- preserve semantic consistency;
- remain structurally descriptive.

## Structure

```text
sp_<operation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Session Cleanup Process | `sp_cleanup_sessions` |

---

# Triggers

## Naming Rules

Triggers must:
- use the `trg_` prefix;
- represent the executed operation;
- preserve operational readability;
- remain semantically explicit.

## Structure

```text
trg_<operation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Password Hash Validation | `trg_hash_password` |

---

# Jobs

## Naming Rules

Scheduled jobs must:
- use the `job_` prefix;
- represent the scheduled operation;
- remain operationally descriptive;
- preserve semantic consistency.

## Structure

```text
job_<operation_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| Expired Session Cleanup | `job_cleanup_sessions` |

---

# Parameters

## Naming Rules

Function and procedure parameters must:
- use the `p_` prefix;
- represent the received operational value;
- remain semantically identifiable.

## Structure

```text
p_<parameter_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Email Parameter | `p_ema_usr` |

---

# Variables

## Naming Rules

Local variables must:
- use the `v_` prefix;
- represent temporary operational data;
- remain semantically descriptive.

## Structure

```text
v_<variable_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Identifier Variable | `v_id_usr` |

---

# Records

## Naming Rules

Record variables must:
- use the `r_` prefix;
- represent row-based structures;
- preserve semantic readability.

## Structure

```text
r_<record_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Record | `r_usr` |

---

# Arrays

## Naming Rules

Array variables must:
- use the `arr_` prefix;
- represent collection-based structures;
- preserve semantic clarity.

## Structure

```text
arr_<array_context>
```

## Naming Transformation

| Original Concept | Standardized Naming |
|---|---|
| User Permission Array | `arr_usr_permissions` |

---

# Procedural Consistency

All procedural SQL components must:
- preserve semantic consistency;
- preserve operational readability;
- preserve compact semantic identification;
- preserve structural naming uniformity.

Any new procedural naming pattern introduced into the system must first be standardized and documented before adoption.

---

# Naming Exceptions

## Contextual Expansion Rules

In specific scenarios where semantic ambiguity or contextual redundancy may occur, additional contextual identifiers may be appended to preserve naming clarity and operational distinction.

This contextual expansion must:
- remain semantically consistent;
- preserve the compact naming philosophy;
- avoid unnecessary verbosity;
- remain structurally standardized.

---

# Dictionary Standardization

All procedural objects, abbreviations and operational identifiers must be formally documented within the system dictionary.

The dictionary is responsible for defining:
- semantic meanings;
- approved abbreviations;
- contextual identifiers;
- procedural references;
- operational descriptions.

The naming convention defines the structural philosophy.  
The dictionary defines the semantic interpretation.
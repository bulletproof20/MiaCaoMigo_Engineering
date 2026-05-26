# Structural Integrity Governance

## Overview

This document defines the official structural integrity governance model adopted within the **MiaCaoMigo** database system.

The purpose of this governance is to establish a consistent and deterministic declarative integrity strategy across all database modules.

Structural integrity mechanisms are responsible for ensuring:

- relational consistency;
- entity identity stability;
- controlled relational dependencies;
- prevention of invalid structural states;
- deterministic schema validation;
- declarative data consistency.

> These standards are mandatory for all database modules and contributors.

---

# Global Structural Consistency

All modules must preserve the same structural integrity philosophy and declarative validation strategy.

Modules 1, 2, 3, and 4 must maintain:

- identical constraint philosophy;
- identical declarative validation principles;
- identical relational consistency standards;
- identical integrity naming conventions;
- identical structural organization rules.

There are no module-specific integrity exceptions.

---

# Structural Integrity Philosophy

The system adopts a declarative structural integrity architecture where consistency is enforced directly by the database schema whenever technically feasible.

Structural integrity mechanisms must prioritize:

- deterministic enforcement;
- semantic consistency;
- relational clarity;
- operational predictability;
- maintainability across all modules;
- prevention of invalid structural states.

Declarative integrity must always be preferred over procedural validation whenever equivalent enforcement is possible.

---

# Structural Integrity Layers

| Mechanism | Responsibility |
|---|---|
| Primary Keys | Entity identity |
| Foreign Keys | Referential consistency |
| Unique Constraints | Uniqueness enforcement |
| Check Constraints | Domain validation |
| Exclusion Constraints | Temporal exclusivity |

---

# Primary Keys

## Purpose

Primary keys uniquely identify structural entities within the relational model.

---

## Governance Rules

Primary keys must:

- preserve entity identity stability;
- remain deterministic and immutable;
- support controlled relational references;
- preserve structural consistency.

---

## Structure

```text
pk_<entity_name>
```

---

# Foreign Keys

## Purpose

Foreign keys enforce controlled relational dependencies between entities.

---

## Governance Rules

Foreign keys must:

- preserve referential consistency;
- prevent orphan relational states;
- enforce controlled entity relationships;
- remain structurally isolated from table definition files.

---

## Structure

```text
fk_<source_entity>_<target_entity>
```

---

## Isolation Rule

Foreign keys must exist exclusively inside:

```text
01_ForeignKeys_ModX.sql
```

---

# Unique Constraints

## Purpose

Unique constraints prevent duplicated structural identities and conflicting entity states.

---

## Governance Rules

Unique constraints must:

- preserve operational uniqueness;
- support one-to-one relationships when required;
- remain semantically explicit;
- preserve deterministic identity rules.

---

## Structure

```text
uq_<validation_context>
```

---

# Check Constraints

## Purpose

Check constraints validate deterministic structural rules and domain restrictions.

---

## Governance Rules

Check constraints should enforce:

- format validation;
- deterministic domain restrictions;
- valid structural states;
- temporal consistency;
- controlled attribute validation.

Complex operational workflows should not be implemented through check constraints.

---

## Structure

```text
chk_<validation_context>
```

---

# Exclusion Constraints

## Purpose

Exclusion constraints prevent mutually exclusive structural conflicts.

---

## Governance Rules

Exclusion constraints should enforce:

- temporal exclusivity;
- interval conflict prevention;
- mutually exclusive operational states;
- deterministic scheduling consistency.

Exclusion enforcement should remain declarative whenever technically feasible.

---

## Structure

```text
ex_<validation_context>
```

---

# Structural Repository Standards

## Constraint Organization

Structural integrity mechanisms must preserve deterministic repository organization.

---

## Standard Structure

| File | Responsibility |
|---|---|
| `00_Tables_ModX.sql` | Primary keys, unique constraints, check constraints |
| `01_ForeignKeys_ModX.sql` | Foreign keys |
| `04_Indexes_ModX.sql` | Indexes and exclusion constraints |

---

# Constraint Ordering Standards

## Table Constraint Order

Inside:

```text
00_Tables_ModX.sql
```

constraints must follow this order:

1. Primary key
2. Unique constraints
3. Check constraints

---

# Declarative Validation Standards

## Validation Philosophy

Structural validation must remain:

- deterministic;
- declarative;
- schema-oriented;
- semantically explicit;
- operationally predictable.

Validation logic that requires:

- workflow orchestration;
- contextual business logic;
- transactional decision-making;
- multi-step operational control;

must not be implemented as structural integrity.

---

# Temporal Structural Integrity

## Purpose

Temporal structural integrity prevents invalid chronological states at schema level.

---

## Governance Rules

Temporal structural integrity should enforce:

- valid intervals;
- non-overlapping ranges;
- chronological consistency;
- deterministic temporal validation.

Temporal exclusivity should prefer exclusion constraints whenever technically feasible.

---

# Structural Isolation Principles

## Responsibility Boundaries

Structural integrity mechanisms are responsible exclusively for:

- declarative relational enforcement;
- deterministic schema validation;
- controlled entity relationships;
- prevention of invalid structural states.

Structural integrity must not:

- orchestrate workflows;
- expose business operations;
- manage application behavior;
- replace procedural validation layers.

---

# Dictionary Standardization

All structural constraints, declarative validation rules, and integrity naming structures must be formally documented within the system dictionary and schema documentation.

The documentation is responsible for defining:

- semantic meanings;
- structural responsibilities;
- validation boundaries;
- declarative integrity rules;
- relational consistency standards.

---

# Design Principles

The adopted structural integrity governance intentionally prioritizes:

- deterministic declarative enforcement;
- relational reliability;
- semantic consistency;
- architectural predictability;
- maintainability across all modules;
- structural clarity;
- long-term scalability.

---

# Final Statement

Structural integrity is considered a core architectural responsibility of the MiaCaoMigo database system.

All declarative integrity standards defined in this documentation must be preserved across:

- all modules;
- all schema objects;
- all relational structures;
- all declarative validation layers;
- all future system extensions.
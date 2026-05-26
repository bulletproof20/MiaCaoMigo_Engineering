# Database Architecture

## Overview

This document defines the structural and procedural architecture of the **MiaCaoMigo** PostgreSQL DataLayer.

The database architecture was designed not only as a persistence layer, but also as a controlled integrity and validation layer responsible for enforcing critical operational rules and workflows.

The architecture prioritizes:

- deterministic execution;
- centralized integrity enforcement;
- modular organization;
- procedural readability;
- maintainability across all modules;
- controlled validation boundaries;
- long-term scalability.

---

# Structural Architecture

The DataLayer adopts a centralized PostgreSQL `public` schema.

The `public` schema was intentionally selected to preserve:

- simpler repository organization;
- cleaner SQL structure;
- reduced schema qualification overhead;
- procedural readability;
- easier maintainability across all modules.

The database is organized into four isolated functional modules:

| Module | Responsibility |
|---|---|
| Module 1 | User and access management |
| Module 2 | Animal and ownership management |
| Module 3 | Commercial and inventory management |
| Module 4 | Appointment and scheduling management |

Each module preserves isolated responsibilities while remaining integrated through controlled relational dependencies and procedural workflows.

---

# Integrity Architecture

The database architecture prioritizes integrity enforcement at the lowest deterministic layer capable of guaranteeing consistency.

Integrity validation follows a layered strategy:

```text
Structural Integrity
    ↓
Automated Integrity
    ↓
Procedural Validation
    ↓
QA Verification
```

Whenever possible, integrity is enforced directly through declarative relational mechanisms such as:

- primary keys;
- foreign keys;
- unique constraints;
- check constraints;
- exclusion constraints.

Advanced overlap validation adopts GiST-backed exclusion constraints through the PostgreSQL `btree_gist` extension.

When declarative enforcement is insufficient, the architecture adopts additional validation mechanisms through:

- triggers;
- procedural workflows;
- scheduled jobs;
- validation services.

Scheduled background operations are implemented through the PostgreSQL `pg_cron` extension.

---

# Procedural Architecture

The database remains the primary authority for integrity-sensitive operations and critical workflow validation.

The database is responsible for:

- authentication-sensitive workflows;
- user creation validation;
- role transition validation;
- attendance validation;
- transactional integrity protection;
- centralized business rule enforcement.

Critical operations such as:

- login workflows;
- user creation;
- employee role promotion;
- permission transitions;
- attendance operations;

are intentionally validated and controlled at database level through declarative, automated, and procedural integrity mechanisms.

The architecture intentionally minimizes dependency on application-side validation for critical integrity-sensitive operations.

---

# API Responsibility

The API layer is responsible for:

- external communication;
- request orchestration;
- frontend integration;
- response serialization;
- non-critical business workflows;
- application interaction flows.

The API consumes controlled database services through the procedural service layer (`svc_*`).

```text
Frontend
    ↓
API
    ↓
svc_*
    ↓
sp_*
    ↓
fn_*
    ↓
vw_*
```

The database remains the primary authority for integrity-sensitive operations.

---

# Primary Key Strategy

Primary keys preferentially adopt sequence-based generation whenever compatible with entity lifecycle requirements and relational workflow consistency.

The architecture prioritizes:

- deterministic identifier generation;
- relational consistency;
- procedural simplicity;
- maintainable insertion workflows.

---

# Technical Stack

| Component | Technology |
|---|---|
| Database Platform | PostgreSQL |
| Scheduled Jobs | pg_cron |
| Exclusion Constraints | btree_gist |
| Containerization | Docker |
| Version Control | GitHub |
| Generated Documentation | SchemaSpy |

The entire DataLayer environment executes through containerized Docker orchestration.

---

# Generated Documentation

Structural metadata, relationships, constraints, indexes, and relational diagrams are automatically generated through SchemaSpy.

SchemaSpy is considered the primary generated source for:

- table exploration;
- relationships;
- constraints;
- indexes;
- procedural metadata;
- relational diagrams.

Manual architectural documentation intentionally avoids duplicating structural metadata already available through generated documentation.

---

# Future Infrastructure Goals

The current architecture was designed to remain compatible with future orchestration and scalability improvements.

Future infrastructure objectives may include:

- Kubernetes-based orchestration;
- distributed deployment strategies;
- scalable service isolation;
- automated deployment pipelines.

These infrastructure extensions remain outside the current implementation scope and may be introduced in future development phases depending on available project time and project requirements.

---

# Architectural Principles

The adopted database architecture intentionally prioritizes:

- deterministic execution;
- modular organization;
- centralized integrity enforcement;
- procedural clarity;
- maintainability across all modules;
- architectural consistency;
- long-term scalability.

---

# Final Statement

The MiaCaoMigo DataLayer was designed as a modular, deterministic, and integrity-oriented PostgreSQL architecture.

The database remains the primary authority for integrity-sensitive workflows, relational consistency, and critical operational validation across the entire system.
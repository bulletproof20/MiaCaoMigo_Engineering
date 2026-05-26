# Schema Overview

## Overview

This directory defines the structural and procedural architecture of the MiaCaoMigo PostgreSQL DataLayer.

The Schema layer is responsible for:

- relational structure definition;
- declarative integrity enforcement;
- procedural validation support;
- trigger orchestration;
- indexing strategies;
- relational workflows;
- generated relational consistency.

The schema architecture intentionally centralizes integrity-sensitive operations at database level whenever deterministic enforcement is required.

---

# Schema Organization

The schema architecture is organized into four isolated functional modules:

| Module | Responsibility |
|---|---|
| Module 1 | User and access management |
| Module 2 | Animal and ownership management |
| Module 3 | Commercial and inventory management |
| Module 4 | Appointment and scheduling management |

Each module preserves isolated responsibilities while remaining integrated through controlled relational dependencies.

---

# Structural Architecture

The DataLayer adopts a centralized PostgreSQL `public` schema.

The `public` schema was intentionally selected to preserve:

- simpler repository organization;
- cleaner SQL structure;
- reduced schema qualification overhead;
- procedural readability;
- maintainability across all modules.

---

# Integrity Strategy

The schema architecture prioritizes integrity enforcement at the lowest deterministic layer capable of guaranteeing consistency.

Whenever possible, integrity is enforced directly through:

- primary keys;
- foreign keys;
- unique constraints;
- check constraints;
- exclusion constraints.

Advanced overlap validation adopts GiST-backed exclusion constraints through the `btree_gist` PostgreSQL extension.

When declarative enforcement is insufficient, the architecture adopts additional validation mechanisms through:

- triggers;
- procedural workflows;
- scheduled jobs;
- validation services.

---

# Procedural Architecture

Critical operational workflows remain controlled at database level.

The database is responsible for:

- authentication-sensitive workflows;
- user creation validation;
- role transition validation;
- attendance validation;
- transactional integrity protection.

The API layer consumes controlled procedural services through the `svc_*` service layer.

```text
Frontend
    ↓
API
    ↓
svc_*
    ↓
sp_*
    ↓
Integrity layers
```

The database remains the primary authority for integrity-sensitive operations.

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

Primary keys preferentially adopt sequence-based generation whenever compatible with entity lifecycle requirements.

---

# Future Infrastructure Goals

The current architecture was designed to remain compatible with future orchestration improvements.

Future infrastructure objectives may include:

- Kubernetes-based orchestration;
- distributed deployment strategies;
- scalable service isolation;
- automated deployment pipelines.

These infrastructure extensions remain outside the current implementation scope.

---

# Generated Documentation

Structural metadata, relationships, constraints, and relational diagrams are automatically generated through SchemaSpy.

Manual architectural documentation intentionally avoids duplicating structural metadata already available through generated documentation.
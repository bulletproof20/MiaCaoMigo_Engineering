# System Architecture

## Overview

The MiaCaoMigo system is structured using a layered architecture approach, separating the database layer from the application layer.

This separation improves:
- modularity;
- maintainability;
- scalability;
- deployment isolation;
- responsibility separation.

---

# System Layers

The system is currently divided into two major layers:

| Layer | Responsibility |
|---|---|
| DataLayer | Database structure, integrity, queries, procedures, and PostgreSQL services |
| ApplicationLayer | Backend API, frontend application, authentication flows, and user interaction |

---

# DataLayer

The DataLayer is responsible for:
- database schemas;
- relational modeling;
- integrity enforcement;
- SQL procedures;
- triggers;
- indexes;
- scheduled jobs;
- reusable queries.

The database system is implemented using PostgreSQL.

---

# ApplicationLayer

The ApplicationLayer is responsible for:
- backend API services;
- frontend interface;
- authentication workflows;
- request validation;
- business logic orchestration;
- user interaction.

This layer communicates directly with the DataLayer through SQL queries and procedures.

---

# Layer Communication

The ApplicationLayer interacts with the DataLayer through controlled database operations.

This communication includes:
- authentication requests;
- operational queries;
- attendance management;
- scheduling operations;
- user management workflows.

---

# Docker Usage

Docker is used to isolate the system layers into independent runtime environments.

The system currently uses separate containers for:
- DataLayer;
- ApplicationLayer.

This approach improves:
- environment consistency;
- deployment portability;
- dependency isolation;
- runtime reproducibility.

---

# DataLayer Container

The DataLayer container is responsible for:
- PostgreSQL execution;
- database initialization;
- extension support;
- persistence management.

It also supports PostgreSQL extensions required by the project, including:
- pg_cron;
- btree_gist.

---

# ApplicationLayer Container

The ApplicationLayer container is responsible for:
- backend execution;
- frontend runtime;
- Node.js dependencies;
- API services.

---

# Architectural Philosophy

The system architecture follows a separation-of-responsibilities approach:
- structural integrity is enforced primarily at database level;
- operational workflows are managed by the application layer;
- presentation logic remains isolated from persistence logic.

This architecture promotes:
- consistency;
- modularity;
- maintainability;
- controlled system evolution.
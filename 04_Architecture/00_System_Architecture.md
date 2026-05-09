<div style="text-align: center; margin-top: 40px; margin-bottom: 50px;">

<h1 style="margin-bottom: 10px;">
System Architecture
</h1>

<h3 style="
    margin-top: 0;
    color: #6b7280;
    font-weight: normal;
">
MiaCaoMigo Architectural Structure & Engineering Organization
</h3>

<p style="
    max-width: 900px;
    margin: 30px auto 0 auto;
    line-height: 1.8;
    font-size: 1.05rem;
">

The MiaCaoMigo ecosystem follows a layered architectural approach
focused on separation of responsibilities, modularity,
maintainability and engineering scalability.

</p>

</div>

---

# Architectural Overview

The system architecture is organized into two primary operational layers
supported by an independent engineering and documentation environment.

The architecture is designed to ensure:

- modular development;
- deployment isolation;
- maintainable system evolution;
- centralized engineering governance;
- separation between persistence and business orchestration.

---

# Core Architecture Layers

| Layer | Responsibility |
|---|---|
| DataLayer | Database architecture, integrity enforcement, persistence and SQL operations |
| ApplicationLayer | Backend services, frontend application, business workflows and user interaction |
| DataEngineering | Technical documentation, architecture governance, planning and engineering artifacts |

---

# DataLayer

The DataLayer is responsible for all persistence and database-oriented operations.

This layer contains:

- relational database schemas;
- integrity enforcement;
- SQL procedures;
- triggers;
- indexes;
- scheduled jobs;
- reusable queries;
- metadata structures;
- database standards.

The database engine is implemented using PostgreSQL.

---

# ApplicationLayer

The ApplicationLayer is responsible for the operational and business side of the system.

This layer contains:

- backend API services;
- frontend interfaces;
- authentication workflows;
- request validation;
- business orchestration;
- operational workflows;
- user interaction management.

The ApplicationLayer communicates directly with the DataLayer
through controlled SQL procedures and database operations.

---

# DataEngineering

The DataEngineering environment centralizes all engineering,
documentation and architectural governance resources associated
with the MiaCaoMigo ecosystem.

This environment contains:

- technical documentation;
- planning artifacts;
- sprint organization;
- engineering decisions;
- architecture specifications;
- integrity documentation;
- diagrams;
- standards;
- SchemaSpy documentation;
- academic statements;
- development support resources.

This layer acts as the centralized engineering knowledge base
for the entire project.

---

# Layer Communication

The ApplicationLayer communicates with the DataLayer
through controlled and validated operations.

This communication includes:

- authentication requests;
- operational queries;
- attendance workflows;
- scheduling operations;
- user management;
- validation procedures;
- integrity-controlled transactions.

The DataEngineering environment supports all layers by providing
centralized technical visibility and engineering traceability.

---

# Containerized Architecture

Docker is used to isolate the system into independent runtime environments.

The architecture currently uses dedicated containers for:

- DataLayer services;
- ApplicationLayer services;
- documentation and engineering tooling.

This approach improves:

- deployment consistency;
- dependency isolation;
- runtime reproducibility;
- maintainability;
- environment portability.

---

# DataLayer Container

The DataLayer container is responsible for:

- PostgreSQL execution;
- database initialization;
- persistence management;
- extension support;
- scheduled database operations.

Supported PostgreSQL extensions include:

- pg_cron;
- btree_gist.

---

# ApplicationLayer Container

The ApplicationLayer container is responsible for:

- backend runtime execution;
- frontend services;
- API orchestration;
- Node.js dependencies;
- authentication services;
- operational workflows.

---

# Engineering Philosophy

The MiaCaoMigo architecture follows a strict
separation-of-responsibilities philosophy.

Core principles include:

- integrity-first database design;
- isolated persistence logic;
- modular application orchestration;
- centralized documentation governance;
- maintainable architectural evolution;
- metadata-driven engineering.

This architectural approach promotes:

- consistency;
- scalability;
- maintainability;
- controlled evolution;
- engineering transparency.

---

<div style="text-align: center; margin-top: 70px; opacity: 0.8;">

<h3>MiaCaoMigo Engineering</h3>

<p>
Architecture • Engineering • Documentation • Governance
</p>

</div>
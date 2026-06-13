# MiaCaoMigo Engineering

Central engineering, architecture, and technical documentation repository for the **MiaCaoMigo** ecosystem.

This repository serves as the primary entry point to the project, providing the engineering foundation, system documentation, architectural decisions, requirements analysis, and development standards that support the entire ecosystem.

---

# Project Repositories

The MiaCaoMigo ecosystem is organized into three main repositories:

| Repository                                                                            | Purpose                                                                                                |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **[MiaCaoMigo_Engineering](https://github.com/bulletproof20/MiaCaoMigo_Engineering)** | Engineering documentation, architecture, requirements, diagrams, standards, and technical governance   |
| **[MiaCaoMigo_DataLayer](https://github.com/bulletproof20/MiaCaoMigo_DataLayer)**     | Database implementation, SQL scripts, PL/pgSQL logic, integrity rules, metadata, and persistence layer |
| **[MiaCaoMigo_Application](https://github.com/JMRM98/MiaCaoMigo_)**                   | Application layer, APIs, business logic, and user-facing functionality                                 |

---

# Academic Context

MiaCaoMigo was developed as an academic project within the Medical Informatics Engineering program.

The project was designed to apply and consolidate concepts from multiple subjects, including:

* Software Engineering
* Systems Analysis and Design
* Database Engineering
* Web Development
* Software Architecture

As an educational project, development was conducted under academic and time constraints. Its primary objective was to support learning, experimentation, and the practical application of engineering methodologies and technologies.

While the system demonstrates a complete engineering workflow—from requirements analysis and architectural design to database and application development—it was not intended to become a production-ready commercial solution. As such, certain areas remain open for future refinement, optimization, and feature expansion.

---

# Repository Structure

Detailed structure (directories and files): **[STRUCTURE.md](STRUCTURE.md)**

```text
00_Assets/                 → Branding, logos and shared assets
01_Planning/               → Sprint planning and project organization
02_Requirements/           → Requirements, traceability and analysis artifacts
03_Diagrams/               → ER models, UML diagrams and workflows
04_Architecture/           → System, application and database architecture
05_Docs/                   → Academic reports and supporting documentation
06_Performance/            → Performance strategies and recommendations

home.md                    → Documentation portal entry page
DOCUMENTATION_LAYERS.md    → Documentation layer model
mkdocs.yml                 → MkDocs configuration

.docs/                     → Docker, scripts and documentation tooling
```

---

# Technology Stack

| Area                   | Technology          |
| ---------------------- | ------------------- |
| Database               | PostgreSQL          |
| Scheduling             | pg_cron             |
| Containerization       | Docker              |
| Documentation          | MkDocs              |
| Documentation Theme    | Material for MkDocs |
| Database Visualization | SchemaSpy           |

---

# Engineering Principles

The project follows a modular engineering approach focused on:

* Maintainability
* Separation of Responsibilities
* Metadata-Driven Documentation
* Integrity-First Database Design
* Architectural Consistency
* Technical Traceability
* Standardized Development Practices

---

# Documentation Portal

This repository includes a fully containerized MkDocs documentation portal.

## Start Documentation Server

```bash
docker compose -f .docs/docker-compose.yml up
```

## Access Documentation

```text
http://localhost:8000
```

---

# Objectives

This repository provides:

* Centralized technical knowledge
* Architectural visibility
* Requirements traceability
* Development standards
* Documentation governance
* Onboarding support

---

# MiaCaoMigo

**Engineering • Architecture • Documentation • Standards**

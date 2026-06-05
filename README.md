# MiaCaoMigo Engineering

Centralized engineering and technical documentation repository for the **MiaCaoMigo** ecosystem.

This repository contains the complete engineering foundation of the project, including:

- system architecture;
- database engineering;
- integrity validation rules;
- technical standards;
- planning artifacts;
- UML and ER diagrams;
- academic statements;
- metadata documentation;
- SchemaSpy integration;
- development support documentation.

---

# Repository Structure

Mapa detalhado (diretorias e ficheiros): **[STRUCTURE.md](STRUCTURE.md)**.

```text id="jlwm1bt"
00_Assets/           → Branding, logos and shared assets
01_Planning/         → Sprint planning and project organization
02_Requirements/     → Sprint 2 RF matrix, summaries, traceability
03_Diagrams/         → ER models, UML diagrams and workflows
04_Architecture/     → System, application and database architecture
05_Docs/             → Academic statements, reports and presentation guides
06_Performance/      → Performance strategy, tests and recommendations
home.md              → Portal overview (MkDocs)
DOCUMENTATION_LAYERS.md → Layer model (conceptual vs technical)
mkdocs.yml           → MkDocs configuration (nav, theme, paths)
.docs/               → MkDocs Docker, overrides and documentation scripts
```

---

# Technology Stack

| Layer                  | Technology          |
| ---------------------- | ------------------- |
| Database               | PostgreSQL          |
| Scheduling             | pg_cron             |
| Containerization       | Docker              |
| Documentation          | MkDocs              |
| Theme                  | Material for MkDocs |
| Database Visualization | SchemaSpy           |

---

# Engineering Principles

The project follows a modular engineering philosophy focused on:

- maintainability;
- separation of responsibilities;
- metadata-driven documentation;
- integrity-first database design;
- centralized technical standards;
- scalable architectural organization.

---

# Documentation Portal

This repository includes a fully dockerized MkDocs documentation portal.

## Start Documentation Server

```bash id="’winii2bt"
docker compose -f .docs/docker-compose.yml up
```

---

## Access Documentation

```text id="’winiii3bt"
http://localhost:8000
```

---

# Objectives

The engineering repository aims to provide:

- centralized technical knowledge;
- architectural visibility;
- engineering traceability;
- onboarding support;
- maintainable documentation;
- standardized development practices.

---

# MiaCaoMigo

Engineering • Architecture • Documentation • Standards

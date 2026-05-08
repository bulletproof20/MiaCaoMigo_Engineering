 # Database Architecture

## Purpose

This document defines the architectural organization adopted for the MiaCaoMigo database system.

The purpose of this architecture is to ensure:
- modular organization;
- structural consistency;
- functional scalability;
- maintainability of database logic;
- controlled integration between system domains.

The database architecture was designed to support modular organization while preserving functional integration across the entire system.

---

# Architectural Philosophy

The MiaCaoMigo database system follows a modular architecture based on:
- controlled relational integration;
- structural consistency;
- progressive scalability;
- domain separation.

Each module maintains:
- its own business responsibility;
- its own relational structures;
- its own procedural logic;
- its own operational domain.

The architectural organization intentionally reduces excessive coupling between modules in order to facilitate:
- maintainability;
- future scalability;
- modular evolution;
- controlled relational dependency.

---

# Public Schema Strategy

At the current development stage, all database objects are maintained within the default PostgreSQL `public` schema.

This decision was adopted to:
- simplify academic development;
- simplify deployment processes;
- reduce schema management complexity;
- accelerate integration between modules;
- facilitate collaborative development.

Although all objects currently reside within the `public` schema, the system architecture was designed to support future logical separation through dedicated PostgreSQL schemas if required by future scalability or organizational needs.

---

# Modular Organization

The database system is divided into four primary functional modules:

| Module | Responsibility |
|---|---|
| Module 1 | User and Access Management |
| Module 2 | Animal Management |
| Module 3 | Commercial Management |
| Module 4 | Appointment Management |

Each module is responsible for maintaining:
- its own entities;
- its own integrity rules;
- its own procedural operations;
- its own business logic.

---

# Modular Dependency Strategy

The current system implementation maintains controlled relational dependencies between modules through:
- foreign keys;
- procedural integrations;
- operational relationships;
- transactional dependencies.

This integration model preserves:
- operational consistency;
- relational integrity;
- business continuity;
- workflow coordination.

Although modules are currently interconnected, the architectural structure was intentionally designed to reduce excessive coupling and facilitate future modular separation if required by future scalability or organizational requirements.

---

# Module Integration Strategy

## Module 1 — User and Access Management

Responsible for:
- authentication;
- authorization;
- role-based access control;
- employee management;
- attendance management;
- auditing and operational traceability.

This module establishes the operational identity layer of the system.

---

## Module 2 — Animal Management

Responsible for:
- animal registration;
- animal records;
- rescue tracking;
- animal-related operational data.

This module establishes the clinical and operational subject layer of the system.

---

## Module 3 — Commercial Management

Responsible for:
- stock management;
- commercial operations;
- sales;
- financial traceability;
- inventory control.

This module establishes the commercial and financial layer of the system.

---

## Module 4 — Appointment Management

Responsible for:
- appointment orchestration;
- cross-module clinical operations;
- integration between professionals, animals and commercial activities;
- operational workflow coordination.

This module acts as the primary functional integration layer of the system.

---

# Relational Integration Philosophy

Cross-module relationships are intentionally controlled to:
- preserve modular consistency;
- reduce excessive coupling;
- simplify maintenance;
- improve scalability.

Modules may reference entities from other modules when required for:
- operational attribution;
- clinical relationships;
- commercial traceability;
- workflow integration;
- auditing processes.

---

# Referential Integrity Strategy

The system adopts a centralized relational integrity strategy through:
- foreign keys;
- exclusion constraints;
- procedural validation;
- triggers;
- transactional operations;
- relational consistency enforcement.

Integrity validation is distributed between:
- structural schema constraints;
- procedural database logic.

This approach ensures:
- operational consistency;
- transactional reliability;
- controlled relational behavior.

---

# Procedural Architecture

The database system adopts a procedural SQL architecture where significant portions of business logic are maintained directly within the database layer.

This includes:
- functions;
- procedures;
- triggers;
- scheduled jobs;
- integrity validations;
- operational workflows.

This strategy centralizes:
- validation logic;
- operational rules;
- relational consistency;
- transactional control.

---

# Scalability Considerations

The current architecture was designed to support:
- future schema separation;
- additional modules;
- progressive feature expansion;
- increased operational complexity;
- scalable relational integration.

The modular organization allows future architectural evolution without requiring complete structural redesign.

---

# Final Notes

The MiaCaoMigo database architecture prioritizes:
- modular organization;
- controlled integration;
- structural consistency;
- relational maintainability;
- operational scalability.

The adopted architecture balances academic simplicity with scalable architectural principles, enabling both practical development efficiency and future system evolution.
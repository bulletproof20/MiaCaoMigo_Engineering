# Database Naming Convention

## Overview

This document defines the official naming philosophy adopted for the **MiaCaoMigo** database system.

Its primary objective is to establish a consistent, scalable, and maintainable naming standard across the entire database architecture.

The convention is designed to ensure:

- semantic consistency;
- SQL readability;
- maintainability of database logic;
- rapid identification of entities and attributes;
- reduced ambiguity in relational operations.

> These conventions are mandatory for all database modules, contributors, and future system extensions.

---

# Core Philosophy

The adopted naming convention follows a **compact semantic strategy** focused on improving:

- SQL readability;
- procedural development efficiency;
- relational consistency;
- long-term maintainability.

The philosophy prioritizes:

- semantic precision;
- compact identification;
- structural uniformity;
- architectural consistency across the entire system.

---

# Language Standards

All database components must comply with the following standards:

| Standard | Requirement |
|---|---|
| Language | Technical English |
| Letter Case | Lowercase only |
| Naming Style | `snake_case` |
| Characters | ASCII-compatible only |
| Abbreviations | Standardized semantic abbreviations |

---

# Naming Structure

Database attributes must follow the structure below:

```text
<prefix>_<entity_suffix>
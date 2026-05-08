# Data Dictionary Overview

## Objective

This directory contains the data dictionaries associated with the MiaCaoMigo database project.

Its purpose is to document:
- entities;
- attributes;
- semantic meaning;
- relational context;
- key classifications.

The data dictionary provides a structured reference for understanding the database model independently from the SQL implementation.

---

# Organization

The data dictionary is organized by system module.

Each document represents a specific functional domain of the system.

### Current Structure

```text
04_Data_Dictionary
│
├── 00_Overview.md
├── Module1_UserManagement.md
├── Module2_AnimalManagement.md
├── Module3_CommercialManagement.md
└── Module4_AppointmentManagement.md
```

---

# Dictionary Structure

Each entity is documented using:
- entity description;
- attribute list;
- semantic meaning;
- key classification.

---

# Attribute Documentation Structure

Each attribute is described using the following columns:

| Column | Description |
|---|---|
| Attribute | Physical database attribute name |
| Name | Human-readable attribute name |
| Description | Semantic meaning of the attribute |
| Key Type | Relational key classification |

---

# Key Type Classification

| Key Type | Meaning |
|---|---|
| PK | Primary Key |
| FK | Foreign Key |
| AK | Alternate Key |
| CPK | Composite Primary Key |
| CFK | Composite Foreign Key |
| SFK | Self Foreign Key |

---

# Scope

This documentation focuses on:
- conceptual meaning;
- relational interpretation;
- operational context.

Implementation-specific logic such as:
- triggers;
- procedures;
- indexes;
- jobs;
- constraints;
- business workflows;

is documented separately in the architecture and integrity documentation.
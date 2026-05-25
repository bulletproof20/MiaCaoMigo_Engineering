# Structural Entity-Relationship Model

## Overview

This section contains the structural Entity-Relationship Model (ER Model) developed for the MiaCaoMigo System.

The presented model represents the conceptual organization of the main entities and relationships that compose the overall system architecture.

Due to the size and complexity of the model, the structural diagram was intentionally simplified in order to improve readability and facilitate the global understanding of the domain structure. The diagram focuses on entities and their relationships; attribute-level detail is documented in separate sections below.

---

## Structural Model (V10)

When the PDF is present in the repository, open: [ER_V10/ER_V10.pdf](ER_V10/ER_V10.pdf).

If the PDF is not checked in, use the module attribute documents and the DataLayer ER artefacts referenced in [STRUCTURE.md](../../STRUCTURE.md).

---

## Attribute documentation (two complementary views)

| View | Location | Read for |
|------|----------|----------|
| **Conceptual semantics** | [ER_V10/Atributos/](ER_V10/Atributos/README.md) | Business meaning, domain justification, WHY attributes exist |
| **Technical implementation** | [Data Dictionary](../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md) | Physical names, keys, constraints, DataLayer navigation |

These are **not duplicates**. See [DOCUMENTATION_LAYERS.md](../../DOCUMENTATION_LAYERS.md).

### Attributes by module (conceptual)

| Module | Document |
|--------|----------|
| Module 1 — Users & access | [ER_V10/Atributos/01_Module1.md](ER_V10/Atributos/01_Module1.md) |
| Module 2 — Animals | [ER_V10/Atributos/02_Module2.md](ER_V10/Atributos/02_Module2.md) |
| Module 3 — Commercial | [ER_V10/Atributos/03_Module3.md](ER_V10/Atributos/03_Module3.md) |
| Module 4 — Appointments | [ER_V10/Atributos/04_Module4.md](ER_V10/Atributos/04_Module4.md) |

!!! warning "Legacy ER V8"
    [ER_V8/Atributos/](ER_V8/Atributos/) is **deprecated** (partial modules only). Use **ER V10** and the [Data Dictionary](../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md) for current work.

---

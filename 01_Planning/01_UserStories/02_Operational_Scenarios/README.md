# Operational Scenarios — validation layer

Authoritative documentation for the **Braga launch simulation**: what must hold for DemoData, QA, and workflow consistency.

**Human-readable context:** [Narrative Stories](../01_Narrative_Stories/README.md)  
**Master index:** [00_ECOSYSTEM.md](00_ECOSYSTEM.md) · **Calendar:** [TIMELINE_LAUNCH_2026.md](01_Chronology/TIMELINE_LAUNCH_2026.md)

---

## Purpose

Operational Scenarios document:

- **who did what and when** in machine-checkable terms;
- **workflow states** (appointments, animals, invoices, absences, clients);
- **references** to services and procedures (`sp_*`, `fn_*`) where validation requires them;
- **cross-links** between cast members and OPS guides.

They are the **consistency contract** between this portal and [`01_MiaCaoMigo_DataLayer`](../../../01_MiaCaoMigo_DataLayer) seed/QA material. They are **not** a substitute for SQL documentation in [04_Architecture](../../../04_Architecture/README.md).

---

## What belongs here (intentional)

| Allowed | Examples |
|---------|----------|
| State enums and transitions | `scheduled`, `no_show`, `Interno` → `Adotado` |
| Operational event tables | Timeline rows, cast timelines |
| Service/procedure **names** as validation anchors | `sp_create_appointment`, `sp_receive_purchase` |
| Column identifiers when tied to demo rows | `sta_ani`, `status_app`, `ina_dat_cli` |

Full procedure bodies, DDL, triggers, and governance rules belong in **Architecture / DataLayer**.

---

## Folder map

| Folder | Content |
|--------|---------|
| [00_ECOSYSTEM.md](00_ECOSYSTEM.md) | Cast index and simulation settings |
| [01_Chronology/](01_Chronology/) | Day-by-day timeline |
| [02_People/](02_People/) | Customers and employees — [Customers](02_People/Customers/README.md) · [Employees](02_People/Employees/README.md) |
| [03_Animals/](03_Animals/) | Animal arcs — [index](03_Animals/README.md) |
| [04_External/](04_External/) | Partners — [index](04_External/README.md) |
| [05_Operations/](05_Operations/) | Cross-cutting OPS guides |

---

## Precedence

If a [Narrative](../01_Narrative_Stories/) page and an Operational page disagree, **trust Operational Scenarios**.

---

## Suggested reading order

1. [00_ECOSYSTEM](00_ECOSYSTEM.md) — cast and links  
2. [TIMELINE](01_Chronology/TIMELINE_LAUNCH_2026.md) — chronological index  
3. Relevant **OPS_*** guide for the domain under test  
4. Cast file(s) for the actor or animal involved  
5. [Architecture](../../../04_Architecture/01_Database/README.md) when implementing or debugging services

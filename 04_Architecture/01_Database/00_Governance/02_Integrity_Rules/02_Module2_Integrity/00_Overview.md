# Module 2 — Integrity overview

Animal management: species, breeds, animals, ownership, delivery, concessions.

**DDL:** `DataBase/Schema/02_Module2_Animal_Management/`  
**Public API:** `DataBase/Services/02_Module2/99_Public_API.sql` (`svc_*` → Schema `sp_*` / `vw_*`)

---

## Structural highlights

- FKs to Module 1 (`client`, `employee`) in `01_ForeignKeys_Mod2.sql`
- Ownership uniqueness and lifecycle triggers in `03_Triggers_Mod2.sql`
- Read models: `07_Views_Mod2.sql`

Constraint inventory: see live `00_Tables_Mod2.sql` and `01_ForeignKeys_Mod2.sql` (same documentation pattern as [Module 1 structural](../01_Module1_Integrity/00_Structural_Integrity.md)).

---

## Automated integrity tests (QA)

Executed by `QA/runners/stages/integrity.ps1` (requires `fixtures/seed/m2_animals_ownership.sql`).

| Script | Rule focus |
|--------|------------|
| `01_Duplicate_Ownership.sql` | Duplicate ownership blocked |
| `02_Ownership_Lifecycle.sql` | Lifecycle transitions |
| `03_Breed_Species_Consistency.sql` | Breed/species alignment |
| `04_Delivery_Date_Consistency.sql` | Delivery dates |
| `05_Concession_And_Inactive.sql` | Concession + inactive animal |

Cleanup between tests: `fixtures/reset/m2_animal1_ownership.sql`.

---

## Stress (optional)

| Script | Focus |
|--------|-------|
| `04_Stress/02_Module2/01_Concurrent_Adoption.sql` | Concurrent adoption |

---

## Related

- [Integrity strategy](../00_Integrity_Strategy.md)
- [Module 2 architecture](../../01_Schemas/00_Public_Schema/02_Module2_Architecture.md)

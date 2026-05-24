# Module 3 — Integrity overview

Commercial management: products, stock, purchases, sales, invoices, returns.

**DDL:** `DataBase/Schema/03_Module3_Commercial_Management/`  
**Public API:** `DataBase/Services/03_Module3/99_Public_API.sql`

**Jobs:** `06_Jobs_Mod3.sql` is a **placeholder** (no pg_cron schedules at bootstrap).

---

## Structural highlights

- Stock-before-sale and invoice totals enforced via triggers / procedures
- Purchase FK names: `fk_purchase_client`, `fk_purchase_employee` (disambiguated from Module 4 — see [Schema build pipeline](../../00_Schema_Build_Pipeline.md))
- Views: `07_Views_Mod3.sql` (`vw_*` for API reads)

---

## Automated integrity tests (QA)

| Script | Rule focus |
|--------|------------|
| `01_Stock_Before_Sale.sql` | Stock availability |
| `02_Inactive_Product_Sale.sql` | Inactive product guard |
| `03_Return_Quantity.sql` | Return quantity vs sold |
| `04_Invoice_Total_Update.sql` | Invoice line totals |

Fixture: `fixtures/seed/m3_commercial_product.sql`.

---

## Stress (optional)

Requires `fixtures/seed/m3_stress_commercial.sql` via `stages/fixtures.ps1 -IncludeStress`.

| Script | Focus |
|--------|-------|
| `01_Concurrent_Sales.sql` | Sale contention |
| `02_High_Volume_Invoice_Lines.sql` | Line volume |
| `03_FIFO_Consumption.sql` | FIFO batches |
| `04_Return_Storm.sql` | Return load |

!!! warning "Legacy setup"
    `04_Stress/00_Setup/01_Commercial_Stress_Fixture.sql` is **not** used by `ci.ps1`. Prefer `m3_stress_commercial.sql`.

---

## Related

- [Integrity strategy](../00_Integrity_Strategy.md)
- [Module 3 architecture](../../01_Schemas/00_Public_Schema/03_Module3_Architecture.md)

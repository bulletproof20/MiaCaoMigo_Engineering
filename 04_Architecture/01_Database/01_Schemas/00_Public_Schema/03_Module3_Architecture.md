# Module 3 — Commercial management

!!! info "Implementation"
    **Schema DDL:** `DataBase/Schema/03_Module3_Commercial_Management/`  
    **Public API:** `DataBase/Services/03_Module3/99_Public_API.sql`  
    **Domain `sp_*`:** `Schema/.../05_Procedures_Mod3.sql`

## Purpose

Product catalog, stock, purchases, invoicing, and returns. Supplies commercial data and optional invoice linkage for Module 4 appointments.

---

## Schema artefacts

| File | Contents |
|------|----------|
| `00_Tables_Mod3.sql` | 8 tables (incl. quoted `"return"`) |
| `01_ForeignKeys_Mod3.sql` | Product graph + M1 `client` / `employee` |
| `02_Functions_Mod3.sql` | Stock / invoice helpers |
| `03_Triggers_Mod3.sql` | 7 sale/stock/return triggers |
| `04_Indexes_Mod3.sql` | Performance / integrity indexes |
| `05_Procedures_Mod3.sql` | `sp_receive_purchase`, `sp_check_restock_needs` |
| `06_Jobs_Mod3.sql` | Placeholder (skipped at bootstrap) |
| `07_Views_Mod3.sql` | Stock reporting views |

---

## Core entities

| Table | Role |
|-------|------|
| `family` | Product family |
| `product` | SKU / catalog item |
| `stock` | Quantity by product |
| `purchase`, `purchase_line` | Inbound stock |
| `invoice`, `invoice_line` | Sales document |
| `"return"` | Return lines (reserved word → quoted identifier) |

---

## Cross-module dependencies

| FK / link | Target |
|-----------|--------|
| `purchase` / `invoice` → `client`, `employee` | Module 1 |
| `appointment.id_inv` → `invoice` | Module 4 → M3 (optional) |

Purchase-side FK names (disambiguation): **`fk_purchase_client`**, **`fk_purchase_employee`** — see [Schema build pipeline](../../00_Schema_Build_Pipeline.md).

---

## Triggers (stock & invoicing)

| Trigger | Concern |
|---------|---------|
| `trg_check_stock_before_sale` | Stock before line insert |
| `trg_stock_after_sale` | Post-sale stock |
| `trg_update_invoice_total` | Invoice total sync |
| `trg_return_restock` | Return restock |
| `trg_prevent_inactive_product_sale` | Inactive product |
| `trg_set_return_return_date` | Return timestamp |
| `trg_warn_low_stock` | Low-stock notice |

---

## Domain procedures

| Procedure | Role |
|-----------|------|
| `sp_receive_purchase` | Receive purchase into stock |
| `sp_check_restock_needs` | Restock evaluation |

---

## Public API (`svc_*`)

| `svc_*` | Delegation |
|---------|------------|
| `svc_list_product_stock_levels` | `vw_product_stock_levels` |
| `svc_list_products_to_reorder` | `vw_products_to_reorder` |
| `svc_get_product_stock_level` | Single product view |
| `svc_receive_purchase` | `CALL sp_receive_purchase` |
| `svc_check_restock_needs` | `CALL sp_check_restock_needs` |

Read paths are **`stable`** SQL over views; writes use `CALL` to Schema procedures.

---

## Views

| View | Purpose |
|------|---------|
| `vw_product_stock_levels` | Stock by product |
| `vw_products_to_reorder` | Below minimum stock |

---

## QA coverage (4 scripts)

| Script | Rule |
|--------|------|
| `01_Stock_Before_Sale.sql` | No oversell |
| `02_Inactive_Product_Sale.sql` | Inactive guard |
| `03_Return_Quantity.sql` | Return qty |
| `04_Invoice_Total_Update.sql` | Totals |

Fixture: `fixtures/seed/m3_commercial_product.sql`.

**Stress (optional):** `fixtures/seed/m3_stress_commercial.sql` + four scripts under `04_Stress/03_Module3/`.  
Legacy `04_Stress/00_Setup/` is **not** used by `ci.ps1`.

---

## Related

- [Database architecture](00_Database_Architecture.md)
- [M3 integrity overview](../../00_Governance/02_Integrity_Rules/03_Module3_Integrity/00_Overview.md)

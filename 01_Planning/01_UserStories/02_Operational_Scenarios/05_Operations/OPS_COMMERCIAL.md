# Operations — Commercial Chains

> Timeline: [TIMELINE_LAUNCH_2026.md](../01_Chronology/TIMELINE_LAUNCH_2026.md)

Module 3 flows: catalog → stock → sale (`invoice_line`) → optional **return**; procurement → `sp_receive_purchase`.

---

## Sale chain (customer purchase)

```text
João Navarro (commercial_manager)
  → purchase (id_cli, id_emp) + invoice (sta_inv)
  → invoice_line (qty, uni_pri, iva)
  → trg_check_stock_before_sale / trg_stock_after_sale (FIFO)
  → trg_update_invoice_total
```

| Customer | Date | Items | `sta_inv` |
|---|---|---|---|
| Gonçalo | 10 May | kibble + 2 toys | paid |
| Gonçalo | 18 May | dermatology diet SKUs | paid |
| Marta | 9 May, 14 May | food, lead | paid / pending |
| Ana | 8 May | adoption kit bundle | paid |
| Isabel (client) | 22 May | post-consultation products | paid |
| Marta | 5 Jun | unpaid follow-up | **overdue** |

---

## Consultation billing

Clinical visit does **not** auto-create lines.

1. Marcelo completes appointment (`id_inv` nullable).
2. Navarro creates/links `invoice`, adds `invoice_line` (consult fee, consumed `rel_app_product`).
3. `appointment.id_inv` FK updated.

Examples: Tico 22 May, Felix 14 May, Jonas 12/16 May.

---

## Return chain

| Date | Customer | Trigger | System |
|---|---|---|---|
| 18 May | Marta | Chewed toy broke — defective batch | `return` + `return_product` + `trg_return_restock` |

Return references originating `invoice_line` when possible. Navarro supervises; Isabel handled desk complaint.

---

## Procurement chain

| PO | State | Handler |
|---|---|---|
| NorteVet antibiotics + gloves | received (12 days ago in generic demo) | Navarro `fn_receive_purchase` |
| NorteVet kibble restock | pending → received 19 May | Navarro |

`purchase_line` materializes `stock` rows on receive.

---

## Stock incidents

| Incident | Resolution |
|---|---|
| Low gloves after busy week | `fn_check_restock_needs` notice 19 May |
| Return restock | Marta toy qty back to `stock` |

---

## Permission boundary

Only **`commercial_manager`** (Navarro) or **`administrador`** (Ivo) write Module 3. Isabel escalates basket; Tiago never posts sales.

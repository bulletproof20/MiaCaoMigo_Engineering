# External Entity — NorteVet Supply Lda

> Type: **Supplier** · Table: `external_entity`

| Field | Value |
|---|---|
| Location | Zona Industrial de Palmeira, Braga |
| Email | comercial@nortevetsupply.pt |

## Role

**Procurement** only — no live animal flows.

| Date | Event | Handler |
|---|---|---|
| Pre-May | PO received — antibiotics, gloves | [Navarro](../02_People/Employees/EMP_J_NAVARRO.md) |
| 19 May | Pending PO received — kibble restock | Navarro `fn_receive_purchase` |

## Operations

- `purchase` + `purchase_line` → `sp_receive_purchase` → `stock` batches
- `employee_purchase` links Navarro

## Validates

Supplier `typ_ext_ent` separate from shelter workflows; stock FIFO input.

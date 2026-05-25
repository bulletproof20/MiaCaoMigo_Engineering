# Animal — Rogerim (dog)

> Owner: [Gonçalo](../02_People/Customers/CLI_GONCALO.md) · Intake: [Patinhas](../04_External/EXT_PATINHAS_AVE.md) · Handler: [Tiago](../02_People/Employees/EMP_TIAGO.md)

| Field | Value |
|---|---|
| Species | Dog |
| `reg_id_ani` | MCM-BRG-2026-ROG-01 |
| Current `sta_ani` | **Adotado** |

## Lifecycle

| Date | State | Event |
|---|---|---|
| 4 May | **Interno** | `sp_record_delivery` — rescue handoff, `delivery_employee` includes Tiago |
| 6 May | Interno | Awaiting client — Gonçalo registered |
| 8 May | **Adotado** | `fn_register_adoption` — `ownership` opened |

## Clinical & commercial

No consultations in launch window (healthy intake).  
Gonçalo bought toys 10 May — enrichment for Rogerim and Jonas.

## Validates

External delivery → waiting period → adoption constraint (`sta_ani` must be `Interno` before assign).

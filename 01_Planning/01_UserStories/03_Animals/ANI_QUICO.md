# Animal — Quico (dog, shelter)

> Handler: [Tiago](../02_People/Employees/EMP_TIAGO.md) · Source: [Resgate Minhoto](../04_External/EXT_RESCATE_MINHO.md)

| Field | Value |
|---|---|
| `sta_ani` | **Interno** |
| `ori_ani` | Abandonment — highway rest area |

## Lifecycle

| Date | Event |
|---|---|
| 4 May | `sp_register_animal` + `sp_record_delivery` |
| Ongoing | Awaiting adoption — kennel B-12 |

## Narrative

Quico represents **abandoned** intake (not owner surrender).  
Tiago documented anxiety; no appointment until adopted.

## Future hook

Demo seed may assign Quico to a new client in July — ownership not in May timeline.

## Validates

Rescue entity type; remains `Interno`; `fn_get_animal_history` delivery event.

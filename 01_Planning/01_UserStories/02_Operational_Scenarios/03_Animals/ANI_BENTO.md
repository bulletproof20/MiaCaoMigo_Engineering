# Animal — Bento (cat)

> Owner: [Ana Lourenço](../02_People/Customers/CLI_ANA_LOURENCO.md) · Clinician: [Marcelo](../02_People/Employees/EMP_J_MARCELO.md)

| Field | Value |
|---|---|
| `sta_ani` | **Falecido** |
| `ina_dat_ani` | 28 May 2026 |

## Lifecycle

| Date | State | Event |
|---|---|---|
| Pre-2026 | Adotado | Ana’s senior cat |
| 20 May | Adotado | Palliative consult `completed` |
| **28 May** | **Falecido** | Euthanasia in clinic — `sp_end_ownership` / status update |

## System notes

`fn_validate` paths treat `Falecido` like terminal for new scheduling.  
No new `appointment` after 28 May.

## Validates

Terminal animal state supported in Module 2 functions; emotional counterpoint to Pipoca adoption arc.

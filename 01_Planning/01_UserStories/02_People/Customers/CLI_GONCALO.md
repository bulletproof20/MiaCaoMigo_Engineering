# Customer — Gonçalo Rego

> Ecosystem: [00_ECOSYSTEM.md](../../00_ECOSYSTEM.md) · Timeline: [TIMELINE](../../01_Chronology/TIMELINE_LAUNCH_2026.md) · Animals: [Jonas](../../03_Animals/ANI_JONAS.md), [Rogerim](../../03_Animals/ANI_ROGERIM.md)

## Role

**cliente** — multi-workflow “anchor” customer: adoption, repeat retail, multi-specialty clinical, auth stress, future `scheduled` visit.

---

## Identity

| Field | Value |
|---|---|
| Email | goncalo.rego.dev@gmail.com |
| NIF | 000000006 |
| Registered | 6 May 2026 by [Ivo](../Employees/EMP_IVO.md) |
| `setup` | pt-pt, dark |

---

## Connected arcs

### Adoption & animals

| Date | Event | With |
|---|---|---|
| 4 May | Rogerim enters shelter | [Tiago](../Employees/EMP_TIAGO.md), [Patinhas](../../04_External/EXT_PATINHAS_AVE.md) |
| 8 May | Adopts Rogerim | Tiago |
| Ongoing | Owns Jonas (pre-existing `ownership`) | — |

### Purchases

| Date | Detail | Handler |
|---|---|---|
| 10 May | Food + toys | [Navarro](../Employees/EMP_J_NAVARRO.md) |
| 18 May | Dermatology diet after Jonas visit | Navarro |

### Consultations (Jonas)

| Date | `id_spe` | `status_app` |
|---|---|---|
| 12 May | geral | completed |
| 16 May | dermatology | completed |
| 10 Jun | dermatology | scheduled |

Reminder: **9 Jun 08:00** cron → [OPS notifications](../../05_Operations/OPS_NOTIFICATIONS.md).

### Authentication

23 May cluster: repeated **email** typos (`goncalo.rego.dev@gmai.com`, etc.) → `login_record` failures; rare password errors.

---

## Relationships

| Person | Interaction |
|---|---|
| Isabel | Desk greeting before account existed |
| Marcelo | Jonas clinician |
| Marta | Waiting-room acquaintance 17 May (ambient) |

---

## Validates

Client portal, email audit, shelter-to-home arc, appointment lifecycle, commercial linkage, cron reminders.

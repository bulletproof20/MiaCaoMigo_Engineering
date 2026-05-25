# Customer — Pedro Costa *(inactive)*

> Timeline: [TIMELINE](../../01_Chronology/TIMELINE_LAUNCH_2026.md) · OPS: [no_show](../../05_Operations/OPS_APPOINTMENT_STATES.md)

## Role

**cliente** (inactive from **2 Jun 2026**) — **`no_show`**, ignored notification, **cancelled** second chance, auth on inactive account.

---

## Identity

| Field | Value |
|---|---|
| Email | pedro.costa.dev@gmail.com |
| NIF | 000000010 |
| Registered | 7 May 2026 |
| `ina_dat_cli` | 2 Jun 2026 (Ivo — moved abroad) |

---

## Animal

**Thor** — dog, `Adotado`, remains in registry under inactive client (ownership not transferred in narrative — demo edge for reporting).

---

## Consultations

| Date | `status_app` | Context |
|---|---|---|
| 15 May 11:00 | **no_show** | Cron 16 May 00:05; reminder 14 May ignored |
| 22 May | **cancelled** | Client cancelled >24h before retry |

Marcelo freed slot; Isabel noted rude no-call-no-show in internal comment (`com_app`).

---

## Authentication

After 2 Jun: `login_user` returns `account_active=false` after valid password — audit row with `id_usr` set.

---

## Validates

`no_show` job, inactive client gate, notification without behaviour change, terminal appointment states on inactive account.

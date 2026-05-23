# Operations — Notifications

> Cron: `daily_appointment_warnings` at **08:00** · Procedure: `sp_generate_appointment_warnings`

Table: `appointment_notification` (`id_cli`, `id_app`, `msg_not`, `cre_tim_not`, `rea_not`).

---

## Tomorrow reminder (primary)

| Appointment | Client | Cron fire | Message intent |
|---|---|---|---|
| Tico 22 May | Isabel | 21 May 08:00 | Portuguese template with vet name + animal |
| Jonas 10 Jun | Gonçalo | 9 Jun 08:00 | Dermatology follow-up |
| Pipoca 12 Jun | Ana | 11 Jun 08:00 | Post-adoption check |

Source view: `vw_scheduled_appointments_tomorrow` (joins client, vet, animal names).

**Not sent** for: `cancelled`, `completed`, `no_show`, `in_progress`.

---

## Operational communication (same table)

Demo narrative may store desk-composed rows after cron (manual insert in seed) for:

| Event | Reader | Note |
|---|---|---|
| 15 May no-show | Pedro | Optional “we missed you” — API layer; not in cron SQL |
| 5 Jun overdue | Marta | Commercial module alert — may mirror as `msg_not` if product supports |

Distinguish in QA: **cron-generated** vs **application-generated** by `cre_tim_not` pattern and `msg_not` prefix.

---

## Customer behaviour

| Client | Behaviour |
|---|---|
| Gonçalo | Reads 9 Jun reminder; plans transport |
| Pedro | Ignores 14 May reminder → contributes to no-show |
| Isabel | Receives 21 May reminder as **client** for Tico |
| Marta | Reads reminder 16 May; still arrives late 17 May |

---

## Failed delivery scenarios

| Case | Cause |
|---|---|
| Inactive client | Pedro post-2 Jun — portal disabled; no new notifications |
| Wrong email | Gonçalo typos don't create notification rows (client id unresolved) |

---

## Related appointments

- [OPS_APPOINTMENT_STATES](OPS_APPOINTMENT_STATES.md)
- [CLI_GONCALO](../02_People/Customers/CLI_GONCALO.md)
- [EMP_CLI_ISABEL](../02_People/Employees/EMP_CLI_ISABEL.md)

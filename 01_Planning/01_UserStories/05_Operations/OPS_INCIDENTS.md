# Operations — Incidents & First-Week Mistakes

> Timeline: [TIMELINE_LAUNCH_2026.md](../01_Chronology/TIMELINE_LAUNCH_2026.md)

Human and system friction during clinic launch — all resolvable within implemented rules.

---

## HR & attendance

| Incident | People | System outcome |
|---|---|---|
| Isabel hired but absent 5–20 May | Isabel | `detected` × N; returns 21 May |
| Tiago chronic lateness | Tiago | `detected` 15, 16, 20 May |
| Ivo forgot hospital was approved | Ivo | 7 May approved vs 21 May duplicate gap confusion |
| Triple pending 25 May | Ivo, Tiago, Marcelo | Ivo batch review |
| Rejected absence example | Tiago | 26 May: `rejected` overlap with approved Marcelo block — `fn_block_absence_overlap_by_user` lesson |

---

## Authentication

| Incident | Actor | `login_record` |
|---|---|---|
| Gonçalo email typos | Client | `suc_log=false`, null `id_usr` |
| Marcelo password loop | Employee | false attempts then success |
| Pedro inactive login | Client | `account_active=false` after password OK |
| Session collision | Gonçalo | Second tab blocked `has_active_sessions` |

---

## Clinical / scheduling

| Incident | Fix |
|---|---|
| 11 May double scheduling pressure | Marcelo reschedules; Isabel apologizes |
| 13 May Felix delayed start | Waiting room; `in_progress` late |
| 15 May Pedro no-show | Cron `no_show` |
| 17 May Marta late | `late` label; visit completed |
| 24 May Marta cancel | `sp_cancel_appointment` success |

---

## Commercial

| Incident | Fix |
|---|---|
| Wrong toy SKU scanned | Navarro void line before payment |
| Marta return 18 May | `return` workflow |
| Pending PO blocking shelf | Receive 19 May |
| Overdue invoice 5 Jun | Marta payment chase |

---

## Animal welfare

| Incident | Fix |
|---|---|
| Quico escape attempt in kennel | Tiago log in `com_app` on later visit note |
| Max aggression → concession | `sp_process_concession` 20 May |
| Bento euthanasia 28 May | `sta_ani=Falecido`, `ina_dat_ani`, ownership end |

---

## Collaboration wins

| Day | Team moment |
|---|---|
| 8 May | Tiago + Ivo + Ana adoption paperwork same hour |
| 22 May | Isabel → Marcelo → Navarro single-chain Tico visit |
| 19 May | Navarro trains Isabel on return scanner |

---

## Archive contrast

[Bernardo](../02_People/Employees/EMP_BERNARDO.md) left no open incidents — only historical rows for regression tests.

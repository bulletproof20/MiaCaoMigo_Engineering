# Sprint 2 — RF traceability matrix (DataLayer)

Maps each **functional requirement (RF)** from [Sprint_2.pdf](../../01_Planning/00_Sprints/Sprint_2/APS/Sprint_2.pdf) to the current **`01_MiaCaoMigo_DataLayer`** implementation.

**Last aligned with:** DataLayer schema, services, and `QA/01_Integrity/` (Sprint 2 validation pass).

---

## Status legend

| Code | Meaning |
|------|---------|
| **IMP** | Implemented in DataLayer (DDL + rules and/or `sp_*`/`svc_*` + QA where applicable) |
| **PAR** | Partially implemented — model or workflow incomplete vs PDF |
| **API** | Delegated to application layer (BD stores outcome/hash only) |
| **NAO** | Not implemented in DataLayer |
| **INC** | Incompatible with current schema without migration |

**Evidence** paths are relative to `01_MiaCaoMigo_DataLayer/DataBase/` unless noted.

---

## Module 1 — User management (43 RF)

| RF | Summary | Status | Evidence / notes |
|----|---------|--------|------------------|
| RF_01 | Create client account | IMP | `Services/01_Module1/02_User_Creation/01_NewClient.sql`, `svc_create_client` |
| RF_02 | Create employee (institutional email) | IMP | `sp_create_employee`, `ck_ema_emp_format` |
| RF_03 | Max one active account per type | IMP | `uq_client_user`, `uq_employee_active_per_user` |
| RF_04 | Deactivate accounts preserving history | PAR | `ina_dat_cli`, `dea_dat_emp`; employee chain via `sp_renew_employee_record` |
| RF_05 | Authenticate email/password | IMP | `sp_auth_login`, `svc_auth_login`, `fn_validate_password` |
| RF_06 | Single active session | IMP | `uq_login_single_active_session_email`, `fn_has_active_sessions` |
| RF_07 | Record auth attempts (IP, result) | IMP | `login_record` |
| RF_08 | Record login/logout | IMP | `login_record.sig_tim_log` / `sou_tim_log` |
| RF_09 | Update personal data (individual) | PAR | `user_account` updatable; no dedicated `svc_*` |
| RF_10 | Shared data across accounts of same individual | IMP | One `id_usr` → client + employee possible |
| RF_11 | No personal data history | IMP | No PII history table (by design) |
| RF_12 | Change password with current validation | API | `fn_validate_password` on login only; no `sp_change_password` |
| RF_13 | Password stored as hash | API | `pas_cli`/`pas_emp`; hash produced in API (`Services/README.md`) |
| RF_14 | Password history | INC | No history table |
| RF_15 | Create/manage roles | PAR | `profile`; admin via seed/SQL, no `svc_*` CRUD |
| RF_16 | Multiple roles per employee | IMP | `occupies` |
| RF_17 | Permissions per role | IMP | `have` |
| RF_18 | Temporal role history (start/end) | INC | `occupies` has no validity interval |
| RF_19 | Responsible for role changes | INC | No `res` on `occupies` |
| RF_20 | Assign vet/assistant role | IMP | `sp_promote_*`, `veterinarian`/`assistant` |
| RF_21 | Max one active job function | IMP | Disjunction triggers vet vs assistant |
| RF_22 | Temporal job function history | PAR | `sp_renew_employee_record` / `dea_dat_emp`; not full assistant/vet history |
| RF_23 | Responsible for job changes | PAR | `aut_reg_emp`, `aut_ina_emp` on `employee` |
| RF_24 | Assistant subfunctions | IMP | `assistant.fun_ass` |
| RF_25 | OMV required; specialty optional | IMP | `num_omv_vet`, `expert` |
| RF_26 | Weekly schedule per employee | IMP | `schedule` |
| RF_27 | Multiple shifts/day, no overlap | IMP | `ex_schedule_overlap` (GiST); QA `06_Schedule_Exclusion.sql` |
| RF_28 | Update schedule | PAR | `svc_replicate_schedule` |
| RF_29 | Absence requests | PAR | `absence` table; no public submit `sp_*` |
| RF_30 | Absence states | PAR | Enum `absence_status`; lexical gap vs PDF (e.g. no *usufruída*) |
| RF_31 | Cancel absence up to 72h before | NAO | No SQL rule found |
| RF_32 | Absence state history | INC | Single `sta_abs` per row |
| RF_33 | Clock-in | IMP | `sp_clock_toggle`, `svc_clock_toggle` |
| RF_34 | Clock-out | IMP | Idem |
| RF_35 | Clock temporal consistency | IMP | `ck_clock_in_dates`, triggers |
| RF_36 | Prevent attendance deletion | PAR | No exposed delete; no explicit forbid trigger verified |
| RF_37 | Availability calculation | PAR | `tfn_block_appointment_if_vet_unavailable`, absence guards |
| RF_38 | Block activity during absence | PAR/API | Triggers M1/M4; permission exceptions → API |
| RF_39 | Theme and language | IMP | `setup` |
| RF_40 | Sync preferences across accounts | IMP | `setup` per `id_usr` |
| RF_41 | No preferences history | IMP | No `setup` history |
| RF_42 | GDPR erasure/anonymization | NAO | No procedures |
| RF_43 | Preserve legally required data | PAR | Inactivation + FK retention; no GDPR workflow |

---

## Module 2 — Animal management (19 RF)

| RF | Summary | Status | Evidence / notes |
|----|---------|--------|------------------|
| RF_01 | Register animal, unique id | IMP | `sp_register_animal`, `uq_reg_id_ani` |
| RF_02 | Species and breed | IMP | `species`, `breed`, species/breed triggers |
| RF_03 | Intake with origin | IMP | `sp_record_delivery`, `delivery`, `svc_register_delivery` |
| RF_04 | Initial clinical state on intake | PAR | `delivery.cli_sta_del` (free text) |
| RF_05 | Auto-create client on delivery | NAO | `sp_record_delivery` does not create client |
| RF_06 | Register external entities | PAR | `external_entity`; no `svc_*` workflow |
| RF_07 | Update animal state | IMP | `sta_ani`, `svc_animal_exit` |
| RF_08 | Each state change → new history row | INC | Only current `sta_ani` |
| RF_09 | Query state history | INC | No history table |
| RF_10 | Ownership assignment (adoption) | IMP | `sp_assign_ownership`, `svc_register_adoption` |
| RF_11 | Ownership period start/end | IMP | `ownership.sta_dat_own`, `end_dat_own` |
| RF_12 | Supervising employee on adoption | IMP | `p_id_emp` in procedures |
| RF_13 | Concession with reason | IMP | `sp_process_concession` |
| RF_14 | Clinical state on concession | PAR | `concession.cli_sta_con` |
| RF_15 | Concession stakeholders | PAR | `p_id_emp`; not full participant list like delivery |
| RF_16 | Ownership history | PAR | `svc_get_animal_history` (partial) |
| RF_17 | Event history (intake, adoption, concession) | PAR | Tables persist; unified history incomplete |
| RF_18 | Query origin | PAR | `delivery` + `id_ext_ent`; via joins/views |
| RF_19 | Inactivate animal with history | PAR | `ina_dat_ani`; no dedicated workflow |

**Gap:** `sp_register_animal` has no `svc_register_animal`.

---

## Module 3 — Commercial management (30 RF)

| RF | Summary | Status | Evidence / notes |
|----|---------|--------|------------------|
| RF_01 | Product CRUD | PAR | `product`, `ina_dat_pro`; no `svc_*` CRUD |
| RF_02 | Product family/category | IMP | `family`, FK on `product` |
| RF_03 | Price and VAT | IMP | `pri_pro`, `iva_pro` |
| RF_04 | Only active products in operations | IMP | `trg_prevent_inactive_product_sale` |
| RF_05 | Register supplier purchases | IMP | `purchase`, `sp_receive_purchase`, `svc_receive_purchase` |
| RF_06 | Purchase ↔ supplier | PAR | Soft ref / `id_ext_ent` |
| RF_07 | Purchase lines | IMP | `purchase_line` |
| RF_08 | Purchase payment/cost | PAR | `pay_met_pur` on `purchase` |
| RF_09 | Stock per batch on purchase | IMP | `stock` after receive |
| RF_10 | Quantity, entry date, batch expiry | IMP | `stock` columns |
| RF_11 | Stock updates (purchase/sale/return) | IMP | Triggers on `invoice_line`, `return` |
| RF_12 | Query stock | IMP | `fn_get_available_stock`, `svc_get_product_stock_level` |
| RF_13 | Register sale/consumption | PAR | Via `invoice_line` + triggers; no `sp_sale` |
| RF_14 | Validate stock before sale | IMP | `trg_check_stock_before_sale` |
| RF_15 | Link sale to appointment or direct | PAR | `invoice.id_app`, M4 `rel_app_product` |
| RF_16 | Manual/automatic batch selection | PAR | FIFO in `tfn_deduct_product_stock` |
| RF_17 | Generate invoice | PAR | `invoice` + lines; DemoData uses INSERT |
| RF_18 | Invoice ↔ appointment | IMP | `uq_invoice_appointment`, sync trigger |
| RF_19 | Multiple items per invoice | IMP | `invoice_line` |
| RF_20 | Auto totals and tax | IMP | `tfn_update_invoice_total` |
| RF_21 | Register payments | INC | No `payment` table |
| RF_22 | Payment method | PAR | `pay_met_pur` (purchases); sales lack dedicated method |
| RF_23 | Invoice states (pending/partial/paid) | PAR | Enum: no `partial` value |
| RF_24 | Returns | PAR | `return` + QA; no `sp_return`/`svc_return` |
| RF_25 | Return reason and date | IMP | `mot_ret`, `trg_set_return_return_date` |
| RF_26 | Stock after return | IMP | `trg_return_restock` |
| RF_27 | Purchase/sale/invoice/return history | PAR | Data exists; no reporting API |
| RF_28 | Filter transaction history | API | Application queries |
| RF_29 | Sales and billing reports | NAO | No reporting views/SP |
| RF_30 | Stock analysis / top products | PAR | `vw_products_to_reorder`, `sp_check_restock_needs` |

---

## Module 4 — Appointment management (17 RF)

| RF | Summary | Status | Evidence / notes |
|----|---------|--------|------------------|
| RF_01 | Register appointment | PAR | `sp_create_appointment`; **no** `svc_*` write |
| RF_02 | Start time before end | IMP | `ck_appointment_flow`, duration trigger |
| RF_03 | Anamnesis | IMP | `anamnesis` |
| RF_04 | Overall assessment (vitals) | IMP | `overall_assessment` |
| RF_05 | Start → in progress | IMP | `sp_start_appointment` |
| RF_06 | Final diagnosis | PAR | `appointment.dia_app` on end |
| RF_07 | Block completion without diagnosis | NAO | `sp_end_appointment` does not require `dia_app` |
| RF_08 | Prescriptions | IMP | `sp_prescription_for_appointment` |
| RF_09 | Products in appointment/prescription | IMP | `rel_app_product`, `rel_pre_prod` |
| RF_10 | Products only with stock | IMP | Stock deduction triggers |
| RF_11 | Appointment state lifecycle | IMP | `appointment_status`, `sp_*`, `jpr_auto_update_no_show` |
| RF_12 | Initially scheduled | IMP | Default `scheduled` |
| RF_13 | Block invalid transitions | IMP | `sp_*` checks, `tfn_prevent_completed_appointment_modification` |
| RF_14 | Cancel scheduled | IMP | `sp_cancel_appointment` |
| RF_15 | No-show | IMP | `jpr_auto_update_no_show_appointments` |
| RF_16 | Animal clinical history | PAR | `svc_list_animal_appointment_history`, views |
| RF_17 | Auto invoice on completion | NAO | `sp_end_appointment` does not create invoice |

**M4 public API:** read-only `svc_*` in `Services/04_Module4/99_Public_API/`.

**Business rule RN_01 (5th visit −30%):** **NAO** — not found in DataLayer.

---

## Summary counts

| Module | IMP | PAR | API | NAO | INC |
|--------|-----|-----|-----|-----|-----|
| M1 | 22 | 12 | 2 | 2 | 5 |
| M2 | 10 | 7 | 0 | 1 | 2 |
| M3 | 12 | 14 | 1 | 1 | 2 |
| M4 | 11 | 4 | 0 | 2 | 0 |
| **Total** | **55** | **37** | **3** | **6** | **9** |

---

## Simulation cross-links

| Capability | Operational doc |
|------------|-----------------|
| Appointments | [OPS_APPOINTMENT_STATES](../../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_APPOINTMENT_STATES.md) |
| Commercial | [OPS_COMMERCIAL](../../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_COMMERCIAL.md) |
| HR / absences | [OPS_INCIDENTS](../../01_Planning/01_UserStories/02_Operational_Scenarios/05_Operations/OPS_INCIDENTS.md) |
| Launch timeline | [TIMELINE_LAUNCH_2026](../../01_Planning/01_UserStories/02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md) |

---

[← Authoritative source](00_Authoritative_Source.md) · [Requirements hub](../README.md)

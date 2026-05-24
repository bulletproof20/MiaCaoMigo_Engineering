# Module 1 — Constraints

!!! info "Source of truth"
    Live DDL: `01_MiaCaoMigo_DataLayer/DataBase/Schema/01_Module1_User_Management/`.  
    This inventory reflects implemented constraint **names**; verify against SQL if the schema changes.

## Purpose

This document defines the structural integrity constraints adopted within Module 1 of the MiaCaoMigo database system.

The purpose of these constraints is to ensure:
- relational consistency;
- data validity;
- operational reliability;
- controlled entity relationships;
- prevention of invalid system states.

Integrity enforcement within Module 1 is distributed between:
- structural database constraints;
- procedural validation mechanisms;
- transactional integrity control.

This document focuses exclusively on declarative structural integrity mechanisms.

---

# Primary Keys

| Constraint | Applied To | Purpose | Ensures |
|---|---|---|---|
| `pk_user_account` | `user_account` | Unique user identification | Entity uniqueness |
| `pk_profile` | `profile` | Unique profile identification | Entity uniqueness |
| `pk_permission` | `permission` | Unique permission identification | Entity uniqueness |
| `pk_specialty` | `specialty` | Unique specialty identification | Entity uniqueness |
| `pk_employee` | `employee` | Unique employee identification | Entity uniqueness |
| `pk_assistant` | `assistant` | Employee specialization identification | Structural specialization integrity |
| `pk_veterinarian` | `veterinarian` | Employee specialization identification | Structural specialization integrity |
| `pk_expert` | `expert` | Veterinarian-specialty association identification | Specialization attribution integrity |
| `pk_client` | `client` | Surrogate primary key on `id_cli` (single-column PK; external FKs target `id_cli`) | Entity uniqueness |
| `pk_login_record` | `login_record` | Unique login record identification | Session traceability |
| `pk_schedule` | `schedule` | Unique schedule identification | Scheduling consistency |
| `pk_absence` | `absence` | Unique absence identification | Absence traceability |
| `pk_clock_in` | `clock_in` | Unique attendance identification | Attendance traceability |
| `pk_setup` | `setup` | Unique setup identification | Configuration consistency |
| `pk_occupies` | `occupies` | Employee-profile association identification | RBAC consistency |
| `pk_have` | `have` | Profile-permission association identification | Permission consistency |

---

# Foreign Keys

| Constraint | Applied To | Purpose | Ensures |
|---|---|---|---|
| `fk_employee_user` | `employee` | Associates employee with user account | Identity consistency |
| `fk_employee_aut_reg` | `employee` | Associates responsible registration employee | Audit traceability |
| `fk_employee_aut_ina` | `employee` | Associates responsible deactivation employee | Audit traceability |
| `fk_assistant_employee` | `assistant` | Associates assistant with employee | Specialization integrity |
| `fk_veterinarian_employee` | `veterinarian` | Associates veterinarian with employee | Specialization integrity |
| `fk_expert_veterinarian` | `expert` | Associates veterinarian specialization assignment with veterinarian | Clinical specialization consistency |
| `fk_expert_specialty` | `expert` | Associates veterinarian specialization assignment with specialty | Clinical specialization consistency |
| `fk_client_user` | `client` | Associates client with user account | Identity consistency |
| `fk_login_record_user` | `login_record` | Associates login record with user account | Authentication traceability |
| `fk_schedule_employee` | `schedule` | Associates schedule with employee | Workforce consistency |
| `fk_absence_employee` | `absence` | Associates absence with employee | Attendance integrity |
| `fk_absence_responsible` | `absence` | Associates responsible employee | Approval traceability |
| `fk_clock_employee` | `clock_in` | Associates attendance record with employee | Attendance consistency |
| `fk_setup_user` | `setup` | Associates setup with user account | User configuration consistency |
| `fk_occ_employee` | `occupies` | Associates employee with profile | RBAC consistency |
| `fk_occ_profile` | `occupies` | Associates profile with employee | RBAC consistency |
| `fk_have_profile` | `have` | Associates profile with permission | Access consistency |
| `fk_have_permission` | `have` | Associates permission with profile | Access consistency |

---

# Unique Constraints

| Constraint | Applied To | Purpose | Ensures |
|---|---|---|---|
| `uq_ema_usr` | `user_account` | Prevent duplicate personal emails | User uniqueness |
| `uq_nif_usr` | `user_account` | Prevent duplicate tax numbers | Legal identity uniqueness |
| `uq_nam_pro` | `profile` | Prevent duplicate profile names | RBAC consistency |
| `uq_nam_per` | `permission` | Prevent duplicate permission names | Access consistency |
| `uq_nam_spe` | `specialty` | Prevent duplicate specialty names | Clinical consistency |
| `uq_ema_emp` | `employee` | Prevent duplicate corporate emails | Employee uniqueness |
| `uq_num_omv_vet` | `veterinarian` | Prevent duplicate OMV registrations | Professional identity integrity |
| `uq_client_user` | `client` | At most one client row per user account | One-to-one `user_account` ↔ `client` |

---

# Check Constraints

## User Account

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_nam_usr_format` | Validates user name structure | Name consistency |
| `chk_nif_usr_format` | Validates tax number structure | Legal identity consistency |
| `chk_add_usr_format` | Validates address structure | Address consistency |
| `chk_pos_usr_format` | Validates postal code structure | Geographic consistency |
| `chk_pho_usr_format` | Validates phone number structure | Contact consistency |
| `chk_ema_usr_format` | Validates email structure | Authentication consistency |

---

## Profile

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_nam_pro_format` | Validates profile naming structure | RBAC consistency |

---

## Permission

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_nam_per_format` | Validates permission naming structure | Access consistency |

---

## Specialty

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_nam_spe_format` | Validates specialty naming structure | Clinical consistency |
| `chk_des_spe_format` | Validates specialty description | Data consistency |

---

## Employee

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_ema_emp_format` | Validates corporate email structure | Employee authentication consistency |
| `chk_pho_emp_format` | Validates professional phone structure | Contact consistency |
| `chk_pho_emg_format` | Validates emergency phone structure | Emergency contact consistency |
| `chk_pas_emp_format` | Validates password structure | Credential integrity |
| `chk_employee_dates` | Validates employee lifecycle timestamps | Temporal consistency |
| `chk_employee_inactivation` | Validates deactivation accountability | Audit consistency |

---

## Veterinarian

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_num_omv_vet_format` | Validates OMV registration structure | Professional consistency |

---

## Client

Declarative **one-to-one** with `user_account` is enforced by **`uq_client_user`** (`UNIQUE` on `id_usr`) in addition to **`fk_client_user`**.

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_pas_cli_format` | Validates password structure | Credential integrity |
| `chk_client_dates` | Validates client lifecycle timestamps | Temporal consistency |

---

## Login Record

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_login_time` | Validates login timestamps | Session consistency |
| `chk_login_email_format` | Validates login email structure | Authentication consistency |

---

## Schedule

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_schedule_day` | Restricts valid weekdays | Scheduling consistency |
| `chk_schedule_time` | Validates schedule intervals | Temporal consistency |

---

## Absence

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_absence_time` | Validates absence intervals | Temporal consistency |
| `chk_mot_abs_format` | Validates absence reason structure | Operational consistency |
| `chk_sta_abs` | Restricts valid absence states | Workflow consistency |

---

## Clock In

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_clock_time` | Validates attendance intervals | Attendance consistency |

---

## Setup

| Constraint | Purpose | Ensures |
|---|---|---|
| `chk_the_set_format` | Restricts valid themes | Configuration consistency |
| `chk_lan_set_format` | Validates language structure | Localization consistency |

---

# Exclusion Constraints

| Constraint | Applied To | Purpose | Ensures |
|---|---|---|---|
| `ex_schedule_overlap` | `schedule` | Prevent overlapping employee schedules | Temporal consistency |
| `ex_absence_overlap` | `absence` | Prevent overlapping employee absences | Temporal consistency |

---

# Indexes

| Index | Applied To | Purpose |
|---|---|---|
| `idx_ema_usr` | `user_account` | Optimize authentication lookups |
| `idx_ema_emp` | `employee` | Optimize employee lookup operations |
| `idx_num_omv_vet` | `veterinarian` | Optimize veterinarian lookup operations |
| `idx_schedule_employee` | `schedule` | Optimize schedule filtering |
| `idx_absence_employee` | `absence` | Optimize absence filtering |
| `idx_clock_employee` | `clock_in` | Optimize attendance filtering |

---

# Constraint Strategy

Module 1 adopts a hybrid structural integrity strategy where constraints are used to enforce:
- entity consistency;
- relationship validity;
- temporal consistency;
- authentication reliability;
- operational traceability;
- access control integrity.

Structural constraints are complemented by:
- triggers;
- procedural validation;
- transactional enforcement;
- operational workflows.

This layered integrity approach reduces invalid states while preserving operational flexibility.

---

# Structural Consistency

All structural integrity mechanisms must:
- preserve semantic consistency;
- preserve relational clarity;
- preserve operational reliability;
- preserve structural maintainability.

Any new structural integrity mechanism introduced into the module must first be standardized and documented before adoption.

---

# Naming Exceptions

## Contextual Expansion Rules

In specific scenarios where semantic ambiguity or contextual redundancy may occur, additional contextual identifiers may be appended to preserve naming clarity and relational distinction.

This contextual expansion must:
- remain semantically consistent;
- preserve the compact naming philosophy;
- avoid unnecessary verbosity;
- remain structurally standardized.

---

# Dictionary Standardization

All constraints, indexes, abbreviations and structural identifiers must be formally documented within the system dictionary.

The dictionary is responsible for defining:
- semantic meanings;
- approved abbreviations;
- contextual identifiers;
- structural references;
- integrity descriptions.

The naming convention defines the structural philosophy.  
The dictionary defines the semantic interpretation.
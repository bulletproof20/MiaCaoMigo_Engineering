# Module 4 — Appointment Management

## Overview

This document presents the entities and attributes implemented in Module 4 of the MiaCaoMigo System.

The module is responsible for:
- scheduling and managing veterinary appointments
- recording clinical assessments (anamnesis, overall assessment)
- managing prescriptions and associated products
- linking appointments to animals, clients, employees (veterinarians), and specialties

For each attribute, the following information is documented:
- attribute name
- physical name
- description

---

# 1. appointment

Stores details about scheduled and completed veterinary appointments.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Appointment Identifier | id_app | Unique identifier for the appointment record. |
| Animal Identifier | id_animal | Foreign key to the `animal` table, identifying the animal for this appointment. |
| Employee Identifier | id_emp | Foreign key to the `employee` table, identifying the veterinarian or employee conducting the appointment. |
| Client Identifier | id_cli | Foreign key to the `client` table, identifying the client associated with the animal. |
| Specialty Identifier | id_spe | Foreign key to the `specialty` table, indicating the specialty of the appointment. |
| Scheduled Date/Time | sch_dat_app | The date and time the appointment is scheduled to occur. |
| Start Date/Time | sta_dat_app | The actual date and time the appointment started. |
| End Date/Time | end_dat_app | The actual date and time the appointment ended. |
| Appointment Status | status_app | The current status of the appointment (e.g., 'Scheduled', 'Completed', 'Canceled'). |
| Diagnosis | dia_app | The diagnosis made during the appointment. |
| Comments | com_app | General comments or notes related to the appointment. |

---

# 2. overall_assessment

Records the animal's general physical assessment during an appointment.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Appointment Identifier | id_app | Foreign key to the `appointment` table, linking the assessment to a specific appointment. Also serves as the primary key. |
| Body Temperature | body_temp | The animal's body temperature recorded during the assessment. |
| Weight | weight | The animal's weight recorded during the assessment. |
| Heart Rate | hrt_rate | The animal's heart rate recorded during the assessment. |
| Respiratory Rate | resp_rate | The animal's respiratory rate recorded during the assessment. |
| General Status | general_status | A textual description of the animal's general health status. |

---

# 3. anamnesis

Stores the animal's medical history and symptoms reported by the owner for an appointment.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Appointment Identifier | id_app | Foreign key to the `appointment` table, linking the anamnesis to a specific appointment. Also serves as the primary key. |
| Anamnesis Description | des_ana | Detailed description of the animal's medical history and symptoms reported by the owner. |

---

# 4. prescription

Contains details about treatments or medications prescribed during an appointment.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Prescription Identifier | id_pre | Unique identifier for a prescription. |
| Appointment Identifier | id_app | Foreign key to the `appointment` table, linking the prescription to a specific appointment. |
| Prescription Description | des_pre | Detailed description of the prescribed treatment or medication. |

---

# 5. rel_app_product

Associates products used or recommended directly during an appointment.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Appointment Identifier | id_app | Foreign key to the `appointment` table, part of the composite primary key. |
| Product Identifier | id_pro | Foreign key to the `product` table, part of the composite primary key. |
| Quantity Used | qty_pre_pro | The quantity of the product used or recommended during the appointment. |
| Dosage/Application | dos_pre_pro | Instructions for dosage or application of the product. |

---

# 6. rel_pre_prod

Associates products that are part of a specific prescription.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Prescription Identifier | id_pre | Foreign key to the `prescription` table, part of the composite primary key. |
| Product Identifier | id_pro | Foreign key to the `product` table, part of the composite primary key. |
| Quantity Prescribed | qty_pre_pro | The quantity of the product prescribed as part of this prescription. |
| Dosage/Application | dos_pre_pro | Instructions for dosage or application of the product within the prescription. |

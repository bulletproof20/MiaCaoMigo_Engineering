# Employee Story — Ivo Sá

## Overview

Ivo Sá joined the clinic as an internal administrative employee on May 1st.  
He does not possess any medical or veterinary specialization and is exclusively responsible for internal human resources and user management operations within the system.

The employee account was originally created by the base system administrator defined in the master data.

---

# Personal Information

| Field | Value |
|---|---|
| Full Name | Ivo Sá |
| Gender | Male |
| Email | ivo.dev@gmail.com |
| Phone Number | +351911911911 |
| Tax Number | 000000001 |
| Address | Campus do IPCA, Vila Frescaínha S. Martinho |
| Postal Code | 4750-810 Barcelos |
| Preferred Language | English |
| Preferred Theme | Dark Mode |

---

# Employment Information

| Field | Value |
|---|---|
| Role | Internal Administrative Employee |
| Department | Human Resources & User Management |
| Employment Start Date | May 1st |
| Current Status | Active |

---

# Permissions & Responsibilities

Ivo Sá is responsible for internal administrative operations related to employee and platform management.

His permissions include:

- Creating internal employee accounts
- Updating employee information
- Inactivating employees
- Managing roles and profiles
- Managing permissions
- Managing work schedules
- Managing absences
- Approving or rejecting absence requests
- Viewing login activity
- Viewing clock-in and clock-out records
- Managing internal HR-related operations

Although he is allowed to consult customer records, he cannot access animal-specific information.  
The system only allows him to visualize the number of animals associated with each customer, without exposing animal details.

He does not perform any veterinary, medical, financial, or operational clinic tasks outside administrative management.

---

# Initial Work Schedule

The employee's original schedule started on May 1st.

## Monday to Friday

| Period | Time |
|---|---|
| Morning | 08:00 - 12:00 |
| Afternoon | 14:00 - 18:00 |

## Saturday

| Period | Time |
|---|---|
| Full Shift | 10:00 - 15:00 |

---

# Updated Work Schedule

On May 20th, the employee schedule was updated.

## Monday, Tuesday, Thursday and Friday

| Period | Time |
|---|---|
| Morning | 08:00 - 12:00 |
| Afternoon | 14:00 - 18:00 |

## Wednesday

| Period | Time |
|---|---|
| Afternoon Only | 12:00 - 18:00 |

## Saturday

| Period | Time |
|---|---|
| Full Shift | 08:00 - 15:00 |

---

# Attendance & Clock Records

The employee consistently performs daily clock-in and clock-out operations.

Observed attendance patterns include:

- Clock-in operations ranging from:
  - 10 minutes early
  - up to 15 minutes late

- Clock-out operations consistently occurring:
  - between 10 minutes
  - and 1 hour after scheduled shift ending

These variations occur naturally and are intentionally preserved within the demo dataset to simulate realistic employee behavior.

---

# Absence History

## Approved Absence — May 7th

The employee submitted an absence request in advance.

| Field | Value |
|---|---|
| Status | Approved |
| Reason | Hospital appointment |

The absence was reviewed and approved through the HR workflow.

---

## Automatic Absence — May 21st

The employee was unable to attend work and did not perform a clock-in operation.

After the scheduled shift ending time was reached, the system automatically generated an absence record.

| Field | Value |
|---|---|
| Status | Automatically Generated |
| Justification | Pending |

This event exists to validate automated attendance monitoring and HR absence generation logic.

---

## Pending Absence Request — May 25th

A future absence request is currently pending review.

| Field | Value |
|---|---|
| Status | Pending Approval |
| Reason | Academic presentation defense |
| Affected Period | Afternoon Shift |

---

# Authentication & Login Behavior

The employee frequently forgets passwords and commonly performs at least one failed password attempt before successfully authenticating into the platform.

This behavior intentionally exists in the dataset to validate:

- Failed authentication logging
- Security monitoring
- Login attempt tracking
- Audit trail generation
- Session history records

---

# System Usage Profile

The employee exclusively interacts with internal administrative modules and HR-related functionality.

Typical actions include:

- Employee onboarding
- Permission management
- Profile administration
- Schedule management
- Attendance verification
- Login auditing
- Clock-in monitoring
- Absence approval workflows

No medical or veterinary actions are associated with this employee account.

---

# Dataset Purpose

This employee story exists to simulate a realistic internal administrative user within the clinic ecosystem.

The dataset supports validation of:

- Role-based access control (RBAC)
- Authentication systems
- HR workflows
- Schedule versioning
- Attendance monitoring
- Automated absence generation
- Audit logs
- Permission systems
- Employee lifecycle management
- Internal administrative operations
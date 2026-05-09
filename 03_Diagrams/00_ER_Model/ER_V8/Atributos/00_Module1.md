# Module 1 — Authentication and Access Management

## Overview

This document presents the entities and attributes implemented in Module 1 of the MiaCaoMigo System.

The module is responsible for:
- user authentication
- access control
- employee lifecycle management
- operational scheduling
- attendance monitoring
- login auditing
- user configuration and preferences

For each attribute, the following information is documented:
- attribute name
- physical name
- description

---

# 1. user_account

Stores general personal, contact, and identification information shared by all system users.

| Attribute Name | Physical Name | Description |
|---|---|---|
| User Identifier | id_usr | Unique identifier associated with the user account within the system. |
| User Full Name | nam_usr | Full legal name of the user used for identification and operational records. |
| User Address | add_usr | Residential or registered address associated with the user account. |
| User Postal Code | pos_usr | Postal code linked to the user address, following the national formatting standard. |
| User Tax Identification Number | nif_usr | Official Portuguese tax identification number associated with the user. |
| User Personal Phone Number | pho_usr | Personal contact phone number used for communication and operational purposes. |
| User Personal Email Address | ema_usr | Personal email address associated with the user account, excluding corporate domains. |

---

# 2. profile

Defines operational access profiles used to organize system permissions and responsibilities.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Profile Identifier | id_pro | Unique identifier associated with the operational profile. |
| Profile Name | nam_pro | Normalized name used to identify the access profile within the system. |
| Profile Description | des_pro | Detailed description of the responsibilities and operational scope associated with the profile. |

---

# 3. permission

Defines granular permissions used to control access to system functionalities and operations.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Permission Identifier | id_per | Unique identifier associated with the permission. |
| Permission Name | nam_per | Normalized name used to identify the permission within the authorization system. |
| Permission Description | des_per | Description of the operational capability or system action controlled by the permission. |

---

# 4. specialty

Defines veterinary and operational specialties associated with professional activities.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Specialty Identifier | id_spe | Unique identifier associated with the specialty. |
| Specialty Name | nam_spe | Name used to identify the veterinary or operational specialty. |
| Specialty Description | des_spe | Description of the specialty scope, responsibilities, and professional area. |

---

# 5. employee

Stores authentication, operational, and lifecycle information related to employees.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Employee Identifier | id_emp | Unique identifier associated with the employee record. |
| Associated User Identifier | id_usr | Identifies the user account associated with the employee. |
| Employee Registration Timestamp | reg_dat_emp | Date and time when the employee account was officially registered in the system. |
| Registration Responsible Employee | aut_reg_emp | Identifies the employee responsible for creating and validating the employee registration. |
| Employee Deactivation Timestamp | dea_dat_emp | Date and time when the employee account was deactivated or removed from operational activity. |
| Deactivation Responsible Employee | aut_ina_emp | Identifies the employee responsible for authorizing or performing the employee deactivation. |
| Professional Phone Number | pho_emp | Professional contact number used for operational communication purposes. |
| Emergency Contact Phone Number | pho_emg | Emergency contact number associated with the employee for urgent situations. |
| Corporate Email Address | ema_emp | Corporate email address assigned to the employee for institutional communication and authentication. |
| Employee Authentication Password | pas_emp | Encrypted authentication credential used by the employee to securely access the system. |

---

# 6. assistant

Defines assistant employees and their operational functions within the organization.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Employee Identifier | id_emp | Identifies the employee associated with the assistant role. |
| Assistant Function | fun_ass | Operational role or function performed by the assistant within the organization. |

---

# 7. veterinarian

Defines veterinarian employees and their professional specialization.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Employee Identifier | id_emp | Identifies the employee associated with the veterinarian role. |
| Veterinarian Registration Number | num_omv_vet | Official professional registration number associated with the veterinarian. |
| Specialty Identifier | id_spe | Identifies the specialty associated with the veterinarian professional activity. |

---

# 8. client

Stores authentication and lifecycle information associated with system clients.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Client Identifier | id_cli | Unique identifier associated with the client record. |
| Associated User Identifier | id_usr | Identifies the user account associated with the client. |
| Client Authentication Password | pas_cli | Encrypted authentication credential used by the client to securely access the system. |
| Client Registration Timestamp | reg_dat_cli | Date and time when the client account was registered in the system. |
| Client Inactivation Timestamp | ina_dat_cli | Date and time when the client account became inactive within the system. |

---

# 9. login_record

Stores authentication attempts, session activity, and login audit history.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Login Record Identifier | id_log | Unique identifier associated with the authentication record. |
| Sign-In Timestamp | sig_tim_log | Date and time when the authentication attempt or session started. |
| Sign-Out Timestamp | sou_tim_log | Date and time when the authenticated session was terminated. |
| Login Success Status | suc_log | Indicates whether the authentication attempt was successful or rejected. |
| Login IP Address | ip_add_log | Stores the IP address associated with the authentication attempt for auditing and security analysis purposes. |
| Authentication Email Snapshot | eml_usr | Email address used during the authentication attempt, stored for auditing purposes. |
| Associated User Identifier | id_usr | Identifies the user account associated with the authentication record whenever applicable. |

---

# 10. schedule

Defines recurring weekly schedules associated with employee operational activity.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Employee Identifier | id_emp | Identifies the employee associated with the schedule entry. |
| Schedule Weekday | day_wee_sch | Defines the weekday associated with the operational schedule entry. |
| Schedule Start Time | sta_tim_sch | Time when the scheduled operational period begins. |
| Schedule End Time | fin_hou_sch | Time when the scheduled operational period ends. |

---

# 11. absence

Stores employee absences, interruptions, and operational validation information.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Absence Identifier | id_abs | Unique identifier associated with the absence record. |
| Employee Identifier | id_emp | Identifies the employee associated with the absence. |
| Absence Start Timestamp | sta_dat_tim_abs | Date and time when the absence period begins. |
| Absence End Timestamp | end_dat_tim_abs | Date and time when the absence period ends. |
| Absence Reason | mot_abs | Description or classification of the operational reason associated with the absence. |
| Absence Status | sta_abs | Current operational state associated with the absence process. |
| Responsible Employee Identifier | res_abs | Identifies the employee responsible for reviewing, validating, or resolving the absence. |
| Absence Creation Timestamp | cre_tim_abs | Date and time when the absence record was created in the system. |

---

# 12. clock_in

Stores employee attendance intervals and operational presence records.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Attendance Record Identifier | id_clk | Unique identifier associated with the attendance record. |
| Employee Identifier | id_emp | Identifies the employee associated with the attendance interval. |
| Attendance Start Timestamp | sta_dat_clk | Date and time when the employee operational attendance period started. |
| Attendance End Timestamp | end_dat_clk | Date and time when the employee operational attendance period ended. |

---

# 13. setup

Stores user interface preferences and configuration settings associated with user accounts.

| Attribute Name | Physical Name | Description |
|---|---|---|
| User Identifier | id_usr | Identifies the user account associated with the configuration settings. |
| Interface Theme Preference | the_set | Defines the preferred visual theme used in the system interface. |
| Interface Language Preference | lan_set | Defines the preferred language used in the system interface. |

---

# 14. occupies

Associates employees with operational access profiles.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Employee Identifier | id_emp | Identifies the employee associated with the operational profile. |
| Profile Identifier | id_pro | Identifies the access profile associated with the employee. |

---

# 15. have

Associates operational profiles with system permissions.

| Attribute Name | Physical Name | Description |
|---|---|---|
| Profile Identifier | id_pro | Identifies the profile associated with the permission assignment. |
| Permission Identifier | id_per | Identifies the permission associated with the operational profile. |
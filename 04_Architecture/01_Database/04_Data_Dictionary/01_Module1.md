# Module 1 — User Management Data Dictionary

---

# 1. USER_ACCOUNT

Stores general personal data of any system user.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_usr | User Identifier | Unique user identifier | PK |
| nam_usr | User Name | Full user name | |
| add_usr | User Address | User address | |
| pos_usr | Postal Code | User postal code | |
| nif_usr | Tax Number | User tax identification number | AK |
| pho_usr | Personal Phone | User personal phone number | |
| ema_usr | Personal Email | User personal email address | AK |

---

# 2. PROFILE

Defines user roles within the system.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_pro | Profile Identifier | Unique profile identifier | PK |
| nam_pro | Profile Name | Profile name | AK |
| des_pro | Profile Description | Profile description | |

---

# 3. PERMISSION

Defines granular access permissions.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_per | Permission Identifier | Unique permission identifier | PK |
| nam_per | Permission Name | Permission name | AK |
| des_per | Permission Description | Permission description | |

---

# 4. SPECIALTY

Defines veterinary specialties associated with veterinarians.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_spe | Specialty Identifier | Unique specialty identifier | PK |
| nam_spe | Specialty Name | Specialty name | AK |
| des_spe | Specialty Description | Specialty description | |

---

# 5. EMPLOYEE

Represents operational employee records and employment lifecycle history.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Unique employee record identifier | PK |
| id_usr | User Identifier | Associated user identifier | FK |
| reg_dat_emp | Registration Timestamp | Employee registration timestamp | |
| aut_reg_emp | Registration Responsible | Employee responsible for employee creation | SFK |
| dea_dat_emp | Deactivation Timestamp | Employee deactivation timestamp | |
| aut_ina_emp | Deactivation Responsible | Employee responsible for deactivation | SFK |
| pho_emp | Professional Phone | Professional phone number | |
| pho_emg | Emergency Phone | Emergency contact phone number | |
| ema_emp | Corporate Email | Corporate email address | AK |
| pas_emp | Password Hash | Employee password hash | |

---

# 6. ASSISTANT

Represents assistant employees and their operational functions.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Associated employee identifier | PK / FK |
| fun_ass | Assistant Function | Assistant operational function | |

---

# 7. VETERINARIAN

Represents veterinarian employees and their professional specialization.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Associated employee identifier | PK / FK |
| num_omv_vet | OMV Registration Number | Veterinary professional registration number | AK |

---

# 8. EXPERT

Associates veterinarians with one or more specialties.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Associated veterinarian employee identifier | CPK / FK |
| id_spe | Specialty Identifier | Associated specialty identifier | CPK / FK |

---

# 9. CLIENT

Represents system clients and their authentication data.

Each client row is identified by a **surrogate primary key** `id_cli`. The association with `user_account` is **one-to-one**: each `user_account` may appear in at most one client row, enforced declaratively by **`uq_client_user` (`UNIQUE` on `id_usr`)** together with **`fk_client_user`**. Other modules reference the client entity by **`id_cli`** (single-column foreign keys).

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_cli | Client Identifier | Unique client identifier | PK |
| id_usr | User Identifier | Associated user identifier; at most one client per user | FK, AK |
| pas_cli | Password Hash | Client password hash | |
| reg_dat_cli | Registration Timestamp | Client registration timestamp | |
| ina_dat_cli | Inactivation Timestamp | Client inactivation timestamp | |

---

# 10. LOGIN_RECORD

Stores authentication attempts and session activity history.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_log | Login Record Identifier | Unique login record identifier | PK |
| sig_tim_log | Login Timestamp | Login timestamp | |
| sou_tim_log | Logout Timestamp | Logout timestamp | |
| suc_log | Success Status | Login success status | |
| ip_add_log | IP Address | Authentication IP address | |
| eml_usr | Email Snapshot | Email used during authentication | |
| id_usr | User Identifier | Associated user identifier | FK |

---

# 11. SCHEDULE

Defines weekly planned working schedules for employees.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Associated employee identifier | CPK / FK |
| day_wee_sch | Weekday | Weekday number | CPK |
| sta_tim_sch | Start Time | Scheduled start time | CPK |
| fin_hou_sch | End Time | Scheduled end time | |

---

# 12. ABSENCE

Represents employee absences, including past absences and future absence requests.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_abs | Absence Identifier | Unique absence identifier | PK |
| id_emp | Employee Identifier | Associated employee identifier | FK |
| sta_dat_tim_abs | Start Timestamp | Absence start timestamp | |
| end_dat_tim_abs | End Timestamp | Absence end timestamp | |
| mot_abs | Absence Reason | Absence reason or justification | |
| sta_abs | Absence Status | Operational absence state | |
| res_abs | Responsible Employee | Employee responsible for approval or validation | FK |
| cre_tim_abs | Creation Timestamp | Absence creation timestamp | |

---

# 13. CLOCK_IN

Stores employee attendance records, including entry and exit timestamps.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_clk | Clock-In Identifier | Unique attendance record identifier | PK |
| id_emp | Employee Identifier | Associated employee identifier | FK |
| sta_dat_clk | Clock-In Timestamp | Employee entry timestamp | |
| end_dat_clk | Clock-Out Timestamp | Employee exit timestamp | |

---

# 14. SETUP

Stores user interface and application preference configurations.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_usr | User Identifier | Associated user identifier | PK / FK |
| the_set | Theme Setting | User interface theme configuration | |
| lan_set | Language Setting | User language configuration | |

---

# 15. OCCUPIES

Associates employees with operational system profiles.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_emp | Employee Identifier | Associated employee identifier | CPK / FK |
| id_pro | Profile Identifier | Associated profile identifier | CPK / FK |

---

# 16. HAVE

Associates profiles with system permissions.

| Attribute | Name | Description | Key Type |
|---|---|---|---|
| id_pro | Profile Identifier | Associated profile identifier | CPK / FK |
| id_per | Permission Identifier | Associated permission identifier | CPK / FK |
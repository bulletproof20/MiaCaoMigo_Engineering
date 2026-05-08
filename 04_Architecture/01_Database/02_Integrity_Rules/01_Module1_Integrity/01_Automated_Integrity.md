# Module 1 — Automated Integrity

## Purpose

This document defines the automated integrity mechanisms adopted within Module 1 of the MiaCaoMigo database system.

Automated integrity mechanisms are responsible for:
- automatic validation enforcement;
- operational consistency;
- temporal consistency;
- credential protection;
- audit maintenance;
- prevention of invalid operational states.

This document follows the global integrity strategy defined for the MiaCaoMigo database system.

---

# Trigger Strategy

Triggers are used to:
- automate validation logic;
- enforce operational consistency;
- preserve relational integrity;
- reduce invalid transactional behavior.

Triggers execute automatically during:
- INSERT operations;
- UPDATE operations;
- DELETE operations.

Validation failures intentionally abort the active transaction in order to preserve operational consistency and relational integrity.

---

# Triggers

| Trigger | Event | Timing | Purpose | Ensures |
|---|---|---|---|---|
| `trg_hash_password_employee` | INSERT / UPDATE | BEFORE | Automatically hash employee passwords before persistence | Credential security |
| `trg_hash_password_client` | INSERT / UPDATE | BEFORE | Automatically hash client passwords before persistence | Credential security |
| `trg_normalize_email_user` | INSERT / UPDATE | BEFORE | Normalize personal email formatting | Authentication consistency |
| `trg_normalize_email_employee` | INSERT / UPDATE | BEFORE | Normalize corporate email formatting | Operational consistency |
| `trg_validate_employee_state` | UPDATE | BEFORE | Validate employee lifecycle transitions | Operational integrity |
| `trg_validate_absence_state` | INSERT / UPDATE | BEFORE | Validate absence workflow states | Workflow consistency |
| `trg_prevent_invalid_schedule` | INSERT / UPDATE | BEFORE | Prevent invalid scheduling operations | Temporal consistency |
| `trg_register_audit_timestamp` | INSERT / UPDATE | BEFORE | Automatically maintain audit timestamps | Operational traceability |

---

# Scheduled Job Strategy

Scheduled jobs are used to:
- automate recurring validation;
- preserve long-term consistency;
- maintain operational reliability;
- reduce manual maintenance operations.

Jobs execute independently from direct user interaction and reinforce continuous operational consistency.

---

# Scheduled Jobs

| Job | Schedule | Purpose | Ensures |
|---|---|---|---|
| `job_expire_sessions` | Scheduled Interval | Automatically invalidate expired sessions | Authentication consistency |
| `job_validate_schedule_conflicts` | Scheduled Interval | Detect unresolved scheduling inconsistencies | Temporal integrity |
| `job_cleanup_login_records` | Scheduled Interval | Maintain controlled authentication history | Audit maintainability |
| `job_attendance_validation` | Scheduled Interval | Validate attendance consistency | Workforce consistency |
| `job_operational_audit_check` | Scheduled Interval | Verify operational auditing integrity | Traceability consistency |

---

# Automated Transaction Protection

Automated integrity mechanisms may intentionally interrupt transactional execution when invalid operational states are detected.

This behavior ensures:
- rollback of invalid operations;
- preservation of relational consistency;
- prevention of partial invalid states.

Transaction abortion on integrity violations is considered expected operational behavior and represents a core component of the system integrity strategy.

---

# Temporal Integrity Automation

Temporal consistency is reinforced through automated mechanisms responsible for:
- schedule validation;
- overlap prevention;
- absence consistency;
- operational interval validation.

These mechanisms operate together with:
- exclusion constraints;
- procedural validation;
- transactional enforcement.

This layered approach improves reliability in scheduling-related operations.
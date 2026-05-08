# SQL Standards

## Objective

This document defines the SQL writing and organization standards used throughout the MiaCaoMigo database project.

Its purpose is to ensure:
- consistency;
- readability;
- maintainability;
- modularity;
- scalability.

---

# 1. General Formatting

## 1.1 SQL Keywords

All SQL keywords must be written in lowercase.

### Example

```sql
create table employee (
    id_emp int primary key
);
```

---

## 1.2 Indentation

Use 4 spaces for indentation.

---

## 1.3 Line Breaks

Each column, constraint, and major clause must be written on separate lines.

---

## 1.4 Section Separation

Major sections must be separated using standardized comment blocks.

### Example

```sql
--=========================================================
-- 1. USER_ACCOUNT
--=========================================================
```

---

# 2. File Organization

## 2.1 Module Structure

Each module must follow the standardized file structure.

### Example

```text
00_Tables
01_Functions
02_Triggers
03_Indexes
04_Procedures
05_Jobs
06_Queries
```

---

## 2.2 Execution Order

Database objects must be created in dependency order:

1. tables  
2. foreign keys  
3. functions  
4. triggers  
5. indexes  
6. procedures  
7. jobs  

---

# 3. Constraint Organization

Constraints should follow this order whenever applicable:

1. primary keys  
2. unique constraints  
3. check constraints  
4. foreign keys  

---

# 4. Query Standards

## 4.1 Avoid `select *`

Explicit column selection must always be preferred.

### Correct

```sql
select id_usr, nam_usr
from user_account;
```

---

## 4.2 Aliases

Aliases must remain short, meaningful, and consistent.

### Example

```sql
from employee e
join user_account u
```

---

# 5. Trigger Standards

Triggers should only be used for:
- integrity enforcement;
- contextual validation;
- automatic consistency control.

---

# 6. Procedure Standards

Procedures are intended for:
- operational workflows;
- automation;
- scheduled processing;
- system maintenance operations.

---

# 7. Index Standards

Indexes should only be created when necessary for:
- integrity enforcement;
- performance optimization;
- exclusion constraints.

Partial indexes should be preferred when applicable.

---

# 8. Comment Standards

All major database objects should contain:
- purpose description;
- operational context;
- integrity explanation when applicable.
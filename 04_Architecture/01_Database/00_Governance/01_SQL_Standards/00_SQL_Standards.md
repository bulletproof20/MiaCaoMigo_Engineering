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
00_Tables_ModX.sql
01_ForeignKeys_ModX.sql
02_Functions_ModX.sql
03_Triggers_ModX.sql
04_Indexes_ModX.sql
05_Procedures_ModX.sql
06_Jobs_ModX.sql
```

Reusable query packs (if any) live outside this numbering, typically under `01_MiaCaoMigo_DataLayer/DataBase/Queries/`, and are reference-only unless explicitly wired into a profile.

---

## 2.2 Execution Order

Database objects must be created in dependency order:

1. tables (`00_Tables_ModX.sql`, all modules)  
2. foreign keys (`01_ForeignKeys_ModX.sql`, all modules)  
3. functions (`02_Functions_ModX.sql`)  
4. triggers (`03_Triggers_ModX.sql`)  
5. indexes / exclusion constraints (`04_Indexes_ModX.sql`)  
6. procedures (`05_Procedures_ModX.sql`)  
7. jobs (`06_Jobs_ModX.sql`)  

See also: `00_Schema_Build_Pipeline.md`.

---

# 3. Constraint Organization

Inside `00_Tables_ModX.sql`, constraints should follow this order whenever applicable:

1. primary keys  
2. unique constraints  
3. check constraints  

**Foreign keys** are declared only in `01_ForeignKeys_ModX.sql` (via `ALTER TABLE … ADD CONSTRAINT`) after all tables exist.

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
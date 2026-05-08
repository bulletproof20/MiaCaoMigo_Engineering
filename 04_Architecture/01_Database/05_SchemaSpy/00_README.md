# SchemaSpy — Database Documentation Generator

## Overview

This module is responsible for automatically generating relational database documentation using SchemaSpy.

The generated documentation includes:

* Entity Relationship Diagrams (ERD)
* Tables
* Columns
* Primary Keys
* Foreign Keys
* Constraints
* Indexes
* Relationships
* Database Metadata

The generated output is intended for:

* Architecture analysis
* Database visualization
* Development support
* Technical documentation
* Team onboarding

---

# Folder Structure

```text
05_SchemaSpy/
├── 01_Scripts/
│    ├── generate_docs.ps1
│    ├── generate_docs.sh
│    └── README.md
│
├── 02_Output/
│    └── index.html
```

---

# Requirements

Before generating the documentation, ensure the following:

* Docker Desktop is installed
* Docker Engine is running
* PostgreSQL container is running
* The DataLayer environment is initialized

---

# PostgreSQL Configuration

Current Docker configuration:

| Property       | Value                           |
| -------------- | ------------------------------- |
| Service Name   | db                              |
| Container Name | miacaomigo-db                   |
| Database       | miacaomigo                      |
| User           | postgres                        |
| Port           | 5432                            |
| Docker Network | 01_miacaomigo_datalayer_default |

---

# Windows (PowerShell)

## Generate Documentation

Open PowerShell inside:

```text
01_Scripts/
```

Run:

```powershell
.\generate_docs.ps1
```

---

# Linux / macOS / Git Bash

## Grant Execution Permission

```bash
chmod +x generate_docs.sh
```

## Generate Documentation

```bash
./generate_docs.sh
```

---

# Generated Output

After execution, the generated documentation will be available in:

```text
02_Output/
```

Open:

```text
index.html
```

inside your browser.

---

# Notes

* SchemaSpy generates documentation directly from the live PostgreSQL schema
* The generated documentation is automatically updated whenever the script is executed
* SQL comments (`COMMENT ON`) are automatically included in the generated documentation

---

# Recommended Usage

It is recommended to regenerate the documentation whenever:

* New tables are created
* Relationships are modified
* Constraints are updated
* Indexes are added
* New modules are introduced

---

# Troubleshooting

## PostgreSQL container not found

Verify active containers:

```bash
docker ps
```

---

## Docker network issue

Verify available networks:

```bash
docker network ls
```

---

## PowerShell script execution disabled

Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Then execute the script again.

---

# References

* SchemaSpy Official Website:
  https://schemaspy.org/

* PostgreSQL Official Website:
  https://www.postgresql.org/

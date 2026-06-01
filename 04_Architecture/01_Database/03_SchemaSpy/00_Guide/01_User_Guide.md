# SchemaSpy — interactive documentation

<div style="text-align: center; margin-bottom: 1.5rem;">

<h3 style="margin-top: 0; color: #6b7280; font-weight: normal;">
Automatically generated relational model (read-only output)
</h3>

</div>

SchemaSpy produces an HTML exploration of the MiaCaoMigo **`public`** schema: tables, columns, FKs, indexes, constraints, and relationship diagrams.

!!! note "Implied relationships (Module 3)"
    SchemaSpy may flag **implied** child links where the DDL uses **soft references** only (`purchase.id_cli`, `purchase.id_inv`, `purchase_line.id_sto`, `return.id_inv_lin`). That is **expected** — see [Module 3 schema](../01_Schemas/00_Public_Schema/03_Module3.md). Do not treat as a schema bug without reading DataLayer `01_ForeignKeys_Mod3.sql`.

!!! success "Open interactive documentation"
    **[Open SchemaSpy — `02_Output/index.html`](02_Output/index.html)**

    Opens the generated site in a new browser tab from this MkDocs page.

!!! warning "Do not edit generated artefacts"
    Files under `03_SchemaSpy/02_Output/` are **regenerated** by SchemaSpy scripts.
    Change the database in **`MiaCaoMigo_DataLayer`**, then re-run the generator — see [SchemaSpy overview](00_Overview.md).

---

## What you can inspect

| Feature | Description |
|---------|-------------|
| Schema overview | All tables in `public` |
| Relationships | FK navigation between entities |
| Constraints | PK, UQ, CHECK, exclusions |
| Indexes | Including GiST-backed rules |
| Per-table diagrams | 1- and 2-degree neighbourhood graphs |

---

## Output location

```text
04_Architecture/01_Database/03_SchemaSpy/
├── 01_Scripts/          # generate_docs.ps1 · generate_docs.sh
├── 00_README.md         # regeneration guide
├── schemaspy.md         # this MkDocs entry (link above)
└── 02_Output/
    └── index.html       # interactive site root
```

---

## Related documentation

| Topic | Link |
|-------|------|
| Database hub | [../README.md](../README.md) |
| Schema modules | [../../01_Schemas/00_Overview.md](../../01_Schemas/00_Overview.md) |
| DDL source of truth | `01_MiaCaoMigo_DataLayer/DataBase/Schema/` |
| ER model (conceptual) | [../../../03_Diagrams/00_ER_Model/er_model.md](../../../03_Diagrams/00_ER_Model/er_model.md) |

---

## Technology

| Component | Value |
|-----------|--------|
| Tool | SchemaSpy |
| Format | Static HTML |
| Database | PostgreSQL |
| Schema | `public` |

---

<div style="text-align: center; margin-top: 2rem; opacity: 0.85;">

[← Database hub](../README.md) · [User guide](00_README.md)

</div>

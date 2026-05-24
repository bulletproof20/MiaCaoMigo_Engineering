<div style="text-align: center; margin-top: 40px; margin-bottom: 40px;">

<img
    src="/00_Assets/00_Branding/00_logos/Logo_partialBack.png"
    width="320"
    style="display: block; margin: 0 auto 24px auto;"
/>

<h1 style="margin-bottom: 8px;">MiaCaoMigo Engineering</h1>

<h3 style="margin-top: 0; color: #6b7280; font-weight: normal;">
Central Engineering &amp; Architecture Portal
</h3>

<p style="max-width: 820px; margin: 24px auto 0 auto; line-height: 1.75; font-size: 1.05rem;">
Structured documentation for architecture, database engineering, integrity validation,
requirements, diagrams, and academic deliverables — rendered with <strong>MkDocs Material</strong>.
</p>

</div>

---

## Explore the portal

<div style="display:grid; grid-template-columns:repeat(auto-fit,minmax(240px,1fr)); gap:14px; margin:1.5rem 0;">

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Architecture</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">System layers and PostgreSQL hub.</p>
<a href="04_Architecture/README.md"><strong>Architecture index</strong></a><br/>
<a href="04_Architecture/00_System_Architecture.md">System architecture</a><br/>
<a href="04_Architecture/01_Database/README.md">Database hub</a>
</div>

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Database engineering</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">Governance, modules, dictionary, SchemaSpy.</p>
<a href="04_Architecture/01_Database/00_Governance/README.md">Governance</a><br/>
<a href="04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md">Data dictionary</a><br/>
<a href="04_Architecture/01_Database/05_SchemaSpy/schemaspy.md">SchemaSpy (interactive)</a>
</div>

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Modeling</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">ER attributes and UML views.</p>
<a href="03_Diagrams/00_ER_Model/er_model.md">ER model</a><br/>
<a href="03_Diagrams/01_UML.md">UML</a>
</div>

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Planning &amp; requirements</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">Sprints and specification sets.</p>
<a href="01_Planning/00_Sprints/Sprint_1/Sprint_01.md">Sprints</a><br/>
<a href="02_Requirements/00_Functional_Requirements.md">Requirements</a>
</div>

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Implementation</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">Sibling repository — source of truth for SQL.</p>
<code>01_MiaCaoMigo_DataLayer</code><br/>
<small><code>DataBase/</code> Bootstrap · Schema · Services · QA</small>
</div>

<div style="border:1px solid #e5e7eb; border-radius:12px; padding:16px;">
<h4 style="margin-top:0;">Academic &amp; meta</h4>
<p style="margin:0.5rem 0 0.75rem 0; font-size:0.95rem;">Statements and repo README.</p>
<a href="05_Docs/00_Statements/statements.md">Academic statements</a><br/>
<a href="README.md">Engineering README</a>
</div>

</div>

---

## Ecosystem layers

| Layer | Repository | Responsibility |
|-------|------------|----------------|
| **DataLayer** | `01_MiaCaoMigo_DataLayer` | PostgreSQL schema, services, bootstrap, QA |
| **ApplicationLayer** | (sibling) | APIs, UI, business orchestration |
| **DataEngineering** | `00_MiaCaoMigo_Engineering` | This documentation portal |

```mermaid
flowchart TB
    APP[ApplicationLayer]
    DL[DataLayer PostgreSQL]
    ENG[Engineering MkDocs]

    APP -->|svc_* / controlled SQL| DL
    ENG -.->|documents| DL
```

---

## Technology stack

| Component | Technology |
|-----------|------------|
| Database | PostgreSQL (+ pg_cron, btree_gist) |
| Containers | Docker / Docker Compose |
| Documentation | MkDocs + Material theme |
| DB visualization | SchemaSpy → `02_Output/index.html` |

---

## Engineering principles

- **As-implemented documentation** — Engineering text follows `01_MiaCaoMigo_DataLayer`, not the reverse.
- **Modular integrity** — structural DDL, triggers, procedures, and QA contracts per module.
- **Separation of layers** — Schema vs Services vs Bootstrap vs host-side QA.
- **Traceability** — naming conventions, templates, and build pipeline documented alongside code.

---

## Documentation map (sidebar)

Use the left navigation (mirrors repository layout):

| Top-level | Focus |
|-----------|--------|
| **Home** | This page · [Home index](indexes/home.md) |
| **Planning** | Sprint artefacts |
| **Requirements** | Functional / NFR / acceptance |
| **Diagrams** | ER V8 attributes · UML |
| **Architecture** | System + **Database** (governance → schemas → dictionary → SchemaSpy) |
| **Documentation** | README · academic statements |

!!! tip "Database onboarding"
    Start at [Database hub](04_Architecture/01_Database/README.md), then [Schema build pipeline](04_Architecture/01_Database/00_Schema_Build_Pipeline.md) and [Governance](04_Architecture/01_Database/00_Governance/README.md).

---

<div style="text-align: center; margin-top: 60px; opacity: 0.85;">

<h3>MiaCaoMigo Project</h3>

<p>Engineering · Architecture · Documentation · Standards</p>

</div>

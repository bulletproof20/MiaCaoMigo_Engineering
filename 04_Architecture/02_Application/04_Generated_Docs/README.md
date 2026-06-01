# MiaCaoMigo Documentation (ApplicationLayer)

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Application docs</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">MkDocs hub</span>
</div>

This index gathers the technical documentation for the application repository (`MiaCaoMigo_`): architecture-oriented guides and the Swagger/OpenAPI API documentation.

This Engineering section is the editable source for application documentation. The website repository keeps only the runtime Swagger UI and the generated OpenAPI JSON artifact.

---

## Explore The Documentation

<div class="grid cards" markdown>

- **Backend**

    Explains how Express mounts Mod1, Mod2 and Mod4 routes, including staff employee onboarding, and serves Swagger UI/OpenAPI JSON locally.

    [:octicons-arrow-right-24: Open backend docs](Backend.md)

- **Frontend**

    Describes the current page flow, route map, main forms, authentication behavior, sidebars, client pages and staff dashboard behavior.

    [:octicons-arrow-right-24: Open frontend docs](Frontend.md)

- **Frontend Flow**

    Presents the navigation diagram and the main frontend flow steps.

    [:octicons-arrow-right-24: Open frontend flow](Frontend_Flow.md)

- **Swagger**

    Explains the `@swagger` comment source, global schemas, and OpenAPI contract generation.

    [:octicons-arrow-right-24: Open Swagger docs](Swagger.md)

- **OpenAPI Specification**

    Explains where to find the JSON contract and Swagger UI.

    [:octicons-arrow-right-24: Open OpenAPI guide](OpenAPI.md)

- **Update Documentation**

    Commands for regenerating the OpenAPI contract from the website sources.

    [:octicons-arrow-right-24: Open update guide](Update_Docs.md)

</div>

---

## Runtime URLs

With `npm start` running in the **`MiaCaoMigo_`** repository:

| URL | Content |
|-----|---------|
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | Interactive Swagger UI |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | Runtime OpenAPI JSON |

---

## Documentation Model

| Layer | Editable source (`MiaCaoMigo_`) | Generated output |
|-------|---------------------------------|------------------|
| REST API | `@swagger` in `Backend/routes/**` and `Backend/swaggerConfig.js` | Swagger UI and `Docs/Swagger/openapi.json` |
| Guides | Engineering Markdown in this section | MkDocs portal pages |

Technical code comments are written in **English**. User-facing UI text remains in **Portuguese**.

---

## Relationship With The Application Section

| Document | Purpose |
|----------|---------|
| [Application overview](../00_Application_Overview.md) | Stack, modules, and ApplicationLayer boundaries |
| [Website flows](../01_Website_Flows.md) | Defense-oriented flow narrative and sequence diagrams |
| [Runtime setup](../02_Runtime_Setup.md) | Local/Docker execution and DataLayer connection |
| [Implementation evidence](../03_Implementation_Evidence.md) | RF/RNF to implementation evidence mapping |

---

[<- Application architecture](../README.md)

# MiaCaoMigo Documentation (ApplicationLayer)

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Website docs</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">MkDocs hub</span>
</div>

This index gathers the technical documentation for the application repository (`MiaCaoMigo_`): Markdown guides, the Swagger/OpenAPI API documentation, and the generated JSDoc reference for backend and frontend code.

The **editable source** remains in the website repository. This Engineering hub mirrors the navigation from the website `Docs/index.html`, adapted to the MkDocs portal.

---

## Explore The Documentation

<div class="grid cards" markdown>

- **Backend**

    Explains how Express mounts routes and serves Swagger UI, OpenAPI JSON, and the JSDoc route locally.

    [:octicons-arrow-right-24: Open backend docs](Backend.md)

- **Frontend**

    Describes the page flow, main forms, authentication behavior, and staff dashboard behavior.

    [:octicons-arrow-right-24: Open frontend docs](Frontend.md)

- **Frontend Flow**

    Presents the navigation diagram and the main frontend flow steps.

    [:octicons-arrow-right-24: Open frontend flow](Frontend_Flow.md)

- **Swagger**

    Explains the `@swagger` comment source, global schemas, and OpenAPI contract generation.

    [:octicons-arrow-right-24: Open Swagger docs](Swagger.md)

- **OpenAPI Specification**

    Explains where to find the JSON contract and the Redoc visualization.

    [:octicons-arrow-right-24: Open OpenAPI guide](OpenAPI.md)

- **Code Reference**

    JSDoc reference generated from backend and frontend code comments.

    [:octicons-arrow-right-24: Open code reference](Code_Reference.md)

- **Update Documentation**

    Commands for regenerating OpenAPI, JSDoc, and HTML from the website sources.

    [:octicons-arrow-right-24: Open update guide](Update_Docs.md)

</div>

---

## Runtime URLs

With `npm start` running in the **`MiaCaoMigo_`** repository:

| URL | Content |
|-----|---------|
| [http://localhost:3000/docs/](http://localhost:3000/docs/) | Original HTML documentation hub from the website repository |
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | Interactive Swagger UI |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | Runtime OpenAPI JSON |
| [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) | JSDoc reference served by the backend |

---

## Documentation Model

| Layer | Editable source (`MiaCaoMigo_`) | Generated output |
|-------|---------------------------------|------------------|
| REST API | `@swagger` in `Backend/routes/**` and `Backend/swaggerConfig.js` | Swagger UI, `Docs/Swagger/openapi.json`, Redoc HTML |
| Code | JSDoc in `Backend/**/*.js` and `FrontEnd/Js/**/*.js` | `Docs/site/CodeReference/` and `/jsdoc/` |
| Guides | Markdown in `Docs/**/*.md` | HTML in `Docs/site/**/*.html` |

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

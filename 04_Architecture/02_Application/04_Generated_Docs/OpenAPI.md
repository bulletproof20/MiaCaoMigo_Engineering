# OpenAPI Specification

Source in the website repository: `Docs/index.html` hub ("Specification" card) and `Docs/Swagger/`

The OpenAPI specification describes the REST contract exposed by the backend. It can be inspected as runtime JSON, through Swagger UI, or as generated Redoc HTML.

---

## JSON Contract

| Source | Path / URL |
|--------|------------|
| Runtime server | [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) |
| Generated website file | `MiaCaoMigo_/Docs/Swagger/openapi.json` |

The JSON file at `Docs/Swagger/openapi.json` is produced by `npm run docs:generate` or `npm run docs:build`. It is the same contract consumed by Swagger UI.

---

## HTML View (Redoc)

In the **`MiaCaoMigo_`** repository, after regenerating documentation:

```text
Docs/site/Swagger/openapi.html
```

Open it in the browser:

- via server: `http://localhost:3000/docs/` -> hub -> generated specification link
- local file: open `Docs/site/Swagger/openapi.html` directly

This HTML corresponds to the **Specification** card in the website `Docs/index.html` page.

---

## Swagger UI (Interactive Exploration)

To test endpoints and inspect schemas interactively, use **Swagger UI**:

[http://localhost:3000/api-docs/](http://localhost:3000/api-docs/)

Full guide: [Swagger](Swagger.md)

---

## Contract Maintenance

1. Change routes or schemas in the source files (`@swagger`, `swaggerConfig.js`).
2. In the **`MiaCaoMigo_`** repository, run `npm run docs:build`.
3. Validate in Swagger UI and, if needed, compare against the generated `openapi.json`.

---

[<- Documentation hub](README.md)

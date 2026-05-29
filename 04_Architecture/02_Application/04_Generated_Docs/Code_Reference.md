# Code Reference (JSDoc)

Source in the website repository: `MiaCaoMigo_/Docs/CODE_REFERENCE.md`

HTML reference generated from JSDoc comments in the backend and frontend code of the **`MiaCaoMigo_`** repository.

---

## Scope

| Area | Paths |
|------|-------|
| Backend | `Backend/**/*.js`: Express, routes, controllers, models, middleware, config |
| Frontend | `FrontEnd/Js/**/*.js`: session, login, dashboards, animals, appointments, sidebars |

Configuration: `jsdoc.json`  
Generation script: `scripts_docs/generate-jsdoc.js`

---

## Where To View It

With `npm start` running in **`MiaCaoMigo_`**:

| URL | Description |
|-----|-------------|
| [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) | Reference served by Express, equivalent to the website hub "Code Reference" card |

Without the server, after running `npm run docs:build`:

```text
MiaCaoMigo_/Docs/site/CodeReference/index.html
```

---

## How To Update

Run in the **`MiaCaoMigo_`** repository:

| Command | Result |
|---------|--------|
| `npm run docs:code` | Regenerates only `Docs/site/CodeReference/` |
| `npm run docs:build` | Regenerates OpenAPI, JSDoc, Markdown-to-HTML pages, and Redoc |

---

## Comment Rules

- Technical code comments: **English**
- User-facing UI text: **Portuguese**
- Prefer useful JSDoc tags such as `@module`, `@param`, and `@returns`
- Document authentication guards, API fetch helpers, and non-obvious behavior

---

## Relationship With Swagger

| Tool | Documents | Typical URL |
|------|-----------|-------------|
| Swagger / OpenAPI | REST endpoints, payloads, responses | `/api-docs/` |
| JSDoc | Code structure and functions | `/jsdoc/` |

---

[<- Documentation hub](README.md)

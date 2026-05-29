# Swagger API Documentation

Source in the website repository: `MiaCaoMigo_/Docs/Swagger/README.md`

The MiaCaoMigo OpenAPI specification is generated from source code comments and published both at runtime and as static files in the website repository.

---

## Available Artifacts

| Artifact | Location (`MiaCaoMigo_`) | Description |
|----------|--------------------------|-------------|
| Swagger guide | `Docs/Swagger/README.md` | Explains how OpenAPI is produced |
| JSON contract | `Docs/Swagger/openapi.json` | Automatically generated; do not edit manually |
| Redoc HTML | `Docs/site/Swagger/openapi.html` | Generated after `npm run docs:build` |

---

## Source Of Truth

- `@swagger` comments in Express routes **mounted** by `server.js`
- Global schemas in `Backend/swaggerConfig.js`
- Generation through `swagger-jsdoc` (`scripts_docs/generate-swagger.js`)

Routes documented in the current contract:

| Module | Prefix | Route file |
|--------|--------|------------|
| Mod1 | `/api/users/auth/*` | `Backend/routes/Mod1_Users/authRoutes.js` |
| Mod2 | `/api/animals/*` | `Backend/routes/Mod2_Animals/animais.js` |
| Mod4 | `/api/appointments/*` | `Backend/routes/Mod4_Appointments/appointmentRoutes.js` |

---

## Runtime View

With `npm start` running in **`MiaCaoMigo_`**:

| URL | Content |
|-----|---------|
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | **Swagger UI**: interactive API documentation, equivalent to the website hub "Swagger UI" card |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | Runtime OpenAPI JSON |

---

## Static View

After running `npm run docs:build` in the website repository:

| Path | Content |
|------|---------|
| `Docs/Swagger/openapi.json` | Generated JSON |
| `Docs/site/Swagger/openapi.html` | Redoc visualization, equivalent to the website hub "Specification" card |

Specification details: [OpenAPI](OpenAPI.md)

---

## Update

| Command (in `MiaCaoMigo_`) | When to use |
|----------------------------|-------------|
| `npm run docs:generate` | Only Swagger/OpenAPI changed |
| `npm run docs:build` | Any documentation changed; recommended default |

Do not manually edit `Docs/Swagger/openapi.json`.

---

[<- Documentation hub](README.md)

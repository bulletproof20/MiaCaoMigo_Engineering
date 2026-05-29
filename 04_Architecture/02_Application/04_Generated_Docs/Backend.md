# Backend Documentation

Source in the website repository: `MiaCaoMigo_/Docs/Backend/README.md`

This page summarizes how the Express backend exposes the application, the API, and the documentation routes at runtime.

---

## Runtime Routes

| URL | Source | Description |
|-----|--------|-------------|
| `/` | `FrontEnd/` | Static website |
| `/api/users` | `Backend/routes/Mod1_Users` | Authentication and session management |
| `/api/animals` | `Backend/routes/Mod2_Animals` | Species, breeds, and animal data |
| `/api/appointments` | `Backend/routes/Mod4_Appointments` | Appointments, veterinarians, specialties, and availability |
| `/docs/` | `Docs/` | Website HTML documentation hub |
| `/api-docs/` | `swagger-ui-express` | Interactive Swagger UI |
| `/api-docs.json` | `swagger-jsdoc` | Runtime OpenAPI JSON |
| `/jsdoc/` | `Docs/site/CodeReference/` | JSDoc reference |
| `/db-test` | `Backend/server.js` | Technical route for testing database connectivity |

---

## Key Files

| File | Purpose |
|------|---------|
| `Backend/server.js` | Express setup, middlewares, routes, and served documentation |
| `Backend/swaggerConfig.js` | OpenAPI configuration and global schemas |
| `Backend/swagger.js` | Exported generated OpenAPI document |
| `Backend/config/db.js` | PostgreSQL connection pool |
| `Backend/middlewares/authMiddleware.js` | JWT, staff, permission, and clinic secretary guards |
| `scripts_docs/generate-swagger.js` | Generates `Docs/Swagger/openapi.json` |
| `scripts_docs/generate-jsdoc.js` | Generates `Docs/site/CodeReference/` |
| `scripts_docs/build-docs.js` | Generates Markdown HTML pages and Redoc |
| `jsdoc.json` | Defines the JSDoc reference scope |

---

## Request Layers

```text
HTTP request
  -> server.js (middlewares)
  -> routes (Mod1 / Mod2 / Mod4)
  -> middlewares (auth, staff, permissions)
  -> controllers
  -> models
  -> PostgreSQL (MiaCaoMigo_DataLayer)
```

See also [Website flows](../01_Website_Flows.md) for the full frontend/backend flow.

---

## OpenAPI

The API source of truth is the `@swagger` comments in mounted route files and the schemas defined in `Backend/swaggerConfig.js`.

Routes included in the current OpenAPI contract:

- `Backend/routes/Mod1_Users/authRoutes.js`
- `Backend/routes/Mod2_Animals/animais.js`
- `Backend/routes/Mod4_Appointments/appointmentRoutes.js`

Stub modules, such as partial Mod3 billing or unmounted prescription routes, are excluded from the contract to avoid publishing tags without real endpoints.

Details: [Swagger](Swagger.md) · [OpenAPI](OpenAPI.md)

---

## JSDoc

JSDoc comments are read from:

- `Backend/**/*.js`
- `FrontEnd/Js/**/*.js`

Output: `Docs/site/CodeReference/`, served at `http://localhost:3000/jsdoc/`.

Details: [Code Reference](Code_Reference.md)

---

## Maintenance

1. Update `@swagger` comments when endpoints, payloads, or responses change.
2. Update JSDoc when modules or public contracts change.
3. In the **`MiaCaoMigo_`** repository, run `npm run docs:build`.

Do not manually edit `Docs/Swagger/openapi.json` or `Docs/site/**`.

---

[<- Documentation hub](README.md)

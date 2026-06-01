# Swagger API Documentation

Source in the website repository: `@swagger` route comments and `Backend/swaggerConfig.js`.

The MiaCaoMigo OpenAPI specification is generated from source code comments and published at runtime through Swagger UI.

---

## Available Artifacts

| Artifact | Location (`MiaCaoMigo_`) | Description |
|----------|--------------------------|-------------|
| JSON contract | `Docs/Swagger/openapi.json` | Automatically generated; do not edit manually |

---

## Source Of Truth

- `@swagger` comments in Express routes **mounted** by `server.js`
- Global schemas in `Backend/swaggerConfig.js`
- Generation through `swagger-jsdoc` (`scripts_docs/generate-swagger.js`)

Routes documented in the current contract:

| Module | Prefix | Route file |
|--------|--------|------------|
| Mod1 | `/api/users/auth/*` | `Backend/routes/Mod1_Users/authRoutes.js` |
| Mod1 | `/api/users/clients/*` | `Backend/routes/Mod1_Users/clientRoutes.js` |
| Mod1 | `/api/users/staff/*` | `Backend/routes/Mod1_Users/staffRoutes.js` |
| Mod1 | `/api/users/employees/*` | `Backend/routes/Mod1_Users/employeeRoutes.js` |
| Mod2 | `/api/animals/*` | `Backend/routes/Mod2_Animals/animais.js` |
| Mod4 | `/api/appointments/*` | `Backend/routes/Mod4_Appointments/appointmentRoutes.js` |
| Mod4 | `/api/appointments/prescriptions/*` | `Backend/routes/Mod4_Appointments/prescricoesRoutes.js` |

The current Swagger contract includes `POST /api/users/employees`, which supports the staff employee onboarding page and requires the `manage_employees` permission.

The appointment availability contract also documents the optional `excludeAppId` query parameter used when recalculating free slots during rescheduling.

Client notification endpoints are also documented under `/api/appointments/notifications/*`; they expose the existing `appointment_notification` read/unread workflow and filter out the internal waiting-room marker.

---

## Runtime View

With `npm start` running in **`MiaCaoMigo_`**:

| URL | Content |
|-----|---------|
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | **Swagger UI**: interactive API documentation |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | Runtime OpenAPI JSON |

---

## Static JSON

After running `npm run docs:generate` in the website repository:

| Path | Content |
|------|---------|
| `Docs/Swagger/openapi.json` | Generated JSON |

Specification details: [OpenAPI](OpenAPI.md)

---

## Update

| Command (in `MiaCaoMigo_`) | When to use |
|----------------------------|-------------|
| `npm run docs:generate` | Only Swagger/OpenAPI changed |

Do not manually edit `Docs/Swagger/openapi.json`.

---

[<- Documentation hub](README.md)

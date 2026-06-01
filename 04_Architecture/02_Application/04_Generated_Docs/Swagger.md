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

The authentication contract also includes `PUT /api/users/auth/heartbeat`, used by the browser to keep the active database session fresh while the authenticated user is active.

---

## Coverage Audit

The Swagger contract was compared with the mounted Express routes and the website API calls in `MiaCaoMigo_`.

| Status | Endpoint / Area | Notes |
|--------|-----------------|-------|
| Covered by Swagger | `PUT /api/users/auth/heartbeat` | Backend route exists in `authRoutes.js` and is called by `authSession.js` every 30 seconds to refresh the active session heartbeat. |
| Covered by Swagger | Mod1 auth, setup/theme, client lookup, staff self-service and employee onboarding | These match the current website flows. |
| Covered by Swagger | Mod2 animals/adoptions | Includes public adoptions, client animals, staff CRUD, ownership association and breed/species catalogs. |
| Covered by Swagger | Mod4 appointments, notifications, clinical record and prescriptions | Includes booking, rescheduling, waiting-room check-in, start/close consultation, clinical record persistence, prescription PDF and client downloads. |
| Not a backend endpoint yet | `GET /api/users/employees/:id` | `FuncionarioDetalhe.html` currently uses static/mock content (`funcionarioDetalhe.js`) until this endpoint is implemented. |
| Frontend fallback only | `GET /api/animals/breed?speciesId=...` | `staffAnimais.js` tries this only if `/api/animals/breeds` fails; the mounted/backend-documented route is `/api/animals/breeds`. |
| Intentionally excluded | Mod3 commercial/billing stubs | No Mod3 route is mounted in `server.js`, so it is not part of the OpenAPI contract. |

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

# OpenAPI Specification

Source in the website repository: `@swagger` route comments, `Backend/swaggerConfig.js`, and the generated `Docs/Swagger/openapi.json` artifact.

The OpenAPI specification describes the REST contract exposed by the backend. It can be inspected as runtime JSON or through Swagger UI.

---

## JSON Contract

| Source | Path / URL |
|--------|------------|
| Runtime server | [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) |
| Generated static file | `MiaCaoMigo_/Docs/Swagger/openapi.json` |

The JSON file at `Docs/Swagger/openapi.json` is produced by `npm run docs:generate`. It is the same contract consumed by Swagger UI.

---

## Covered API Areas

| Area | Main paths |
|------|------------|
| Authentication and setup | `/api/users/auth/*` |
| Client lookup | `/api/users/clients` |
| Staff self-service | `/api/users/staff/me/*` |
| Employee onboarding | `/api/users/employees` |
| Animals and adoptions | `/api/animals/*` |
| Appointments | `/api/appointments/*` |
| Appointment notifications | `/api/appointments/notifications/*` |

Only mounted Express routes are published. Partial or unmounted modules are intentionally excluded from the generated contract.

Appointment availability supports `vetId`, `date` and optional `excludeAppId` query parameters; the optional parameter is used by the staff/client reschedule flow to ignore the appointment currently being moved. Client notification endpoints expose the existing `appointment_notification` read/unread feed and exclude the internal `__WAITING_ROOM__` check-in marker.

---

## Swagger UI (Interactive Exploration)

To test endpoints and inspect schemas interactively, use **Swagger UI**:

[http://localhost:3000/api-docs/](http://localhost:3000/api-docs/)

Full guide: [Swagger](Swagger.md)

---

## Contract Maintenance

1. Change routes or schemas in the source files (`@swagger`, `swaggerConfig.js`).
2. In the **`MiaCaoMigo_`** repository, run `npm run docs:generate`.
3. Validate in Swagger UI and, if needed, compare against the generated `openapi.json`.

---

[<- Documentation hub](README.md)

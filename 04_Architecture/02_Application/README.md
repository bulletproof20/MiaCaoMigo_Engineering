# Application architecture

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">ApplicationLayer</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Website-aligned</span>
  <span style="background:#64748b;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Defense support</span>
</div>

The MiaCaoMigo **ApplicationLayer** is implemented in the sibling website repository **`MiaCaoMigo_`**. It contains the browser frontend, the Node/Express API, the OpenAPI/JSDoc documentation tooling, and the runtime integration with the PostgreSQL DataLayer.

This section adapts the website documentation into the Engineering portal without duplicating the canonical requirements matrices. It is intended for architectural reading and defense preparation.

---

## Entry points

| Document | Scope |
|----------|-------|
| [Application overview](00_Application_Overview.md) | Repository scope, technology stack, modules and runtime boundaries |
| [Website flows](01_Website_Flows.md) | Authentication, client, appointment and staff/admin flows |
| [Runtime setup](02_Runtime_Setup.md) | Local/Docker execution model and Application-to-DataLayer connection |
| [Implementation evidence](03_Implementation_Evidence.md) | Defense-oriented mapping between implemented website features and RF/RNF evidence |
| [**Website documentation hub**](04_Generated_Docs/README.md) | Hub equivalente ao `Docs/index.html` do website (Backend, Frontend, Swagger, JSDoc, atualização) |

---

## Repository role

| Repository | Responsibility |
|------------|----------------|
| `MiaCaoMigo_Engineering` | Engineering documentation, planning, architecture, requirements and defense support |
| `MiaCaoMigo_` | ApplicationLayer: frontend, backend API, Swagger/JSDoc and runtime orchestration |
| `MiaCaoMigo_DataLayer` | PostgreSQL schema, services, seed data, QA and database governance |

---

## Application scope

| Area | Current scope |
|------|---------------|
| UI | Static HTML/CSS/JavaScript pages under `FrontEnd/` |
| API | Express server, modular routes, middlewares, controllers and models under `Backend/` |
| Authentication | JWT login/logout/session flow with staff/client separation |
| Animals | Client animal reads and staff-controlled association/update/removal |
| Appointments | Client booking, availability, cancel/reschedule and staff lifecycle operations |
| Documentation | Swagger UI, OpenAPI JSON, JSDoc and generated static docs |

---

## Relationship with requirements

Normative requirements remain in [02_Requirements](../../02_Requirements/). This Application section only records implementation and presentation evidence for defense:

- functional requirements: [00_Functional_Requirements.md](../../02_Requirements/00_Functional_Requirements.md);
- non-functional requirements: [01_Non_Functional_Requirements.md](../../02_Requirements/01_Non_Functional_Requirements.md);
- implementation status: [06_Implementacion_Matrix.md](../../02_Requirements/06_Implementacion_Matrix.md).

---

[← Architecture hub](../README.md)
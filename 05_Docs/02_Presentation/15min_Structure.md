# Oral presentation plan (~15 min)

This plan structures the oral presentation of the MiaCaoMigo web application, covering context, users, functionality, authentication/security, performance evidence, tools, limitations, future improvements and conclusion. It aligns with the [Application Report](../01_Academic_Reports/Application_Report.md).

---

## Time allocation

| Min | Section | Content |
|-----|---------|---------|
| 0–2 | Context | What MiaCaoMigo is; three layers (Frontend, API, PostgreSQL); `MiaCaoMigo_`, `MiaCaoMigo_DataLayer`, Engineering repositories |
| 2–4 | Users | Visitor, client, staff; RBAC profiles; `@miacaomigo.pt` domain |
| 4–9 | Functionality | Flow: login → client area → appointments → staff area → protected operation; key screenshots |
| 9–12 | Authentication and security | JWT structure (`header.payload.signature`), `JWT_SECRET`, `localStorage`, middlewares, database permissions, Swagger |
| 12–14 | Performance and tools | Initial performance baseline, Firefox/API testing plan, Node, Express, PostgreSQL, Docker, MkDocs, Bootstrap |
| 14–15 | Limitations, future improvements and conclusion | Time constraints, commercial work beyond the implemented counter/invoice core, animal image support, HR prototypes, performance baseline, message of real integration |

---

## Core message

> This is not just a static website: it is a modular application with a documented API, database rules, and multi-layer access control.

---

## Demonstration sequence

1. Public page → client login.
2. Book or list an appointment.
3. Staff login → dashboard with profile-based menus.
4. Open `/api-docs/` and show a protected endpoint.
5. If time allows, mention the completed performance baseline and one planned security test (invalid token or missing permission).

---

[← Presentation hub](README.md)

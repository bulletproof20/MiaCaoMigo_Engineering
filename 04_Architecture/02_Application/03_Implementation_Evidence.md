# Implementation evidence

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Evidence</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">RF/RNF support</span>
  <span style="background:#64748b;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Defense</span>
</div>

This page maps implemented website evidence to the existing Engineering requirements vocabulary. It does not replace the canonical RF/RNF documents; it provides presentation-ready evidence from the ApplicationLayer.

Normative sources:

- [Functional requirements](../../02_Requirements/00_Functional_Requirements.md)
- [Non-functional requirements](../../02_Requirements/01_Non_Functional_Requirements.md)
- [Implementation matrix](../../02_Requirements/06_Implementacion_Matrix.md)

---

## Functional evidence

| Evidence ID | Related RF | Website evidence | Implementation notes |
|-------------|------------|------------------|----------------------|
| APP-EV-M1-01 | RF_M1_01 | `POST /api/users/auth/register`, `FrontEnd/Pages/UserView/Mod1/criar_conta.html`, `FrontEnd/Js/Mod1/criarConta.js` | Client account registration exposed through UI and API |
| APP-EV-M1-02 | RF_M1_05, RF_M1_06, RF_M1_08 | `POST /api/users/auth/login`, `POST /api/users/auth/logout`, `GET /api/users/auth/me` | Login, active session handling, logout and current session endpoint |
| APP-EV-M1-03 | RF_M1_16, RF_M1_17 | `Backend/middlewares/authMiddleware.js`, JWT permissions, `staffDashboard.js` | Staff permissions carried in JWT and used by API/UI |
| APP-EV-M1-04 | RF_M1_39, RF_M1_41 | `GET /api/users/auth/setup`, `PUT /api/users/auth/setup/theme`, `setup.the_set`, `ClientSideBar.html`, `authSession.js` | Client light/dark theme is read from and persisted to the database without keeping preference history |
| APP-EV-M1-05 | RF_M1_33–37, RF_M1_39 | `GET /api/users/staff/me/agenda`, `staff.js`, `MainDashboard.html`, `AreaFuncionario.html`, `staffDashboardHome.js`, `staffArea.js` | Staff self-service dashboard with role metadata (veterinarian/assistant/profiles) and personal operational widgets |
| APP-EV-M2-01 | RF_M2_02 | `GET /api/animals/species`, `GET /api/animals/breeds` | Species and breed catalogs exposed to the application |
| APP-EV-M2-02 | RF_M2_10, RF_M2_11 | `GET /api/animals/me`, `GET /api/animals/client/:clientId` | Client animal ownership is readable through authenticated endpoints |
| APP-EV-M2-03 | RF_M2_01, RF_M2_10, RF_M2_19 | `POST /api/animals`, `POST /api/animals/associate`, `PUT /api/animals/:id`, `DELETE /api/animals/:id` | Animal operations restricted to clinic secretary/admin flows |
| APP-EV-M2-04 | RF_M2 adoption workflow | `GET /api/animals/adoptions`, `POST /api/animals/:id/adopt`, `adocoes.html`, `adocoes.js`, `vw_internal_animals_available`, `sp_assign_ownership` | Public listing of `Interno` animals and direct client adoption without schema changes |
| APP-EV-M4-01 | RF_M4_01, RF_M4_12 | `POST /api/appointments`, `FrontEnd/Pages/UserView/Mod4/consultas.html`, `FrontEnd/Js/Mod4/clientConsultas.js` | Client appointment booking through UI and API |
| APP-EV-M4-02 | RF_M4_11, RF_M4_14 | `GET /api/appointments/me`, `PATCH /api/appointments/:id_app/cancel`, `PATCH /api/appointments/:id_app/reschedule` | Client appointment history, cancellation and rescheduling |
| APP-EV-M4-03 | RF_M4_01, RF_M1_37 | `GET /api/appointments/veterinarians`, `GET /api/appointments/specialties`, `GET /api/appointments/availability` | Appointment form data and availability calculation exposed to frontend |
| APP-EV-M4-04 | RF_M4_05, RF_M4_11 | `PATCH /api/appointments/:id_app/start`, `PATCH /api/appointments/:id_app/close` | Staff appointment lifecycle operations protected by permission checks |

---

## Non-functional evidence

| Evidence ID | Related RNF | Website evidence | Implementation notes |
|-------------|-------------|------------------|----------------------|
| APP-NF-SEC-01 | RNF_M1_08, RNF_M4_05 | `requireAuth`, `requireStaff`, `requirePermission`, `requireClinicSecretary` | Access control enforced at API route level |
| APP-NF-SEC-02 | RNF_M1_02, SEC-T03 | JWT signing utilities and authentication model integration | Password/session logic is separated from frontend and controlled by API/DataLayer |
| APP-NF-INT-01 | RNF_M1_07, RNF_M2_02, RNF_M4_02 | PostgreSQL error handling for `23503`, `23505`, `23514`, `23P01` | API maps database integrity errors into user-facing responses |
| APP-NF-PER-01 | RNF_M1_04, RNF_M3_19 | `Backend/config/db.js` PostgreSQL pool | Database connections are pooled instead of opening per request |
| APP-NF-MNT-01 | RNF supportability / maintainability | `routes`, `middlewares`, `controllers`, `Models`, `config` separation | Backend responsibilities are separated by layer and module |
| APP-NF-CFG-01 | CST / configurability | `Backend/.env`, `Backend/.env.docker`, `docker-compose.yml` | Runtime credentials and ports are externalized |
| APP-NF-DOC-01 | Documentation support | Swagger UI, OpenAPI JSON, `npm run docs:generate` | API documentation is generated from route comments |

---

## Current implementation boundaries

| Area | Status in website repository |
|------|------------------------------|
| Mod1 authentication/setup | Implemented for login, register, logout, session read and client theme preference persistence |
| Mod2 animals | Implemented for catalogs, client animal reads and staff-controlled operations |
| Mod3 commercial | Structurally present, limited application exposure |
| Mod4 appointments | Implemented for booking, availability, client management and staff lifecycle |
| Infrastructure NFR | Local/Docker setup documented; production HTTPS/availability policies remain operational concerns |

---

## Defense narrative

The website implementation demonstrates the integration between planned requirements and running software:

1. Mod1 proves authentication, session control and role separation.
2. Mod2 proves protected access to animal data and staff-controlled management actions.
3. Mod4 proves a complete user-facing appointment flow from availability to persisted appointment state.
4. The API structure proves maintainability through modular routes, middlewares, controllers and models.
5. The runtime setup proves separation between ApplicationLayer and DataLayer repositories.

---

[← Application architecture](README.md)

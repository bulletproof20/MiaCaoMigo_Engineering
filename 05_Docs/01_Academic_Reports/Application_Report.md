# Academic Web Application Report

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">ApplicationLayer</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">15 min presentation</span>
  <span style="background:#64748b;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Academic defense</span>
</div>

This report presents the web application implemented in the `MiaCaoMigo_` repository, placing it within the MiaCaoMigo project’s documentation and technical ecosystem. The application demonstrates integration between a static frontend, a Node/Express API, and a PostgreSQL database, using JWT authentication, profile-based permissions, and Swagger/OpenAPI documentation.

---

## 1. Context / Introduction

The **MiaCaoMigo** system is a platform that supports the management of a veterinary clinic. Its main goal is to centralise operations that, in a real-world setting, would be spread across reception, clinical staff, animal management, appointment scheduling, and client follow-up.

The web application is organised into three main layers:

| Layer | Responsibility |
|--------|----------------|
| Frontend | HTML/CSS/JavaScript pages, public navigation, authenticated client and staff areas |
| Backend | REST API in Node.js/Express, authentication, authorisation, request validation, and model access |
| DataLayer | PostgreSQL, business functions, tables, profiles, permissions, sessions, and integrity rules |

The system is presented as a modular solution: users interact with web pages, the frontend communicates with the API through `fetch`, and the API delegates persistence and critical business rules to the database. This separation shows not only the visual interface, but also an application architecture with authentication, authorisation, data integration, and technical documentation.

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/index.png" alt="Application home page" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 1</strong> — Public home page of the MiaCaoMigo application.</figcaption>
</figure>

---

## 2. Users

The website distinguishes public users, authenticated clients, and authenticated staff. Separation is enforced through login, account type, and profiles/permissions loaded from the database.

| User | Main access | Example actions |
|------|-------------|-----------------|
| Visitor | Public pages | Browse services, adoptions, public shop, contact and institutional information |
| Client | Client area | View animals, book appointments, reschedule/cancel appointments, view notifications and prescriptions |
| Staff | Internal area | View personal agenda, attendance, absences, and operations according to permissions |
| Administrator / HR | Staff area | Create employees, view staff board, access management views |
| Veterinarian / clinical team | Clinical area | Manage appointments, view patients, record clinical lifecycle when authorised |
| Assistant / reception | Front-desk operations | Register/associate animals and support booking |
| Commercial manager | Reserved area | Menu entries for commercial area and reports, still under development |

The client/staff distinction uses the institutional domain `@miacaomigo.pt` and staff profiles associated in the database.

---

## 3. Functionality

### 3.1 Overview by module

| Module | Website status | Demonstrable features |
|--------|----------------|------------------------|
| Mod1 - Users | Centrally implemented | Client registration, login, logout, JWT session, light/dark theme, client area, staff area, RBAC, employee creation |
| Mod2 - Animals | Partially implemented / operational | Species/breed catalogues, client animal list, public adoptions, internal animal operations |
| Mod3 - Commercial | Reserved / partial | Public shop as placeholder and disabled internal entries for commercial area/reports |
| Mod4 - Appointments | Substantially implemented | Booking, availability, listing, cancellation, rescheduling, notifications, prescriptions, appointment lifecycle |

### 3.2 System flow

The main flow starts on public pages and moves into protected areas after authentication.

1. The visitor opens the home page and browses public pages.
2. The user creates a client account or logs in.
3. The backend validates credentials in the database and returns a JWT.
4. The frontend stores the token and user data in `localStorage`.
5. Post-login navigation separates client and staff.
6. The client accesses their area, animals, and appointments.
7. Staff access the internal dashboard and see menus according to profiles/permissions.
8. Each protected request sends `Authorization: Bearer <token>` to the API.
9. The backend validates the JWT and applies permissions before executing models.

### 3.3 Visual evidence

The collected screenshots illustrate the main application path: public entry, authentication, client area access, clinical features, internal area access, and validation of the API technical contract.

| Figure | Screen | Relevance |
|--------|--------|-----------|
| 1 | Home page | Public entry and institutional presentation of the clinic |
| 2 | Login | Entry point for authentication and JWT issuance |
| 3 | Client area | Personal dashboard with client-account operations |
| 4 | Client appointments | Booking, listing, and appointment management |
| 5 | Adoptions | Public feature linked to the animals module |
| 6 | Staff area | Internal experience separated with profile-based menus |
| 7 | Appointment management | Internal clinical operations and appointment lifecycle |
| 8 | Swagger UI | Technical documentation and REST API contract |

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/login.png" alt="Application login" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 2</strong> — Authentication screen used by clients and staff.</figcaption>
</figure>

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/areaClient.png" alt="Client area" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 3</strong> — Authenticated client dashboard.</figcaption>
</figure>

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/consultas.png" alt="Client appointments" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 4</strong> — Appointment management in the client area.</figcaption>
</figure>

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/adocoes.png" alt="Public adoptions page" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 5</strong> — Public view of animals available for adoption.</figcaption>
</figure>

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/areaFuncionario.png" alt="Staff area" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 6</strong> — Internal staff area with contextual navigation.</figcaption>
</figure>

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/gestaoConsultas.png" alt="Appointment management" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 7</strong> — Internal interface for operational appointment management.</figcaption>
</figure>

### 3.4 Authentication

Authentication uses **JWT (JSON Web Tokens)** via the `jsonwebtoken` package.

Implemented flow:

1. The login form calls `POST /api/users/auth/login`.
2. The backend invokes the database authentication function through the `authModel`.
3. The password is converted to SHA-256 before validation in the database.
4. On success, the backend issues a JWT with `sub`, `email`, `staff`, `permissions`, and `profiles`.
5. The frontend stores the token in `localStorage` under the key `jwtToken`.
6. Protected requests use the header `Authorization: Bearer <token>`.
7. The `requireAuth` middleware validates signature, issuer, and expiration.

The JWT issuer is `miacaomigo-api` and lifetime is configurable via `JWT_EXPIRES_IN`, with a development default of `6h`.

### 3.5 Permissions and access control

The system combines access control on the frontend and backend.

| Layer | Mechanism |
|-------|-----------|
| Frontend | Local guards, profile-based menus, client/staff page redirects |
| JWT | Carries `staff`, `permissions`, and `profiles` |
| Backend | `requireAuth`, `requireStaff`, `requirePermission`, and `requireClinicSecretary` middlewares |
| Database | Profiles and permissions from RBAC tables (`profile`, `permission`, occupation/permission relations) |

Example permissions:

| Permission | Use |
|------------|-----|
| `manage_employees` | Create employees and access HR management |
| `manage_animals` | Look up active clients for animal association |
| `manage_appointments` | Manage appointments, check-in, start and close |
| `manage_commercial` | Reserved entry for commercial area |
| `view_reports` | Reserved entry for reports |

Even when the frontend hides or disables menu entries, authorisation is enforced on the backend. Critical operations are not protected by the UI alone.

### 3.6 Security

Security is implemented across several layers:

| Area | Implementation |
|------|----------------|
| Authentication | Server-signed JWT |
| Session | Login/logout recorded in the database; open sessions closed on server startup |
| Authorisation | Staff, permission middlewares, and clinic secretary validation |
| Passwords | SHA-256 hash before validation/persistence via database services |
| SQL | Parameterised queries with `pg`, reducing SQL injection risk |
| Configuration | Environment variables for database and JWT |
| Documentation | Swagger/OpenAPI exposes the technical contract and supports controlled testing |

Key security points:

- The token identifies the user but does not replace server-side permission checks.
- Permissions come from the database and are carried in the JWT to guide frontend and backend.
- The backend rejects requests without a token, with an expired token, or with insufficient permissions.
- The API uses JSON and REST routes organised by module.

### 3.7 Usability

The website uses straightforward area-based navigation:

| Aspect | Evidence |
|--------|----------|
| Context separation | Public area, client area, and staff area |
| Sidebars | Client and staff menus generated from profile |
| User feedback | Loading, error, and success messages in forms and tables |
| Visual consistency | Shared CSS across dashboards, cards, tables, and buttons |
| Theme | Light/dark preference persisted in user setup |
| Basic responsiveness | Viewport meta tag and grid/flex layouts on several pages |

The experience is suitable for academic demonstration: users quickly understand where they are, which actions they can perform, and which sections remain under development.

### 3.8 API and database integration

The backend starts from `Backend/server.js`, serves static files from `FrontEnd/`, and mounts the main API routes:

| Prefix | Responsibility |
|--------|----------------|
| `/api/users/auth` | Login, registration, logout, current session, preferences |
| `/api/users/clients` | Client lookup/listing for authorised staff |
| `/api/users/staff/me` | Personal agenda, schedule, attendance, absences, clock toggle |
| `/api/users/employees` | Employee creation with `manage_employees` permission |
| `/api/animals` | Catalogues, client animals, adoptions, internal management |
| `/api/appointments` | Bookings, availability, notifications, lifecycle, history |
| `/api-docs` | API Swagger UI |
| `/api-docs.json` | OpenAPI specification in JSON |

Models use `pg` and a shared PostgreSQL pool. Some business logic—login, logout, client creation—is delegated to database functions, aligning the application with the DataLayer.

### 3.9 Navigation architecture

Frontend navigation is centralised in `FrontEnd/Js/geral/routes.js`, which defines current routes, legacy paths, and redirect/guard helpers.

Sidebars are built from:

| File | Role |
|------|------|
| `SidebarMenuCatalog.js` | Central item catalogue and profile → menu mapping |
| `SidebarShell.js` | Shared sidebar structure |
| `ClientSidebar.js` | Client menu |
| `EmployeeSidebar.js` | Staff menu |

This avoids duplicating links on every page and keeps the menu aligned with the authenticated user’s profile.

### 3.10 Technical documentation

The API includes Swagger/OpenAPI documentation at:

- [`Interative Routes`](http://localhost:3000/api-docs/) for interactive visual browsing;
- [`Interative Routs JSON`](http://localhost:3000/api-docs.json/) for the JSON contract.

This shows that the application is not limited to the visual layer: there is a navigable technical contract with endpoints, schemas, expected responses, and protected routes.

<figure>
  <img src="/00_Assets/01_Screenshots/Application_Presentation/Swagger.png" alt="Swagger UI" style="width:100%; max-width:980px; border-radius:10px; border:1px solid #e5e7eb; box-shadow:0 6px 18px rgba(15,23,42,0.12);" />
  <figcaption><strong>Figure 8</strong> — Swagger UI documenting API endpoints. Interactive version: <a href="http://localhost:3000/api-docs/" target="_blank" rel="noopener">http://localhost:3000/api-docs/</a>.</figcaption>
</figure>

### 3.11 Technical strengths

Beyond visible interface features, the project includes technical elements that reinforce solution maturity:

| Topic | Significance |
|-------|--------------|
| Modular separation | Organisation by functional areas M1–M4 |
| DataLayer alignment | Application respects database architecture |
| RBAC | Structured permission management |
| Swagger/OpenAPI | Documentation and testability |
| Docker | Reproducible execution |
| Acknowledged limitations | Technical awareness and transparency |

---

## 4. Tools, frameworks, and packages

| Category | Tools / packages |
|----------|------------------|
| Frontend | HTML5, CSS3, JavaScript, Font Awesome, Bootstrap |
| Backend | Node.js, Express |
| Database | PostgreSQL, `pg` package |
| Authentication | `jsonwebtoken`, JWT Bearer |
| Configuration | `dotenv`, environment variables |
| API / documentation | `swagger-jsdoc`, `swagger-ui-express`, OpenAPI |
| API security | `cors`, Express middlewares |
| PDF / documents | `pdfkit` for prescription/document generation |
| Containers | Docker and Docker Compose |
| External integration | `@supabase/supabase-js`, included as a dependency prepared for future integration |

The application `docker-compose.yml` exposes the service at `http://localhost:3000`, runs `npm start`, and connects the API to PostgreSQL through environment variables.

---

## 5. Limitations

The current state is suitable for academic demonstration, but important limitations remain:

| Limitation | Impact |
|------------|--------|
| Mod3 commercial still reserved | Public shop and internal entries exist, but billing, stock, and reports are not fully integrated in the mounted API contract |
| Some HR views are presentation/prototype | They support the visual narrative but not all represent full API-backed workflows |
| Token in `localStorage` | Simple for academic context; production would require XSS risk analysis and possibly `HttpOnly` cookies |
| Development JWT secret | Fallback if `JWT_SECRET` is unset; production should require an explicit secret |
| SHA-256 password hashing | Matches the database format, but production would prefer adaptive hashing (bcrypt/argon2) |
| Open CORS | Useful in development; should be restricted by origin in production |
| Variable frontend/backend validation | Relevant checks exist, but a more uniform input schema layer would help |
| Limited automated tests | Validation relies mainly on manual runs, Swagger, and demonstration flows |

These limitations do not invalidate the academic solution; they show critical awareness of the gap between a functional prototype and a production-ready system.

---

## 6. Conclusion

The MiaCaoMigo website demonstrates a modular web application integrated with a database, appropriate for the proposed academic context. The solution covers public pages, authentication, distinct client and staff areas, animal management, appointment booking and follow-up, access profiles, and API technical documentation.

The main strengths are separation between frontend, backend, and DataLayer; JWT with RBAC; centralised navigation; and Swagger/OpenAPI. A complete demonstration path is: visitor → login → client area → book appointment → staff area → protected operation → Swagger.

The project’s final message is that the solution is not merely a set of static pages, but a modular application with real integration between interface, API, permissions, and database, while keeping clear limitations for future evolution.

---

[← Academic reports](README.md) · [Application architecture](../../04_Architecture/02_Application/README.md)

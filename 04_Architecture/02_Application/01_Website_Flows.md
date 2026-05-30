# Website flows

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Flow view</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Defense support</span>
</div>

This document summarizes the main website flows implemented in `MiaCaoMigo_`. It is written for presentation and defense usage; source-level endpoint details remain in Swagger/OpenAPI.

---

## API request flow

```text
Client request
  -> Backend/server.js
  -> Module route
  -> Auth/permission middleware
  -> Controller
  -> Model
  -> PostgreSQL
  -> JSON response
```

1. The browser sends an HTTP request, for example `POST /api/appointments`.
2. `Backend/server.js` receives the request, applies JSON parsing and CORS, and serves static frontend files.
3. The request is routed to the correct module:
   - `/api/users` for Mod1;
   - `/api/animals` for Mod2;
   - `/api/appointments` for Mod4.
4. Protected routes apply middleware such as `requireAuth`, `requireStaff`, `requirePermission` or `requireClinicSecretary`.
5. Controllers validate input, apply HTTP-level rules and call models.
6. Models call PostgreSQL through the shared pool in `Backend/config/db.js`.
7. PostgreSQL returns data or constraint/domain errors.
8. Controllers serialize the result as JSON for the frontend.

---

## Authentication flow

```mermaid
sequenceDiagram
    participant U as User
    participant FE as Frontend
    participant API as Express API
    participant DB as PostgreSQL

    U->>FE: Submit login form
    FE->>API: POST /api/users/auth/login
    API->>DB: Validate credentials and session rules
    DB-->>API: Login result
    API-->>FE: JWT + user snapshot + theme
    FE->>FE: Save jwtToken + miaUser and apply theme
    FE-->>U: Redirect by profile
```

1. The user opens a public page and navigates to `FrontEnd/Pages/UserView/Mod1/login.html`.
2. `FrontEnd/Js/Mod1/login.js` submits email and password to `POST /api/users/auth/login`.
3. `authController.login` validates credentials through the authentication model.
4. A successful login returns a JWT, a user snapshot and the current theme from `setup.the_set`.
5. `FrontEnd/Js/geral/authSession.js` stores `jwtToken` and `miaUser` in `localStorage` and applies the theme through `data-theme`.
6. Staff users are redirected to `FrontEnd/Pages/AdminPanel/MainDashboard.html`.
7. Client users are redirected to `FrontEnd/Pages/UserView/Mod1/area_cliente.html`.
8. Protected requests include `Authorization: Bearer <token>`.
9. Logout calls `POST /api/users/auth/logout`, closes the database session and clears local storage.

---

## Client setup preference flow

The client theme preference implements `RF_M1_39` and `RF_M1_41` through the existing `setup` table. The database remains the source of truth, while `localStorage` is used only as a local UI cache.

```mermaid
sequenceDiagram
    participant C as Client
    participant FE as Frontend
    participant API as Express API
    participant DB as PostgreSQL setup

    C->>FE: Login with valid credentials
    FE->>API: POST /api/users/auth/login
    API->>DB: Read setup.the_set for id_usr
    API-->>FE: JWT + user.theme
    FE->>FE: Apply data-theme and store local snapshot

    C->>FE: Open client area
    FE->>API: GET /api/users/auth/setup
    API->>DB: SELECT the_set, lan_set
    API-->>FE: setup preferences
    FE->>FE: Re-apply current theme

    C->>FE: Choose Claro/Escuro in sidebar
    FE->>FE: Apply theme immediately
    FE->>API: PUT /api/users/auth/setup/theme
    API->>DB: UPDATE setup.the_set
    API-->>FE: Updated setup row
```

1. The `setup` row is created automatically by the DataLayer when a user account is created.
2. On login, `authController.login` includes `theme` in the returned user snapshot.
3. On authenticated page load, `MiaAuth.loadSetupFromApi()` calls `GET /api/users/auth/setup` to synchronize with the database.
4. The client sidebar exposes a `Tema` selector with `Claro` and `Escuro`.
5. Changing the selector calls `MiaAuth.saveTheme()`, which applies the theme immediately and persists it with `PUT /api/users/auth/setup/theme`.
6. The API never receives `id_usr` from the frontend; it uses `req.user.sub` from the JWT, preventing one user from changing another user's preferences.
7. The backend validates the accepted values (`light`, `dark`), and the database constraint on `setup.the_set` enforces the same domain.

---

## Public adoptions flow

Visitors can browse animals available for adoption without logging in. Adoption is registered immediately for authenticated clients (no pending-request table in the current schema).

```mermaid
flowchart TD
  homeSection["FrontEnd/index.html#adocoes"] --> publicPage["FrontEnd/Pages/UserView/Geral/adocoes.html"]
  publicPage --> listApi["GET /api/animals/adoptions"]
  listApi --> availableView["vw_internal_animals_available"]
  availableView --> cards["Cards with Interno animals"]

  cards --> adoptClick["Client clicks Pedir adoção"]
  adoptClick --> authCheck{"JWT + client (not staff)?"}
  authCheck -->|"No"| loginPage["Redirect to login"]
  authCheck -->|"Yes"| adoptApi["POST /api/animals/:id/adopt"]
  adoptApi --> ownershipProc["sp_assign_ownership"]
  ownershipProc --> adopted["ownership created + animal Adotado"]
  adopted --> refreshList["Refresh public list"]
```

| Step | Page/API | Behaviour |
|------|----------|-----------|
| Discover | `index.html#adocoes` | Header link scrolls to the landing-page adoption section, matching services/about navigation |
| Browse | `adocoes.html` + `adocoes.js` | Public list from `GET /api/animals/adoptions`; `photo_path` reserved for future static assets |
| Authenticate | `login.html` | Unauthenticated adopt action redirects with return URL to adoptions page |
| Adopt | `POST /api/animals/:id/adopt` | Client-only; calls `sp_assign_ownership` with platform registrar employee; staff receives `403` |

DataLayer sources (unchanged schema): `vw_internal_animals_available`, `sp_assign_ownership`.

---

## Client flow

The authenticated client area supports self-service viewing and appointment management.

| Area | Page/script | Behaviour |
|------|-------------|-----------|
| Client entry | `FrontEnd/Pages/UserView/Mod1/area_cliente.html` | Reserved area entry point |
| Theme preference | `FrontEnd/Pages/Geral/ClientSideBar.html` + `FrontEnd/Js/geral/ClientSideBar.js` | Lets the authenticated client choose light/dark theme |
| Animals | `FrontEnd/Pages/UserView/Mod2/animais.html` + `FrontEnd/Js/Mod2/clientAnimais.js` | Lists animals linked to the authenticated client |
| Appointments | `FrontEnd/Pages/UserView/Mod4/consultas.html` + `FrontEnd/Js/Mod4/clientConsultas.js` | Lists, books, cancels and reschedules client appointments |

Access control rule:

```text
Client JWT -> only own client animals and appointments
```

---

## Appointment booking flow

```text
Open appointments page
  -> load own animals
  -> load veterinarians
  -> load specialties
  -> request availability
  -> submit appointment
  -> refresh appointment list
```

1. The client opens `FrontEnd/Pages/UserView/Mod4/consultas.html`.
2. The frontend loads animals with `GET /api/animals/me`.
3. The frontend loads veterinarians with `GET /api/appointments/veterinarians`.
4. The frontend loads specialties with `GET /api/appointments/specialties`.
5. After choosing veterinarian and date, the frontend calls `GET /api/appointments/availability?vetId=<id>&date=<yyyy-mm-dd>`.
6. The client selects an available slot.
7. The frontend submits `POST /api/appointments` with animal, veterinarian, specialty and scheduled date/time.
8. The API validates authentication, ownership, veterinarian, specialty, availability and schedule conflicts.
9. The appointment is persisted and the client appointment table is refreshed.

---

## Staff/admin flow

Staff users enter through the same authentication flow but are separated by institutional email and JWT permissions.

The staff area follows a hybrid model:

- **Self-service (`Minha Área`)**: every staff member sees their own agenda, schedule, clock-ins and absences through `/api/users/staff/me/*`.
- **Global operations (RBAC)**: management sections appear only when the JWT includes the matching permission (`manage_appointments`, `manage_employees`, `manage_animals`, etc.).

| Area | Page/script | Behaviour |
|------|-------------|-----------|
| Staff home | `FrontEnd/Pages/AdminPanel/MainDashboard.html` + `staffDashboardHome.js` | Personal widgets loaded from `GET /api/users/staff/me/agenda` |
| Full personal agenda | `FrontEnd/Pages/AdminPanel/AreaFuncionario.html` + `staffArea.js` | Detailed tables for appointments, schedule, attendance and absences |
| Permission shell | `FrontEnd/Js/geral/staffDashboard.js` | Shows/hides `[data-require]` sections according to JWT permissions |
| Global appointments | `FrontEnd/Pages/AdminPanel/AdicionarConsulta.html` | Staff appointment operations (`manage_appointments`) |
| Employee onboarding | `FrontEnd/Pages/AdminPanel/AdicionarFuncionario.html` | HR entry (`manage_employees`) |

Authorization rules:

| Operation | Guard |
|-----------|-------|
| Staff-only reads | `requireStaff` |
| Personal agenda | `requireAuth` + `requireStaff` on `/api/users/staff/me/*` |
| Appointment lifecycle | `requirePermission('manage_appointments')` |
| Employee directory | `manage_employees` in UI (`data-require`) |
| Animal association/removal | `requireClinicSecretary` |

Role-aware UI notes:

- Veterinarians focus on appointments where `appointment.id_emp` matches their employee row.
- Assistants see the same self-service area but global clinical management depends on RBAC profiles, not a fixed “assigned veterinarian” relationship in the database.

---

## Defense reading

For defense purposes, this flow proves that the website is not just a static frontend. It includes:

- authenticated client and staff navigation;
- API-mediated access to protected data;
- role and permission checks;
- database-backed session handling;
- database-backed client setup preferences;
- appointment lifecycle operations;
- visible separation between public, client and admin areas.

---

[← Application architecture](README.md)

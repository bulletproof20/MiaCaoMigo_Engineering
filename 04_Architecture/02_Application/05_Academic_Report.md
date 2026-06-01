# Academic Application Report

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">ApplicationLayer</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Defense summary</span>
</div>

This report summarizes the implemented website in `MiaCaoMigo_` for academic reading. It complements the detailed flow and API pages in this section.

---

## Implemented Scope

| Module | Website evidence |
|--------|------------------|
| Mod1 - Users | Public registration/login, JWT session state, logout, user setup theme preference, client/staff separation, role-aware sidebars, staff self-service pages, employee onboarding and HR presentation views |
| Mod2 - Animals | Species/breed catalogs, client animal list, public adoption list, direct client adoption and staff animal operations |
| Mod3 - Commercial | Public shop page placeholder and reserved sidebar entries; backend/API exposure remains outside the current mounted application contract |
| Mod4 - Appointments | Client booking, availability lookup, cancellation/rescheduling and staff lifecycle operations |

---

## Current Website Structure

| Area | Representative pages |
|------|----------------------|
| Public | `index.html`, `Pages/Public/servicos.html`, `Pages/Public/adocoes.html`, `Pages/Public/sobre_nos.html`, `Pages/Public/formulário_contacto.html`, `Pages/Public/loja.html` |
| Authentication | `Pages/Mod1_Users/Autenticacao/login.html`, `Pages/Mod1_Users/Autenticacao/criar_conta.html` |
| Client | `Pages/Mod1_Users/Clientes/area_cliente.html`, `Pages/Mod2_Animals/animais.html`, `Pages/Mod4_Appointments/consultas.html` |
| Staff | `Pages/Mod1_Users/Funcionarios/MainDashboard.html`, `AreaFuncionario.html`, `AdicionarFuncionario.html`, `QuadroFuncionario.html`, `FuncionarioDetalhe.html`, `CalendarioEquipa.html`, `Views/*.html`, `Pages/Mod2_Animals/RegistarAnimal.html`, `Pages/Mod4_Appointments/AdicionarConsulta.html` |

Navigation is centralized in `FrontEnd/Js/geral/routes.js`, which also maps legacy paths to the current directory structure. Staff/client menus are rendered through the shared sidebar shell and a menu catalog resolved from session/profile data.

---

## API Evidence

The Express backend is mounted from `Backend/server.js` and exposes:

| Prefix | Responsibility |
|--------|----------------|
| `/api/users/auth` | Login, register, logout, current user and setup/theme preferences |
| `/api/users/clients` | Staff-only active client lookup |
| `/api/users/staff/me` | Staff personal agenda, schedule, clock-ins, absences and clock toggle |
| `/api/users/employees` | Staff employee onboarding with `manage_employees` permission |
| `/api/animals` | Catalogs, client animals, staff animal management and adoptions |
| `/api/appointments` | Client and staff appointment workflows |

The API contract is published through Swagger UI at `/api-docs/` and as JSON at `/api-docs.json`.

Some HR pages under `Funcionarios/Views/` are frontend presentation/prototype partials. They support the defense narrative for employee management screens but should not be read as fully API-backed workflows yet. The full personal agenda API/script exists, but `AreaFuncionario.html` is currently empty in the website working tree and needs its HTML shell restored before the route validates.

---

## Defense Positioning

The ApplicationLayer demonstrates integration between the frontend, Express API and PostgreSQL DataLayer:

1. Public pages remain accessible without authentication.
2. Client pages rely on JWT state and only show the authenticated client's own animals and appointments.
3. Staff pages combine personal self-service data with RBAC-protected management actions.
4. The backend validates access through route middlewares before calling controllers/models.
5. Swagger/OpenAPI documents the mounted REST contract and should be regenerated whenever route contracts change.

---

[← Application architecture](README.md)

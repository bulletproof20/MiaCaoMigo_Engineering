# Frontend Documentation

Source in the website repository: `MiaCaoMigo_/Docs/Frontend/README.md`

This page describes the current MiaCaoMigo frontend. User-facing UI text is in Portuguese; technical comments and JSDoc comments in code are in English.

---

## Structure

| Area | Path | Purpose |
|------|------|---------|
| Public page | `FrontEnd/index.html` | Landing page with services, shop, about, contact, and login navigation |
| Client area | `FrontEnd/Pages/UserView/` | Login, registration, client dashboard, animals, and appointments |
| Staff area | `FrontEnd/Pages/AdminPanel/` | Staff dashboard and administrative pages |
| Shared pages | `FrontEnd/Pages/Geral/` | Sidebars and shared general pages |
| Scripts | `FrontEnd/Js/` | Session, dashboards, animals, appointments, and public UI behavior |
| CSS | `FrontEnd/CSS/` | Area-specific styles |

---

## Login Flow

1. Visitor opens `FrontEnd/index.html`.
2. Visitor navigates to `FrontEnd/Pages/UserView/Mod1/login.html`.
3. `FrontEnd/Js/Mod1/login.js` calls `POST /api/users/auth/login`.
4. `FrontEnd/Js/geral/authSession.js` stores the JWT and user snapshot in `localStorage`.
5. Redirect:
   - Client -> `FrontEnd/Pages/UserView/Mod1/area_cliente.html`
   - Staff -> `FrontEnd/Pages/AdminPanel/MainDashboard.html`

Full diagram: [Frontend Flow](Frontend_Flow.md)

---

## Main Pages

| Page | Purpose |
|------|---------|
| `UserView/Mod1/login.html` | Login |
| `UserView/Mod1/criar_conta.html` | Client registration |
| `UserView/Mod1/area_cliente.html` | Client hub |
| `UserView/Mod2/animais.html` | Account animals |
| `UserView/Mod4/consultas.html` | Appointments and appointment booking |
| `UserView/Geral/servicos.html` | Public services page |
| `UserView/Geral/sobre_nos.html` | Public about page |
| `UserView/Geral/formulário_contacto.html` | Public contact page |
| `UserView/Mod3/loja.html` | Shop |
| `AdminPanel/MainDashboard.html` | Staff dashboard |
| `AdminPanel/AdicionarFuncionario.html` | Staff employee management |
| `AdminPanel/AdicionarConsulta.html` | Staff appointments page |

---

## Main Scripts

| Script | Purpose |
|--------|---------|
| `geral/authSession.js` | `window.MiaAuth`, token, user, logout, and public nav behavior |
| `Mod1/login.js` | Login and profile-based redirect |
| `Mod1/criarConta.js` | `POST /api/users/auth/register` |
| `geral/clientDashboard.js` | Session validation with `GET /api/users/auth/me` |
| `Mod2/clientAnimais.js` | Species, breeds, and client animals |
| `Mod4/clientConsultas.js` | Appointments, availability, and booking |
| `geral/ClientSideBar.js` | Client sidebar and logout |
| `geral/AdminSidebar.js` | Staff sidebar |
| `geral/staffDashboard.js` | Staff page guard and `data-require` permission behavior |
| `geral/cookies.js` | Cookie consent state |
| `geral/scroll.js` | Landing page carousel |

---

## APIs Consumed By The Frontend

| Area | Main endpoints |
|------|----------------|
| Auth | `POST .../login`, `POST .../register`, `GET .../me`, `POST .../logout` |
| Animals | `GET .../species`, `GET .../breeds`, `GET .../me`, `POST /api/animals`, `DELETE .../:id` |
| Appointments | `GET .../me`, `GET .../veterinarians`, `GET .../specialties`, `GET .../availability`, `POST /api/appointments` |

Base prefixes: `/api/users/auth`, `/api/animals`, `/api/appointments`.

Full contract: [Swagger](Swagger.md) · runtime at `http://localhost:3000/api-docs/`

---

## Generated Reference

After running `npm run docs:build` in the **`MiaCaoMigo_`** repository:

- With server: [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/)
- Static website file: `Docs/site/CodeReference/index.html`

---

[<- Documentation hub](README.md)

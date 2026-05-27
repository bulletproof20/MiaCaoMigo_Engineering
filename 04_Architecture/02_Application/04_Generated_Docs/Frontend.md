# Frontend — documentação da aplicação

Fonte no website: `MiaCaoMigo_/Docs/Frontend/README.md`

Descrição do frontend atual do MiaCaoMigo. A interface visível está em português; comentários técnicos e JSDoc no código estão em inglês.

---

## Estrutura

| Área | Caminho | Função |
|------|---------|--------|
| Página pública | `FrontEnd/index.html` | Landing: serviços, loja, sobre, contacto, login |
| Área cliente | `FrontEnd/Pages/UserView/` | Login, registo, painel, animais, consultas |
| Área staff | `FrontEnd/Pages/AdminPanel/` | Dashboard e páginas administrativas |
| Partilhado | `FrontEnd/Pages/Geral/` | Sidebars e páginas gerais |
| Scripts | `FrontEnd/Js/` | Sessão, dashboards, animais, consultas, UI pública |
| CSS | `FrontEnd/CSS/` | Estilos por área |

---

## Fluxo de login

1. Visitante abre `FrontEnd/index.html`.
2. Navega para `FrontEnd/Pages/UserView/Mod1/login.html`.
3. `FrontEnd/Js/Mod1/login.js` chama `POST /api/users/auth/login`.
4. `FrontEnd/Js/geral/authSession.js` guarda JWT e utilizador em `localStorage`.
5. Redirecionamento:
   - Cliente → `FrontEnd/Pages/UserView/Mod1/area_cliente.html`
   - Staff → `FrontEnd/Pages/AdminPanel/MainDashboard.html`

Diagrama completo: [Frontend Flow](Frontend_Flow.md)

---

## Páginas principais

| Página | Função |
|--------|--------|
| `UserView/Mod1/login.html` | Login |
| `UserView/Mod1/criar_conta.html` | Registo de cliente |
| `UserView/Mod1/area_cliente.html` | Hub do cliente |
| `UserView/Mod2/animais.html` | Animais da conta |
| `UserView/Mod4/consultas.html` | Consultas e marcação |
| `UserView/Geral/servicos.html` | Serviços (público) |
| `UserView/Geral/sobre_nos.html` | Sobre (público) |
| `UserView/Geral/formulário_contacto.html` | Contacto (público) |
| `UserView/Mod3/loja.html` | Loja |
| `AdminPanel/MainDashboard.html` | Dashboard staff |
| `AdminPanel/AdicionarFuncionario.html` | Gestão de funcionários (staff) |
| `AdminPanel/AdicionarConsulta.html` | Consultas (staff) |

---

## Scripts principais

| Script | Função |
|--------|--------|
| `geral/authSession.js` | `window.MiaAuth`, token, utilizador, logout, nav pública |
| `Mod1/login.js` | Login e redirecionamento por perfil |
| `Mod1/criarConta.js` | `POST /api/users/auth/register` |
| `geral/clientDashboard.js` | Validação de sessão com `GET /api/users/auth/me` |
| `Mod2/clientAnimais.js` | Espécies, raças e animais do cliente |
| `Mod4/clientConsultas.js` | Consultas, disponibilidade e marcação |
| `geral/ClientSideBar.js` | Sidebar cliente e logout |
| `geral/AdminSidebar.js` | Sidebar staff |
| `geral/staffDashboard.js` | Proteção staff e `data-require` por permissões |
| `geral/cookies.js` | Consentimento de cookies |
| `geral/scroll.js` | Carrossel da landing |

---

## APIs consumidas pelo frontend

| Área | Endpoints principais |
|------|----------------------|
| Auth | `POST .../login`, `POST .../register`, `GET .../me`, `POST .../logout` |
| Animais | `GET .../species`, `GET .../breeds`, `GET .../me`, `POST /api/animals`, `DELETE .../:id` |
| Consultas | `GET .../me`, `GET .../veterinarians`, `GET .../specialties`, `GET .../availability`, `POST /api/appointments` |

Prefixo base: `/api/users/auth`, `/api/animals`, `/api/appointments`.

Contrato completo: [Swagger](Swagger.md) · runtime em `http://localhost:3000/api-docs/`

---

## Referência gerada

Após `npm run docs:build` no repositório **`MiaCaoMigo_`**:

- Com servidor: [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/)
- Estático no website: `Docs/site/CodeReference/index.html`

---

[← Hub documentação](README.md)

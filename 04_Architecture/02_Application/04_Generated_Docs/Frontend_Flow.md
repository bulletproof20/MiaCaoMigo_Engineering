# Fluxo do frontend MiaCaoMigo

Fonte no website: `MiaCaoMigo_/Docs/Frontend_Flow.md`

Diagrama e passos de navegação reais entre páginas e chamadas à API. Para narrativa orientada a defesa, ver também [Website flows](../01_Website_Flows.md).

---

## Visão geral

O frontend divide-se em:

- páginas públicas para visitantes;
- páginas de cliente autenticado;
- páginas administrativas para staff.

---

## Diagrama de navegação

```mermaid
flowchart TD
  visitor["Visitante"] --> home["Home: FrontEnd/index.html"]
  home --> login["Login: UserView/Mod1/login.html"]
  home --> publicPages["Páginas públicas: serviços, loja, sobre, contacto"]
  home --> register["Criar conta: UserView/Mod1/criar_conta.html"]

  register -->|"POST /api/users/auth/register"| authApi["Auth API"]
  login -->|"POST /api/users/auth/login"| authApi
  authApi -->|"JWT + user"| miaAuth["MiaAuth: localStorage"]

  miaAuth -->|"cliente"| clientHub["Área cliente: Mod1/area_cliente.html"]
  miaAuth -->|"staff"| staffHub["Staff: AdminPanel/MainDashboard.html"]

  clientHub --> animals["Meus Animais: Mod2/animais.html"]
  clientHub --> appointments["Minhas Consultas: Mod4/consultas.html"]

  animals -->|"GET /api/animals/species"| animalsApi["Animals API"]
  animals -->|"GET /api/animals/breeds"| animalsApi
  animals -->|"GET /api/animals/me"| animalsApi
  animals -->|"POST /api/animals"| animalsApi
  animals -->|"DELETE /api/animals/:id"| animalsApi

  appointments -->|"GET /api/appointments/me"| appointmentsApi["Appointments API"]
  appointments -->|"GET vets, specialties, availability"| appointmentsApi
  appointments -->|"POST /api/appointments"| appointmentsApi

  staffHub --> staffPages["Staff pages: AdicionarFuncionario, AdicionarConsulta"]
  staffHub -->|"data-require permissions"| staffGuard["staffDashboard.js"]
```

---

## Páginas públicas

| Página | Descrição |
|--------|-----------|
| `FrontEnd/index.html` | Landing page |
| `UserView/Geral/servicos.html` | Serviços |
| `UserView/Geral/sobre_nos.html` | Sobre a clínica |
| `UserView/Geral/formulário_contacto.html` | Contacto |
| `UserView/Mod3/loja.html` | Loja online |
| `UserView/Mod1/login.html` | Login |
| `UserView/Mod1/criar_conta.html` | Registo de cliente |

---

## Autenticação e sessão

- `login.js` → `POST /api/users/auth/login`
- `authSession.js` → `window.MiaAuth`, `jwtToken` + `miaUser` em `localStorage`
- `clientDashboard.js` → `GET /api/users/auth/me` na área cliente
- `staffDashboard.js` → exige `staff === true` e `data-require` por permissões
- Logout → `POST /api/users/auth/logout` quando existe token

---

## Fluxo do cliente

| Página | Script | Função |
|--------|--------|--------|
| `Mod1/area_cliente.html` | `geral/clientDashboard.js` | Hub e validação de sessão |
| `Mod2/animais.html` | `Mod2/clientAnimais.js` | Lista, adiciona e remove animais |
| `Mod4/consultas.html` | `Mod4/clientConsultas.js` | Lista e marca consultas |

---

## Fluxo staff

| Página | Script | Função |
|--------|--------|--------|
| `AdminPanel/MainDashboard.html` | `staffDashboard.js`, `AdminSidebar.js` | Dashboard com permissões |
| `AdminPanel/AdicionarFuncionario.html` | `staffDashboard.js` | Formulário staff |
| `AdminPanel/AdicionarConsulta.html` | `staffDashboard.js` | Consultas staff |

---

## Documentação relacionada

| Recurso | URL / página |
|---------|----------------|
| API interativa | [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) |
| JSDoc | [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) |
| Frontend (páginas e scripts) | [Frontend](Frontend.md) |
| Backend (rotas) | [Backend](Backend.md) |

---

[← Hub documentação](README.md)

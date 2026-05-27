# Backend — documentação da aplicação

Fonte no website: `MiaCaoMigo_/Docs/Backend/README.md`

Esta página resume como o backend Express expõe a aplicação, a API e a documentação servida em runtime.

---

## Rotas em runtime

| URL | Origem | Descrição |
|-----|--------|-----------|
| `/` | `FrontEnd/` | Site estático |
| `/api/users` | `Backend/routes/Mod1_Users` | Autenticação e sessão |
| `/api/animals` | `Backend/routes/Mod2_Animals` | Espécies, raças e animais |
| `/api/appointments` | `Backend/routes/Mod4_Appointments` | Consultas, veterinários, especialidades e disponibilidade |
| `/docs/` | `Docs/` | Hub HTML da documentação (website) |
| `/api-docs/` | `swagger-ui-express` | Swagger UI interativo |
| `/api-docs.json` | `swagger-jsdoc` | OpenAPI JSON em runtime |
| `/jsdoc/` | `Docs/site/CodeReference/` | Referência JSDoc |
| `/db-test` | `Backend/server.js` | Teste de ligação à BD |

---

## Ficheiros principais

| Ficheiro | Função |
|----------|--------|
| `Backend/server.js` | Express, middlewares, rotas e documentação servida |
| `Backend/swaggerConfig.js` | OpenAPI e schemas globais |
| `Backend/swagger.js` | Export do documento OpenAPI gerado |
| `Backend/config/db.js` | Pool PostgreSQL |
| `Backend/middlewares/authMiddleware.js` | JWT, staff, permissões, secretaria |
| `scripts_docs/generate-swagger.js` | Gera `Docs/Swagger/openapi.json` |
| `scripts_docs/generate-jsdoc.js` | Gera `Docs/site/CodeReference/` |
| `scripts_docs/build-docs.js` | HTML dos Markdown e Redoc |
| `jsdoc.json` | Âmbito da referência JSDoc |

---

## Camadas do pedido

```text
HTTP request
  -> server.js (middlewares)
  -> routes (Mod1 / Mod2 / Mod4)
  -> middlewares (auth, staff, permissions)
  -> controllers
  -> models
  -> PostgreSQL (MiaCaoMigo_DataLayer)
```

Ver também [Website flows](../01_Website_Flows.md) para o fluxo completo com frontend.

---

## OpenAPI

A fonte de verdade da API está nos comentários `@swagger` das rotas montadas e em `Backend/swaggerConfig.js`.

Rotas incluídas no OpenAPI (montadas em `server.js`):

- `Backend/routes/Mod1_Users/authRoutes.js`
- `Backend/routes/Mod2_Animals/animais.js`
- `Backend/routes/Mod4_Appointments/appointmentRoutes.js`

Módulos stub (ex.: Mod3 comercial, prescrições não montadas) não entram no contrato para evitar tags sem endpoints reais.

Detalhe: [Swagger](Swagger.md) · [OpenAPI](OpenAPI.md)

---

## JSDoc

Comentários JSDoc em:

- `Backend/**/*.js`
- `FrontEnd/Js/**/*.js`

Saída: `Docs/site/CodeReference/`, servida em `http://localhost:3000/jsdoc/`.

Detalhe: [Code Reference](Code_Reference.md)

---

## Manutenção

1. Atualizar `@swagger` se mudares endpoints, payloads ou respostas.
2. Atualizar JSDoc se mudares módulos ou contratos públicos.
3. No repositório **`MiaCaoMigo_`**, correr `npm run docs:build`.

Não editar manualmente `Docs/Swagger/openapi.json` nem `Docs/site/**`.

---

[← Hub documentação](README.md)

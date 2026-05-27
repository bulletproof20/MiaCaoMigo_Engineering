# Swagger — documentação da API

Fonte no website: `MiaCaoMigo_/Docs/Swagger/README.md`

A especificação OpenAPI da API MiaCaoMigo é gerada a partir do código e publicada em runtime e em ficheiros estáticos no repositório do website.

---

## O que existe

| Artefacto | Localização (`MiaCaoMigo_`) | Descrição |
|-----------|----------------------------|-----------|
| Guia Swagger | `Docs/Swagger/README.md` | Como o OpenAPI é produzido |
| Contrato JSON | `Docs/Swagger/openapi.json` | Gerado automaticamente (não editar à mão) |
| Redoc HTML | `Docs/site/Swagger/openapi.html` | Após `npm run docs:build` |

---

## Fonte da verdade

- Comentários `@swagger` nas rotas Express **montadas** em `server.js`
- Schemas globais em `Backend/swaggerConfig.js`
- Geração via `swagger-jsdoc` (`scripts_docs/generate-swagger.js`)

Rotas documentadas no contrato atual:

| Módulo | Prefixo | Ficheiro de rotas |
|--------|---------|-------------------|
| Mod1 | `/api/users/auth/*` | `Backend/routes/Mod1_Users/authRoutes.js` |
| Mod2 | `/api/animals/*` | `Backend/routes/Mod2_Animals/animais.js` |
| Mod4 | `/api/appointments/*` | `Backend/routes/Mod4_Appointments/appointmentRoutes.js` |

---

## Onde ver (runtime)

Com `npm start` em **`MiaCaoMigo_`**:

| URL | Conteúdo |
|-----|----------|
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | **Swagger UI** — documentação interativa (equivalente ao card “Swagger UI” do hub website) |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | JSON OpenAPI em tempo real |

---

## Onde ver (estático)

Após `npm run docs:build` no website:

| Caminho | Conteúdo |
|---------|----------|
| `Docs/Swagger/openapi.json` | JSON gerado |
| `Docs/site/Swagger/openapi.html` | Visualização Redoc (card “Especificação” no hub website) |

Detalhe da especificação: [OpenAPI](OpenAPI.md)

---

## Atualizar

| Comando (em `MiaCaoMigo_`) | Quando |
|----------------------------|--------|
| `npm run docs:generate` | Só mudaste Swagger/OpenAPI |
| `npm run docs:build` | Mudaste qualquer documentação (recomendado) |

Não editar `Docs/Swagger/openapi.json` manualmente.

---

[← Hub documentação](README.md)

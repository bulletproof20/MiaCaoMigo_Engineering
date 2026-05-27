# Especificação OpenAPI

Fonte no website: hub `Docs/index.html` (card **Especificação**) e `Docs/Swagger/`

A especificação OpenAPI descreve o contrato REST exposto pelo backend. Pode ser consultada de três formas: JSON em runtime, Swagger UI e HTML Redoc gerado.

---

## Contrato JSON

| Origem | Caminho / URL |
|--------|----------------|
| Runtime (servidor ligado) | [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) |
| Ficheiro gerado no website | `MiaCaoMigo_/Docs/Swagger/openapi.json` |

O JSON em `Docs/Swagger/openapi.json` é produzido por `npm run docs:generate` ou `npm run docs:build`. É a mesma base que alimenta o Swagger UI.

---

## Visualização HTML (Redoc)

No repositório **`MiaCaoMigo_`**, após regenerar documentação:

```text
Docs/site/Swagger/openapi.html
```

Abrir no browser (com ou sem servidor):

- Via servidor: `http://localhost:3000/docs/` → hub → ligação para a especificação no site gerado
- Ficheiro local: abrir `Docs/site/Swagger/openapi.html` no browser

Este HTML corresponde ao card **Especificação** da página inicial `Docs/index.html`.

---

## Swagger UI (exploração interativa)

Para testar endpoints e ver schemas de forma interativa, usar **Swagger UI** (card separado no hub website):

[http://localhost:3000/api-docs/](http://localhost:3000/api-docs/)

Guia completo: [Swagger](Swagger.md)

---

## Manutenção do contrato

1. Alterar rotas ou schemas nas fontes (`@swagger`, `swaggerConfig.js`).
2. No repositório **`MiaCaoMigo_`**: `npm run docs:build`.
3. Validar em Swagger UI e, se necessário, comparar com `openapi.json` gerado.

---

[← Hub documentação](README.md)

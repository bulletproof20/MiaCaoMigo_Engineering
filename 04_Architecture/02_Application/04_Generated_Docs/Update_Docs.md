# Atualizar documentação da aplicação

Fonte no website: `MiaCaoMigo_/Docs/README.md` (secção Commands)

Todos os comandos abaixo correm no repositório **`MiaCaoMigo_`**, na raiz do projeto (onde está o `package.json` com os scripts `docs:*`).

---

## Comando recomendado

```sh
cd MiaCaoMigo_
npm run docs:build
```

Regenera:

- `Docs/Swagger/openapi.json` (OpenAPI)
- `Docs/site/CodeReference/` (JSDoc HTML)
- HTML a partir dos Markdown em `Docs/**/*.md` (inclui Backend, Frontend, Frontend_Flow, Swagger README)
- `Docs/site/Swagger/openapi.html` (Redoc)

Equivalente ao card **Atualizar Docs** do hub `Docs/index.html`.

---

## Comandos parciais

| Comando | Quando usar |
|---------|-------------|
| `npm run docs:generate` | Alteraste apenas `@swagger` ou `swaggerConfig.js` |
| `npm run docs:code` | Alteraste apenas comentários JSDoc |
| `npm run docs:build` | Qualquer alteração em documentação ou antes de entregar/commit |

---

## O que não editar manualmente

- `Docs/Swagger/openapi.json`
- `Docs/site/**` (HTML gerado)

Editar as fontes:

| Tipo | Onde |
|------|------|
| API | `Backend/routes/**`, `Backend/swaggerConfig.js` |
| Código | JSDoc em `Backend/` e `FrontEnd/Js/` |
| Guias | `Docs/**/*.md` |

Depois de alterar fontes no website, atualizar as páginas espelhadas neste hub Engineering (`04_Generated_Docs/`) se o conteúdo narrativo mudou.

---

## Verificar após gerar

1. `npm start`
2. Abrir [http://localhost:3000/docs/](http://localhost:3000/docs/) — hub HTML do website
3. Abrir [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) — Swagger UI
4. Abrir [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) — JSDoc

No portal Engineering (MkDocs):

```sh
cd MiaCaoMigo_Engineering
docker compose -f .docs/docker-compose.yml up
```

Navegar em **Architecture → Application → Website Documentation**.

---

## Sincronização Engineering ↔ Website

| Conteúdo | Repositório canónico para edição técnica | Cópia/adaptação Engineering |
|----------|------------------------------------------|-----------------------------|
| Markdown guias | `MiaCaoMigo_/Docs/*.md` | `04_Architecture/02_Application/04_Generated_Docs/*.md` |
| OpenAPI / JSDoc gerados | `MiaCaoMigo_/Docs/site/**` | Consultar via URLs runtime ou ficheiros no website |
| Hub visual com cards | `MiaCaoMigo_/Docs/index.html` | [README.md](README.md) (MkDocs cards) |

---

[← Hub documentação](README.md)

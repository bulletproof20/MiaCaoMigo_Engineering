# Update Application Documentation

Source in the website repository: `MiaCaoMigo_/Docs/README.md` ("Commands" section)

All commands below run in the **`MiaCaoMigo_`** repository root, where `package.json` defines the `docs:*` scripts.

---

## Recommended Command

```sh
cd MiaCaoMigo_
npm run docs:build
```

This regenerates:

- `Docs/Swagger/openapi.json` (OpenAPI)
- `Docs/site/CodeReference/` (JSDoc HTML)
- HTML from Markdown files in `Docs/**/*.md`, including Backend, Frontend, Frontend_Flow, and Swagger README
- `Docs/site/Swagger/openapi.html` (Redoc)

This corresponds to the **Update Docs** card in the website `Docs/index.html` hub.

---

## Partial Commands

| Command | When to use |
|---------|-------------|
| `npm run docs:generate` | Only `@swagger` comments or `swaggerConfig.js` changed |
| `npm run docs:code` | Only JSDoc comments changed |
| `npm run docs:build` | Any documentation changed, or before delivery/commit |

---

## What Not To Edit Manually

- `Docs/Swagger/openapi.json`
- `Docs/site/**` (generated HTML)

Edit the source files instead:

| Type | Where |
|------|-------|
| API | `Backend/routes/**`, `Backend/swaggerConfig.js` |
| Code | JSDoc in `Backend/` and `FrontEnd/Js/` |
| Guides | `Docs/**/*.md` |

After changing website documentation sources, update the mirrored pages in this Engineering hub (`04_Generated_Docs/`) if the narrative content changed.

---

## Verify After Generation

1. Run `npm start`.
2. Open [http://localhost:3000/docs/](http://localhost:3000/docs/) - website HTML hub.
3. Open [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) - Swagger UI.
4. Open [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) - JSDoc.

In the Engineering portal (MkDocs):

```sh
cd MiaCaoMigo_Engineering
docker compose -f .docs/docker-compose.yml up
```

Navigate to **Architecture -> Application -> Website Documentation**.

---

## Engineering / Website Synchronization

| Content | Canonical repository for technical editing | Engineering copy/adaptation |
|---------|-------------------------------------------|-----------------------------|
| Markdown guides | `MiaCaoMigo_/Docs/*.md` | `04_Architecture/02_Application/04_Generated_Docs/*.md` |
| Generated OpenAPI / JSDoc | `MiaCaoMigo_/Docs/site/**` | Reference through runtime URLs or website files |
| Visual card hub | `MiaCaoMigo_/Docs/index.html` | [README.md](README.md) (MkDocs cards) |

---

[<- Documentation hub](README.md)

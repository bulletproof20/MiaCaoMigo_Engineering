# Update Application Documentation

Application documentation is maintained in this Engineering portal. The website repository only generates the OpenAPI JSON artifact from source route comments.

---

## Regenerate OpenAPI

```sh
cd MiaCaoMigo_
npm run docs:generate
```

This regenerates:

- `Docs/Swagger/openapi.json` (OpenAPI)

---

## Partial Commands

| Command | When to use |
|---------|-------------|
| `npm run docs:generate` | Only `@swagger` comments or `swaggerConfig.js` changed |

---

## What Not To Edit Manually

- `Docs/Swagger/openapi.json`

Edit the source files instead:

| Type | Where |
|------|-------|
| API | `Backend/routes/**`, `Backend/swaggerConfig.js` |
| Guides | `MiaCaoMigo_Engineering/04_Architecture/02_Application/` |

After changing application behavior or routes, update the relevant Engineering pages and regenerate the OpenAPI artifact if endpoint contracts changed.

---

## Verify After Generation

1. Run `npm start`.
2. Open [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) - Swagger UI.

In the Engineering portal (MkDocs):

```sh
cd MiaCaoMigo_Engineering
docker compose -f .docs/docker-compose.yml up
```

Navigate to **Architecture -> Application -> Website Documentation**.

---

## Engineering / Website Synchronization

| Content | Canonical location |
|---------|--------------------|
| Application guides | `MiaCaoMigo_Engineering/04_Architecture/02_Application/` |
| OpenAPI source | `MiaCaoMigo_/Backend/routes/**`, `MiaCaoMigo_/Backend/swaggerConfig.js` |
| Generated OpenAPI JSON | `MiaCaoMigo_/Docs/Swagger/openapi.json` |

---

[<- Documentation hub](README.md)

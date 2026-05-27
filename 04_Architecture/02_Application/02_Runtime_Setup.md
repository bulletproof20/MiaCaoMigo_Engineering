# Runtime setup

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Runtime</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Application + DataLayer</span>
</div>

This document captures the runtime model of the website application and its connection to the database repository. It adapts the setup notes from the website README into the Engineering portal.

---

## Prerequisites

| Requirement | Purpose |
|-------------|---------|
| Node.js + npm | Run the Express application locally |
| Docker + Docker Compose | Run PostgreSQL DataLayer and optionally the application container |
| `MiaCaoMigo_DataLayer` | Database schema, seed data and PostgreSQL container |
| `Backend/.env` | Local Node.js runtime configuration |
| `Backend/.env.docker` | Dockerized application runtime configuration |

---

## DataLayer startup

The PostgreSQL database is started from the DataLayer repository:

```sh
cd ../MiaCaoMigo_DataLayer
docker compose up -d
```

The database is exposed on the host as:

```text
localhost:5433
```

The PostgreSQL container uses port `5432` internally and exposes `5433` on the host to avoid conflicts with local PostgreSQL installations.

---

## Local application runtime

Expected local environment file in the website repository:

```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=miacaomigo
DB_PASSWORD=1234
DB_PORT=5433

JWT_SECRET=EsteSegredo!2026!ProgWeb
JWT_EXPIRES_IN=6h

PORT=3000
API_BASE_URL=http://localhost:3000
```

Start the website application:

```sh
cd ../MiaCaoMigo_
npm install
npm start
```

Runtime path:

```text
Browser -> localhost:3000 -> Node/Express on host -> localhost:5433 -> PostgreSQL DataLayer
```

Application URL:

```text
http://localhost:3000
```

---

## Dockerized application runtime

When the application runs inside Docker, the database host must point back to the host machine:

```env
DB_HOST=host.docker.internal
```

Start the application container from the website repository:

```sh
docker compose up --build
```

Stop it with:

```sh
docker compose down
```

Runtime path:

```text
Browser -> localhost:3000 -> Node/Express in Docker -> host.docker.internal:5433 -> PostgreSQL DataLayer
```

The website `docker-compose.yml` includes `extra_hosts` so `host.docker.internal` also works on Linux.

---

## Runtime ports

| Port | Service |
|------|---------|
| `3000` | Node/Express website, API and generated docs |
| `5433` | PostgreSQL exposed on the host |
| `5432` | PostgreSQL internal container port |

---

## Defense reading

This setup demonstrates that the ecosystem is intentionally split:

- Engineering documents the architecture and evidence;
- DataLayer owns the database and integrity model;
- ApplicationLayer owns the UI/API runtime and consumes the database through controlled configuration.

---

[← Application architecture](README.md)

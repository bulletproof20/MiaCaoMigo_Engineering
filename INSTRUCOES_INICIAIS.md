# Instruções para testar o projeto MiaCaoMigo

Suadações, Professora,

Para testar o projeto é necessário clonar os 3 repositórios e arrancar os serviços por esta ordem:

1. DataLayer
2. Website / API
3. Engineering Docs

## Repositórios

Application / Website:

https://github.com/JMRM98/MiaCaoMigo_.git

DataLayer / Base de Dados:

https://github.com/bulletproof20/MiaCaoMigo_DataLayer.git

Engineering / Documentação:

https://github.com/bulletproof20/MiaCaoMigo_Engineering.git

## Pré-requisitos

- Docker + Docker Compose
- Node.js + npm
- Portas livres:
  - 5433 para PostgreSQL
  - 3000 para o website/API
  - 8000 para a documentação Engineering

## 1. Clonar os repositórios

```bash
mkdir MiaCaoMigo
cd MiaCaoMigo

git clone https://github.com/bulletproof20/MiaCaoMigo_DataLayer.git
git clone https://github.com/JMRM98/MiaCaoMigo_.git
git clone https://github.com/bulletproof20/MiaCaoMigo_Engineering.git
```

## 2. Arrancar a base de dados

```bash
cd MiaCaoMigo_DataLayer
docker compose up -d --build
```

A base de dados fica disponível em:

```text
Host: localhost
Porta: 5433
Database: miacaomigo
User: postgres
Password: 1234
```

## 3. Arrancar o website/API

```bash
cd ../MiaCaoMigo_
npm install
npm start
```

Se o ficheiro `Backend/.env` não existir, criar com:

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

Depois abrir:

```text
Website: http://localhost:3000
Swagger/API Docs: http://localhost:3000/api-docs/
OpenAPI JSON: http://localhost:3000/api-docs.json
```

## 4. Arrancar a documentação Engineering

Noutro terminal:

```bash
cd MiaCaoMigo_Engineering
docker compose -f .docs/docker-compose.yml up -d
```

Abrir:

```text
Documentação Engineering: http://localhost:8000
```

## Credenciais de demonstração

Cliente:

```text
Email: goncalo.rego.dev@gmail.com
Password: 123456789
```

Administrador / staff:

```text
Email: 2@miacaomigo.pt
Password: 123456789
```

Funcionário clínico:

```text
Email: 5@miacaomigo.pt
Password: 123456789
```

## Sugestão de teste rápido

1. Entrar no website em http://localhost:3000.
2. Fazer login como cliente.
3. Validar a área do cliente:
   - consultas;
   - prescrições;
   - faturas;
   - download de PDFs.
4. Fazer logout.
5. Fazer login como staff/admin com `2@miacaomigo.pt`.
6. Validar:
   - área comercial;
   - histórico/detalhes de faturas;
   - download de PDF de fatura;
   - gestão de consultas;
   - marcação/reagendamento de consultas.
7. Abrir Swagger em http://localhost:3000/api-docs/ para consultar/testar endpoints.
8. Abrir a documentação Engineering em http://localhost:8000.

## Nota sobre PDFs

Os PDFs de faturas e prescrições são gerados no momento do clique em "PDF".

Os ficheiros não ficam guardados na base de dados como binários; o backend gera o documento em memória e envia-o ao browser, são descarregados os ficheiros para o computador do utilizador.

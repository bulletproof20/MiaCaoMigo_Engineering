# MiaCaoMigo — Docker Production Mode

Este guia prepara o modo de produção do ecossistema MiaCaoMigo sem o deixar ligado por defeito. Os ficheiros ficam prontos, mas só arrancam quando forem executados os comandos deste documento.

## O Que Este Modo Faz

O modo de produção cria três serviços Docker:

- `db`: base de dados PostgreSQL 15 com `pg_cron`, dados persistentes e bootstrap sem dados demo.
- `website`: aplicação Node.js/Express que serve a API e o frontend estático.
- `docs`: documentação MkDocs compilada para HTML e servida por Nginx.

O ficheiro principal é:

```bash
07_Deployment/docker-compose.prod.yml
```

Este ficheiro não substitui os `docker-compose.yml` de desenvolvimento. Ele é uma configuração paralela, pensada para ser ativada apenas quando se quiser testar ou correr o ambiente em modo produção.

## Como Funciona

### Rede Interna

A base de dados fica numa rede Docker interna chamada `miacaomigo_internal`. Isso significa que o PostgreSQL não fica exposto diretamente no computador ou na internet.

A aplicação liga-se à base de dados usando:

```text
DB_HOST=db
DB_PORT=5432
```

Ou seja, em produção a app não usa `localhost`, `host.docker.internal` nem a porta `5433`.

### Rede Pública

O website e a documentação ficam numa rede pública Docker chamada `miacaomigo_public`.

Por defeito:

- website: `http://localhost:3000`
- documentação: `http://localhost:8000`

Num servidor real, estes serviços devem ficar atrás de um reverse proxy com HTTPS, por exemplo Nginx, Caddy ou Traefik.

### Base de Dados

A BD usa a imagem definida em `MiaCaoMigo_DataLayer/Dockerfile`, que instala PostgreSQL 15 com `pg_cron`.

O bootstrap de produção usa:

```bash
MiaCaoMigo_DataLayer/DataBase/Bootstrap/entrypoints/init_prod_entry.sql
```

Esse entrypoint carrega:

- estrutura da BD;
- chaves estrangeiras;
- regras de integridade;
- comentários/metadata;
- serviços SQL;
- `MasterData`.

Não carrega `DemoData`.

Os dados ficam guardados no volume Docker:

```text
miacaomigo_postgres_data
```

Remover containers não apaga a base de dados. Remover o volume apaga.

### Website

O website usa:

```bash
MiaCaoMigo_/Dockerfile.prod
```

Este Dockerfile:

- instala apenas dependências de produção;
- copia `Backend` e `FrontEnd`;
- arranca com `node Backend/server.js`;
- não usa bind mount;
- não depende dos ficheiros locais depois da imagem estar construída.

O backend recebe as configurações por variáveis de ambiente, através do ficheiro `.env.production`.

### Documentação

A documentação usa:

```bash
MiaCaoMigo_Engineering/Dockerfile.docs.prod
```

Este Dockerfile tem duas fases:

1. Compila o MkDocs com `mkdocs build`.
2. Serve o resultado final com Nginx.

Isto é diferente do modo de desenvolvimento, que usa `mkdocs serve`.

## Ficheiros Criados

```text
MiaCaoMigo_Engineering/
├── Dockerfile.docs.prod
├── .dockerignore
└── 07_Deployment/
    ├── docker-compose.prod.yml
    ├── .env.production.example
    └── README_Production_Docker.md

MiaCaoMigo_/
└── Dockerfile.prod

MiaCaoMigo_DataLayer/
└── DataBase/Bootstrap/entrypoints/init_prod_entry.sql
```

## Variáveis de Ambiente

O ficheiro real de produção deve chamar-se:

```bash
07_Deployment/.env.production
```

Esse ficheiro não deve ser commitado.

Existe um exemplo seguro:

```bash
07_Deployment/.env.production.example
```

Variáveis principais:

```text
POSTGRES_USER       Utilizador da BD
POSTGRES_PASSWORD   Password da BD
POSTGRES_DB         Nome da base de dados
JWT_SECRET          Segredo para assinar tokens JWT
JWT_EXPIRES_IN      Tempo de validade dos tokens
PUBLIC_API_BASE_URL URL pública usada pelo Swagger
CORS_ORIGIN         Origem permitida para pedidos browser
WEB_PORT            Porta local do website
DOCS_PORT           Porta local da documentação
```

Em `NODE_ENV=production`, o backend falha se `JWT_SECRET` não estiver definido.

## Primeira Ativação

Executar a partir da pasta `MiaCaoMigo_Engineering/07_Deployment`:

```bash
cp .env.production.example .env.production
```

Editar `.env.production` e trocar todos os valores `replace-with-*`.

Depois construir as imagens:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml build
```

Arrancar em background:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml up -d
```

Ver estado:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml ps
```

Ver logs:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f
```

## Acessos Locais

Com os valores por defeito:

```text
Website:      http://localhost:3000
Documentação: http://localhost:8000
Healthcheck:  http://localhost:3000/health
```

A base de dados não fica acessível por porta local. Só os containers da rede interna conseguem falar com ela.

## Desligar Sem Apagar Dados

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml down
```

Isto remove containers e rede, mas mantém o volume da BD.

## Apagar Tudo, Incluindo BD

Usar apenas quando for aceitável perder os dados:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml down -v
```

## Atualizar Depois de Alterações

Quando houver alterações no código ou documentação:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml build
docker compose --env-file .env.production -f docker-compose.prod.yml up -d
```

## Backup Manual da BD

Criar backup:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec db sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' > miacaomigo_backup.sql
```

Restaurar backup num ambiente limpo:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec -T db sh -c 'psql -U "$POSTGRES_USER" "$POSTGRES_DB"' < miacaomigo_backup.sql
```

## Notas de Segurança

- Não commitar `.env.production`.
- Usar uma `POSTGRES_PASSWORD` forte.
- Usar um `JWT_SECRET` longo e aleatório.
- Não expor a porta `5432` da BD em produção.
- Colocar website e documentação atrás de HTTPS num servidor real.
- Rever rotas técnicas como `/db-test` antes de expor publicamente.
- Corrigir URLs frontend que ainda apontem explicitamente para `localhost`.

## Reverse Proxy

Este compose deixa website e documentação prontos em portas separadas. Num deployment real, o passo seguinte seria colocar um reverse proxy à frente:

```text
https://app.exemplo.pt  -> website:3000
https://docs.exemplo.pt -> docs:80
```

Esse proxy também deve tratar certificados TLS/HTTPS.

## Checklist Antes de Usar Como Produção Real

- `.env.production` criado com valores reais.
- `JWT_SECRET` definido.
- `CORS_ORIGIN` definido para o domínio final.
- Backups testados.
- HTTPS configurado no reverse proxy.
- Dados demo confirmados como ausentes.
- URLs hardcoded para `localhost` corrigidos no frontend.
- Logs e monitorização definidos.

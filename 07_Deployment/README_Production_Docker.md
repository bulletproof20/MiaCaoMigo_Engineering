# Production

Esta página explica como arrancar o MiaCaoMigo em modo de produção usando Docker. O objetivo, no contexto académico, é demonstrar que o projeto consegue sair do ambiente de desenvolvimento e ser executado com uma configuração mais próxima de um deployment real.

O modo de produção fica preparado, mas não fica ligado automaticamente. Só é iniciado quando forem executados os comandos desta página.

## Objetivo Académico

Para a entrega/defesa, esta configuração mostra que o sistema tem:

- separação entre aplicação, base de dados e documentação;
- variáveis de ambiente para credenciais e segredos;
- base de dados persistente;
- documentação servida como site estático;
- healthchecks para verificar se os serviços estão ativos;
- configuração separada do modo de desenvolvimento.

Isto não pretende substituir uma infraestrutura cloud completa, mas sim apresentar uma base organizada e tecnicamente correta para produção.

## O Que Significa «Pronto Para Produção»

Num ambiente profissional, **produção** não significa apenas «o programa corre». Significa que o sistema pode ser usado de forma fiável por pessoas reais, mantido por uma equipa e recuperado quando algo falha.

Em termos simples, um sistema está mais próximo de produção quando:

- arranca sempre da mesma forma (build reproduzível);
- guarda dados de forma persistente;
- não expõe segredos no código nem no repositório;
- separa desenvolvimento de produção;
- permite verificar se os serviços estão saudáveis;
- pode ser atualizado sem perder dados por acidente;
- tem plano de backup e restauro;
- está protegido (HTTPS, CORS, BD não pública).

No MiaCaoMigo, o modo Docker de produção cobre **parte importante** destes critérios. Ainda não cobre tudo o que uma empresa exigiria antes de abrir o sistema na internet.

## Comparação Com o Meio Profissional

| Aspeto | Prática profissional típica | MiaCaoMigo (modo produção Docker) |
|---|---|---|
| Empacotamento | Imagens Docker versionadas, registry privado | Imagens Docker locais (`Dockerfile.prod`, `Dockerfile.docs.prod`) |
| Configuração | Secrets manager, variáveis por ambiente | `.env.production` (não commitado) |
| Base de dados | Managed DB, migrações versionadas, backups automáticos | PostgreSQL em container, volume persistente, backup manual documentado |
| Rede | HTTPS, reverse proxy, firewall, BD isolada | BD em rede interna; website/docs em HTTP local |
| Documentação | Site estático (S3, CDN, Nginx) | MkDocs build + Nginx em container |
| Observabilidade | Logs centralizados, métricas, alertas | Logs via `docker compose logs`; healthcheck `/health` |
| Entrega | CI/CD, testes automáticos antes do deploy | Build e arranque manuais documentados |
| Dados iniciais | Seeds controlados, sem demo em produção | Bootstrap `init_prod` sem `DemoData` |

**Conclusão:** o projeto demonstra **consciência de produção** e uma arquitetura Docker coerente para contexto académico. Em linguagem profissional, isto classifica-se como **deployment local tipo produção** ou **base production-ready**, não como produção empresarial completa.

## Pontos Já Bem Resolvidos

O que o projeto já faz de forma alinhada com boas práticas:

| Ponto | O que demonstra |
|---|---|
| Compose separado | `docker-compose.prod.yml` não mistura com desenvolvimento |
| Imagens imutáveis | App e docs construídas em Dockerfile; sem bind mount do código em produção |
| `NODE_ENV=production` | Ambiente explícito no container da API |
| BD isolada | PostgreSQL só na rede `miacaomigo_internal`; sem porta `5432` no host |
| Persistência | Volume `miacaomigo_postgres_data` sobrevive a `down` sem `-v` |
| Segredos fora do Git | `.env.production.example` + `.env.production` ignorado |
| JWT obrigatório em produção | Backend recusa arrancar sem `JWT_SECRET` quando `NODE_ENV=production` |
| CORS configurável | `CORS_ORIGIN` em vez de CORS totalmente aberto em produção |
| Healthcheck | Endpoint `/health` e checks no compose |
| Docs como site estático | `mkdocs build` + Nginx, não `mkdocs serve` |
| Bootstrap adequado | `init_prod_entry.sql` — schema + MasterData, sem DemoData |
| Documentação operacional | Guia passo a passo, backup, checklist para defesa |

Estes pontos são credíveis numa **defesa académica** e mostram que a equipa pensou além de «correr no portátil com `npm start`».

## Pontos Ainda Por Melhorar

O que falta ou está incompleto face a um deployment profissional «em produção real»:

| Lacuna | Impacto | Estado no projeto |
|---|---|---|
| HTTPS / TLS | Tráfego não encriptado em `localhost` | Não configurado (aceitável localmente; obrigatório na internet) |
| Reverse proxy | Um único ponto de entrada, domínios, certificados | Não incluído no compose atual |
| Backups automáticos | Risco de perda de dados sem rotina | Apenas procedimento manual documentado |
| Monitorização e alertas | Equipa não vê falhas a tempo | Só logs Docker e healthcheck |
| CI/CD | Deploy manual, sem gate de testes | Não implementado |
| Migrações versionadas da BD | Alterações de schema difíceis de aplicar em produção | Bootstrap inicial; sem pipeline de migrations |
| Gestão avançada de secrets | `.env` em disco é frágil em equipas grandes | Ficheiro local suficiente para académico, fraco para empresa |
| Rotas de diagnóstico | `/db-test` não deve estar público | Ainda presente na API |
| URLs `localhost` no frontend | Alguns módulos podem falhar fora do host esperado | Revisão pendente (ex.: animais staff) |
| Logging centralizado | Dificulta auditoria e debugging em escala | Não configurado |

Estas lacunas **não invalidam** o trabalho académico. São o que se diria numa discussão honesta: «temos uma base sólida; estes seriam os próximos passos numa empresa».

## Quão Parecido É Isto Com Produção Real?

Escala simplificada para contextualizar na defesa:

```text
Desenvolvimento local (npm start, compose dev)
        ↓
Production-like local (o que temos agora)  ← MiaCaoMigo
        ↓
Staging / pré-produção (HTTPS, CI, dados de teste)
        ↓
Produção empresarial (cloud, monitorização, SLA, backups automáticos)
```

| Nível | Descrição | MiaCaoMigo |
|---|---|---|
| 1 — Dev | Programar com hot reload, credenciais simples | `docker-compose.yml` da app, MkDocs `serve` |
| 2 — Production-like | Docker prod, BD persistente, segredos, healthchecks | **Modo documentado nesta página** |
| 3 — Staging | Ambiente espelho com HTTPS e pipeline | Não implementado |
| 4 — Produção cloud | Escala, alta disponibilidade, operações 24/7 | Fora do scope académico atual |

Para um **projeto universitário**, o nível 2 é um objetivo realista e defensável. Para uma **startup ou empresa**, seria o ponto de partida antes de investir no nível 3–4.

## Serviços de Produção

O ficheiro principal é:

```bash
07_Deployment/docker-compose.prod.yml
```

Ele cria três serviços:

| Serviço | Função |
|---|---|
| `db` | PostgreSQL 15 com `pg_cron` e volume persistente |
| `website` | API Node.js/Express e frontend estático |
| `docs` | documentação MkDocs compilada e servida por Nginx |

## Diferença Para Desenvolvimento

No modo de desenvolvimento, os containers usam ficheiros locais, portas abertas e servidores próprios para programar/testar.

No modo de produção:

- a aplicação é construída numa imagem Docker própria;
- não há bind mount do código da aplicação;
- `NODE_ENV` fica como `production`;
- a base de dados não expõe a porta `5432` para fora;
- a documentação não usa `mkdocs serve`;
- o MkDocs é compilado para HTML e servido por Nginx;
- as credenciais ficam num ficheiro `.env.production`, que não deve ser commitado.

## Como a Arquitetura Funciona

### Base de Dados

A base de dados usa o repositório `MiaCaoMigo_DataLayer`.

Em produção, o bootstrap usa:

```bash
MiaCaoMigo_DataLayer/DataBase/Bootstrap/entrypoints/init_prod_entry.sql
```

Este ficheiro carrega a estrutura da BD, regras, serviços SQL e `MasterData`. Não carrega `DemoData`, porque dados de demonstração não devem entrar num ambiente de produção.

Os dados ficam guardados no volume:

```text
miacaomigo_postgres_data
```

Isto permite desligar e voltar a ligar containers sem perder a base de dados.

### Website

O website usa:

```bash
MiaCaoMigo_/Dockerfile.prod
```

Este Dockerfile instala apenas dependências de produção e arranca a aplicação com:

```bash
node Backend/server.js
```

A aplicação fala com a BD através da rede interna Docker:

```text
DB_HOST=db
DB_PORT=5432
```

### Documentação

A documentação usa:

```bash
MiaCaoMigo_Engineering/Dockerfile.docs.prod
```

O processo é:

1. Compilar o portal com `mkdocs build`.
2. Servir o resultado final com Nginx.

Assim, a documentação fica mais próxima de um site real publicado.

## Antes de Ligar

Entrar na pasta de produção:

```bash
cd MiaCaoMigo_Engineering/07_Deployment
```

Criar o ficheiro real de ambiente:

```bash
cp .env.production.example .env.production
```

Editar `.env.production` e trocar os valores de exemplo.

Campos mais importantes:

| Variável | O que representa |
|---|---|
| `POSTGRES_USER` | utilizador da base de dados |
| `POSTGRES_PASSWORD` | password da base de dados |
| `POSTGRES_DB` | nome da base de dados |
| `JWT_SECRET` | segredo usado para assinar tokens de login |
| `CORS_ORIGIN` | origem permitida para chamadas do browser |
| `WEB_PORT` | porta local do website |
| `DOCS_PORT` | porta local da documentação |

O ficheiro `.env.production` não deve ser colocado no Git.

## Passo a Passo Para Iniciar

1. Construir as imagens:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml build
```

2. Ligar os serviços:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml up -d
```

3. Verificar o estado:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml ps
```

4. Ver logs, se necessário:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f
```

## Endereços Locais

Com as portas por defeito:

| Recurso | URL |
|---|---|
| Website | `http://localhost:3000` |
| Documentação | `http://localhost:8000` |
| Healthcheck da API | `http://localhost:3000/health` |

A base de dados não fica acessível diretamente por uma porta local. Ela fica disponível apenas para os containers que pertencem à rede interna.

## Como Desligar

Para desligar sem apagar os dados:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml down
```

Este comando remove containers e redes, mas mantém o volume da base de dados.

## Como Apagar Tudo

Usar apenas se for aceitável apagar a base de dados:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml down -v
```

O `-v` remove também os volumes Docker.

## Como Atualizar

Depois de alterações no código ou na documentação:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml build
docker compose --env-file .env.production -f docker-compose.prod.yml up -d
```

Isto reconstrói as imagens e volta a arrancar os serviços atualizados.

## Backup Simples da BD

Criar backup:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec db sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' > miacaomigo_backup.sql
```

Restaurar backup:

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec -T db sh -c 'psql -U "$POSTGRES_USER" "$POSTGRES_DB"' < miacaomigo_backup.sql
```

## Checklist Para a Defesa

Antes de demonstrar o modo de produção:

- confirmar que `.env.production` existe;
- confirmar que `JWT_SECRET` está definido;
- confirmar que o compose constrói sem erros;
- confirmar que `website`, `docs` e `db` aparecem como ativos;
- abrir `http://localhost:3000`;
- abrir `http://localhost:8000`;
- testar `http://localhost:3000/health`;
- explicar que a BD não está exposta diretamente;
- explicar que a documentação é servida por Nginx e não por `mkdocs serve`;
- referir que dados demo não são carregados no bootstrap de produção.

### Frases úteis na apresentação

- «Temos um ambiente Docker de produção separado do desenvolvimento, com imagens imutáveis e BD persistente.»
- «Isto é um deployment *production-like* local, não uma cloud enterprise completa.»
- «Os pontos fortes são separação de serviços, segredos por ambiente e bootstrap sem dados demo.»
- «Os próximos passos profissionais seriam HTTPS, reverse proxy, CI/CD e backups automáticos.»

## Próximos Passos (Além do Académico)

Se o projeto evoluísse para um ambiente público real, a ordem lógica seria:

1. Reverse proxy com HTTPS (Nginx/Caddy/Traefik).
2. Backups automáticos da BD com teste de restore.
3. Pipeline CI/CD (build → testes → deploy).
4. Remover ou proteger rotas de diagnóstico (`/db-test`).
5. Migrações versionadas da BD em vez de depender só do bootstrap inicial.
6. Monitorização (métricas, alertas, logs agregados).

Estes passos estão alinhados com a secção [Pontos Ainda Por Melhorar](#pontos-ainda-por-melhorar) e mostram maturidade técnica na discussão com o júri.

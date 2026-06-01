# Resultados de testes — Performance

Registo de medições e evidências. **Tipo actual:** baseline inicial (2026-05-30 / 2026-06-01).

**Como actualizar:** após cada sessão Firefox ou API, acrescentar uma entrada com data, ambiente e capturas em `00_Assets/01_Screenshots/Performance/`.

---

## Resumo executivo (baseline)

| Área | Testes feitos | Resultado geral |
|------|---------------|-----------------|
| API — health BD | `GET /db-test` | **Verde** — resposta rápida, BD ligada |
| API — adoções | `GET /api/animals/adoptions` | **Verde** — HTTP 200 após correcção da query (2026-06-01) |
| API — login | `POST /api/users/auth/login` | **Verde** — curl + Firefox (`POST` visível na Rede) |
| Frontend estático | HTML servido pelo Express | **Verde** — ficheiros 200, transferência pequena |
| Firefox DevTools | Página inicial | **Verde** — carregamento local rápido, sem falhas 4xx/5xx visíveis |
| Firefox DevTools | Login + adoções | **Verde** — páginas medidas no browser |
| Firefox DevTools | Área cliente pós-login | **Verde** — dashboard autenticado medido no browser |
| Firefox DevTools | `GET /db-test` | **Verde** — resposta simples validada no browser |

!!! note "Limitação desta baseline"
    Medições em `localhost` não simulam produção nem redes lentas. Mod3/Mod4 e validação de Consola JS permanecem opcionais/futuros.

---

## Ambiente da sessão

| Campo | Valor |
|-------|-------|
| **Data** | 2026-05-30 (curl) · 2026-06-01 (Firefox + re-testes API) |
| **SO** | Linux (ambiente de desenvolvimento local) |
| **API** | `http://localhost:3000` |
| **Docs MkDocs** | `http://localhost:8000` |
| **Execução app** | `npm start` (Node no host) |
| **Ferramenta API** | `curl` (baseline automatizada) |
| **Firefox** | 151.0.2 |

---

## API: Health base de dados

- **Tipo:** baseline inicial
- **Método / URL:** `GET http://localhost:3000/db-test`
- **Auth:** não
- **RNF:** —

| Execução | HTTP | Tempo (ms) |
|----------|------|------------|
| 1 | 200 | 4,5 |
| 2 | 200 | 0,7 |
| 3 | 200 | 0,6 |
| 4 | 200 | 0,5 |
| 5 | 200 | 0,5 |

| Estatística | Valor |
|-------------|-------|
| Mín | ~0,5 ms |
| Média | ~1,4 ms |
| Máx | ~4,5 ms |
| Classificação | **Verde** |

**Observações:** primeira execução mais lenta (arranque de ligação ao pool PG). Resposta esperada: texto com nome da base de dados.

### Validação Firefox

| Métrica | Valor observado |
|---------|-----------------|
| Pedidos HTTP | 2 |
| Transferido | ~19 B / ~709 B |
| Tempo total | ~471 ms |
| Estado HTTP | 200 no documento `/db-test` |
| Classificação | **Verde** |

#### Evidência
- [Captura Rede — db-test](../00_Assets/01_Screenshots/Performance/db-testNetworkResult.jpeg)

---

## API: Listar animais para adoção

- **Tipo:** baseline inicial
- **Método / URL:** `GET http://localhost:3000/api/animals/adoptions`
- **Auth:** não
- **RNF:** RNF_M2_13 (&lt; 1 s)

### Antes da correcção (2026-05-30)

| Execução | HTTP | Tempo (ms) |
|----------|------|------------|
| 1–5 | 500 | ~1–5 |

**Erro:** `column "dat_bir_ani" does not exist` — a query lia colunas que a view `vw_internal_animals_available` não expõe.

**Correcção aplicada:** `animaisModel.js` passou a fazer `JOIN` com `animal` para obter `dat_bir_ani`, `gen_ani`, etc.

### Após correcção (2026-06-01)

| Execução | HTTP | Tempo (ms) |
|----------|------|------------|
| 1 | 200 | ~1,2 |
| 2 | 200 | ~0,9 |
| 3 | 200 | ~0,9 |
| 4 | 200 | ~1,0 |
| 5 | 200 | ~0,8 |
| 6 | 200 | ~0,7 |
| 7 | 200 | ~0,7 |
| 8 | 200 | ~0,7 |
| 9 | 200 | ~0,7 |
| 10 | 200 | ~0,8 |

| Estatística | Valor |
|-------------|-------|
| Mín | ~0,7 ms |
| Média | ~0,9 ms |
| Máx | ~1,2 ms |
| Cumpre RNF_M2_13 | **Sim** (10/10 &lt; 1 s) |
| Classificação | **Verde** |

**Resposta exemplo:** 1 animal (`Quico`, estado `Interno`). Medição Firefox do XHR na página adoções — **pendente** (ver checklist abaixo).

---

## Frontend: transferência HTML (curl)

Medição apenas do **documento HTML** (não inclui CSS, JS, imagens nem chamadas XHR). Complementar com Firefox.

| Página | URL | HTTP | Tamanho | Tempo |
|--------|-----|------|---------|-------|
| Inicial | `/` ou `/index.html` | 200 | ~12,3 KB | ~0,6–2,4 ms |
| Login | `/Pages/Mod1_Users/Autenticacao/login.html` | 200 | ~3,0 KB | ~0,5 ms |
| Adoções | `/Pages/Public/adocoes.html` | 200 | ~4,8 KB | ~0,5 ms |
| Swagger UI | `/api-docs/` | 200 | ~3,1 KB | ~0,9 ms |

| Classificação | **Verde** (HTML leve); validação completa pendente no browser |

---

## Frontend: Firefox

### Frontend: Página inicial

- **Data:** 2026-06-01
- **Firefox:** 151.0.2
- **URL:** `http://localhost:3000/` ou `/index.html`
- **Tipo:** baseline inicial

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | 16 |
| Transferido | ~2,72 MB |
| Tempo total | ~165 ms |
| DOMContentLoaded | ~48 ms |
| Load | ~97 ms |
| Erros consola | Não evidenciados na captura; confirmar no separador **Consola** |
| Classificação | **Verde** |

#### Evidências
- [Captura — página inicial](../00_Assets/01_Screenshots/Performance/indexConsoleResult.jpeg)

!!! note "Consola"
    O ficheiro `indexConsoleResult.jpeg` mostra novamente o separador **Rede**, não a **Consola**. Como não há erros HTTP visíveis, a página mantém classificação verde; se for necessário fechar a evidência de consola, falta um print do separador **Consola**.

#### 3 recursos mais pesados (da captura Rede)

| # | Recurso | Tamanho aprox. |
|---|---------|----------------|
| 1 | `background_pagInicial.jpeg` | ~2,03 MB (~70% do total) |
| 2 | `CMBarcelos.png` | ~210 KB |
| 3 | `fale_connosco.webp` / `adoção.png` | ~120 KB cada |

**Nota:** `logo.jpeg` aparece duplicado na Rede (2 pedidos).

---

### Frontend: Login (Firefox)

- **URL:** `http://localhost:3000/Pages/Mod1_Users/Autenticacao/login.html`
- **Firefox:** 151.0.2

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | 10 |
| Transferido | ~209,88 kB / ~213,28 kB |
| Tempo total (Finish) | ~79 ms |
| DOMContentLoaded | ~62 ms |
| Load | ~66 ms |
| Recursos com erro | 0 visíveis |
| Classificação | **Verde** |

#### Evidência
- [Captura Rede — login](../00_Assets/01_Screenshots/Performance/loginNetworkResult.jpeg)

---

### API adoções — validação Firefox (endpoint directo)

- **Data:** 2026-06-01
- **URL:** `http://localhost:3000/api/animals/adoptions` (JSON no browser)
- **Tipo:** baseline inicial — confirma API funcional no Firefox

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | 2 (`adoptions` + `favicon.ico` 404) |
| Transferido | ~306 B / ~879 B |
| Tempo total (Finish) | ~32 ms |
| DOMContentLoaded | ~14 ms |
| Load | ~53 ms |
| `GET /api/animals/adoptions` | **200**, ~575 B transferidos, ~1,06 kB |
| Classificação | **Verde** |

---

### Frontend: Página adoções (Firefox)

- **URL:** `http://localhost:3000/Pages/Public/adocoes.html`
- **Firefox:** 151.0.2

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | 16 |
| Transferido | ~687,18 kB / ~692,53 kB |
| Tempo total (Finish) | ~97 ms |
| DOMContentLoaded | ~63 ms |
| Load | ~83 ms |
| XHR/API | `GET /api/animals/adoptions` **200** |
| Recursos com erro | 0 visíveis |
| Classificação | **Verde** |

#### Evidência
- [Captura Rede — página adoções](../00_Assets/01_Screenshots/Performance/adocoesNetworkResult.jpeg)

---

### Frontend: Área cliente pós-login (Firefox)

- **URL:** `http://localhost:3000/Pages/Mod1_Users/Clientes/area_cliente.html`
- **Firefox:** 151.0.2

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | 18 |
| Transferido | ~412,63 kB / ~336,17 kB |
| Tempo total (Finish) | ~304 ms |
| DOMContentLoaded | ~144 ms |
| Load | ~152 ms |
| APIs autenticadas visíveis | `me`, `pets`, `orders`, `setup` — **200** |
| Recursos com erro | 0 visíveis |
| Classificação | **Verde** |

#### Evidência
- [Captura Rede — área cliente pós-login](../00_Assets/01_Screenshots/Performance/loginApiNetworkResult.jpeg)

!!! note "Sobre o ficheiro `loginApiNetworkResult.jpeg`"
    Este print mostra o carregamento da área cliente já autenticada (só `GET`). A evidência do submit de login no Firefox está no print seguinte.

---

### API login — validação Firefox (`POST`)

- **Data:** 2026-06-01
- **Firefox:** 151.0.2
- **URL:** `POST http://localhost:3000/api/users/auth/login`
- **Contexto:** capturado com **Persistir registos** activo; lista visível após redirect para área cliente

| Campo | Valor observado |
|-------|-----------------|
| Método | **POST** |
| Endpoint | `/api/users/auth/login` |
| Initiator | `login.js:26 (fetch)` |
| Content-Type | `application/json` |
| Pedidos seguintes | `setup`, `me`, `SideBar.html` — **GET 200** (fluxo pós-login) |
| Classificação | **Verde** (login seguido de dashboard funcional) |

#### Evidência
- [Captura Rede — POST login](../00_Assets/01_Screenshots/Performance/loginPostAuthNetworkResult.png)

Para fechar 100% no relatório, no Firefox clicar na linha `login` → separador **Resposta** e confirmar HTTP **200** + corpo com `token`.

---

## API: Login (curl)

- **Método / URL:** `POST http://localhost:3000/api/users/auth/login`
- **Body:** `{"email":"goncalo.rego.dev@gmail.com","password":"123456789"}`
- **RNF:** RNF_M1_01 (≤ 2 s)

| Tentativa | HTTP | Tempo (ms) | Notas |
|-----------|------|------------|-------|
| Cliente (1.ª) | 200 | ~15,8 | Login com sucesso |
| Staff `2@miacaomigo.pt` (1.ª) | 200 | ~8,2 | Login com sucesso |
| Repetições sem logout | 409 | ~1,4–2,3 | Sessão activa — política de sessão única |

| Classificação | **Verde** para tempo da 1.ª autenticação em localhost |

### Login 10× — RNF_M1_01 (2026-06-01)

Metodologia: 10 utilizadores demo distintos com password `123456789`; após cada **200**, `POST /api/users/auth/logout` com Bearer token. Repetir o mesmo email sem logout devolve **409** (sessão activa).

| # | Email | HTTP | Tempo (s) |
|---|-------|------|-----------|
| 1 | `2@miacaomigo.pt` | 200 | 0,016 |
| 2 | `3@miacaomigo.pt` | 200 | 0,005 |
| 3 | `4@miacaomigo.pt` | 200 | 0,005 |
| 4 | `5@miacaomigo.pt` | 200 | 0,004 |
| 5 | `6@miacaomigo.pt` | 200 | 0,003 |
| 6 | `marta.ribeiro.dev@gmail.com` | 200 | 0,005 |
| 7 | `ana.lourenco.dev@gmail.com` | 200 | 0,004 |
| 8 | `isabel.carvalho.dev@gmail.com` | 200 | 0,003 |
| 9 | `tiago.mendes.dev@gmail.com` | 401 | — |
| 10 | `joao.navarro.dev@gmail.com` | 401 | — |

| Estatística (8 sucessos) | Valor |
|--------------------------|-------|
| Mín | ~3 ms |
| Máx | ~16 ms |
| Cumpre RNF_M1_01 (&lt; 2 s) | **8/8 = 100%** |
| Classificação | **Verde** |

**Nota:** utilizadores 9–10 não têm a password demo `123456789` no seed actual.

---

## Histórico de sessões

| Data | Responsável | Notas |
|------|-------------|-------|
| 2026-05-30 | Baseline automática `curl` | BD OK; adoptions inicialmente 500; Firefox por completar |
| 2026-06-01 | Baseline manual Firefox | Página inicial e `/db-test` registados a partir dos prints DevTools |
| 2026-06-01 | Correcção API + curl | Adoptions 200; login medido; servidor reiniciado |
| 2026-06-01 | Firefox API adoptions | Print endpoint directo (~32 ms finish) |
| 2026-06-01 | Firefox páginas baseline | Login, adoções e área cliente pós-login registados |
| 2026-06-01 | Firefox POST login | `loginPostAuthNetworkResult.png` com Persistir registos |
| 2026-06-01 | Login 10× curl | 8/8 sucessos &lt; 2 s (RNF_M1_01) |
| 2026-06-01 | Relatório APS | Secção 3.11 actualizada em `Application_Report.md` |

---

## Evidências (galeria)

| Captura | Ficheiro |
|---------|----------|
| Página inicial (Rede) | [indexConsoleResult.jpeg](../00_Assets/01_Screenshots/Performance/indexConsoleResult.jpeg) |
| Login — Rede | [loginNetworkResult.jpeg](../00_Assets/01_Screenshots/Performance/loginNetworkResult.jpeg) |
| Adoções — Rede + XHR | [adocoesNetworkResult.jpeg](../00_Assets/01_Screenshots/Performance/adocoesNetworkResult.jpeg) |
| POST login — Firefox | [loginPostAuthNetworkResult.png](../00_Assets/01_Screenshots/Performance/loginPostAuthNetworkResult.png) |
| Área cliente — Rede | [loginApiNetworkResult.jpeg](../00_Assets/01_Screenshots/Performance/loginApiNetworkResult.jpeg) |

---

## O que falta — checklist

### Prints Firefox

| Ficheiro sugerido | Página | O que capturar |
|-------------------|--------|----------------|
| `indexConsoleResult.jpeg` | `/` | **Opcional:** repetir no separador **Consola**, se for necessário provar ausência de erros JS |
| ~~`loginNetworkResult.jpeg`~~ | `/Pages/Mod1_Users/Autenticacao/login.html` | **Feito** |
| ~~`adocoesNetworkResult.jpeg`~~ | `/Pages/Public/adocoes.html` | **Feito** |
| ~~`adoptionsApiNetworkResult.png`~~ | `/api/animals/adoptions` | **Feito** — endpoint directo |
| ~~`loginApiNetworkResult.jpeg`~~ | Área cliente pós-login | **Feito** — só `GET` autenticados |
| ~~`loginPostAuthNetworkResult.png`~~ | Login → redirect | **Feito** — `POST /api/users/auth/login` visível |

Em cada captura: **Desativar cache** activo na Rede.

### Comandos úteis (terminal)

```bash
# Confirmar API (com servidor a correr)
curl -s http://localhost:3000/api/animals/adoptions | head -c 300

# Login (password demo: 123456789)
curl -s -X POST http://localhost:3000/api/users/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"goncalo.rego.dev@gmail.com","password":"123456789"}'

```

---

## Próximo passo (documentação)

1. **Baseline inicial fechada** para APS (index, login, adoções, APIs medidas).
2. Opcional: print real da **Consola** da página inicial.
3. Converter `FrontEnd/img/background_pagInicial.jpeg` (ficheiro AVIF com extensão `.jpeg`) — ver [05_Recommendations.md](05_Recommendations.md).
4. Quando Mod3/Mod4 estiverem estáveis: repetir medições Firefox nessas páginas.

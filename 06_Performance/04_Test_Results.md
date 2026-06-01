# Resultados de testes — Performance

Registo de medições e evidências. **Tipo actual:** baseline inicial (2026-05-30).

**Como actualizar:** após cada sessão Firefox ou API, acrescentar uma entrada com data, ambiente e capturas em `06_Performance/evidence/` (opcional).

---

## Resumo executivo (baseline)

| Área | Testes feitos | Resultado geral |
|------|---------------|-----------------|
| API — health BD | `GET /db-test` | **Verde** — resposta rápida, BD ligada |
| API — adoções | `GET /api/animals/adoptions` | **Vermelho** — HTTP 500 (erro servidor) |
| Frontend estático | HTML servido pelo Express | **Verde** — ficheiros 200, transferência pequena |
| Firefox DevTools | Página inicial | **Pendente** — completar manualmente (§ abaixo) |

!!! warning "Limitação desta baseline"
    Medições `curl` em localhost não substituem medição no Firefox (número de pedidos, CSS, JS, imagens). A secção [Frontend pendente](#frontend-pendente-firefox) deve ser preenchida no browser.

---

## Ambiente da sessão

| Campo | Valor |
|-------|-------|
| **Data** | 2026-05-30 |
| **SO** | Linux (ambiente de desenvolvimento local) |
| **API** | `http://localhost:3000` |
| **Docs MkDocs** | `http://localhost:8000` |
| **Execução app** | `npm start` (Node no host) |
| **Ferramenta API** | `curl` (baseline automatizada) |
| **Firefox** | *A preencher na medição manual* |

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

---

## API: Listar animais para adoção

- **Tipo:** baseline inicial
- **Método / URL:** `GET http://localhost:3000/api/animals/adoptions`
- **Auth:** não
- **RNF:** RNF_M2_13 (&lt; 1 s quando funcional)

| Execução | HTTP | Tempo (ms) |
|----------|------|------------|
| 1 | 500 | 1,4 |
| 2 | 500 | 4,2 |
| 3 | 500 | 4,7 |
| 4 | 500 | 4,3 |
| 5 | 500 | 4,4 |

| Estatística | Valor |
|-------------|-------|
| Média tempo resposta | ~3,8 ms |
| Cumpre RNF | **N/A** — endpoint em erro |
| Classificação | **Vermelho** |

**Corpo de erro (registado):**

```json
{
  "success": false,
  "message": "Erro ao carregar animais disponíveis para adoção.",
  "detail": "column \"dat_bir_ani\" does not exist"
}
```

**Observações:** o tempo de resposta é baixo (~4 ms), mas o fluxo **adoções** falha por desalinhamento entre query da API e esquema BD. Repetir teste após correcção do modelo/SQL.

---

## Frontend: transferência HTML (curl)

Medição apenas do **documento HTML** (não inclui CSS, JS, imagens nem chamadas XHR). Complementar com Firefox.

| Página | URL | HTTP | Tamanho | Tempo |
|--------|-----|------|---------|-------|
| Inicial | `/index.html` | 200 | ~12,2 KB | ~0,6 ms |
| Login | `/Pages/UserView/Mod1/login.html` | 200 | ~3,0 KB | ~1,9 ms |
| Adoções | `/Pages/UserView/Geral/adocoes.html` | 200 | ~4,7 KB | ~0,9 ms |
| Swagger UI | `/api-docs/` | 200 | ~3,1 KB | ~0,9 ms |

| Classificação | **Verde** (HTML leve); validação completa pendente no browser |

---

## Frontend pendente (Firefox)

Completar seguindo [02_Frontend_Performance.md](02_Frontend_Performance.md) e [01 §7](01_Performance_Strategy.md#7-primeiro-exercício-prático-firefox).

### Frontend: Página inicial

- **Data:** _a preencher_
- **Firefox:** _versão_
- **URL:** `http://localhost:3000/` ou `/index.html`
- **Tipo:** baseline inicial

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | |
| Transferido | |
| Tempo total | |
| Erros consola | |
| Classificação | |

#### Evidências
- [ ] Captura Rede
- [ ] Captura Consola

---

## Histórico de sessões

| Data | Responsável | Notas |
|------|-------------|-------|
| 2026-05-30 | Baseline automática `curl` | BD OK; adoptions 500; Firefox por completar |

---

## Próximo passo

1. Corrigir `GET /api/animals/adoptions` e repetir tabela API.
2. Executar exercício Firefox na página inicial e preencher secção pendente.
3. Actualizar [05_Recommendations.md](05_Recommendations.md) com problemas confirmados.

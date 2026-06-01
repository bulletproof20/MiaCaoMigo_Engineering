# Performance — Backend (API)

Testes de tempo de resposta dos endpoints Express e impacto da base de dados PostgreSQL.

**Relacionado:** [Estratégia](01_Performance_Strategy.md) · [Resultados](04_Test_Results.md) · [Swagger](../04_Architecture/02_Application/04_Generated_Docs/Swagger.md)

!!! note "Tipo de teste"
    Medições com `curl` ou cliente HTTP em **baseline inicial**. Para RNF com “95% dos pedidos”, repetir cada rota **5–10 vezes** e calcular mín/média/máx.

---

## Índice

1. [Scope de endpoints](#1-scope-de-endpoints)
2. [Ambiente](#2-ambiente)
3. [Procedimento de medição](#3-procedimento-de-medição)
4. [Ligação aos RNF](#4-ligação-aos-rnf)
5. [Template de registo](#5-template-de-registo)

---

## 1. Scope de endpoints

Prefixos montados em `Backend/server.js`:

| Prefixo | Módulo |
|---------|--------|
| `/api/users` | Mod1 — utilizadores e auth |
| `/api/animals` | Mod2 — animais |
| `/api/appointments` | Mod4 — consultas |

### Baseline — prontos sem autenticação

| Operação | Método e rota | RNF | Estado |
|----------|---------------|-----|--------|
| Health BD | `GET /db-test` | — | **Pronta** |
| Listar adoções (público) | `GET /api/animals/adoptions` | RNF_M2_13 | **Pronta** |
| Documentação OpenAPI | `GET /api-docs/` | — | Opcional |

### Baseline — requer token JWT

| Operação | Método e rota | RNF | Estado |
|----------|---------------|-----|--------|
| Login | `POST /api/users/auth/login` | RNF_M1_01 | **Pronta** (credenciais de seed) |
| Sessão atual | `GET /api/users/auth/me` | — | Parcial |
| Listar animais (staff) | `GET /api/animals/` | RNF_M2_13 | Parcial (staff) |
| Consultas | `GET /api/appointments/...` | RNF_M4_01 | Parcial (auth) |

### Adiar (módulo incompleto ou instável)

| Área | Notas |
|------|-------|
| Mod3 — faturação | Rotas comentadas em `server.js` |
| Carga concorrente (k6, ab) | Fase avançada |

---

## 2. Ambiente

| Item | Valor típico |
|------|--------------|
| API base | `http://localhost:3000` |
| PostgreSQL | `localhost:5433` |
| Ferramenta | `curl`, Postman, Insomnia, Thunder Client |

Exemplo `curl` com tempo total (segundos):

```bash
curl -s -o /dev/null -w "%{http_code} %{time_total}\n" \
  http://localhost:3000/api/animals/adoptions
```

Repetir 5–10 vezes e calcular estatísticas.:
```bash
# Cinco vezes — para ter mín/média/máx
for i in 1 2 3 4 5; do
  curl -s -o /dev/null -w "%{time_total}\n" \
    http://localhost:3000/api/animals/adoptions
done
```


### Login (para rotas autenticadas)

```bash
curl -s -X POST http://localhost:3000/api/users/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"goncalo.rego.dev@gmail.com","password":"123456789"}'
```

Credenciais demo (seed `DataSeed/03_DemoData`): password em texto **`123456789`** (o backend faz SHA-256 antes de comparar com a BD). Cliente: `goncalo.rego.dev@gmail.com`. Staff: `2@miacaomigo.pt` (Ivo).

!!! note "Sessão única"
    Logins repetidos sem logout podem devolver **HTTP 409** (sessão activa). Para 10 medições seguidas, fazer logout entre tentativas ou usar utilizadores distintos.

Usar credenciais do seed QA/DataLayer. Guardar o `token` e:

```bash
curl -s -H "Authorization: Bearer TOKEN" \
  http://localhost:3000/api/users/auth/me
```

---

## 3. Procedimento de medição

1. Garantir DataLayer + `npm start` activos ([Runtime Setup](../04_Architecture/02_Application/02_Runtime_Setup.md)).
2. Escolher endpoint do scope baseline.
3. Executar **5–10** pedidos idênticos (sem pausa longa entre eles).
4. Registar: HTTP status, tempo (ms), tamanho do body se relevante.
5. Calcular **mín**, **média**, **máx**; contar quantos cumprem o RNF.
6. Copiar resultado para [04_Test_Results.md](04_Test_Results.md).

!!! warning "Interpretação"
    Tempos muito baixos em localhost (&lt; 10 ms) reflectem sobretudo rede local e cache de ligação PG — úteis para **comparar antes/depois**, não para simular produção.

---

## 4. Ligação aos RNF

| RNF | Meta | Endpoint sugerido |
|-----|------|-------------------|
| RNF_M1_01 | Autenticação ≤ 2 s | `POST /api/users/auth/login` |
| RNF_M2_13 | Consultas simples &lt; 1 s | `GET /api/animals/adoptions` |
| RNF_M3_19 | Consultas comerciais &lt; 1 s | (quando Mod3 activo) |
| RNF_M4_01 | Histórico &lt; 3 s | `GET /api/appointments/...` |

Demonstração académica de “95%”: em 10 execuções, ≥ 9 dentro da meta.

---

## 5. Template de registo

```markdown
### API: [Nome da operação]

- **Data:**
- **Método / URL:**
- **Auth:** sim/não
- **Tipo:** baseline inicial
- **RNF:** RNF_Mx_yy

| Execução | HTTP | Tempo (ms) |
|----------|------|------------|
| 1 | | |
| … | | |

| Estatística | Valor |
|-------------|-------|
| Mín | |
| Média | |
| Máx | |
| Cumpre RNF (sim/não) | |

#### Observações
- ...
```

---

## Próximo passo

Medições baseline registadas em [04_Test_Results.md](04_Test_Results.md) (`/db-test`, `/api/animals/adoptions`, login 10×). Expandir para rotas Mod3/Mod4 quando activas em `server.js`.

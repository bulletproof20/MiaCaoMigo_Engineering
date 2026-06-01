# Performance — Frontend

Testes de carregamento e interação nas páginas HTML/CSS/JS do MiaCaoMigo.

**Relacionado:** [Estratégia](01_Performance_Strategy.md) · [Resultados](04_Test_Results.md) · [Runtime Setup](../04_Architecture/02_Application/02_Runtime_Setup.md)

!!! note "Tipo de teste"
    Os testes desta fase são **baseline inicial**. Não substituem validação final quando todos os fluxos estiverem concluídos.

---

## Índice

1. [Scope de páginas](#1-scope-de-páginas)
2. [Ambiente e pré-requisitos](#2-ambiente-e-pré-requisitos)
3. [Procedimento Firefox (por página)](#3-procedimento-firefox-por-página)
4. [Critérios por página](#4-critérios-por-página)
5. [Template de registo](#5-template-de-registo)

---

## 1. Scope de páginas

Páginas no repositório `MiaCaoMigo_/FrontEnd/`. Estado indica se já faz sentido medir em baseline.

| Prioridade | Página | Caminho (servido em `localhost:3000`) | Módulo | Estado baseline |
|------------|--------|----------------------------------------|--------|-----------------|
| Alta | Página inicial | `/` ou `/index.html` | Geral | **Medida** (Firefox) |
| Alta | Login | `/Pages/Mod1_Users/Autenticacao/login.html` | M1 | **Medida** |
| Alta | Área do cliente | `/Pages/Mod1_Users/Clientes/area_cliente.html` | M1 | **Medida** (sessão autenticada) |
| Média | Adoções | `/Pages/Public/adocoes.html` | M2 | **Medida** (lista via API) |
| Média | Dashboard staff | `/Pages/Mod1_Users/Funcionarios/MainDashboard.html` | M1/M4 | Parcial (requer staff) |
| Baixa | Loja / serviços | várias em `FrontEnd/Pages/` | M3 | Adiar |

**Baseline mínimo recomendado (agora):** inicial, login, adoções.

---

## 2. Ambiente e pré-requisitos

| Item | Valor a registar |
|------|------------------|
| URL base | `http://localhost:3000` |
| Browser | Firefox + versão (`about:support`) |
| Cache | Desativar na Rede (F12) |
| Recarregar | `Ctrl+Shift+R` |
| Backend + BD | Ver [02_Runtime_Setup](../04_Architecture/02_Application/02_Runtime_Setup.md) |

---

## 3. Procedimento Firefox (por página)

Seguir o [§7 da estratégia](01_Performance_Strategy.md#7-primeiro-exercício-prático-firefox) para cada URL:

1. Abrir a página no Firefox.
2. F12 → **Rede** → ativar **Desativar cache**.
3. `Ctrl+Shift+R` para recarregar.
4. Registar no rodapé da Rede: número de pedidos, transferido, tempo.
5. Ordenar por **Tempo** → anotar os 3 pedidos mais lentos.
6. **Consola** → erros (sim/não + mensagem).
7. Se a página chama API: filtrar **XHR/Fetch** e registar URL, HTTP, tempo (ms).

### Páginas com API no carregamento

| Página | Pedido API esperado |
|--------|---------------------|
| Adoções | `GET /api/animals/adoptions` |
| Login (após submit) | `POST /api/users/auth/login` |
| Área cliente | rotas autenticadas Mod1 |

---

## 4. Critérios por página

Referência: [01 §5](01_Performance_Strategy.md#5-critérios-de-aceitação-projeto-académico).

| Critério | Meta (localhost) |
|----------|------------------|
| Carregamento percebido | ≤ 3 s (conteúdo principal utilizável) |
| Erros na consola | 0 em fluxos críticos do baseline |
| Recursos essenciais | 0 falhas 404 em CSS/JS principais |
| Tamanho total | Registar; alerta se &gt; ~2–3 MB sem justificação |

Classificação: **Verde** / **Amarelo** / **Vermelho** (ver estratégia §5.3).

---

## 5. Template de registo

Copiar para [04_Test_Results.md](04_Test_Results.md) por cada página testada:

```markdown
### Frontend: [Nome da página]

- **Data:**
- **Firefox:**
- **URL:**
- **Tipo:** baseline inicial

| Métrica | Valor |
|---------|-------|
| Pedidos HTTP | |
| Transferido | |
| Tempo total / DOMContentLoaded | |
| 3 pedidos mais lentos | 1) … 2) … 3) … |
| Erros consola | |
| Classificação | Verde / Amarelo / Vermelho |

#### Evidências
- [ ] Captura Rede
- [ ] Captura Consola (se erros)
```

---

## Próximo passo

Baseline inicial concluída — ver [04_Test_Results.md](04_Test_Results.md). Repetir medições opcionais para páginas comerciais Mod3 (`Pages/AdminPanel/*`) e fluxos staff Mod4 adicionais.

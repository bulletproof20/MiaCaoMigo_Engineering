# Processos de Negócio — Sistema de Gestão Veterinária

Processos de negócio (`PN_Mx_yy`) que agrupam requisitos funcionais e regras. Artefactos relacionados: [RF](00_Functional_Requirements.md), [RN](02_Business_Rules.md), [RNF](01_Non_Functional_Requirements.md), [AC](04_Acceptance_Criteria.md), [Matriz](06_Implementation_Matrix.md), [CST](07_Constraints.md).

**Contagens:** M1 — 9 PN · M2 — 8 PN · M3 — 9 PN · M4 — 8 PN · **Total: 34 PN**.

---

# Índice

- [Módulo 1 — Gestão de Utilizadores](#módulo-1--gestão-de-utilizadores)
- [Módulo 2 — Gestão de Animais](#módulo-2--gestão-de-animais)
- [Módulo 3 — Gestão Comercial](#módulo-3--gestão-comercial)
- [Módulo 4 — Gestão de Consultas](#módulo-4--gestão-de-consultas)

---

# Módulo 1 — Gestão de Utilizadores

## Descrição

Define os processos de negócio relacionados com gestão de contas, autenticação, permissões, disponibilidade e conformidade de utilizadores.

---

## Processos de Negócio

| ID | Nome do Processo | RF (intervalo) | RN (intervalo) | Descrição |
|---|---|---|---|---|
| PN_M1_01 | Gestão de Contas de Utilizador | RF_M1_01–04 | RN_M1_01–05 | Processo iniciado pela necessidade de criação ou manutenção de contas no sistema. Permite criar, ativar, desativar e gerir contas de cliente e/ou empregado associadas a um indivíduo. Garante unicidade de conta ativa por tipo e consistência dos dados associados. Termina com a conta corretamente registada e operacional. |
| PN_M1_02 | Autenticação e Gestão de Sessões | RF_M1_05–08 | RN_M1_06–10 | Processo iniciado por uma tentativa de acesso ao sistema. Responsável pela validação de credenciais, criação e gestão de sessões ativas, bem como pelo registo de eventos de autenticação. Termina com o utilizador autenticado com sessão válida ou com tentativa rejeitada e auditada. |
| PN_M1_03 | Gestão de Credenciais | RF_M1_12–14 | RN_M1_14–15 | Processo iniciado por solicitação de alteração de credenciais. Permite validar a password atual, aplicar políticas de segurança e manter histórico de alterações. Termina com as credenciais atualizadas e armazenadas de forma segura. |
| PN_M1_04 | Gestão de Dados Pessoais | RF_M1_09–11 | RN_M1_11–13 | Processo iniciado pela necessidade de atualização de dados do indivíduo. Permite gerir informação pessoal e garantir partilha entre contas associadas. Termina com os dados atualizados e consistentes no sistema. |
| PN_M1_05 | Gestão de Roles e Permissões | RF_M1_15–19 | RN_M1_16–19 | Processo iniciado pela necessidade de controlo de acessos. Permite definir roles organizacionais, associar permissões e atribuí-las a empregados. Termina com os acessos corretamente configurados e auditáveis. |
| PN_M1_06 | Gestão de Funções de Empregado | RF_M1_20–25 | RN_M1_20–26 | Processo iniciado pela definição ou alteração do papel funcional de um empregado. Permite atribuir funções, gerir subfunções e dados profissionais. Termina com a função corretamente atribuída e registada. |
| PN_M1_07 | Gestão de Disponibilidade de Empregado | RF_M1_26–38 | RN_M1_27–37 | Processo iniciado pela necessidade de determinar ou atualizar a disponibilidade operacional de um empregado. Integra horários, ausências e registo de presenças. Termina com a disponibilidade calculada e válida para suporte operacional. |
| PN_M1_08 | Gestão de Preferências de Utilizador | RF_M1_39–41 | RN_M1_38–40 | Processo iniciado pela alteração de preferências de utilização. Permite definir idioma e tema da interface. Termina com as preferências atualizadas e consistentes. |
| PN_M1_09 | Gestão de Conformidade e Proteção de Dados (RGPD) | RF_M1_42–43 | RN_M1_41–42 | Processo iniciado por solicitação do titular dos dados ou obrigação legal. Permite eliminação, anonimização ou exportação de dados pessoais. Termina com os dados tratados conforme os requisitos legais aplicáveis. |

---

# Módulo 2 — Gestão de Animais

## Descrição

Define os processos de negócio relacionados com registo, classificação, posse, cedência e histórico dos animais.

---

## Processos de Negócio

| ID | Nome do Processo | RF (intervalo) | RN (intervalo) | Descrição |
|---|---|---|---|---|
| PN_M2_01 | Registo de Animal | RF_M2_01, RF_M2_19 | RN_M2_01–02 | Processo iniciado pela necessidade de introduzir um novo animal no sistema. Permite registar dados biográficos, identificação e classificação taxonómica. Termina com o animal identificado e disponível no sistema. |
| PN_M2_02 | Registo de Entrada de Animal | RF_M2_03–05, RF_M2_18 | RN_M2_03–06, RN_M2_30 | Processo iniciado pela entrega ou resgate de um animal. Permite registar a origem, contexto da entrada e estado clínico inicial. Termina com o animal associado a um evento de entrada válido. |
| PN_M2_03 | Alteração de Estado do Animal | RF_M2_07–09 | RN_M2_07–11, RN_M2_26–27 | Processo iniciado por uma mudança na situação do animal. Permite atualizar o estado e criar novo registo histórico. Termina com o estado atualizado e histórico preservado. |
| PN_M2_04 | Atribuição de Posse (Adoção) | RF_M2_10–12, RF_M2_16 | RN_M2_12–15, RN_M2_28–29 | Processo iniciado pela decisão de atribuir um animal a um cliente. Permite registar titularidade, período de posse e contexto de adoção. Termina com o animal associado a um cliente como titular. |
| PN_M2_05 | Cedência de Animal | RF_M2_13–15 | RN_M2_16–18 | Processo iniciado pela necessidade de transferir um animal para terceiros. Permite registar motivo, estado clínico e intervenientes. Termina com a transferência registada e rastreável. |
| PN_M2_06 | Registo de Entidade Externa | RF_M2_06 | RN_M2_19–20 | Processo iniciado pela necessidade de registar uma entidade externa. Permite guardar dados de identificação, contactos e tipo de parceria. Termina com a entidade disponível para participação em processos operacionais. |
| PN_M2_07 | Classificação Biológica do Animal | RF_M2_02 | RN_M2_21–22 | Processo iniciado pela necessidade de classificar um animal. Permite associar o animal a uma espécie e raça previamente registadas. Termina com o animal corretamente classificado. |
| PN_M2_08 | Consolidação do Histórico do Animal | RF_M2_17 | RN_M2_23–25 | Processo iniciado sempre que ocorre um evento relevante no ciclo de vida do animal. Permite integrar eventos e garantir consistência entre estados, posse e histórico. Termina com o histórico corretamente registado e consultável. |

---

# Módulo 3 — Gestão Comercial

## Descrição

Define os processos de negócio relacionados com catálogo comercial, stock, faturação, pagamentos e análise comercial.

---

## Processos de Negócio

| ID | Nome do Processo | RF (intervalo) | RN (intervalo) | Descrição |
|---|---|---|---|---|
| PN_M3_01 | Gestão de Catálogo Comercial | RF_M3_01–04 | RN_M3_01–04 | Processo iniciado pela necessidade de disponibilizar produtos no sistema. Permite criar, atualizar e desativar produtos. Termina com o catálogo atualizado e consistente. |
| PN_M3_02 | Registo de Compras (Reposição de Stock) | RF_M3_05–08 | RN_M3_05–08 | Processo iniciado pela necessidade de reabastecimento de produtos. Permite registar compras a fornecedores e respetivos detalhes. Termina com a compra registada e disponível para atualização de stock. |
| PN_M3_03 | Gestão de Stock por Lote | RF_M3_09–12 | RN_M3_09–13 | Processo iniciado por movimentos de produtos. Permite registar e atualizar stock por lote. Termina com o stock atualizado e consistente com as operações realizadas. |
| PN_M3_04 | Registo de Consumo e Venda | RF_M3_13–16 | RN_M3_14–17 | Processo iniciado pela necessidade de utilização ou venda de produtos. Permite validar stock e associar produtos a operações. Termina com os produtos registados como consumidos ou vendidos. |
| PN_M3_05 | Faturação | RF_M3_17–20 | RN_M3_18–22 | Processo iniciado após registo de consumo ou venda. Permite gerar faturas com base nos produtos e serviços associados. Termina com a fatura emitida e registada no sistema. |
| PN_M3_06 | Gestão de Pagamentos | RF_M3_21–23 | RN_M3_23–25 | Processo iniciado pela necessidade de liquidação de uma fatura. Permite registar pagamentos e atualizar o estado financeiro da fatura. Termina com a fatura corretamente atualizada. |
| PN_M3_07 | Gestão de Devoluções | RF_M3_24–26 | RN_M3_26–29 | Processo iniciado pela devolução de produtos previamente vendidos. Permite registar devoluções e atualizar stock quando aplicável. Termina com os registos comerciais atualizados. |
| PN_M3_08 | Consulta de Histórico Comercial | RF_M3_27–28 | RN_M3_30–31 | Processo iniciado pela necessidade de consulta de operações comerciais. Permite aceder ao histórico de compras, vendas, faturas e devoluções. Termina com os dados disponíveis para análise. |
| PN_M3_09 | Análise e Monitorização Comercial | RF_M3_29–30 | RN_M3_32 | Processo iniciado pela necessidade de suporte à decisão. Permite gerar relatórios e indicadores de desempenho comercial. Termina com informação consolidada para apoio à gestão. |

---

# Módulo 4 — Gestão de Consultas

## Descrição

Define os processos de negócio relacionados com consultas veterinárias, registo clínico, prescrições e integração com faturação.

---

## Processos de Negócio

| ID | Nome do Processo | RF (intervalo) | RN (intervalo) | Descrição |
|---|---|---|---|---|
| PN_M4_01 | Gestão de Consultas | RF_M4_01–02 | RN_M4_05, RN_M4_07, RN_M4_13–14, RN_M4_25 | Processo iniciado pela necessidade de agendar ou gerir uma consulta veterinária. Permite definir data, hora, animal, veterinário e especialidade. Termina com a consulta registada e pronta para execução. |
| PN_M4_02 | Execução e Registo Clínico | RF_M4_03–05 | RN_M4_11, RN_M4_17 | Processo iniciado no momento da realização da consulta. Permite registar anamnese, avaliação geral e sinais vitais do animal. Termina com a informação clínica devidamente registada. |
| PN_M4_03 | Registo de Diagnóstico Clínico | RF_M4_06–07 | RN_M4_04, RN_M4_18–19 | Processo iniciado durante ou após a consulta. Permite registar diagnóstico final e observações clínicas. Termina com a consulta concluída e diagnóstico válido registado. |
| PN_M4_04 | Gestão de Prescrições | RF_M4_08 | RN_M4_10 | Processo iniciado após avaliação clínica. Permite criar prescrições médicas associadas à consulta. Termina com a prescrição registada e associada ao animal. |
| PN_M4_05 | Gestão de Consumo de Produtos Clínicos | RF_M4_09–10 | RN_M4_06, RN_M4_23–24 | Processo iniciado durante a consulta. Permite associar produtos e medicamentos utilizados no ato clínico. Termina com os produtos corretamente registados para faturação. |
| PN_M4_06 | Gestão de Estados da Consulta | RF_M4_11–15 | RN_M4_09, RN_M4_15–16, RN_M4_20–21 | Processo iniciado por alterações no ciclo de vida da consulta. Permite atualizar estados da consulta garantindo coerência clínica e temporal. Termina com o estado atualizado de forma consistente. |
| PN_M4_07 | Gestão de Histórico Clínico | RF_M4_16 | — | Processo iniciado pela necessidade de consulta de informação médica. Permite acesso ao histórico clínico do animal. Termina com os dados apresentados de forma estruturada. |
| PN_M4_08 | Integração com Faturação | RF_M4_17 | RN_M4_01–03, RN_M4_08, RN_M4_12, RN_M4_22 | Processo iniciado após conclusão da consulta. Permite comunicação com o módulo comercial para geração automática de faturação e descontos de fidelização. Termina com a fatura emitida e associada à consulta. |

---

# Convenções

## Estrutura de identificadores

Formato obrigatório: `PN_M<modulo>_<numero>` (ex.: `PN_M3_05`).

Cada processo:

- **Inicia** com um evento de negócio identificável;
- **Engloba** um ou mais RF e RN do mesmo módulo;
- **Termina** com um resultado de negócio verificável (estado consistente no sistema).

## Relação PN ↔ RF ↔ RN

| Artefacto | Papel |
|-----------|-------|
| **PN** | Agrupa capacidades de negócio (este documento) |
| **RF** | Define o que o sistema deve permitir — [00_Functional_Requirements.md](00_Functional_Requirements.md) |
| **RN** | Define restrições e políticas testáveis — [02_Business_Rules.md](02_Business_Rules.md) |

A coluna **RF (intervalo)** indica cobertura principal; consultar tabelas RF para mapeamento linha a linha.

## Palavras-chave

`PN`, `processo de negócio`, `workflow`, `RGPD`, `adoção`, `faturação`, `consulta`.

## Nota — PN_M4_08

O processo **Integração com Faturação** inclui regras de desconto (`RN_M4_01–03`, `RN_M4_12`) sem RF dedicado; ver lacunas em [00_Functional_Requirements.md](00_Functional_Requirements.md#rastreabilidade-rf--rn-lacunas-documentadas).
# Requisitos Funcionais — Sistema de Gestão Veterinária

Especificação funcional modular (M1–M4) do ecossistema MiaCaoMigo. Artefactos relacionados na mesma pasta:

| Documento | Conteúdo |
|-----------|----------|
| [01_Non_Functional_Requirements.md](01_Non_Functional_Requirements.md) | Requisitos não funcionais (`RNF_Mx_yy`) |
| [02_Business_Rules.md](02_Business_Rules.md) | Regras de negócio (`RN_Mx_yy`) |
| [03_Business_Processes.md](03_Business_Processes.md) | Processos de negócio (`PN_Mx_yy`) |
| [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) | Critérios de aceitação (`AC_RF_Mx_yy`) |
| [06_Implementation_Matrix.md](06_Implementation_Matrix.md) | Matriz de implementação e estados |
| [07_Constraints.md](07_Constraints.md) | Restrições globais (`CST_xx`) |

**Contagens:** M1 — 43 RF · M2 — 19 RF · M3 — 30 RF · M4 — 17 RF · **Total: 109 RF**.

---

# Índice

- [Módulo 1 — Gestão de Utilizadores](#módulo-1--gestão-de-utilizadores)
- [Módulo 2 — Gestão de Animais](#módulo-2--gestão-de-animais)
- [Módulo 3 — Gestão Comercial](#módulo-3--gestão-comercial)
- [Módulo 4 — Gestão de Consultas](#módulo-4--gestão-de-consultas)

---

# Módulo 1 — Gestão de Utilizadores

## Descrição

Responsável pela gestão de contas, autenticação, roles, funções, horários, ausências e preferências dos utilizadores.

---

## Requisitos Funcionais

| ID | Requisito Funcional | Processo de Negócio | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RF_M1_01 | Permitir a criação de conta de cliente associada a um indivíduo | PN_M1_01 | 3 | Alta |
| RF_M1_02 | Permitir a criação de conta de empregado com email institucional imutável | PN_M1_01 | 3 | Alta |
| RF_M1_03 | Garantir no máximo uma conta ativa por tipo (cliente/empregado) por indivíduo | PN_M1_01 | 5 | Alta |
| RF_M1_04 | Permitir a desativação de contas mantendo o respetivo histórico | PN_M1_01 | 2 | Alta |
| RF_M1_05 | Permitir autenticação de utilizador através de email e password | PN_M1_02 | 3 | Alta |
| RF_M1_06 | Garantir no máximo uma sessão ativa por conta | PN_M1_02 | 5 | Alta |
| RF_M1_07 | Registar tentativas de autenticação com IP, timestamp e resultado | PN_M1_02 | 3 | Alta |
| RF_M1_08 | Registar eventos de login e logout com data e hora | PN_M1_02 | 2 | Alta |
| RF_M1_09 | Permitir a atualização de dados pessoais ao nível do indivíduo | PN_M1_04 | 2 | Média |
| RF_M1_10 | Garantir a partilha automática de dados entre contas associadas ao mesmo indivíduo | PN_M1_04 | 3 | Alta |
| RF_M1_11 | Manter apenas o estado atual dos dados pessoais (sem histórico) | PN_M1_04 | 1 | Média |
| RF_M1_12 | Permitir alteração de password com validação da password atual | PN_M1_03 | 3 | Alta |
| RF_M1_13 | Armazenar passwords de forma segura (hash) | PN_M1_03 | 3 | Alta |
| RF_M1_14 | Manter histórico de passwords para rastreabilidade | PN_M1_03 | 3 | Média |
| RF_M1_15 | Permitir a criação e gestão de roles organizacionais | PN_M1_05 | 3 | Média |
| RF_M1_16 | Permitir a atribuição de múltiplos roles a empregados | PN_M1_05 | 3 | Alta |
| RF_M1_17 | Permitir a associação de permissões a roles | PN_M1_05 | 3 | Média |
| RF_M1_18 | Registar histórico temporal de roles (data de início e fim) | PN_M1_05 | 5 | Alta |
| RF_M1_19 | Registar o responsável por alterações de roles | PN_M1_05 | 3 | Alta |
| RF_M1_20 | Permitir a atribuição de função a empregado (ex: veterinário ou auxiliar) | PN_M1_06 | 2 | Alta |
| RF_M1_21 | Garantir no máximo uma função ativa por empregado | PN_M1_06 | 3 | Alta |
| RF_M1_22 | Manter histórico temporal de funções desempenhadas | PN_M1_06 | 5 | Alta |
| RF_M1_23 | Registar o responsável por alterações de função | PN_M1_06 | 3 | Alta |
| RF_M1_24 | Permitir definição e atribuição de subfunções a auxiliares | PN_M1_06 | 2 | Média |
| RF_M1_25 | Exigir número OMV para veterinários e permitir especialidade opcional | PN_M1_06 | 2 | Alta |
| RF_M1_26 | Permitir definir um horário semanal único por empregado | PN_M1_07 | 3 | Alta |
| RF_M1_27 | Permitir múltiplos turnos por dia sem sobreposição | PN_M1_07 | 4 | Alta |
| RF_M1_28 | Permitir a atualização do horário semanal substituindo o anterior | PN_M1_07 | 2 | Média |
| RF_M1_29 | Permitir submissão de pedidos de ausência com intervalo temporal válido | PN_M1_07 | 2 | Alta |
| RF_M1_30 | Permitir gestão de estados de ausência (submetida, aprovada, rejeitada, cancelada, usufruída) | PN_M1_07 | 4 | Alta |
| RF_M1_31 | Permitir cancelamento de ausência até 72 horas antes do seu início | PN_M1_07 | 3 | Média |
| RF_M1_32 | Manter histórico de estados das ausências | PN_M1_07 | 5 | Alta |
| RF_M1_33 | Permitir registo de entrada de empregado (clock-in) | PN_M1_07 | 2 | Alta |
| RF_M1_34 | Permitir registo de saída de empregado (clock-out) | PN_M1_07 | 2 | Alta |
| RF_M1_35 | Garantir consistência temporal entre registos de entrada e saída | PN_M1_07 | 3 | Alta |
| RF_M1_36 | Impedir a remoção de registos de presença | PN_M1_07 | 2 | Alta |
| RF_M1_37 | Permitir o cálculo da disponibilidade com base em horários, ausências e presenças | PN_M1_07 | 8 | Alta |
| RF_M1_38 | Impedir atividade durante ausência ativa, salvo exceções baseadas em permissões | PN_M1_07 | 5 | Alta |
| RF_M1_39 | Permitir definir preferências de tema (claro/escuro) e idioma (PT/EN) | PN_M1_08 | 1 | Baixa |
| RF_M1_40 | Sincronizar preferências entre contas do mesmo indivíduo | PN_M1_08 | 2 | Média |
| RF_M1_41 | Permitir atualização de preferências sem histórico | PN_M1_08 | 1 | Baixa |
| RF_M1_42 | Permitir eliminação ou anonimização de dados pessoais mediante pedido | PN_M1_09 | 5 | Alta |
| RF_M1_43 | Garantir preservação de dados obrigatórios para integridade e obrigações legais | PN_M1_09 | 3 | Alta |

---

# Módulo 2 — Gestão de Animais

## Descrição

Responsável pelo registo, acompanhamento e histórico dos animais.

---

## Requisitos Funcionais

| ID | Requisito Funcional | Processo de Negócio | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RF_M2_01 | Permitir o registo de um novo animal com dados biográficos e identificadores únicos (ex: microchip) | PN_M2_01 | 5 | Alta |
| RF_M2_02 | Permitir associar o animal a uma espécie e raça existentes no catálogo biológico | PN_M2_07 | 2 | Alta |
| RF_M2_03 | Permitir o registo de entrada de um animal com identificação da origem (cliente ou entidade externa) | PN_M2_02 | 5 | Alta |
| RF_M2_04 | Permitir o registo do estado clínico inicial no momento da entrada | PN_M2_02 | 3 | Alta |
| RF_M2_05 | Permitir a criação automática de cliente quando um indivíduo entrega um animal e não existe no sistema | PN_M2_02 | 5 | Média |
| RF_M2_06 | Permitir o registo de entidades externas com dados de identificação e contacto | PN_M2_06 | 3 | Média |
| RF_M2_07 | Permitir a atualização do estado do animal (ex: interno, adotado, falecido, desaparecido) | PN_M2_03 | 4 | Alta |
| RF_M2_08 | Garantir que cada alteração de estado gera um novo registo histórico | PN_M2_03 | 5 | Alta |
| RF_M2_09 | Permitir a consulta do histórico completo de estados do animal | PN_M2_03 | 3 | Alta |
| RF_M2_10 | Permitir a atribuição de um animal a um cliente (processo de adoção/posse) | PN_M2_04 | 4 | Alta |
| RF_M2_11 | Permitir o registo do período de posse (data de início e fim) | PN_M2_04 | 3 | Alta |
| RF_M2_12 | Permitir a associação de um empregado responsável pela supervisão da adoção | PN_M2_04 | 2 | Média |
| RF_M2_13 | Permitir o registo de cedência de um animal com motivo associado | PN_M2_05 | 4 | Alta |
| RF_M2_14 | Permitir o registo do estado clínico do animal no momento da cedência | PN_M2_05 | 3 | Alta |
| RF_M2_15 | Permitir identificar os intervenientes envolvidos no processo de cedência | PN_M2_05 | 3 | Média |
| RF_M2_16 | Permitir a consulta do histórico de posse (ownership) de um animal | PN_M2_04 | 3 | Alta |
| RF_M2_17 | Permitir a consulta do histórico de eventos (entrada, adoção, cedência) associados a um animal | PN_M2_08 | 4 | Alta |
| RF_M2_18 | Permitir a consulta da origem do animal (quem ou que entidade o entregou) | PN_M2_02 | 2 | Alta |
| RF_M2_19 | Permitir a inativação de registos de animais mantendo histórico | PN_M2_01 | 2 | Média |

---

# Módulo 3 — Gestão Comercial

## Descrição

Responsável pela gestão de produtos, stock, faturação e operações comerciais.

---

## Requisitos Funcionais

| ID | Requisito Funcional | Processo de Negócio | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RF_M3_01 | Permitir a criação, edição e desativação de produtos no catálogo comercial | PN_M3_01 | 5 | Alta |
| RF_M3_02 | Permitir associar produtos a uma família (categoria) | PN_M3_01 | 2 | Alta |
| RF_M3_03 | Permitir definir preço e taxa de IVA para cada produto | PN_M3_01 | 3 | Alta |
| RF_M3_04 | Garantir que apenas produtos ativos podem ser utilizados em operações comerciais | PN_M3_01 | 3 | Alta |
| RF_M3_05 | Permitir o registo de compras a fornecedores (entidades externas) | PN_M3_02 | 5 | Alta |
| RF_M3_06 | Permitir associar uma compra a um fornecedor válido | PN_M3_02 | 2 | Alta |
| RF_M3_07 | Permitir registar múltiplos produtos e quantidades numa compra | PN_M3_02 | 5 | Alta |
| RF_M3_08 | Permitir registar método de pagamento e custo total da compra | PN_M3_02 | 3 | Média |
| RF_M3_09 | Permitir a criação automática de registos de stock por lote aquando de uma compra | PN_M3_03 | 5 | Alta |
| RF_M3_10 | Permitir registar quantidade, data de entrada e validade por lote | PN_M3_03 | 4 | Alta |
| RF_M3_11 | Permitir a atualização automática do stock após operações de compra, venda ou devolução | PN_M3_03 | 5 | Alta |
| RF_M3_12 | Permitir consultar o stock disponível por produto e por lote | PN_M3_03 | 3 | Alta |
| RF_M3_13 | Permitir registar consumo ou venda de produtos | PN_M3_04 | 5 | Alta |
| RF_M3_14 | Validar disponibilidade de stock antes de permitir a venda ou consumo | PN_M3_04 | 5 | Alta |
| RF_M3_15 | Permitir associar produtos a uma consulta (consumo clínico) ou venda direta | PN_M3_04 | 4 | Alta |
| RF_M3_16 | Permitir selecionar automaticamente ou manualmente o lote a utilizar | PN_M3_04 | 5 | Média |
| RF_M3_17 | Permitir gerar uma fatura com base nos produtos e serviços associados | PN_M3_05 | 5 | Alta |
| RF_M3_18 | Permitir associar uma fatura a uma consulta (quando aplicável) | PN_M3_05 | 2 | Média |
| RF_M3_19 | Permitir incluir múltiplos itens (produtos/serviços) numa fatura | PN_M3_05 | 5 | Alta |
| RF_M3_20 | Calcular automaticamente totais, impostos e valor final da fatura | PN_M3_05 | 5 | Alta |
| RF_M3_21 | Permitir registar pagamentos associados a uma fatura | PN_M3_06 | 4 | Alta |
| RF_M3_22 | Permitir definir o método de pagamento (dinheiro, cartão, etc.) | PN_M3_06 | 2 | Média |
| RF_M3_23 | Atualizar automaticamente o estado da fatura (pendente, parcial, paga) | PN_M3_06 | 3 | Alta |
| RF_M3_24 | Permitir registar devoluções de produtos com associação à fatura original | PN_M3_07 | 5 | Alta |
| RF_M3_25 | Permitir registar motivo e data da devolução | PN_M3_07 | 2 | Média |
| RF_M3_26 | Atualizar automaticamente o stock após devolução | PN_M3_07 | 4 | Alta |
| RF_M3_27 | Permitir consultar histórico de compras, vendas, faturas e devoluções | PN_M3_08 | 4 | Alta |
| RF_M3_28 | Permitir filtrar histórico por cliente, produto, período ou tipo de operação | PN_M3_08 | 3 | Média |
| RF_M3_29 | Permitir gerar relatórios de vendas e faturação | PN_M3_09 | 4 | Média |
| RF_M3_30 | Permitir analisar níveis de stock e produtos mais utilizados | PN_M3_09 | 4 | Média |

---

# Módulo 4 — Gestão de Consultas

## Descrição

Responsável pela gestão de consultas, prescrições, diagnósticos e histórico clínico.

---

## Requisitos Funcionais

| ID | Requisito Funcional | Processo de Negócio | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RF_M4_01 | Permitir o registo de consultas com associação a animal, veterinário responsável e especialidade, incluindo data, hora de início e fim | PN_M4_01 | 8 | Alta |
| RF_M4_02 | Garantir que a hora de início da consulta é anterior à hora de fim | PN_M4_01 | 3 | Alta |
| RF_M4_03 | Permitir o registo da anamnese (motivo e histórico clínico) associada à consulta | PN_M4_02 | 3 | Alta |
| RF_M4_04 | Permitir o registo da avaliação geral do animal, incluindo temperatura, peso e frequências | PN_M4_02 | 3 | Alta |
| RF_M4_05 | Permitir o início da consulta, alterando o seu estado para “em curso” | PN_M4_06 | 2 | Alta |
| RF_M4_06 | Permitir o registo do diagnóstico final e observações clínicas associadas à consulta | PN_M4_03 | 2 | Alta |
| RF_M4_07 | Impedir a conclusão da consulta sem diagnóstico registado | PN_M4_03 | 3 | Alta |
| RF_M4_08 | Permitir a criação de prescrições médicas associadas à consulta, incluindo data, validade e observações | PN_M4_04 | 5 | Alta |
| RF_M4_09 | Permitir associar produtos e medicamentos à consulta (utilização em clínica) ou à prescrição (utilização externa) | PN_M4_05 | 4 | Alta |
| RF_M4_10 | Garantir que apenas podem ser utilizados produtos com stock disponível | PN_M4_05 | 5 | Alta |
| RF_M4_11 | Permitir a alteração do estado da consulta ao longo do seu ciclo de vida (agendada, em curso, concluída, cancelada, não realizada) | PN_M4_06 | 3 | Alta |
| RF_M4_12 | Garantir que todas as consultas são inicialmente registadas como “agendadas” | PN_M4_06 | 2 | Alta |
| RF_M4_13 | Impedir alterações de estado da consulta que violem as regras definidas para o seu ciclo de vida | PN_M4_06 | 3 | Alta |
| RF_M4_14 | Permitir o cancelamento de consultas já agendadas | PN_M4_06 | 2 | Média |
| RF_M4_15 | Permitir marcar consultas como não realizadas quando o cliente não comparece | PN_M4_06 | 2 | Média |
| RF_M4_16 | Permitir a consulta do histórico clínico de um animal, incluindo consultas, diagnósticos, avaliações e prescrições | PN_M4_07 | 5 | Média |
| RF_M4_17 | Gerar automaticamente uma fatura após a conclusão da consulta com base nos serviços e produtos associados | PN_M4_08 | 7 | Alta |

---

# Convenções

## Estrutura de identificadores

| Tipo | Formato | Exemplo | Definido em |
|------|---------|---------|-------------|
| Requisito funcional | `RF_M<modulo>_<numero>` | `RF_M1_05` | Este documento |
| Processo de negócio | `PN_M<modulo>_<numero>` | `PN_M2_02` | [03_Business_Processes.md](03_Business_Processes.md) |
| Regra de negócio | `RN_M<modulo>_<numero>` | `RN_M3_20` | [02_Business_Rules.md](02_Business_Rules.md) |
| Requisito não funcional | `RNF_M<modulo>_<numero>` | `RNF_M4_02` | [01_Non_Functional_Requirements.md](01_Non_Functional_Requirements.md) |
| Critério de aceitação | `AC_RF_M<modulo>_<numero>` | `AC_RF_M1_05` | [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) |
| Restrição global | `CST_<numero>` | `CST_04` | [07_Constraints.md](07_Constraints.md) |

- `<modulo>`: `1` (utilizadores), `2` (animais), `3` (comercial), `4` (consultas).
- `<numero>`: sequência decimal com dois dígitos (`01`–`99`) por módulo.

A coluna **Processo de Negócio** referencia sempre `PN_Mx_yy` completo (não usar `PN_01` isolado).

## Palavras-chave (pesquisa)

`RF`, `requisito funcional`, `M1`, `M2`, `M3`, `M4`, `utilizadores`, `animais`, `comercial`, `consultas`, `autenticação`, `stock`, `fatura`, `consulta`.

## Rastreabilidade RF ↔ RN (lacunas documentadas)

Regras de negócio **sem** requisito funcional dedicado na mesma pasta (ver [02_Business_Rules.md](02_Business_Rules.md)):

| RN | Tema |
|----|------|
| RN_M1_36, RN_M1_37 | Classificação de ausências e impacto no saldo de férias |
| RN_M1_25 | Histórico temporal de especialidades do veterinário |
| RN_M4_01, RN_M4_02, RN_M4_03, RN_M4_12 | Descontos de fidelização na consulta |
| RN_M3_22 | Identificador sequencial legal de faturas |

Cobertura parcial possível via RF genéricos (ex.: `RF_M4_17` faturação; `RF_M1_25` especialidade sem histórico explícito).

## Rastreabilidade RF ↔ RNF

| RF (exemplos) | RNF relacionados |
|---------------|------------------|
| RF_M1_05–08, RF_M1_12–14 | RNF_M1_01, RNF_M1_02, RNF_M1_06 |
| RF_M2_08–09, RF_M2_17 | RNF_M2_01, RNF_M2_08 |
| RF_M3_11–14, RF_M3_20–23 | RNF_M3_03–06, RNF_M3_18 |
| RF_M4_16–17 | RNF_M4_01, RNF_M4_13, RNF_M4_14 |

Detalhe dos RNF transversais: [01_Non_Functional_Requirements.md](01_Non_Functional_Requirements.md#requisitos-transversais-do-sistema).
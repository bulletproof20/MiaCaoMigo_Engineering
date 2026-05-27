# Regras de Negócio — Sistema de Gestão Veterinária

Regras de validação e políticas de domínio (`RN_Mx_yy`) alinhadas com [processos](03_Business_Processes.md) (`PN_Mx_yy`) e [requisitos funcionais](00_Functional_Requirements.md) (`RF_Mx_yy`).

**Relacionado:** [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) (incl. `AC_RN_*` para RN sem RF) · [06_Implementacion_Matrix.md](06_Implementacion_Matrix.md) · [07_Constraints.md](07_Constraints.md)

**Contagens:** M1 — 42 RN · M2 — 30 RN · M3 — 32 RN · M4 — 25 RN · **Total: 129 RN**.

---

# Índice

- [Módulo 1 — Gestão de Utilizadores](#módulo-1--gestão-de-utilizadores)
- [Módulo 2 — Gestão de Animais](#módulo-2--gestão-de-animais)
- [Módulo 3 — Gestão Comercial](#módulo-3--gestão-comercial)
- [Módulo 4 — Gestão de Consultas](#módulo-4--gestão-de-consultas)

---

# Módulo 1 — Gestão de Utilizadores

## Descrição

Define as regras de negócio relacionadas com autenticação, contas, roles, funções, horários, ausências e preferências dos utilizadores.

---

## Regras de Negócio

| ID | Processo | RF principal | Regra |
|---|---|---|---|
| RN_M1_01 | PN_M1_01 | RF_M1_01 | Um indivíduo que se registe autonomamente no sistema deve ser associado a uma conta de cliente. |
| RN_M1_02 | PN_M1_01 | RF_M1_01 | Uma conta de cliente pode ser criada por um empregado, sendo gerada uma password aleatória enviada por email. |
| RN_M1_03 | PN_M1_01 | RF_M1_02 | Uma conta de empregado só pode ser criada por outro empregado com permissões adequadas. |
| RN_M1_04 | PN_M1_01 | RF_M1_03 | Cada indivíduo pode possuir no máximo uma conta ativa de cliente e uma conta ativa de empregado. |
| RN_M1_05 | PN_M1_01 | RF_M1_02 | O email institucional de uma conta de empregado é obrigatório e imutável após criação. |
| RN_M1_06 | PN_M1_02 | RF_M1_05 | O acesso ao sistema requer autenticação válida. |
| RN_M1_07 | PN_M1_02 | RF_M1_06 | Cada conta pode ter no máximo uma sessão ativa em simultâneo. |
| RN_M1_08 | PN_M1_02 | RF_M1_06 | Um indivíduo pode ter múltiplas sessões ativas apenas se correspondentes a contas distintas. |
| RN_M1_09 | PN_M1_02 | RF_M1_07 | Todas as tentativas de autenticação devem ser registadas com data/hora, IP e resultado. |
| RN_M1_10 | PN_M1_02 | RF_M1_08 | Todos os eventos de login e logout devem ser registados. |
| RN_M1_11 | PN_M1_04 | RF_M1_09 | Os dados pessoais devem ser armazenados ao nível do indivíduo. |
| RN_M1_12 | PN_M1_04 | RF_M1_10 | Os dados pessoais devem ser partilhados entre contas associadas ao mesmo indivíduo. |
| RN_M1_13 | PN_M1_04 | RF_M1_11 | As alterações aos dados pessoais não devem manter histórico. |
| RN_M1_14 | PN_M1_03 | RF_M1_12 | A alteração de password requer validação da password atual. |
| RN_M1_15 | PN_M1_03 | RF_M1_14 | O sistema deve manter histórico de passwords. |
| RN_M1_16 | PN_M1_05 | RF_M1_16 | Um empregado pode possuir um ou mais roles. |
| RN_M1_17 | PN_M1_05 | RF_M1_15 | Roles só podem ser criados ou atribuídos por utilizadores com permissões adequadas. |
| RN_M1_18 | PN_M1_05 | RF_M1_18 | As atribuições de roles devem possuir intervalo temporal (início e fim). |
| RN_M1_19 | PN_M1_05 | RF_M1_19 | As alterações de roles devem registar o responsável. |
| RN_M1_20 | PN_M1_06 | RF_M1_21 | Cada empregado pode possuir no máximo uma função ativa. |
| RN_M1_21 | PN_M1_06 | RF_M1_21 | Um empregado não pode acumular funções de veterinário e auxiliar. |
| RN_M1_22 | PN_M1_06 | RF_M1_24 | Auxiliares devem possuir obrigatoriamente uma subfunção. |
| RN_M1_23 | PN_M1_06 | RF_M1_25 | Veterinários devem possuir obrigatoriamente um número OMV válido. |
| RN_M1_24 | PN_M1_06 | RF_M1_25 | Um veterinário pode possuir uma ou mais especialidades. |
| RN_M1_25 | PN_M1_06 | — | O sistema deve manter histórico das especialidades de um veterinário. |
| RN_M1_26 | PN_M1_06 | RF_M1_22 | As alterações de função devem ser registadas com intervalo temporal e responsável. |
| RN_M1_27 | PN_M1_07 | RF_M1_26 | Cada empregado deve possuir um único horário semanal ativo. |
| RN_M1_28 | PN_M1_07 | RF_M1_27 | Turnos de um horário não podem sobrepor-se. |
| RN_M1_29 | PN_M1_07 | RF_M1_27 | Turnos devem ocorrer dentro do mesmo dia. |
| RN_M1_30 | PN_M1_07 | RF_M1_29 | Uma ausência deve possuir data de início anterior à data de fim. |
| RN_M1_31 | PN_M1_07 | RF_M1_31 | Uma ausência só pode ser cancelada até 72 horas antes da sua data de início. |
| RN_M1_32 | PN_M1_07 | RF_M1_38 | Durante uma ausência ativa, o empregado não pode exercer atividade normal. |
| RN_M1_33 | PN_M1_07 | RF_M1_38 | Exceções à ausência dependem das permissões do role. |
| RN_M1_34 | PN_M1_07 | RF_M1_35 | Registos de presença devem garantir consistência temporal. |
| RN_M1_35 | PN_M1_07 | RF_M1_36 | Registos de presença são imutáveis. |
| RN_M1_36 | PN_M1_07 | — | Ausências devem ser classificadas como justificadas ou injustificadas. |
| RN_M1_37 | PN_M1_07 | — | Ausências injustificadas devem reduzir automaticamente o saldo de férias. |
| RN_M1_38 | PN_M1_08 | RF_M1_39 | Preferências devem ser definidas ao nível do indivíduo. |
| RN_M1_39 | PN_M1_08 | RF_M1_40 | Preferências devem ser partilhadas entre contas associadas. |
| RN_M1_40 | PN_M1_08 | RF_M1_41 | Preferências não devem manter histórico. |
| RN_M1_41 | PN_M1_09 | RF_M1_42 | O sistema deve permitir anonimização ou eliminação de dados pessoais mantendo integridade referencial. |
| RN_M1_42 | PN_M1_09 | RF_M1_43 | O sistema deve garantir a preservação de dados obrigatórios para cumprimento legal. |

---

# Módulo 2 — Gestão de Animais

## Descrição

Define as regras de negócio relacionadas com registo, estados, posse, cedência e histórico dos animais.

---

## Regras de Negócio

| ID | Processo | RF principal | Regra |
|---|---|---|---|
| RN_M2_01 | PN_M2_01 | RF_M2_02 | Um animal só pode ser registado se estiver associado a uma espécie e raça previamente existentes. |
| RN_M2_02 | PN_M2_01 | RF_M2_01 | Cada animal deve possuir um identificador único no sistema. |
| RN_M2_03 | PN_M2_02 | RF_M2_03 | Um registo de entrada deve estar associado a um animal previamente registado. |
| RN_M2_04 | PN_M2_02 | RF_M2_03 | Um evento de entrada deve estar associado a um responsável pela entrega (cliente ou entidade externa). |
| RN_M2_05 | PN_M2_02 | RF_M2_05 | Caso o responsável pela entrega não exista no sistema, deve ser criado automaticamente como cliente. |
| RN_M2_06 | PN_M2_02 | RF_M2_04 | O registo de entrada deve incluir obrigatoriamente o estado clínico inicial do animal. |
| RN_M2_07 | PN_M2_03 | RF_M2_07 | O estado do animal deve assumir um valor de um conjunto pré-definido de estados válidos. |
| RN_M2_08 | PN_M2_03 | RF_M2_07 | Apenas um estado pode estar ativo para um animal num dado momento. |
| RN_M2_09 | PN_M2_03 | RF_M2_08 | Cada alteração de estado deve originar um novo registo histórico, preservando os anteriores. |
| RN_M2_10 | PN_M2_03 | RF_M2_08 | Cada registo de estado deve possuir um intervalo temporal válido. |
| RN_M2_11 | PN_M2_03 | RF_M2_08 | Não é permitido eliminar registos históricos de estado. |
| RN_M2_12 | PN_M2_04 | RF_M2_10 | Um processo de posse requer a associação de um animal e um cliente válido. |
| RN_M2_13 | PN_M2_04 | RF_M2_10 | Um animal só pode ter um único titular ativo num determinado momento. |
| RN_M2_14 | PN_M2_04 | RF_M2_11 | A atribuição de posse deve registar a data de início e pode incluir data de fim. |
| RN_M2_15 | PN_M2_04 | RF_M2_16 | O histórico de posse deve ser mantido, não sendo permitida a sua eliminação. |
| RN_M2_16 | PN_M2_05 | RF_M2_13 | Um evento de cedência deve estar associado a um animal e a um interveniente válido. |
| RN_M2_17 | PN_M2_05 | RF_M2_14 | Um evento de cedência deve registar obrigatoriamente o motivo e o estado clínico do animal no momento da transferência. |
| RN_M2_18 | PN_M2_05 | RF_M2_13 | Um evento de cedência deve originar uma atualização do estado do animal coerente com o contexto da transferência. |
| RN_M2_19 | PN_M2_06 | RF_M2_06 | Uma entidade externa deve possuir dados mínimos de identificação (nome e contacto). |
| RN_M2_20 | PN_M2_06 | RF_M2_06 | Apenas entidades marcadas como parceiras podem participar em processos recorrentes de entrega. |
| RN_M2_21 | PN_M2_07 | RF_M2_02 | Uma raça deve estar sempre associada a uma única espécie. |
| RN_M2_22 | PN_M2_07 | RF_M2_02 | Não podem existir espécies ou raças duplicadas no sistema. |
| RN_M2_23 | PN_M2_08 | RF_M2_17 | Todo o evento relevante deve ser refletido no histórico do animal. |
| RN_M2_24 | PN_M2_08 | RF_M2_17 | Os eventos do animal devem ser temporalmente consistentes, não podendo existir sobreposições inválidas. |
| RN_M2_25 | PN_M2_08 | RF_M2_17 | Não é permitido eliminar eventos históricos associados a um animal. |
| RN_M2_26 | PN_M2_03 | RF_M2_07 | Um animal com estado “falecido” não pode transitar para outro estado ativo. |
| RN_M2_27 | PN_M2_03 | RF_M2_03 | Após um evento de entrada, o estado do animal deve ser atualizado para um estado válido inicial. |
| RN_M2_28 | PN_M2_04 | RF_M2_10 | Um animal com titular ativo deve possuir um estado compatível com posse. |
| RN_M2_29 | PN_M2_04 | RF_M2_10 | Um animal sem titular ativo deve possuir um estado compatível com ausência de posse. |
| RN_M2_30 | PN_M2_02 | RF_M2_03 | A data de resgate deve ser anterior ou igual à data de entrada do animal. |

---

# Módulo 3 — Gestão Comercial

## Descrição

Define as regras de negócio relacionadas com produtos, stock, faturação, pagamentos e devoluções.

---

## Regras de Negócio

| ID | Processo | RF principal | Regra |
|---|---|---|---|
| RN_M3_01 | PN_M3_01 | RF_M3_01 | Um produto deve possuir uma designação, preço e taxa de IVA válidos. |
| RN_M3_02 | PN_M3_01 | RF_M3_02 | Um produto deve estar associado a uma única família (categoria). |
| RN_M3_03 | PN_M3_01 | RF_M3_01 | Não podem existir produtos duplicados com a mesma referência interna. |
| RN_M3_04 | PN_M3_01 | RF_M3_04 | Apenas produtos com estado ativo podem ser utilizados em operações comerciais. |
| RN_M3_05 | PN_M3_02 | RF_M3_05 | Uma compra deve estar associada a uma entidade externa válida (fornecedor). |
| RN_M3_06 | PN_M3_02 | RF_M3_07 | Uma compra deve conter pelo menos um produto. |
| RN_M3_07 | PN_M3_02 | RF_M3_07 | Cada linha de compra deve registar quantidade e custo unitário. |
| RN_M3_08 | PN_M3_02 | RF_M3_05 | A data da compra não pode ser futura. |
| RN_M3_09 | PN_M3_03 | RF_M3_09 | Cada registo de stock deve estar associado a um produto e a um lote (batch). |
| RN_M3_10 | PN_M3_03 | RF_M3_11 | A quantidade em stock deve ser sempre maior ou igual a zero. |
| RN_M3_11 | PN_M3_03 | RF_M3_10 | A data de validade de um lote deve ser posterior à data de entrada. |
| RN_M3_12 | PN_M3_03 | RF_M3_09 | Não podem existir dois registos de stock ativos com o mesmo produto e lote. |
| RN_M3_13 | PN_M3_03 | RF_M3_11 | Movimentos de stock devem refletir obrigatoriamente uma operação válida (compra, venda ou devolução). |
| RN_M3_14 | PN_M3_04 | RF_M3_14 | Um produto só pode ser vendido ou consumido se existir stock disponível. |
| RN_M3_15 | PN_M3_04 | RF_M3_16 | A quantidade utilizada não pode exceder a quantidade disponível no lote selecionado. |
| RN_M3_16 | PN_M3_04 | RF_M3_13 | Cada operação de consumo/venda deve estar associada a pelo menos um produto. |
| RN_M3_17 | PN_M3_04 | RF_M3_13 | Produtos utilizados devem originar obrigatoriamente uma redução de stock. |
| RN_M3_18 | PN_M3_05 | RF_M3_17 | Uma fatura deve conter pelo menos um item (produto ou serviço). |
| RN_M3_19 | PN_M3_05 | RF_M3_18 | Cada fatura pode estar associada no máximo a uma consulta. |
| RN_M3_20 | PN_M3_05 | RF_M3_20 | O valor total da fatura deve ser igual à soma dos seus itens e respetivos impostos. |
| RN_M3_21 | PN_M3_05 | RF_M3_17 | Após emissão, uma fatura não pode ser alterada, apenas anulada ou retificada. |
| RN_M3_22 | PN_M3_05 | — | As faturas devem possuir um identificador único e sequencial. |
| RN_M3_23 | PN_M3_06 | RF_M3_21 | O valor total dos pagamentos não pode exceder o valor da fatura. |
| RN_M3_24 | PN_M3_06 | RF_M3_23 | Uma fatura é considerada paga apenas quando o total pago for igual ao total faturado. |
| RN_M3_25 | PN_M3_06 | RF_M3_23 | Uma fatura parcialmente paga deve manter estado intermédio até liquidação total. |
| RN_M3_26 | PN_M3_07 | RF_M3_24 | Uma devolução deve estar associada a uma fatura previamente existente. |
| RN_M3_27 | PN_M3_07 | RF_M3_24 | A quantidade devolvida não pode exceder a quantidade originalmente vendida. |
| RN_M3_28 | PN_M3_07 | RF_M3_25 | Uma devolução deve indicar obrigatoriamente o motivo. |
| RN_M3_29 | PN_M3_07 | RF_M3_26 | Uma devolução deve originar atualização do stock quando aplicável. |
| RN_M3_30 | PN_M3_08 | RF_M3_27 | Todas as operações comerciais devem ser registadas e mantidas para consulta futura. |
| RN_M3_31 | PN_M3_08 | RF_M3_27 | Não é permitido eliminar registos históricos comerciais. |
| RN_M3_32 | PN_M3_09 | RF_M3_29 | Relatórios e indicadores devem basear-se exclusivamente em dados registados no sistema. |

---

# Módulo 4 — Gestão de Consultas

## Descrição

Define as regras de negócio relacionadas com consultas, prescrições, faturação clínica e descontos de fidelização.

---

## Regras de Negócio

| ID | Processo | RF principal | Regra |
|---|---|---|---|
| RN_M4_01 | PN_M4_08 | — | À 5ª consulta concluída de um animal, deve ser aplicado automaticamente um desconto de 30% sobre o valor do serviço de consulta. |
| RN_M4_02 | PN_M4_08 | — | A cada 10 consultas concluídas do mesmo animal, deve ser aplicado um desconto de 50% sobre o valor base da 10ª consulta. |
| RN_M4_03 | PN_M4_08 | — | Os descontos por fidelização aplicam-se exclusivamente ao serviço de consulta. |
| RN_M4_04 | PN_M4_03 | RF_M4_07 | Uma consulta só pode ser marcada como concluída após o registo obrigatório do diagnóstico. |
| RN_M4_05 | PN_M4_01 | RF_M4_01 | Um animal deve possuir um proprietário ativo para que seja possível agendar uma consulta. |
| RN_M4_06 | PN_M4_05 | RF_M4_09 | Produtos associados a uma prescrição não podem ser faturados como consumo em clínica. |
| RN_M4_07 | PN_M4_01 | RF_M4_01 | Cada consulta deve possuir exatamente um veterinário responsável. |
| RN_M4_08 | PN_M4_08 | RF_M4_17 | O valor total da fatura associada a uma consulta deve corresponder à soma do serviço de consulta e dos produtos ou medicamentos utilizados. |
| RN_M4_09 | PN_M4_06 | RF_M4_15 | Consultas marcadas como não realizadas não geram faturação automática e devem ser registadas para fins estatísticos. |
| RN_M4_10 | PN_M4_04 | RF_M4_08 | Uma prescrição médica possui uma validade máxima de 30 dias, salvo indicação em contrário por parte do veterinário. |
| RN_M4_11 | PN_M4_02 | RF_M4_03 | Não é permitido eliminar registos de anamnese após 24 horas da realização da consulta. |
| RN_M4_12 | PN_M4_08 | — | Um benefício de desconto só pode ser aplicado se o cliente não possuir faturas pendentes de pagamento. |
| RN_M4_13 | PN_M4_01 | RF_M4_01 | Cada consulta deve estar associada a exatamente uma especialidade. |
| RN_M4_14 | PN_M4_01 | RF_M4_01 | Deve existir uma especialidade “Geral” que pode ser associada a qualquer consulta. |
| RN_M4_15 | PN_M4_06 | RF_M4_11 | Cada consulta deve possuir um estado pertencente ao conjunto (agendada, em curso, concluída, cancelada, não realizada). |
| RN_M4_16 | PN_M4_06 | RF_M4_12 | Uma consulta deve ser criada com estado inicial “agendada”. |
| RN_M4_17 | PN_M4_02 | RF_M4_05 | Uma consulta em curso deve possuir data e hora de início definidas. |
| RN_M4_18 | PN_M4_03 | RF_M4_06 | Uma consulta concluída deve possuir data e hora de fim definidas. |
| RN_M4_19 | PN_M4_03 | RF_M4_07 | Uma consulta cancelada ou não realizada não pode possuir diagnóstico registado. |
| RN_M4_20 | PN_M4_06 | RF_M4_13 | Uma consulta concluída não pode mudar para outro estado. |
| RN_M4_21 | PN_M4_06 | RF_M4_13 | Uma consulta cancelada ou não realizada não pode transitar para os estados em curso ou concluída. |
| RN_M4_22 | PN_M4_08 | RF_M4_17 | Apenas consultas concluídas podem originar faturação automática. |
| RN_M4_23 | PN_M4_05 | RF_M4_10 | A associação de produtos a uma consulta deve respeitar a disponibilidade de stock existente. |
| RN_M4_24 | PN_M4_05 | RF_M4_10 | Os produtos utilizados numa consulta devem originar obrigatoriamente uma redução de stock. |
| RN_M4_25 | PN_M4_01 | RF_M4_01 | Cada consulta deve estar associada a um animal previamente registado no sistema. |

---

# Convenções

## Estrutura de identificadores

Formato obrigatório: `RN_M<modulo>_<numero>` (ex.: `RN_M2_09`).

| Coluna | Significado |
|--------|-------------|
| **Processo** | Processo de negócio `PN_Mx_yy` — ver [03_Business_Processes.md](03_Business_Processes.md) |
| **RF principal** | Requisito funcional que materializa a regra; `—` quando não existe RF dedicado |
| **Regra** | Enunciado testável de negócio |

## Palavras-chave

`RN`, `regra de negócio`, `validação`, `política`, `integridade de domínio`.

## Regras órfãs (sem RF dedicado)

| RN | Nota |
|----|------|
| RN_M1_25 | Histórico de especialidades — RF_M1_25 cobre OMV/especialidade, não histórico |
| RN_M1_36, RN_M1_37 | Política de férias / ausências injustificadas |
| RN_M3_22 | Numeração sequencial legal de faturas |
| RN_M4_01, RN_M4_02, RN_M4_03, RN_M4_12 | Descontos de fidelização e pré-condições |

Lista espelhada em [00_Functional_Requirements.md](00_Functional_Requirements.md#rastreabilidade-rf--rn-lacunas-documentadas).

## Testabilidade

Cada regra deve ser verificável por: (1) teste de aceitação de negócio, (2) constraint de persistência, ou (3) validação na camada de aplicação — conforme responsabilidade indicada nos [RNF](01_Non_Functional_Requirements.md).
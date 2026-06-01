# Requisitos Não Funcionais — Sistema de Gestão Veterinária

Atributos de qualidade do sistema (`RNF_Mx_yy`), complementares aos [requisitos funcionais](00_Functional_Requirements.md).

**Relacionado:** [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) · [06_Implementation_Matrix.md](06_Implementation_Matrix.md) · [07_Constraints.md](07_Constraints.md)

**Contagens:** M1 — 11 · M2 — 14 · M3 — 20 · M4 — 14 · **Total: 59 RNF** (inclui repetições por módulo de temas transversais).

---

# Índice

- [Requisitos transversais do sistema](#requisitos-transversais-do-sistema)
- [Módulo 1 — Gestão de Utilizadores](#módulo-1--gestão-de-utilizadores)
- [Módulo 2 — Gestão de Animais](#módulo-2--gestão-de-animais)
- [Módulo 3 — Gestão Comercial](#módulo-3--gestão-comercial)
- [Módulo 4 — Gestão de Consultas](#módulo-4--gestão-de-consultas)
- [Convenções](#convenções)

---

# Requisitos transversais do sistema

Temas repetidos nos módulos com a mesma semântica. Os `RNF_Mx_yy` mantêm-se por módulo (rastreio APS); a **responsabilidade** de implementação é comum.

| Ref. | Tema | Responsabilidade | RNF equivalentes (exemplos) |
|------|------|------------------|----------------------------|
| SEC-T01 | Encriptação em trânsito (HTTPS) | Infraestrutura / API | RNF_M1_03, RNF_M2_05, RNF_M3_09, RNF_M4_03 |
| SEC-T02 | Encriptação em repouso (BD) | Infraestrutura / DBA | RNF_M2_06, RNF_M3_10, RNF_M4_04 |
| SEC-T03 | Hash seguro de passwords | API + BD | RNF_M1_02 ↔ RF_M1_13 |
| OPS-T01 | Disponibilidade ≥ 99% | Operações / hosting | RNF_M1_05, RNF_M2_09, RNF_M3_07, RNF_M4_08 |
| OPS-T02 | Backup e recuperação | Operações / DBA | RNF_M1_09, RNF_M2_10, RNF_M3_08, RNF_M4_09 |
| UX-T01 | Compatibilidade navegadores / mobile | UI / frontend | RNF_M1_10–11, RNF_M2_14, RNF_M3_16–17, RNF_M4_12 |

---

# Módulo 1 — Gestão de Utilizadores

## Descrição

Responsável pelos requisitos não funcionais relacionados com autenticação, segurança, disponibilidade, auditoria e usabilidade da gestão de utilizadores.

---

## Requisitos Não Funcionais

| ID | Requisito Não Funcional | Tipo | Responsabilidade | Estimativa (US) | Prioridade |
|---|---|---|---|---|---|
| RNF_M1_01 | O sistema deve garantir que o tempo de autenticação não excede 2 segundos em 95% dos pedidos | Performance | API + BD | 3 | Alta |
| RNF_M1_02 | O sistema deve armazenar passwords utilizando algoritmos de hash seguros | Segurança | SEC-T03 | 3 | Alta |
| RNF_M1_03 | O sistema deve garantir encriptação de dados sensíveis em trânsito (HTTPS) | Segurança | SEC-T01 | 3 | Alta |
| RNF_M1_04 | O sistema deve suportar múltiplos utilizadores simultâneos sem degradação significativa de desempenho | Escalabilidade | Infra + BD | 5 | Média |
| RNF_M1_05 | O sistema deve garantir disponibilidade mínima de 99% durante o horário de operação | Disponibilidade | OPS-T01 | 5 | Alta |
| RNF_M1_06 | O sistema deve registar logs de autenticação e operações críticas para auditoria | Auditoria | BD + API | 3 | Alta |
| RNF_M1_07 | O sistema deve garantir integridade referencial dos dados de utilizadores e contas | Integridade | BD | 5 | Alta |
| RNF_M1_08 | O sistema deve impedir acesso não autorizado através de controlo de permissões baseado em roles | Segurança | BD + API | 5 | Alta |
| RNF_M1_09 | O sistema deve permitir recuperação de dados em caso de falha através de backups automáticos | Fiabilidade | OPS-T02 | 5 | Média |
| RNF_M1_10 | O sistema deve ser acessível através de navegadores modernos (Chrome, Edge, Firefox) | Compatibilidade | UX-T01 | 2 | Média |
| RNF_M1_11 | O sistema deve apresentar uma interface responsiva e utilizável em dispositivos móveis | Usabilidade | UX-T01 | 3 | Baixa |

---

# Módulo 2 — Gestão de Animais

## Descrição

Responsável pelos requisitos não funcionais relacionados com desempenho, integridade, disponibilidade e segurança da gestão de animais.

---

## Requisitos Não Funcionais

| ID | Requisito Não Funcional | Tipo | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RNF_M2_01 | O sistema deve permitir consultar o histórico completo de um animal em menos de 2 segundos para 95% dos pedidos | Performance | 5 | Alta |
| RNF_M2_02 | O sistema deve garantir consistência e integridade referencial entre animais, estados, eventos e posse | Integridade | 5 | Alta |
| RNF_M2_03 | O sistema deve garantir que operações de registo de eventos (entrada, adoção, cedência) são transacionais | Fiabilidade | 5 | Alta |
| RNF_M2_04 | O sistema deve suportar múltiplos utilizadores a consultar e atualizar dados de animais sem conflitos ou inconsistências | Concorrência | 5 | Média |
| RNF_M2_05 | O sistema deve garantir encriptação de dados sensíveis em trânsito (HTTPS) | Segurança | 3 | Alta |
| RNF_M2_06 | O sistema deve garantir encriptação de dados sensíveis em repouso (base de dados) | Segurança | 5 | Alta |
| RNF_M2_07 | O sistema deve registar logs de eventos críticos (entrada, adoção, cedência, alteração de estado) para auditoria | Auditoria | 3 | Alta |
| RNF_M2_08 | O sistema deve garantir que os registos históricos são imutáveis após criação | Integridade | 5 | Alta |
| RNF_M2_09 | O sistema deve garantir disponibilidade mínima de 99% para acesso a dados de animais | Disponibilidade | 5 | Alta |
| RNF_M2_10 | O sistema deve permitir recuperação de dados em caso de falha através de backups automáticos | Fiabilidade | 5 | Média |
| RNF_M2_11 | O sistema deve suportar crescimento do número de animais e eventos sem degradação significativa de desempenho | Escalabilidade | 5 | Média |
| RNF_M2_12 | O sistema deve permitir exportação de dados de animais e histórico em formato estruturado (ex: PDF ou CSV) | Portabilidade | 3 | Baixa |
| RNF_M2_13 | O sistema deve apresentar tempos de resposta inferiores a 1 segundo para operações de consulta simples de dados de animais | Performance | 3 | Média |
| RNF_M2_14 | O sistema deve garantir que a interface é utilizável em dispositivos móveis para acesso a dados de animais no terreno | Usabilidade | 5 | Média |

---

# Módulo 3 — Gestão Comercial

## Descrição

Responsável pelos requisitos não funcionais relacionados com stock, faturação, concorrência, desempenho e integridade comercial.

---

## Requisitos Não Funcionais

| ID | Requisito Não Funcional | Tipo | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RNF_M3_01 | O sistema deve responder a operações de consulta (produtos, stock, faturas) em menos de 2 segundos para 95% dos pedidos | Performance | 5 | Alta |
| RNF_M3_02 | O sistema deve permitir o registo completo de uma venda em menos de 5 segundos (excluindo interação do utilizador) | Performance | 5 | Alta |
| RNF_M3_03 | O sistema deve garantir atualização do stock em tempo real após operações de compra, venda ou devolução | Consistência | 5 | Alta |
| RNF_M3_04 | O sistema deve garantir integridade referencial entre produtos, stock, compras, faturas e devoluções | Integridade | 8 | Alta |
| RNF_M3_05 | O sistema deve suportar múltiplos utilizadores simultâneos sem inconsistências de stock (controlo de concorrência) | Concorrência | 8 | Alta |
| RNF_M3_06 | O sistema deve garantir que operações comerciais são executadas de forma transacional (ACID) | Fiabilidade | 8 | Alta |
| RNF_M3_07 | O sistema deve garantir disponibilidade mínima de 99% durante o horário de funcionamento | Disponibilidade | 5 | Alta |
| RNF_M3_08 | O sistema deve garantir recuperação de dados em caso de falha através de backups automáticos diários | Fiabilidade | 5 | Alta |
| RNF_M3_09 | O sistema deve garantir encriptação de dados sensíveis em trânsito (HTTPS) | Segurança | 3 | Alta |
| RNF_M3_10 | O sistema deve garantir encriptação de dados sensíveis em repouso (base de dados) | Segurança | 5 | Alta |
| RNF_M3_11 | O sistema deve restringir o acesso a funcionalidades comerciais com base em roles e permissões | Segurança | 5 | Alta |
| RNF_M3_12 | O sistema deve registar logs de todas as operações críticas (compras, vendas, faturação, devoluções) | Auditoria | 5 | Alta |
| RNF_M3_13 | O sistema deve garantir que os logs não podem ser alterados ou eliminados por utilizadores comuns | Auditoria | 5 | Alta |
| RNF_M3_14 | O sistema deve permitir crescimento do volume de dados (produtos, transações) sem degradação significativa de desempenho | Escalabilidade | 8 | Média |
| RNF_M3_15 | O sistema deve permitir exportação de dados comerciais (faturas, vendas, stock) em formatos estruturados (ex: PDF, CSV) | Portabilidade | 3 | Média |
| RNF_M3_16 | O sistema deve garantir compatibilidade com navegadores modernos (Chrome, Edge, Firefox) | Compatibilidade | 2 | Média |
| RNF_M3_17 | O sistema deve apresentar interface utilizável que permita concluir uma venda em no máximo 5 interações principais | Usabilidade | 3 | Média |
| RNF_M3_18 | O sistema deve garantir precisão de cálculos financeiros com duas casas decimais | Precisão | 3 | Alta |
| RNF_M3_19 | O sistema deve garantir tempo de resposta inferior a 1 segundo para operações simples de consulta (ex: produto ou stock) | Performance | 3 | Média |
| RNF_M3_20 | Em caso de falha, o sistema deve ser restaurado em menos de 1 hora (RTO ≤ 1h) | Recuperação | 5 | Alta |

---

# Módulo 4 — Gestão de Consultas

## Descrição

Responsável pelos requisitos não funcionais relacionados com desempenho clínico, segurança, auditoria e integridade das consultas.

---

## Requisitos Não Funcionais

| ID | Requisito Não Funcional | Tipo | Estimativa (US) | Prioridade |
|---|---|---|---|---|
| RNF_M4_01 | O sistema deve permitir o carregamento do histórico clínico completo de um animal em menos de 3 segundos para 95% dos pedidos | Performance | 5 | Alta |
| RNF_M4_02 | O sistema deve garantir consistência entre os dados clínicos e o estado da consulta | Integridade | 5 | Alta |
| RNF_M4_03 | O sistema deve garantir encriptação de dados clínicos sensíveis em trânsito (HTTPS) | Segurança | 3 | Alta |
| RNF_M4_04 | O sistema deve garantir encriptação de dados clínicos sensíveis em repouso (base de dados) | Segurança | 5 | Alta |
| RNF_M4_05 | O sistema deve garantir que apenas utilizadores autorizados podem aceder e registar dados clínicos | Segurança | 5 | Alta |
| RNF_M4_06 | O sistema deve suportar múltiplos utilizadores a registar e consultar consultas em simultâneo sem inconsistências | Concorrência | 5 | Média |
| RNF_M4_07 | O sistema deve garantir que os registos clínicos são persistidos de forma segura e não são perdidos em caso de falha | Fiabilidade | 5 | Alta |
| RNF_M4_08 | O sistema deve garantir disponibilidade mínima de 99% para acesso a dados clínicos | Disponibilidade | 5 | Alta |
| RNF_M4_09 | O sistema deve permitir recuperação de dados em caso de falha através de backups automáticos | Fiabilidade | 5 | Média |
| RNF_M4_10 | O sistema deve registar logs de operações clínicas críticas para efeitos de auditoria | Auditoria | 4 | Alta |
| RNF_M4_11 | O sistema deve garantir que os registos clínicos não podem ser eliminados após um período de 24 horas | Integridade | 4 | Alta |
| RNF_M4_12 | O sistema deve apresentar uma interface adaptada a dispositivos móveis (ex: tablets) para suporte à execução de consultas | Usabilidade | 8 | Média |
| RNF_M4_13 | O sistema deve garantir que a geração de faturação após consulta não compromete o desempenho das operações clínicas | Performance | 5 | Média |
| RNF_M4_14 | O sistema deve garantir consistência entre os dados clínicos e os dados de faturação associados à consulta | Integridade | 5 | Alta |

---

# Convenções

## Estrutura de identificadores

Formato obrigatório: `RNF_M<modulo>_<numero>` (ex.: `RNF_M3_18`).

Referências transversais (`SEC-T*`, `OPS-T*`, `UX-T*`) agrupam requisitos semanticamente duplicados entre módulos — **não substituem** o ID `RNF_Mx_yy` no rastreio APS.

## Responsabilidade (legenda)

| Valor | Significado |
|-------|-------------|
| **BD** | PostgreSQL, constraints, triggers, jobs |
| **API** | Camada de aplicação / orquestração |
| **UI** | Interface e experiência de utilizador |
| **Infra** | Hosting, TLS, rede, escalabilidade horizontal |
| **Ops** | Backup, monitorização, RTO/RPO |
| **SEC-T*** / **OPS-T*** / **UX-T*** | Ver [requisitos transversais](#requisitos-transversais-do-sistema) |

## Ligação RF ↔ RNF

| Domínio | Exemplos |
|---------|----------|
| Autenticação | RF_M1_05–08 ↔ RNF_M1_01–03, RNF_M1_06 |
| Stock / transações | RF_M3_11–14 ↔ RNF_M3_03–06 |
| Consultas / clínico | RF_M4_16–17 ↔ RNF_M4_01, RNF_M4_13–14 |

## Palavras-chave

`RNF`, `não funcional`, `performance`, `segurança`, `disponibilidade`, `HTTPS`, `backup`, `ACID`.
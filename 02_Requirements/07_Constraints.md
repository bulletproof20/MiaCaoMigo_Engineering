# Restrições — Sistema de Gestão Veterinária

Limites técnicos, legais e operacionais do ecossistema MiaCaoMigo. Complementa [RNF](01_Non_Functional_Requirements.md) (atributos de qualidade) sem substituir requisitos funcionais ou regras de negócio.

**Relacionado:** [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) · [06_Implementacion_Matrix.md](06_Implementacion_Matrix.md)

---

# Índice

- [Arquitetura](#arquitetura)
- [Base de Dados](#base-de-dados)
- [Segurança](#segurança)
- [Infraestrutura](#infraestrutura)
- [Compliance](#compliance)
- [Performance](#performance)
- [Integração](#integração)
- [Operação](#operação)
- [Convenções](#convenções)

---

# Arquitetura

## CST_01 — Separação de camadas

O sistema deve seguir separação **UI → API → DataLayer (PostgreSQL)**. A documentação de implementação técnica reside no repositório Engineering (`04_Architecture/`) e no repositório executável `01_MiaCaoMigo_DataLayer`; requisitos de produto permanecem nesta pasta.

## CST_02 — Modularização M1–M4

A persistência e serviços de negócio devem respeitar os quatro módulos de domínio: utilizadores (M1), animais (M2), comercial (M3), consultas (M4). Referências cruzadas entre módulos devem usar chaves explícitas (FK ou referências documentadas).

## CST_03 — API pública da DataLayer

Exposição externa preferencial via funções `svc_*` quando existirem; procedures `sp_*` do schema podem ser invocadas pela API quando não houver `svc_*` equivalente (ex.: M4 escrita clínica).

---

# Base de Dados

## CST_04 — SGBD principal

O sistema deve utilizar **PostgreSQL** como sistema principal de gestão de dados transacionais.

## CST_05 — Schema e integridade

O modelo físico deve ser carregado a partir de `01_MiaCaoMigo_DataLayer/DataBase/Schema/` com validação de integridade em `DataBase/QA/01_Integrity/`.

## CST_06 — Tipos enumerados partilhados

Estados de negócio críticos (ausência, compra, fatura, consulta) devem usar ENUMs definidos em `Schema/00_Core/01_Types.sql`, alinhados com [00_Functional_Requirements.md](00_Functional_Requirements.md).

## CST_07 — Imutabilidade de histórico

Registos de auditoria, posse, eventos comerciais e histórico clínico não devem ser eliminados fisicamente quando a regra de negócio exige preservação (ver [02_Business_Rules.md](02_Business_Rules.md)).

---

# Segurança

## CST_08 — Comunicação externa

Toda a comunicação entre clientes externos e a plataforma deve utilizar **HTTPS** (alinhado com SEC-T01 em [01_Non_Functional_Requirements.md](01_Non_Functional_Requirements.md)).

## CST_09 — Credenciais

Passwords não devem ser armazenadas em texto claro na base de dados; a API aplica hashing antes de invocar serviços de autenticação da DataLayer.

## CST_10 — Controlo de acesso

Operações sensíveis devem respeitar RBAC (`profile`, `permission`, `occupies`) documentado no módulo M1.

---

# Infraestrutura

## CST_11 — Containerização

Ambientes de desenvolvimento e documentação podem utilizar **Docker** (portal MkDocs, base de dados local).

## CST_12 — Agendamento

Tarefas periódicas de negócio na BD utilizam **pg_cron** sobre procedures `jpr_*` (M1, M4).

## CST_13 — Documentação técnica

O portal Engineering utiliza **MkDocs (Material)**; diagramas de schema podem ser gerados via SchemaSpy (output read-only).

---

# Compliance

## CST_14 — Proteção de dados pessoais

Tratamento de dados pessoais deve suportar pedidos de titulares (anonimização/eliminação) conforme RF_M1_42–43, com preservação de dados legalmente obrigatórios (RN_M1_41–42).

## CST_15 — Rastreabilidade académica

Artefactos APS (RF, RN, PN, RNF) nesta pasta constituem baseline normativa do projeto; alterações devem manter rastreio ID-a-ID.

---

# Performance

## CST_16 — Transações

Operações comerciais e de registo de eventos de animal devem ser **transacionais (ACID)** quando envolvem múltiplas tabelas (RNF_M3_06, RN_M2_03).

## CST_17 — Concorrência de stock

Atualizações de stock devem evitar inconsistências em cenários de venda/consumo concorrente (RNF_M3_05).

---

# Integração

## CST_18 — Módulo comercial ↔ consultas

Faturação de consulta deve respeitar no máximo uma fatura por consulta (RN_M3_19) e sincronização documentada entre M3 e M4.

## CST_19 — Entidades externas

Referências a fornecedores/abrigo usam `external_entity` (M2/M3) com regras de identificação mínima (RN_M2_19).

---

# Operação

## CST_20 — Backups

Deve existir política de backup e recuperação para a base de dados (OPS-T02 em RNF).

## CST_21 — Disponibilidade

Meta operacional de disponibilidade durante horário de funcionamento da clínica (OPS-T01 em RNF) — responsabilidade de hosting.

## CST_22 — Logs de auditoria

Operações críticas (autenticação, comercial, clínico) devem ser auditáveis via registos persistidos ou logs de aplicação (RNF_M1_06, RNF_M3_12).

---

# Convenções

## Identificadores

Formato: `CST_<numero>` (sequência global neste documento).

## Relação com outros artefactos

| Artefacto | Relação com CST |
|-----------|-----------------|
| **RNF** | Atributos de qualidade mensuráveis (tempo, %, UX) |
| **CST** | Limites obrigatórios e tecnologias mandatórias |
| **RF / RN** | Comportamento de negócio — não duplicar aqui |

## Palavras-chave

`restrição`, `PostgreSQL`, `HTTPS`, `Docker`, `RGPD`, `ACID`, `M1`, `M4`.

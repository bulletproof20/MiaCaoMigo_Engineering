# ER V10 — Atributos por módulo (semântica conceptual)

Documentação de **atributos ao nível do modelo de domínio**: significado de negócio, papel de cada atributo no ecossistema MiaCaoMigo e ligação às entidades do ER V10.

!!! info "Não é a documentação de implementação"
    Para colunas físicas, chaves, ENUMs e navegação no PostgreSQL, usar o **[Data Dictionary](../../../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md)** em `04_Architecture/`.

    Os textos desta pasta são **sincronizados** com comentários em `01_MiaCaoMigo_DataLayer` para consistência, mas o objetivo de leitura aqui é **conceptual** (WHY / WHAT), não pipelines SQL.

---

## Módulos

| Ficheiro | Módulo | Tabelas |
|----------|--------|---------|
| [01_Module1.md](01_Module1.md) | Utilizadores e acesso | 16 |
| [02_Module2.md](02_Module2.md) | Animais e tutela | 8 |
| [03_Module3.md](03_Module3.md) | Comercial | 8 |
| [04_Module4.md](04_Module4.md) | Consultas | 7 |

**Fontes de sincronização:** `DataBase/Comments/Schema/*/00_Tables_Mod*_Comments.sql` e DDL em `DataBase/Schema/*/` no repositório DataLayer.

---

## Convenção das tabelas

| Coluna | Significado |
|--------|-------------|
| Nome do atributo | Designação legível no modelo E-R / negócio |
| Nome físico | Coluna PostgreSQL (ponte para o dicionário técnico) |
| Descrição | Semântica operacional e justificação no domínio |

Relações **soft** no Módulo 3 estão assinaladas na descrição (referência lógica sem FK física no DDL).

---

## Leitura em par

| Passo | Documento |
|-------|-----------|
| 1 | [Modelo estrutural ER](../../er_model.md) |
| 2 | Atributos (esta pasta) — semântica |
| 3 | [Data Dictionary](../../../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md) — implementação |

Camadas do repositório: [DOCUMENTATION_LAYERS.md](../../../../DOCUMENTATION_LAYERS.md).

Requisitos funcionais (estado na BD): [RF matrix](../../../../02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) — semântica aqui, implementação no dicionário.

---

[← Modelo E-R](../../er_model.md)

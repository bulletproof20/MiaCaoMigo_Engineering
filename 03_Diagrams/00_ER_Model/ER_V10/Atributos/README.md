# ER V10 — Atributos por módulo

Documentação de atributos alinhada com a implementação em **`01_MiaCaoMigo_DataLayer`**.

| Ficheiro | Módulo | Tabelas |
|----------|--------|---------|
| [01_Module1.md](01_Module1.md) | Utilizadores e acesso | 16 |
| [02_Module2.md](02_Module2.md) | Animais e tutela | 8 |
| [03_Module3.md](03_Module3.md) | Comercial | 8 |
| [04_Module4.md](04_Module4.md) | Consultas | 7 |

**Fontes:** `DataBase/Comments/Schema/*/00_Tables_Mod*_Comments.sql` e `DataBase/Schema/*/00_Tables_Mod*.sql` (quando o comentário ainda não existe no repositório).

**Convenção das tabelas**

| Coluna | Significado |
|--------|-------------|
| Nome do atributo | Designação legível (modelo E-R / negócio) |
| Nome físico | Coluna PostgreSQL |
| Descrição | Semântica operacional |

Relações **soft** no Módulo 3 estão assinaladas na descrição (sem FK física no DDL).

---

[← Modelo E-R](../../er_model.md) · [Dicionário de dados](../../../04_Architecture/01_Database/04_Data_Dictionary/00_Overview.md)

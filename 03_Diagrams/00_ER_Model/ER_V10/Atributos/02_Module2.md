# Módulo 2 — Gestão de animais

!!! info "Fonte de verdade"
    `01_MiaCaoMigo_DataLayer` — `Comments/Schema/02_Module2/00_Tables_Mod2_Comments.sql`  
    DDL: `Schema/02_Module2_Animal_Management/00_Tables_Mod2.sql`

**8 entidades** · espécie, raça, animal, entidades externas, tutela, concessão, entrega.

---

## 1. species (espécie)

Catálogo de espécies animais suportadas pela clínica.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da espécie | `id_spc` | Identificador único da espécie no sistema. |
| Nome da espécie | `nam_spc` | Nome comum da espécie (ex.: cão, gato). |
| Nome científico | `sci_nam_spc` | Nome científico opcional da espécie. |

---

## 2. breed (raça)

Raças associadas a uma espécie.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da raça | `id_bre` | Identificador único da raça. |
| Nome da raça | `nam_bre` | Designação apresentável da raça. |
| Nome científico da raça | `sci_nam_bre` | Nome científico opcional da raça. |
| Espécie | `id_spc` | Referência obrigatória à espécie (FK). |

---

## 3. animal

Registo clínico e administrativo de cada animal.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do animal | `id_ani` | Identificador único do animal. |
| Código de registo | `reg_id_ani` | Código de registo interno ou externo da clínica. |
| Nome do animal | `nam_ani` | Nome pelo qual o animal é identificado. |
| Data de nascimento | `dat_bir_ani` | Data de nascimento quando conhecida. |
| Sexo | `gen_ani` | Sexo biológico (`M` / `F`). |
| Origem | `ori_ani` | Origem ou contexto de entrada do animal. |
| Estado operacional | `sta_ani` | Estado do animal (ex.: interno, adotado, transferido). |
| Espécie | `id_spc` | Espécie do animal (FK). |
| Raça | `id_bre` | Raça opcional (FK). |

---

## 4. external_entity (entidade externa)

Parceiros externos (abrigo, fornecedor, etc.) envolvidos em entradas ou transferências.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da entidade | `id_ext_ent` | Identificador único da entidade externa. |
| Nome da organização | `nam_ext_ent` | Nome da organização parceira. |
| Localização | `loc_ext_ent` | Descrição da localização ou morada. |
| Telefone de contacto | `pho_ext_ent` | Telefone em formato internacional. |
| Email de contacto | `ema_ext_ent` | Endereço de email de contacto. |
| Tipo de entidade | `typ_ext_ent` | Classificação da entidade (abrigo, fornecedor, etc.). |

---

## 5. ownership (tutela / posse)

Intervalos de relação cliente–animal com possível validação por colaborador.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da tutela | `id_own` | Identificador único do intervalo de tutela. |
| Cliente | `id_cli` | Cliente titular do animal (FK M1). |
| Animal | `id_ani` | Animal sujeito à tutela (FK). |
| Data de início | `sta_dat_own` | Data de início da tutela. |
| Data de fim | `end_dat_own` | Data de encerramento da tutela, se aplicável. |
| Motivo | `mot_own` | Motivo narrativo da alteração de tutela. |
| Colaborador responsável | `id_emp` | Colaborador que validou a alteração (FK M1, opcional). |

---

## 6. concession (concessão / transferência)

Transferência de um animal para uma entidade externa com contexto clínico.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da concessão | `id_con` | Identificador único da concessão. |
| Data da transferência | `dat_con` | Data em que a transferência ocorreu. |
| Motivo | `mot_con` | Motivo da concessão ou transferência. |
| Estado clínico | `cli_sta_con` | Registo do estado clínico no momento da transferência. |
| Entidade externa | `id_ext_ent` | Destino da transferência (FK). |
| Colaborador autorizador | `id_emp` | Colaborador que autorizou a operação (FK M1). |
| Animal | `id_ani` | Animal transferido (FK). |

---

## 7. delivery (entrega / resgate)

Metadados do fluxo de resgate ou entrega de um animal.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da entrega | `id_del` | Identificador único do registo de entrega. |
| Data de registo | `reg_dat_del` | Data e hora de criação do registo. |
| Data do resgate | `res_dat_del` | Data e hora do evento de resgate. |
| Data de entrega | `del_dat_del` | Data e hora da entrega ou handover. |
| Local do resgate | `res_loc_del` | Descrição do local do resgate. |
| Estado clínico na entrada | `cli_sta_del` | Estado clínico no momento da entrada. |
| Entidade de origem | `id_ext_ent` | Parceiro de origem opcional (FK). |
| Animal | `id_ani` | Animal associado à entrega (FK). |

---

## 8. delivery_employee

Colaboradores que participaram numa operação de entrega.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Entrega | `id_del` | Referência ao registo de entrega (PK composta). |
| Colaborador | `id_emp` | Colaborador participante (FK M1, PK composta). |

---

## Relacionado

- [Módulo 1 — Atributos](01_Module1.md) · [Módulo 3](03_Module3.md) · [Índice](README.md)

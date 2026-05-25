# Módulo 4 — Gestão de consultas

!!! info "Fonte de verdade"
    `01_MiaCaoMigo_DataLayer` — `Comments/Schema/04_Module4/00_Tables_Mod4_Comments.sql`  
    DDL: `Schema/04_Module4_Appointment_Management/00_Tables_Mod4.sql`

**7 entidades** · consulta, avaliação global, anamnese, prescrição, produtos, notificações.

---

## 1. appointment (consulta)

Agendamento e sessão clínica de um animal com veterinário e especialidade.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da consulta | `id_app` | Identificador único da consulta. |
| Animal | `id_ani` | Animal em atendimento (FK M2). |
| Colaborador (veterinário) | `id_emp` | Veterinário ou colaborador atribuído (FK M1). |
| Cliente | `id_cli` | Cliente responsável pela visita (FK M1). |
| Especialidade da consulta | `id_spe` | Natureza clínica da consulta (FK M1); deve existir em `expert` para o veterinário. |
| Fatura | `id_inv` | Identificador de fatura M3 (opcional; pode ser gerada após a consulta — FK em `01_ForeignKeys_Mod4`). |
| Data e hora agendadas | `sch_dat_app` | Data e hora planeadas da consulta. |
| Data e hora de início real | `sta_dat_app` | Início efectivo da consulta. |
| Data e hora de fim real | `end_dat_app` | Fim efectivo da consulta. |
| Estado da consulta | `status_app` | Estado do fluxo (`appointment_status` ENUM). |
| Diagnóstico | `dia_app` | Diagnóstico registado no encerramento. |
| Observações | `com_app` | Notas clínicas ou operacionais livres. |

---

## 2. overall_assessment (avaliação global)

Sinais vitais estruturados durante a consulta (relação 1:1 com `appointment`).

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Consulta | `id_app` | Chave primária e FK para a consulta. |
| Temperatura corporal | `bod_tmp_ova` | Temperatura em graus Celsius. |
| Peso | `wei_ova` | Peso em quilogramas. |
| Frequência cardíaca | `hrt_rat_ova` | Batimentos por minuto. |
| Frequência respiratória | `res_rat_ova` | Respirações por minuto. |
| Estado geral | `gen_sta_ova` | Avaliação qualitativa narrativa do estado do animal. |

---

## 3. anamnesis (anamnese)

História clínica relatada pelo tutor, associada à consulta (1:1).

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Consulta | `id_app` | Consulta associada (PK). |
| Data de registo | `reg_dat_ana` | Data e hora de captura da anamnese. |
| Descrição | `des_ana` | Narrativa detalhada da história e sintomas. |

---

## 4. prescription (prescrição)

Metadados de prescrição emitida na consulta (uma prescrição por consulta).

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da prescrição | `id_pre` | Identificador único da prescrição. |
| Consulta | `id_app` | Consulta de origem (FK; única por consulta). |
| Data de emissão | `reg_dat_pre` | Data e hora de emissão. |
| Instruções | `des_pre` | Instruções ou descrição farmacêutica. |

---

## 5. rel_app_product (produtos na consulta)

Produtos consumidos ou faturados directamente na consulta.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Consulta | `id_app` | Referência à consulta (PK composta). |
| Produto | `id_pro` | Produto do catálogo M3 (PK composta). |
| Quantidade | `qty_pre_pro` | Quantidade utilizada na consulta. |
| Dosagem | `dos_pre_pro` | Instruções de dosagem ou administração. |

---

## 6. rel_pre_prod (linhas da prescrição)

Artigos do catálogo que materializam uma prescrição.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Prescrição | `id_pre` | Referência à prescrição (PK composta). |
| Produto | `id_pro` | Produto prescrito (PK composta). |
| Quantidade prescrita | `qty_pre_pro` | Quantidade prescrita. |
| Dosagem | `dos_pre_pro` | Instruções de dosagem. |

---

## 7. appointment_notification (notificação)

Notificações ao cliente (lembretes, etc.) geradas por jobs ou procedimentos.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da notificação | `id_not` | Identificador único da notificação. |
| Cliente | `id_cli` | Cliente destinatário (FK M1). |
| Consulta | `id_app` | Consulta associada (FK; presente no DDL). |
| Mensagem | `msg_not` | Corpo legível da notificação. |
| Data de criação | `cre_tim_not` | Data e hora de criação. |
| Lida | `rea_not` | Indica se o cliente já leu a notificação. |

---

## Relacionado

- [Módulo 3](03_Module3.md) · [Índice](README.md)

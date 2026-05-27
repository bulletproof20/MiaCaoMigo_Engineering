# Matriz de implementação — Sistema de Gestão Veterinária

Rastreabilidade técnica entre requisitos (`RF`, `RN`, `RNF`, `PN`) e camadas de implementação. **Não duplica** o texto dos requisitos — ver [00_Functional_Requirements.md](00_Functional_Requirements.md).

**Repositório executável:** `01_MiaCaoMigo_DataLayer`  
**Evidência:** paths relativos a `DataBase/` salvo indicação `—` (API/UI).

---

# Índice

- [Legenda](#legenda)
- [Módulo 1](#módulo-1--gestão-de-utilizadores)
- [Módulo 2](#módulo-2--gestão-de-animais)
- [Módulo 3](#módulo-3--gestão-comercial)
- [Módulo 4](#módulo-4--gestão-de-consultas)
- [Transversal](#transversal-rnf--infra)
- [Convenções](#convenções)

---

# Legenda

| Coluna | Significado |
|--------|-------------|
| **ID** | `RF_Mx_yy`, `RN_Mx_yy`, `RNF_Mx_yy` ou `PN_Mx_yy` |
| **Tipo** | RF · RN · RNF · PN |
| **Camada** | UI · API · DB · INFRA · OPS · INT |
| **Implementação** | Componente lógico (sem inventar paths de aplicação inexistentes) |
| **Estado** | IMP · PAR · NAO · INC · TEST · REV |
| **Evidência** | Ficheiro ou área verificável |

### Estados

| Código | Significado |
|--------|-------------|
| **IMP** | Implementado na DataLayer (e/ou infra documentada) |
| **PAR** | Parcial — lacuna funcional ou só `sp_*` sem `svc_*` |
| **NAO** | Não implementado na BD/API documentada |
| **INC** | Incompatível com schema actual sem migração |
| **TEST** | Coberto por QA `01_Integrity` |
| **REV** | Em revisão / depende de repositório Application |

---

# Módulo 1 — Gestão de Utilizadores

| ID | Tipo | Camada | Implementação | Estado | Evidência |
|----|------|--------|---------------|--------|-----------|
| RF_M1_01 | RF | DB | `sp_create_client` / `svc_create_client` | IMP | Services/01_Module1/02_User_Creation/ |
| RF_M1_02 | RF | DB | `sp_create_employee` + `ck_ema_emp_format` | IMP | Schema/01_Module1/00_Tables_Mod1.sql |
| RF_M1_03 | RF | DB | `uq_client_user`, `uq_employee_active_per_user` | IMP | Schema/01_Module1/04_Indexes_Mod1.sql |
| RF_M1_04 | RF | DB | `ina_dat_cli`, `dea_dat_emp`, `sp_renew_employee_record` | PAR | Services/01_Module1/03_Role_Change/ |
| RF_M1_05 | RF | DB+API | `sp_auth_login`, `svc_auth_login` | IMP | Services/01_Module1/01_Authentication/ |
| RF_M1_06 | RF | DB | `uq_login_single_active_session_email` | IMP | Schema/01_Module1/04_Indexes_Mod1.sql |
| RF_M1_07 | RF | DB | `login_record` | IMP | Schema/01_Module1/00_Tables_Mod1.sql |
| RF_M1_08 | RF | DB | `login_record` (login/logout timestamps) | IMP | Idem |
| RF_M1_09 | RF | API | Actualização `user_account` | PAR | Sem `svc_*` dedicado |
| RF_M1_10 | RF | DB | Um `id_usr` → client + employee | IMP | Modelo M1 |
| RF_M1_11 | RF | DB | Sem histórico PII | IMP | Por desenho |
| RF_M1_12 | RF | API | Alteração password | NAO | Sem `sp_change_password` |
| RF_M1_13 | RF | API+DB | `fn_validate_password` + colunas hash | PAR | Services/README.md |
| RF_M1_14 | RF | DB | Histórico passwords | INC | Sem tabela |
| RF_M1_15 | RF | DB | `profile` (seed/admin) | PAR | Sem CRUD `svc_*` |
| RF_M1_16 | RF | DB | `occupies` | IMP | Schema M1 |
| RF_M1_17 | RF | DB | `have` | IMP | Schema M1 |
| RF_M1_18 | RF | DB | Histórico temporal `occupies` | INC | Sem vigência |
| RF_M1_19 | RF | DB | Responsável em `occupies` | INC | Sem coluna |
| RF_M1_20 | RF | DB | `sp_promote_*`, `assistant`/`veterinarian` | IMP | Services/01_Module1/03_Role_Change/ |
| RF_M1_21 | RF | DB | Triggers disjunção vet/assistant | IMP | Schema/01_Module1/03_Triggers_Mod1.sql |
| RF_M1_22 | RF | DB | `sp_renew_employee_record` | PAR | Cadeia `employee` |
| RF_M1_23 | RF | DB | `aut_reg_emp`, `aut_ina_emp` | PAR | Tabela `employee` |
| RF_M1_24 | RF | DB | `assistant.fun_ass` | IMP | Schema M1 |
| RF_M1_25 | RF | DB | `num_omv_vet`, `expert` | IMP | Schema M1 |
| RF_M1_26 | RF | DB | `schedule` | IMP | Schema M1 |
| RF_M1_27 | RF | DB | `ex_schedule_overlap` (GiST) | TEST | QA/01_Integrity/01_Module1/06_Schedule_Exclusion.sql |
| RF_M1_28 | RF | DB | `svc_replicate_schedule` | PAR | Services/01_Module1/99_Public_API/ |
| RF_M1_29 | RF | DB | Tabela `absence` | PAR | Sem `sp_submit` público |
| RF_M1_30 | RF | DB | `absence_status` enum | PAR | Léxico vs PDF |
| RF_M1_31 | RF | DB/API | Regra 72h cancelamento | NAO | — |
| RF_M1_32 | RF | DB | Histórico transições ausência | INC | Só `sta_abs` |
| RF_M1_33 | RF | DB | `sp_clock_toggle`, `svc_clock_toggle` | IMP | Services/01_Module1/ |
| RF_M1_34 | RF | DB | Idem clock-out | IMP | Idem |
| RF_M1_35 | RF | DB | `ck_clock_in_dates`, triggers | IMP | Schema M1 |
| RF_M1_36 | RF | DB | Sem DELETE exposto | PAR | — |
| RF_M1_37 | RF | DB | Triggers disponibilidade / M4 block | PAR | Schema M1/M4 |
| RF_M1_38 | RF | DB+API | Triggers + excepções permissão | PAR | API para excepções |
| RF_M1_39 | RF | DB | `setup` | IMP | Schema M1 |
| RF_M1_40 | RF | DB | `setup` por `id_usr` | IMP | Idem |
| RF_M1_41 | RF | DB | `setup` sem histórico | IMP | Idem |
| RF_M1_42 | RF | API | RGPD erase/export | NAO | — |
| RF_M1_43 | RF | DB+API | Inactivação + FK | PAR | RF_M1_42 NAO |
| PN_M1_01 | PN | INT | Contas utilizador | IMP | Agrega RF_M1_01–04 |
| PN_M1_02 | PN | INT | Autenticação | IMP | Agrega RF_M1_05–08 |
| PN_M1_07 | PN | INT | Disponibilidade HR | PAR | RF_M1_29–38 |
| RN_M1_36 | RN | API | Saldo férias / ausências | NAO | Sem RF dedicado |
| RN_M1_37 | RN | API | Idem | NAO | — |
| RNF_M1_02 | RNF | API+DB | Hash passwords | PAR | SEC-T03 |
| RNF_M1_03 | RNF | INFRA | HTTPS | REV | OPS / hosting |

---

# Módulo 2 — Gestão de Animais

| ID | Tipo | Camada | Implementação | Estado | Evidência |
|----|------|--------|---------------|--------|-----------|
| RF_M2_01 | RF | DB | `sp_register_animal` | PAR | Schema/02_Module2/05_Procedures_Mod2.sql (sem `svc_*`) |
| RF_M2_02 | RF | DB | `species`, `breed`, triggers | IMP | Schema/02_Module2/ |
| RF_M2_03 | RF | DB | `sp_record_delivery` | IMP | Procedures Mod2 |
| RF_M2_04 | RF | DB | `delivery.cli_sta_del` | PAR | Campo texto |
| RF_M2_05 | RF | DB | Auto-criar cliente na entrega | NAO | `sp_record_delivery` |
| RF_M2_06 | RF | DB | `external_entity` | PAR | Sem workflow `svc_*` |
| RF_M2_07 | RF | DB | `sta_ani` | IMP | Tabela `animal` |
| RF_M2_08 | RF | DB | Histórico estados | INC | Sem tabela histórico |
| RF_M2_09 | RF | DB | Consulta histórico estados | INC | Idem |
| RF_M2_10 | RF | DB | `sp_assign_ownership`, `svc_register_adoption` | IMP | Services/02_Module2/99_Public_API/ |
| RF_M2_11 | RF | DB | `ownership` datas | IMP | Schema M2 |
| RF_M2_12 | RF | DB | `p_id_emp` em procedures | IMP | Procedures |
| RF_M2_13 | RF | DB | `sp_process_concession` | IMP | Procedures Mod2 |
| RF_M2_14 | RF | DB | `concession.cli_sta_con` | PAR | Texto |
| RF_M2_15 | RF | DB | `p_id_emp` cedência | PAR | — |
| RF_M2_16 | RF | DB | `svc_get_animal_history` (parcial) | PAR | Services/02_Module2/ |
| RF_M2_17 | RF | DB | `delivery`, `ownership`, `concession` | PAR | Sem vista unificada |
| RF_M2_18 | RF | DB | `delivery` + `id_ext_ent` | PAR | Joins |
| RF_M2_19 | RF | DB | `ina_dat_ani` | PAR | — |
| PN_M2_02 | PN | INT | Entrada animal | IMP | RF_M2_03–05 |
| PN_M2_08 | PN | INT | Histórico consolidado | PAR | RF_M2_17 |
| RN_M2_09 | RN | DB | Novo registo por estado | INC | RF_M2_08 |

---

# Módulo 3 — Gestão Comercial

| ID | Tipo | Camada | Implementação | Estado | Evidência |
|----|------|--------|---------------|--------|-----------|
| RF_M3_01 | RF | DB | `product`, `ina_dat_pro` | PAR | Sem `svc_*` CRUD |
| RF_M3_02 | RF | DB | `family` FK | IMP | Schema/03_Module3/ |
| RF_M3_03 | RF | DB | `pri_pro`, `iva_pro` | IMP | Idem |
| RF_M3_04 | RF | DB | `trg_prevent_inactive_product_sale` | IMP | Schema/03_Module3/03_Triggers_Mod3.sql |
| RF_M3_05 | RF | DB | `purchase`, `sp_receive_purchase` | IMP | Procedures + `svc_receive_purchase` |
| RF_M3_06 | RF | DB | Soft ref fornecedor | PAR | M3 |
| RF_M3_07 | RF | DB | `purchase_line` | IMP | Schema M3 |
| RF_M3_08 | RF | DB | `pay_met_pur` | PAR | Só compras |
| RF_M3_09 | RF | DB | `stock` após receive | IMP | `sp_receive_purchase` |
| RF_M3_10 | RF | DB | Colunas lote/validade `stock` | IMP | Schema M3 |
| RF_M3_11 | RF | DB | Triggers stock | IMP | 03_Triggers_Mod3.sql |
| RF_M3_12 | RF | DB | `fn_get_available_stock`, views | IMP | Functions + `svc_get_product_stock_level` |
| RF_M3_13 | RF | DB | `invoice_line` + triggers | PAR | Sem `sp_sale` |
| RF_M3_14 | RF | DB | `trg_check_stock_before_sale` | TEST | QA M3 |
| RF_M3_15 | RF | DB | `invoice.id_app`, M4 links | PAR | M3+M4 |
| RF_M3_16 | RF | DB | FIFO `tfn_deduct_product_stock` | PAR | Triggers |
| RF_M3_17 | RF | DB | `invoice` + linhas | PAR | DemoData INSERT |
| RF_M3_18 | RF | DB | `uq_invoice_appointment` | IMP | Schema/04 + trigger sync |
| RF_M3_19 | RF | DB | `invoice_line` | IMP | Schema M3 |
| RF_M3_20 | RF | DB | `tfn_update_invoice_total` | IMP | Triggers M3 |
| RF_M3_21 | RF | DB | Entidade pagamento | INC | Sem tabela `payment` |
| RF_M3_22 | RF | API | Método pagamento venda | PAR | — |
| RF_M3_23 | RF | DB | `sta_inv` enum | PAR | Sem `partial` |
| RF_M3_24 | RF | DB | `return` + triggers | PAR | Sem `sp_return` |
| RF_M3_25 | RF | DB | `mot_ret`, trigger data | IMP | Schema M3 |
| RF_M3_26 | RF | DB | `trg_return_restock` | IMP | Triggers M3 |
| RF_M3_27 | RF | DB | Tabelas histórico | PAR | Dados existem |
| RF_M3_28 | RF | API | Filtros relatório | PAR | — |
| RF_M3_29 | RF | API | Relatórios BI | NAO | — |
| RF_M3_30 | RF | DB | `vw_products_to_reorder`, `sp_check_restock_needs` | PAR | Views/procedure |
| PN_M3_05 | PN | INT | Faturação | PAR | RF_M3_17 |
| PN_M3_09 | PN | INT | Análise comercial | PAR | RF_M3_29–30 |
| RN_M3_22 | RN | DB | Sequência legal faturas | NAO | Sem sequenciador |

---

# Módulo 4 — Gestão de Consultas

| ID | Tipo | Camada | Implementação | Estado | Evidência |
|----|------|--------|---------------|--------|-----------|
| RF_M4_01 | RF | DB | `sp_create_appointment` | PAR | Sem `svc_*` write |
| RF_M4_02 | RF | DB | `ck_appointment_flow` | IMP | Schema/04_Module4/ |
| RF_M4_03 | RF | DB | `anamnesis` | IMP | Schema M4 |
| RF_M4_04 | RF | DB | `overall_assessment` | IMP | Schema M4 |
| RF_M4_05 | RF | DB | `sp_start_appointment` | PAR | Schema procedures |
| RF_M4_06 | RF | DB | `appointment.dia_app` | PAR | `sp_end_appointment` |
| RF_M4_07 | RF | DB | Obrigatoriedade diagnóstico | NAO | `sp_end_appointment` |
| RF_M4_08 | RF | DB | `sp_prescription_for_appointment` | PAR | Procedures M4 |
| RF_M4_09 | RF | DB | `rel_app_product`, `rel_pre_prod` | IMP | Schema M4 |
| RF_M4_10 | RF | DB | Stock triggers M4 | IMP | Triggers M4 |
| RF_M4_11 | RF | DB | `appointment_status`, `sp_*` | IMP | Types + procedures |
| RF_M4_12 | RF | DB | Default `scheduled` | IMP | `sp_create_appointment` |
| RF_M4_13 | RF | DB | Checks + `tfn_prevent_completed_*` | IMP | Triggers M4 |
| RF_M4_14 | RF | DB | `sp_cancel_appointment` | PAR | Procedures |
| RF_M4_15 | RF | DB | `jpr_auto_update_no_show_appointments` | IMP | Schema/04_Module4/06_Jobs_Mod4.sql |
| RF_M4_16 | RF | DB | `svc_list_animal_appointment_history` | PAR | 99_Public_API read-only |
| RF_M4_17 | RF | DB | Fatura automática no end | NAO | `sp_end_appointment` |
| PN_M4_08 | PN | INT | Integração faturação | PAR | RF_M4_17 + M3 |
| RN_M4_01 | RN | API+DB | Desconto 5.ª consulta | NAO | — |
| RN_M4_02 | RN | API+DB | Desconto 10.ª consulta | NAO | — |
| RN_M4_04 | RN | DB | Diagnóstico obrigatório | NAO | RF_M4_07 |
| RNF_M4_01 | RNF | DB+API | Histórico clínico performance | PAR | Views + `svc_*` read |

---

# Transversal (RNF / INFRA)

| ID | Tipo | Camada | Implementação | Estado | Evidência |
|----|------|--------|---------------|--------|-----------|
| RNF_M1_03 | RNF | INFRA | HTTPS / reverse proxy | REV | [07_Constraints.md](07_Constraints.md) CST_08 |
| RNF_M2_06 | RNF | INFRA | Encriptação repouso | REV | CST + hosting |
| RNF_M3_06 | RNF | DB | Transações ACID | IMP | PostgreSQL |
| RNF_M3_20 | RNF | OPS | RTO ≤ 1h | REV | Política operação |
| SEC-T01 | RNF | INFRA | HTTPS (todos módulos) | REV | 01_Non_Functional_Requirements.md |
| SEC-T03 | RNF | API | Hash passwords | PAR | Services README |

---

# Convenções

## Identificadores

Usar sempre `RF_Mx_yy`, `RN_Mx_yy`, `RNF_Mx_yy`, `PN_Mx_yy` — nunca abreviaturas `PN_01`.

## Sincronização

| Documento | Uso |
|-----------|-----|
| [04_Acceptance_Criteria.md](04_Acceptance_Criteria.md) | Validação funcional (`AC_RF_*`) |
| [07_Constraints.md](07_Constraints.md) | Restrições globais (`CST_*`) |
| [00_Functional_Requirements.md](00_Functional_Requirements.md) | Texto normativo RF |

## Palavras-chave

`matriz`, `implementação`, `IMP`, `PAR`, `DataLayer`, `svc_`, `sp_`, `evidência`.

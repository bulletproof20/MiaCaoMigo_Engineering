# Sprint 4 — Modulo 4: Consultas / Appointments

Analise de rastreabilidade entre a especificacao da Sprint 4 e a implementacao real do Modulo 4, focada em **Gestao Clinica / Consultas**.

Fonte funcional analisada: `Sprint 04.pdf`.

Repositorios verificados:

- Aplicacao/API: `MiaCaoMigo_`
- Base de dados/QA: `MiaCaoMigo_DataLayer`

Legenda:

- **Implementado**: existe fluxo funcional e/ou regra executavel no frontend, API ou base de dados.
- **Parcial**: existe parte relevante, mas falta um detalhe pedido no PDF.
- **Nao evidenciado**: nao foi encontrada implementacao real suficiente.

## Sumario Executivo

O Modulo 4 esta implementado para o ciclo principal de consultas: marcacao, listagem, disponibilidade por veterinario, validacao de animal/cliente/veterinario/especialidade, cancelamento, reagendamento, inicio, sala de espera, conclusao, registo clinico, historico, prescricoes simples, PDF de prescricao, produtos usados em consulta e notificacoes.

As principais lacunas face ao PDF sao:

- **RF_M4_07 / RN_M4_07**: a conclusao da consulta nao exige diagnostico obrigatorio. O backend aceita `dia_app` nulo ao fechar a consulta.
- **RF_M4_08 / RN_M4_09**: a prescricao existe, mas nao tem campo de validade nem regra de validade maxima de 30 dias.
- **RF_M4_15**: existe estado `no_show` e job automatico, mas nao ha acao manual de staff para marcar uma consulta como nao realizada no fluxo web.
- **RF_M4_17 / RN_M4_16 / RN_M4_17**: existe ligacao tecnica consulta-fatura, mas nao foi encontrada geracao automatica de fatura ao concluir consulta.

## Prova Geral de Implementacao

### Aplicacao e API

| Area | Evidencia |
|------|-----------|
| Rotas de consultas | `Backend/routes/Mod4_Appointments/appointmentRoutes.js` monta endpoints em `/api/appointments` para criar, listar, disponibilidade, notificacoes, cancelamento, reagendamento, check-in, inicio e fecho |
| Rotas de prescricoes/registo clinico | `Backend/routes/Mod4_Appointments/prescricoesRoutes.js` monta `/api/appointments/prescriptions/*` |
| Controladores de consultas | `Backend/controllers/Mod4_Appointments/appointmentController.js` implementa `createAppointment`, `fetchMyAppointments`, `fetchAllAppointments`, `cancelMyAppointment`, `rescheduleMyAppointment`, `beginAppointment`, `endAppointment` |
| Modelo de consultas | `Backend/Models/Mod4_Appointments/appointmentModel.js` implementa `registerAppointment`, `listVetAvailability`, `assertVetSlotAvailable`, `assertCanStartAppointment`, `startAppointment`, `closeAppointment` |
| Registo clinico | `Backend/Models/Mod4_Appointments/clinicalRecordModel.js` implementa anamnese, avaliacao global, notificacoes e sala de espera |
| Prescricoes e historico | `Backend/Models/Mod4_Appointments/prescriptionsModel.js` implementa workspace de consulta, historico clinico, prescricao, produtos usados e PDF |
| Interface cliente | `FrontEnd/Js/Mod4/clientConsultas.js` permite marcar, listar, cancelar, reagendar, consultar dados clinicos e descarregar prescricoes |
| Interface staff | `FrontEnd/Js/Mod4/staffConsultas.js` permite marcar em nome de cliente, listar, reagendar, cancelar, check-in e iniciar consulta |
| Interface veterinario | `FrontEnd/Js/Mod4/registoConsulta.js` permite registo clinico, prescricao, produtos usados e fecho de consulta |
| Paginas | `FrontEnd/Pages/Mod4_Appointments/AdicionarConsulta.html`, `FrontEnd/Pages/Mod4_Appointments/RegistoConsulta.html`, `FrontEnd/Pages/Mod4_Appointments/consultas.html` |

### DataLayer

| Area | Evidencia |
|------|-----------|
| Tabelas Mod4 | `DataBase/Schema/04_Module4_Appointment_Management/00_Tables_Mod4.sql` cria `appointment`, `overall_assessment`, `anamnesis`, `prescription`, `rel_app_product`, `rel_pre_prod`, `appointment_notification` |
| Integridade referencial | `DataBase/Schema/04_Module4_Appointment_Management/01_ForeignKeys_Mod4.sql` liga consultas a animal, empregado/veterinario, cliente, especialidade e fatura |
| Funcoes de validacao | `DataBase/Schema/04_Module4_Appointment_Management/02_Functions_Mod4.sql` valida ausencia, data passada, especialidade, posse do animal, stock, terminalidade e sincronizacao com fatura |
| Triggers | `DataBase/Schema/04_Module4_Appointment_Management/03_Triggers_Mod4.sql` aplica validacoes em `appointment`, `prescription`, `rel_app_product` |
| Indices e concorrencia | `DataBase/Schema/04_Module4_Appointment_Management/04_Indexes_Mod4.sql` define `ex_appointment_vet_overlap` para impedir dupla marcacao do mesmo veterinario no mesmo slot |
| Procedures | `DataBase/Schema/04_Module4_Appointment_Management/05_Procedures_Mod4.sql` define `sp_create_appointment`, `sp_cancel_appointment`, `sp_reschedule_appointment`, `sp_start_appointment`, `sp_end_appointment`, jobs auxiliares |
| Jobs | `DataBase/Schema/04_Module4_Appointment_Management/06_Jobs_Mod4.sql` agenda lembretes diarios e atualizacao automatica de `no_show` |
| Views | `DataBase/Schema/04_Module4_Appointment_Management/07_Views_Mod4.sql` cria `vw_appointment_detail`, `vw_appointments_today`, `vw_scheduled_appointments_tomorrow` |
| QA integridade | `DataBase/QA/01_Integrity/04_Module4/*` cobre marcacao, sobreposicao, ausencia, ciclo de vida, prescricoes e notificacoes |
| QA stress | `DataBase/QA/04_Stress/04_Module4/*` cobre concorrencia de marcacoes e carga no ciclo de vida |
| QA defesa | `DataBase/QA/05_Manual/04_Module4/Appointment_Management/01_Defense_Reference.sql` consolida cenarios demonstraveis |

## Processos de Negocio

| ID | Processo do PDF | Estado | Prova / Observacao |
|----|-----------------|--------|--------------------|
| PN_M4_01 | Gestao de Consultas Veterinarias: agendamento, execucao clinica, diagnostico e estados | **Implementado** | API em `appointmentRoutes.js`; modelo `appointmentModel.js`; DB `appointment`; procedures `sp_create_appointment`, `sp_start_appointment`, `sp_end_appointment`; UI cliente/staff/veterinario |
| PN_M4_02 | Gestao de Prescricao Clinica | **Parcial** | Existe `prescription`, `createPrescription`, `issuePrescription`, listagem e PDF; falta validade formal da prescricao e UI/API para itens `rel_pre_prod` |
| PN_M4_03 | Gestao de Historico Clinico | **Implementado** | `getAnimalClinicalHistory`, `getClientClinicalRecord`, `fetchMyAppointmentClinicalRecord`; historico visivel no workspace da consulta e no cliente |
| PN_M4_04 | Integracao Clinica e Faturacao | **Parcial** | Existe `appointment.id_inv`, FK para `invoice`, `uq_appointment_invoice` e `trg_sync_invoice_appointment_link`; nao foi encontrada criacao automatica de fatura ao concluir consulta |

## Requisitos Funcionais

| ID | Requisito do PDF | Estado | Prova / Observacao |
|----|------------------|--------|--------------------|
| RF_M4_01 | Registar consultas com animal, veterinario, especialidade, data, hora de inicio e fim | **Implementado** | `registerAppointment` insere `id_cli`, `id_ani`, `id_emp`, `id_spe`, `sch_dat_app`, `status_app='scheduled'`; `startAppointment` preenche `sta_dat_app`; `closeAppointment` preenche `end_dat_app` |
| RF_M4_02 | Garantir hora de inicio anterior a hora de fim | **Implementado** | Constraint `ck_appointment_flow` em `appointment`; QA `04_Appointment_Lifecycle.sql`; `sp_end_appointment`/`closeAppointment` gerem fim apos inicio |
| RF_M4_03 | Registar anamnese associada a consulta | **Implementado** | Tabela `anamnesis`; `saveClinicalRecord`; UI `registoConsulta.js` campo `des_ana`; cliente ve em `clientConsultas.js` |
| RF_M4_04 | Registar avaliacao geral: temperatura, peso, frequencias | **Implementado** | Tabela `overall_assessment`; `saveClinicalRecord`; UI `registoConsulta.js` campos `bod_tmp_ova`, `wei_ova`, `hrt_rat_ova`, `res_rat_ova`, `gen_sta_ova`; checks de valores positivos/intervalos |
| RF_M4_05 | Iniciar consulta e alterar estado para em curso | **Implementado** | Endpoint `PATCH /api/appointments/:id_app/start`; `beginAppointment`; `startAppointment`; procedure `sp_start_appointment` |
| RF_M4_06 | Registar diagnostico final e observacoes clinicas | **Implementado** | Campos `dia_app` e `com_app` em `appointment`; `saveClinicalRecord`; `endAppointment`; UI `RegistoConsulta.html` e `registoConsulta.js` |
| RF_M4_07 | Impedir conclusao sem diagnostico | **Nao evidenciado** | `endAppointment` envia `dia_app || null`; `closeAppointment` usa `COALESCE($1, dia_app)` e permite concluir sem diagnostico; nao ha constraint/trigger obrigando `dia_app` |
| RF_M4_08 | Criar prescricoes associadas a consulta com data, validade e observacoes | **Parcial** | `prescription` guarda `reg_dat_pre` e `des_pre`; `issuePrescription` cria prescricao; falta campo/regra de validade |
| RF_M4_09 | Associar produtos/medicamentos a consulta ou prescricao | **Parcial** | Produtos usados na consulta: `rel_app_product`, `recordUsedProduct`, UI `form-used-product`; produtos de prescricao: existe `rel_pre_prod` e leitura para PDF, mas nao foi encontrada UI/API para inserir itens de prescricao |
| RF_M4_10 | Usar apenas produtos com stock disponivel | **Implementado para produtos de consulta; parcial no ambito total** | `listAvailableProducts` lista stock > 0; trigger `trg_deduct_product_stock` chama `tfn_deduct_product_stock`; falta fluxo executavel para produtos de prescricao |
| RF_M4_11 | Alterar estado da consulta no ciclo de vida | **Implementado** | Estados em `appointment_status`; endpoints cancel/reschedule/check-in/start/close; procedures `sp_cancel_appointment`, `sp_start_appointment`, `sp_end_appointment`; job `jpr_auto_update_no_show_appointments` |
| RF_M4_12 | Consultas inicialmente registadas como agendadas | **Implementado** | Default `status_app default 'scheduled'`; `registerAppointment` e `sp_create_appointment` inserem `scheduled` explicitamente |
| RF_M4_13 | Impedir transicoes que violem o ciclo de vida | **Implementado** | `assertCanStartAppointment`; `assertInProgress`; `tfn_prevent_completed_appointment_modification`; procedures aceitam apenas estados corretos; QA lifecycle |
| RF_M4_14 | Cancelar consultas agendadas | **Implementado** | Endpoint `PATCH /:id_app/cancel`; `cancelAppointment`; `sp_cancel_appointment`; UI cliente/staff; regra de antecedencia >24h |
| RF_M4_15 | Marcar consulta como nao realizada quando cliente nao comparece | **Parcial** | Estado `no_show` existe; procedure/job `jpr_auto_update_no_show_appointments` atualiza agendadas passadas; nao foi encontrada acao manual na UI/API para staff marcar no-show |
| RF_M4_16 | Consultar historico clinico do animal | **Implementado** | `getAnimalClinicalHistory` lista consultas concluidas, diagnosticos, anamnese e prescricoes; `getClientClinicalRecord` mostra dados ao cliente; UI `registoConsulta.js` e `clientConsultas.js` |
| RF_M4_17 | Gerar automaticamente fatura apos conclusao da consulta com servicos/produtos | **Nao evidenciado** | Existe ligacao `appointment.id_inv`/`invoice.id_app`, mas `closeAppointment`, `sp_end_appointment` e controllers nao criam fatura nem linhas automaticamente |

## Requisitos Nao Funcionais

| ID | Requisito do PDF | Estado | Prova / Observacao |
|----|------------------|--------|--------------------|
| RNF_M4_01 | Garantir integridade entre consultas, prescricoes e faturacao associada | **Parcial** | Integridade consulta-prescricao via FK e unique `uq_prescription_per_appointment`; integridade consulta-fatura via FK, unique `uq_appointment_invoice` e `trg_sync_invoice_appointment_link`; falta faturacao automatica completa |
| RNF_M4_02 | Impedir eliminacao direta de registos clinicos validados | **Parcial** | Nao ha endpoint de eliminacao na aplicacao; estados terminais sao protegidos contra update por `tfn_prevent_completed_appointment_modification`; porem FKs usam `on delete cascade`, portanto a BD nao bloqueia toda eliminacao direta |
| RNF_M4_03 | Permitir uso simultaneo por multiplos profissionais sem inconsistencias clinicas | **Parcial** | Marcacoes concorrentes protegidas por `ex_appointment_vet_overlap`, locks em cancel/reagendamento e QA stress; registos clinicos usam transacoes em `saveClinicalRecord`, mas nao ha mecanismo especifico de versionamento/lock otimista para edicoes simultaneas do mesmo registo |

## Regras de Negocio

| ID | Regra do PDF | Estado | Prova / Observacao |
|----|--------------|--------|--------------------|
| RN_M4_01 | Cada consulta deve estar associada a animal previamente registado | **Implementado** | `appointment.id_ani not null`; FK `fk_appointment_animal`; trigger tambem valida posse animal-cliente |
| RN_M4_02 | Cada consulta deve possuir exatamente um veterinario responsavel | **Implementado** | `appointment.id_emp not null`; FK `fk_appointment_employee`; `requireAssignedVet` garante veterinario atribuido nas acoes clinicas |
| RN_M4_03 | Cada consulta deve estar associada a especialidade valida | **Implementado** | `appointment.id_spe not null`; FK `fk_appointment_specialty`; UI carrega `/api/appointments/specialties` |
| RN_M4_04 | Deve existir especialidade "Geral" aplicavel a qualquer consulta | **Implementado** | MasterData Mod1 cria `specialty` com `nam_spe='geral'`; QA usa `qa_specialty_general_id()` |
| RN_M4_05 | Consulta em curso deve possuir data/hora de inicio | **Implementado** | `startAppointment` define `sta_dat_app=current_timestamp` e `status_app='in_progress'`; `sp_start_appointment` idem |
| RN_M4_06 | Consulta concluida deve possuir data/hora de fim | **Implementado** | `closeAppointment` e `sp_end_appointment` definem `end_dat_app=current_timestamp/now()` e `status_app='completed'` |
| RN_M4_07 | Consulta so conclui apos diagnostico | **Nao evidenciado** | Nao ha validacao obrigatoria de `dia_app`; fecho aceita null |
| RN_M4_08 | Consultas canceladas ou nao realizadas nao podem ter diagnostico | **Parcial** | Estados terminais bloqueiam updates posteriores, mas nao foi encontrada trigger que limpe/impessa `dia_app` em cancelamento/no_show caso ja exista antes |
| RN_M4_09 | Prescricoes tem validade maxima de 30 dias salvo indicacao contraria | **Nao evidenciado** | Tabela `prescription` nao tem validade; API nao recebe validade; trigger valida timing, nao validade |
| RN_M4_10 | Produtos associados a consultas respeitam stock disponivel | **Implementado** | `listAvailableProducts`; `trg_deduct_product_stock`; `tfn_deduct_product_stock`; controller rejeita quantidade <= 0 |
| RN_M4_11 | Produtos utilizados em consulta reduzem stock | **Implementado** | Trigger `trg_deduct_product_stock` executa `tfn_deduct_product_stock` antes de inserir em `rel_app_product` |
| RN_M4_12 | Cada consulta deve possuir estado valido do sistema | **Implementado** | Tipo enum `appointment_status` define `scheduled`, `in_progress`, `completed`, `cancelled`, `no_show`, `late`; coluna `status_app appointment_status not null` |
| RN_M4_13 | Consulta criada inicialmente como agendada | **Implementado** | Default `scheduled`; `registerAppointment` e `sp_create_appointment` |
| RN_M4_14 | Consulta concluida nao pode regressar a estados anteriores | **Implementado** | `tfn_prevent_completed_appointment_modification` bloqueia update quando estado anterior e `completed`, `cancelled` ou `no_show`; QA testa alteracao de concluida |
| RN_M4_15 | Consultas canceladas ou nao realizadas nao transitam para estados ativos | **Implementado** | Mesmo trigger `tfn_prevent_completed_appointment_modification`; `assertCanStartAppointment` trata estados terminais como nao ativos para a consulta anterior e nao inicia consultas nao `scheduled` |
| RN_M4_16 | Apenas consultas concluidas podem originar faturacao automatica | **Nao evidenciado** | Nao existe geracao automatica de fatura; logo a regra nao e executada |
| RN_M4_17 | Valor faturado corresponde a servicos/produtos usados | **Nao evidenciado** | Nao ha criacao automatica de fatura/linhas a partir de `rel_app_product`; Mod3 calcula totais de faturas existentes, mas nao a partir do fecho da consulta |
| RN_M4_18 | Registos clinicos de consultas concluidas nao podem ser eliminados | **Parcial** | Aplicacao nao expoe delete; trigger bloqueia updates em estados terminais; porem FKs com cascade nao impedem delete direto em BD |

## Modelacao / Dicionario de Dados do PDF

| Entidade do PDF | Estado | Prova / Observacao |
|-----------------|--------|--------------------|
| Consulta | **Implementado** | Tabela `appointment`, view `vw_appointment_detail`, API `/api/appointments` |
| Avaliacao Global | **Implementado** | Tabela `overall_assessment`; `saveClinicalRecord`; UI `registoConsulta.js` |
| Anamnese | **Implementado** | Tabela `anamnesis`; `saveClinicalRecord`; UI `registoConsulta.js` |
| Prescricao | **Parcial** | Tabela `prescription`; API/UI/PDF existem; falta validade e itens formais via UI/API |
| Produto aplicado na consulta | **Implementado** | Tabela `rel_app_product`; `recordUsedProduct`; trigger de stock |
| Item de prescricao | **Parcial** | Tabela `rel_pre_prod` e leitura `listPrescriptionProducts`; falta criacao pela aplicacao |
| Notificacao de consulta | **Implementado** | Tabela `appointment_notification`; jobs de lembrete; endpoints `/notifications/me`, `read`, `read-all`; sala de espera usa notificacao interna |

## Diagrama de Estados da Consulta

O PDF descreve estados `agendada`, `em curso`, `concluida`, `atrasada` e `cancelada`, com eventos de inicio, reagendamento, cancelamento e ausencia.

| Estado / Transicao | Estado | Prova / Observacao |
|--------------------|--------|--------------------|
| Agendada | **Implementado** | `scheduled` no enum e default da tabela |
| Em curso | **Implementado** | `in_progress`; endpoint `/start`; `sta_dat_app` preenchida |
| Concluida | **Implementado** | `completed`; endpoint `/close`; `end_dat_app` preenchida |
| Cancelada | **Implementado** | `cancelled`; endpoint `/cancel`; regra >24h |
| Atrasada | **Parcial** | Enum `late` existe e UI tem label; `fn_appointment_list_by_client` pode devolver `late`, mas o fluxo principal usa `vw_appointment_detail` com `status_app` persistido |
| Nao compareceu | **Parcial** | Enum `no_show` e job `jpr_auto_update_no_show_appointments`; falta botao/endpoint manual para staff marcar |
| Reagendamento | **Implementado** | Endpoint `/reschedule`; procedure `sp_reschedule_appointment`; slots por disponibilidade |
| Bloqueio de voltar de estados finais | **Implementado** | `tfn_prevent_completed_appointment_modification` |

## Evidencia de QA

| Tipo | Ficheiro | Cobertura |
|------|----------|-----------|
| Integridade | `DataBase/QA/01_Integrity/04_Module4/01_Appointment_Scheduling.sql` | criacao valida, data passada, especialidade invalida, animal de outro cliente |
| Integridade | `DataBase/QA/01_Integrity/04_Module4/02_Appointment_Overlap.sql` | bloqueio de sobreposicao para o mesmo veterinario |
| Integridade | `DataBase/QA/01_Integrity/04_Module4/03_Vet_Absence.sql` | bloqueio por ausencia do veterinario |
| Integridade | `DataBase/QA/01_Integrity/04_Module4/04_Appointment_Lifecycle.sql` | cancelamento, inicio, fim, protecao de concluida |
| Integridade | `DataBase/QA/01_Integrity/04_Module4/05_Prescription_Timing.sql` | prescricao antes/depois do inicio |
| Integridade | `DataBase/QA/01_Integrity/04_Module4/06_Notifications.sql` | persistencia de notificacoes |
| Stress | `DataBase/QA/04_Stress/04_Module4/01_Concurrent_Appointment_Booking.sql` | 50 tentativas concorrentes no mesmo slot; espera uma marcacao e bloqueios por overlap |
| Stress | `DataBase/QA/04_Stress/04_Module4/02_Appointment_Lifecycle_Load.sql` | 30 ciclos start/end |
| Defesa | `DataBase/QA/05_Manual/04_Module4/Appointment_Management/01_Defense_Reference.sql` | cenarios demonstraveis para defesa |

### Notas de Cobertura Tecnica

- A funcao `tfn_appointment_duration_check` existe em `DataBase/Schema/04_Module4_Appointment_Management/02_Functions_Mod4.sql`, mas nao foi encontrada trigger associada em `03_Triggers_Mod4.sql`.
- Nao foi encontrada QA automatizada especifica para deducao de stock em `rel_app_product` (embora exista trigger) nem para `sp_reschedule_appointment`.

## Conclusao por Area

| Area | Estado global | Justificacao |
|------|---------------|--------------|
| Marcacao de consultas | **Implementado** | Fluxo cliente/staff/API/BD completo com disponibilidade, posse, especialidade, ausencia, datas passadas e overlap |
| Ciclo de vida da consulta | **Implementado com lacunas menores** | Start/close/cancel/reschedule existem; falta exigencia de diagnostico e acao manual de no-show |
| Registo clinico | **Implementado** | Anamnese, avaliacao, diagnostico, comentarios e historico funcionais |
| Prescricao | **Parcial** | Prescricao textual e PDF existem; falta validade e gestao de itens/produtos prescritos pela UI/API |
| Produtos usados na consulta | **Implementado** | Produtos com stock disponivel podem ser registados e reduzem stock |
| Faturacao da consulta | **Parcial / nao automatizada** | Ligacao estrutural existe, mas nao ha geracao automatica de fatura apos conclusao |
| Notificacoes | **Implementado** | Lembretes, inbox do cliente, leitura e sala de espera existem |




<!-- - **RF_M4_09**: produtos aplicados na consulta existem; produtos/medicamentos como itens formais da prescricao existem na base de dados, mas nao ha UI/API para os adicionar. -->
# Módulo 1 — Utilizadores e controlo de acesso

!!! info "Fonte de verdade"
    `01_MiaCaoMigo_DataLayer` — `Comments/Schema/01_Module1/00_Tables_Mod1_Comments.sql`  
    DDL: `Schema/01_Module1_User_Management/00_Tables_Mod1.sql`

**16 entidades** · conta de utilizador, perfis, permissões, colaboradores, clientes, horários, assiduidade, auditoria de login.

---

## 1. user_account (conta de utilizador)

Dados pessoais, de contacto e identificação partilhados por todos os utilizadores.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do utilizador | `id_usr` | Identificador único da conta de utilizador. |
| Nome completo | `nam_usr` | Nome legal completo do utilizador. |
| Morada | `add_usr` | Morada residencial ou registada. |
| Código postal | `pos_usr` | Código postal no formato xxxx-xxx. |
| NIF | `nif_usr` | Número de identificação fiscal português. |
| Telefone pessoal | `pho_usr` | Telefone em formato internacional. |
| Email pessoal | `ema_usr` | Email pessoal normalizado (exclui domínios corporativos). |

---

## 2. profile (perfil operacional)

Perfis de acesso e papéis operacionais no sistema.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do perfil | `id_pro` | Identificador único do perfil (≠ `product.id_pro` do M3). |
| Nome do perfil | `nam_pro` | Nome normalizado do perfil. |
| Descrição do perfil | `des_pro` | Descrição das responsabilidades do perfil. |

---

## 3. permission (permissão)

Permissões granulares para controlo de funcionalidades.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da permissão | `id_per` | Identificador único da permissão. |
| Nome da permissão | `nam_per` | Nome normalizado da permissão. |
| Descrição | `des_per` | Finalidade da permissão no sistema. |

---

## 4. specialty (especialidade)

Especialidades veterinárias e operacionais.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da especialidade | `id_spe` | Identificador único da especialidade. |
| Nome da especialidade | `nam_spe` | Nome da especialidade. |
| Descrição | `des_spe` | Âmbito e responsabilidades da especialidade. |

---

## 5. employee (colaborador)

Autenticação operacional e ciclo de vida do colaborador.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do colaborador | `id_emp` | Identificador único do colaborador. |
| Conta de utilizador | `id_usr` | Referência à conta `user_account` (FK). |
| Data de registo | `reg_dat_emp` | Data e hora de registo do colaborador. |
| Registo autorizado por | `aut_reg_emp` | Colaborador que efectuou o registo (FK). |
| Data de desactivação | `dea_dat_emp` | Data e hora de desactivação. |
| Desactivação autorizada por | `aut_ina_emp` | Colaborador que autorizou a desactivação (FK). |
| Telefone profissional | `pho_emp` | Contacto profissional. |
| Telefone de emergência | `pho_emg` | Contacto de emergência. |
| Email corporativo | `ema_emp` | Email corporativo normalizado. |
| Palavra-passe | `pas_emp` | Hash da palavra-passe de autenticação. |

---

## 6. assistant (assistente)

Colaboradores com função de assistente.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Colaborador | `id_emp` | Referência ao colaborador (PK, 1:1). |
| Função de assistente | `fun_ass` | Função ou papel operacional do assistente. |

---

## 7. veterinarian (veterinário)

Colaboradores com registo profissional veterinário.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Colaborador | `id_emp` | Referência ao colaborador (PK, 1:1). |
| Número OMV | `num_omv_vet` | Número de registo profissional de veterinário. |

---

## 8. expert (especialista)

Associação veterinário–especialidade (N:N).

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Veterinário | `id_emp` | Veterinário (FK, PK composta). |
| Especialidade | `id_spe` | Especialidade atribuída (FK, PK composta). |

---

## 9. client (cliente)

Autenticação e ciclo de vida do cliente da clínica.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do cliente | `id_cli` | Identificador único do cliente. |
| Conta de utilizador | `id_usr` | Conta associada; no máximo um cliente por `user_account` (UQ). |
| Palavra-passe | `pas_cli` | Hash da palavra-passe do cliente. |
| Data de registo | `reg_dat_cli` | Data e hora de registo do cliente. |
| Data de inactivação | `ina_dat_cli` | Data e hora de inactivação da conta. |

---

## 10. login_record (registo de login)

Tentativas de autenticação e histórico de sessão.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do registo | `id_log` | Identificador único do registo de login. |
| Data e hora de entrada | `sig_tim_log` | Momento do início de sessão / sign-in. |
| Data e hora de saída | `sou_tim_log` | Momento de termo de sessão / sign-out. |
| Autenticação com sucesso | `suc_log` | Indica se a autenticação foi bem-sucedida. |
| Endereço IP | `ip_add_log` | IP utilizado na tentativa de autenticação. |
| Email na tentativa | `ema_log` | Cópia do email usado na autenticação (auditoria). |
| Utilizador | `id_usr` | Conta de utilizador associada, quando aplicável (FK). |

---

## 11. schedule (horário semanal)

Horário operacional recorrente por colaborador.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Colaborador | `id_emp` | Colaborador (PK composta com dia e intervalo). |
| Dia da semana | `day_wee_sch` | Dia da semana do turno. |
| Hora de início | `sta_tim_sch` | Hora de início do período. |
| Hora de fim | `fin_hou_sch` | Hora de fim do período. |

---

## 12. absence (ausência)

Ausências, interrupções e fluxo de aprovação.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da ausência | `id_abs` | Identificador único da ausência. |
| Colaborador | `id_emp` | Colaborador ausente (FK). |
| Início da ausência | `sta_dat_tim_abs` | Data e hora de início. |
| Fim da ausência | `end_dat_tim_abs` | Data e hora de fim. |
| Motivo | `mot_abs` | Motivo normalizado da ausência. |
| Estado | `sta_abs` | Estado do fluxo (`absence_status` ENUM). |
| Responsável pela resolução | `res_abs` | Colaborador que validou ou resolveu (FK). |
| Data de criação | `cre_tim_abs` | Data e hora de criação do registo. |

---

## 13. clock_in (picagem / assiduidade)

Intervalos de presença operacional do colaborador.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da picagem | `id_clk` | Identificador único do registo de assiduidade. |
| Colaborador | `id_emp` | Colaborador (FK). |
| Início | `sta_dat_clk` | Data e hora de início da presença. |
| Fim | `end_dat_clk` | Data e hora de fim da presença. |

---

## 14. setup (preferências)

Preferências de interface por utilizador.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Utilizador | `id_usr` | Conta de utilizador (PK, 1:1). |
| Tema | `the_set` | Tema preferido da interface. |
| Idioma | `lan_set` | Código de idioma preferido. |

---

## 15. occupies (perfil do colaborador)

Associação colaborador–perfil operacional.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Colaborador | `id_emp` | Colaborador (PK composta). |
| Perfil | `id_pro` | Perfil atribuído (PK composta). |

---

## 16. have (permissões do perfil)

Associação perfil–permissão.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Perfil | `id_pro` | Perfil (PK composta). |
| Permissão | `id_per` | Permissão concedida (PK composta). |

---

## Relacionado

- [Módulo 2](02_Module2.md) · [Índice](README.md) · [Schema M1](../../../04_Architecture/01_Database/01_Schemas/00_Public_Schema/01_Module1.md)

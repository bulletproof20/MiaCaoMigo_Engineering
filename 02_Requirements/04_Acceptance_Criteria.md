# Critérios de Aceitação — Sistema de Gestão Veterinária

Condições de validação dos [requisitos funcionais](00_Functional_Requirements.md) (`RF_Mx_yy`). Cada bloco `AC_RF_Mx_yy` é testável, objectivo e orientado a negócio — **sem** detalhe de implementação.

**Contagens:** M1 — 43 · M2 — 19 · M3 — 30 · M4 — 17 · **Total: 109 AC** (paridade 1:1 com RF).

**Relacionado:** [06_Implementacion_Matrix.md](06_Implementacion_Matrix.md) · [07_Constraints.md](07_Constraints.md) · [02_Business_Rules.md](02_Business_Rules.md)

---

# Índice

- [Módulo 1](#módulo-1--gestão-de-utilizadores)
- [Módulo 2](#módulo-2--gestão-de-animais)
- [Módulo 3](#módulo-3--gestão-comercial)
- [Módulo 4](#módulo-4--gestão-de-consultas)
- [Regras sem RF dedicado](#regras-sem-rf-dedicado)
- [Convenções](#convenções)

---

# Módulo 1 — Gestão de Utilizadores

## AC_RF_M1_01 — Criação de conta de cliente

**RF:** [RF_M1_01](00_Functional_Requirements.md#módulo-1--gestão-de-utilizadores) · **PN:** PN_M1_01

### Critérios de Aceitação

- O sistema permite criar conta de cliente associada a um indivíduo identificado.
- Não é possível criar cliente sem vínculo a indivíduo.
- Após criação, o cliente pode ser referenciado em processos de negócio (ex.: adoção).

## AC_RF_M1_02 — Criação de conta de empregado

**RF:** RF_M1_02 · **PN:** PN_M1_01

### Critérios de Aceitação

- O sistema permite criar conta de empregado com email institucional.
- O email institucional não pode ser alterado após criação.
- Conta inválida ou incompleta é rejeitada com mensagem compreensível.

## AC_RF_M1_03 — Unicidade de conta por tipo

**RF:** RF_M1_03 · **PN:** PN_M1_01

### Critérios de Aceitação

- Um indivíduo não pode ter mais de uma conta de cliente activa.
- Um indivíduo não pode ter mais de uma conta de empregado activa.
- Tentativa de duplicar conta activa do mesmo tipo é rejeitada.

## AC_RF_M1_04 — Desativação de contas

**RF:** RF_M1_04 · **PN:** PN_M1_01

### Critérios de Aceitação

- Contas podem ser desactivadas sem apagar histórico associado.
- Conta desactivada não pode ser usada como conta activa em novas operações.
- Registos históricos permanecem consultáveis conforme política de retenção.

## AC_RF_M1_05 — Autenticação

**RF:** RF_M1_05 · **PN:** PN_M1_02

### Critérios de Aceitação

- Utilizador com email e password válidos autentica com sucesso.
- Password incorrecta impede autenticação.
- Conta desactivada não autentica.

## AC_RF_M1_06 — Sessão única

**RF:** RF_M1_06 · **PN:** PN_M1_02

### Critérios de Aceitação

- Apenas uma sessão activa por conta é permitida em simultâneo.
- Nova autenticação com sessão activa segue política definida (invalidar anterior ou rejeitar).

## AC_RF_M1_07 — Registo de tentativas de autenticação

**RF:** RF_M1_07 · **PN:** PN_M1_02

### Critérios de Aceitação

- Cada tentativa regista IP, data/hora e resultado (sucesso/falha).
- Tentativas falhadas ficam auditáveis.
- Dados registados são consultáveis para fins de segurança.

## AC_RF_M1_08 — Login e logout

**RF:** RF_M1_08 · **PN:** PN_M1_02

### Critérios de Aceitação

- Login regista data e hora de início de sessão.
- Logout regista data e hora de encerramento quando aplicável.
- Eventos são associados à conta correcta.

## AC_RF_M1_09 — Atualização de dados pessoais

**RF:** RF_M1_09 · **PN:** PN_M1_04

### Critérios de Aceitação

- Dados pessoais do indivíduo podem ser actualizados por utilizador autorizado.
- Campos obrigatórios inválidos impedem gravação.
- Alteração reflecte-se nas contas ligadas ao mesmo indivíduo quando aplicável.

## AC_RF_M1_10 — Partilha de dados entre contas

**RF:** RF_M1_10 · **PN:** PN_M1_04

### Critérios de Aceitação

- Dados do indivíduo são consistentes entre contas cliente e empregado do mesmo indivíduo.
- Actualização num ponto actualiza a visão partilhada sem duplicação manual.

## AC_RF_M1_11 — Estado actual dos dados pessoais

**RF:** RF_M1_11 · **PN:** PN_M1_04

### Critérios de Aceitação

- Consulta de dados pessoais devolve apenas o estado actual.
- Não existe histórico versionado de alterações de PII para utilizador final.

## AC_RF_M1_12 — Alteração de password

**RF:** RF_M1_12 · **PN:** PN_M1_03

### Critérios de Aceitação

- Alteração exige confirmação da password actual.
- Password actual incorrecta bloqueia alteração.
- Nova password válida substitui a anterior com sucesso.

## AC_RF_M1_13 — Armazenamento seguro de passwords

**RF:** RF_M1_13 · **PN:** PN_M1_03

### Critérios de Aceitação

- Passwords nunca são apresentadas ou armazenadas em texto claro.
- Autenticação valida contra representação segura (hash).
- Política de complexidade aplicável é respeitada quando definida.

## AC_RF_M1_14 — Histórico de passwords

**RF:** RF_M1_14 · **PN:** PN_M1_03

### Critérios de Aceitação

- Alterações de password geram registo de rastreabilidade (sem expor valor).
- Histórico permite auditoria de quantas alterações ocorreram e quando.
- Reutilização imediata da password anterior pode ser bloqueada se política RN o exigir.

## AC_RF_M1_15 — Gestão de roles organizacionais

**RF:** RF_M1_15 · **PN:** PN_M1_05

### Critérios de Aceitação

- Roles podem ser criadas e mantidas por utilizador autorizado.
- Role inexistente não pode ser atribuída.
- Lista de roles disponíveis é consultável.

## AC_RF_M1_16 — Múltiplos roles por empregado

**RF:** RF_M1_16 · **PN:** PN_M1_05

### Critérios de Aceitação

- Um empregado pode ter mais do que um role activo quando permitido.
- Atribuição duplicada do mesmo role é tratada conforme regra de negócio.
- Permissões efectivas reflectem a união dos roles atribuídos.

## AC_RF_M1_17 — Permissões por role

**RF:** RF_M1_17 · **PN:** PN_M1_05

### Critérios de Aceitação

- Permissões podem ser associadas a roles.
- Empregado com role herda permissões desse role.
- Operação sem permissão é negada.

## AC_RF_M1_18 — Histórico temporal de roles

**RF:** RF_M1_18 · **PN:** PN_M1_05

### Critérios de Aceitação

- Cada atribuição de role regista intervalo de vigência (início e fim quando aplicável).
- Consulta histórica mostra períodos passados e actual.
- Role terminado deixa de conceder permissões.

## AC_RF_M1_19 — Responsável por alterações de roles

**RF:** RF_M1_19 · **PN:** PN_M1_05

### Critérios de Aceitação

- Alterações de role registam o responsável (empregado/autor do sistema).
- Registo é consultável em auditoria.

## AC_RF_M1_20 — Atribuição de função a empregado

**RF:** RF_M1_20 · **PN:** PN_M1_06

### Critérios de Aceitação

- Empregado pode ser classificado como veterinário ou auxiliar (ou equivalente do domínio).
- Função inválida ou incompatível é rejeitada.
- Função activa influencia operações clínicas permitidas.

## AC_RF_M1_21 — Função única activa

**RF:** RF_M1_21 · **PN:** PN_M1_06

### Critérios de Aceitação

- Não existem duas funções activas em simultâneo para o mesmo empregado.
- Mudança de função encerra a anterior ou impede sobreposição.

## AC_RF_M1_22 — Histórico de funções

**RF:** RF_M1_22 · **PN:** PN_M1_06

### Critérios de Aceitação

- Transições de função ficam registadas com datas de vigência.
- Histórico de funções desempenhadas é consultável.

## AC_RF_M1_23 — Responsável por alterações de função

**RF:** RF_M1_23 · **PN:** PN_M1_06

### Critérios de Aceitação

- Alteração de função regista responsável pela mudança.
- Auditoria identifica quem autorizou a alteração.

## AC_RF_M1_24 — Subfunções de auxiliares

**RF:** RF_M1_24 · **PN:** PN_M1_06

### Critérios de Aceitação

- Auxiliar pode ter subfunção definida no catálogo.
- Subfunção só aplica a empregados classificados como auxiliar.
- Subfunção incorrecta é rejeitada.

## AC_RF_M1_25 — Veterinário: OMV e especialidade

**RF:** RF_M1_25 · **PN:** PN_M1_06

### Critérios de Aceitação

- Veterinário exige número OMV válido para ficar activo em função clínica.
- Especialidade é opcional e pode ser associada quando existir no catálogo.
- Veterinário sem OMV não pode assumir consultas que exijam OMV.

## AC_RF_M1_26 — Horário semanal único

**RF:** RF_M1_26 · **PN:** PN_M1_07

### Critérios de Aceitação

- Cada empregado tem um horário semanal de referência definível.
- Horário cobre os dias da semana configurados no processo.
- Ausência de horário impede cálculo de disponibilidade baseado em turnos.

## AC_RF_M1_27 — Múltiplos turnos sem sobreposição

**RF:** RF_M1_27 · **PN:** PN_M1_07

### Critérios de Aceitação

- É possível definir vários turnos no mesmo dia.
- Turnos sobrepostos no mesmo dia são rejeitados.
- Turnos válidos contribuem para disponibilidade.

## AC_RF_M1_28 — Actualização de horário semanal

**RF:** RF_M1_28 · **PN:** PN_M1_07

### Critérios de Aceitação

- Novo horário semanal substitui o anterior para efeitos futuros.
- Horário anterior permanece consultável se política de histórico o exigir.
- Agendamentos futuros respeitam o horário vigente após actualização.

## AC_RF_M1_29 — Pedidos de ausência

**RF:** RF_M1_29 · **PN:** PN_M1_07

### Critérios de Aceitação

- Empregado pode submeter ausência com data/hora de início e fim válidas.
- Intervalo inválido (fim antes do início) é rejeitado.
- Pedido fica registado em estado inicial (ex.: submetida).

## AC_RF_M1_30 — Estados de ausência

**RF:** RF_M1_30 · **PN:** PN_M1_07

### Critérios de Aceitação

- Ausência transita pelos estados previstos (submetida, aprovada, rejeitada, cancelada, usufruída).
- Transição inválida é bloqueada.
- Estado actual é visível ao solicitante e aprovador.

## AC_RF_M1_31 — Cancelamento de ausência (72h)

**RF:** RF_M1_31 · **PN:** PN_M1_07

### Critérios de Aceitação

- Cancelamento é permitido até 72 horas antes do início da ausência.
- Cancelamento fora do prazo é rejeitado.
- Ausência cancelada deixa de bloquear disponibilidade futura.

## AC_RF_M1_32 — Histórico de estados de ausência

**RF:** RF_M1_32 · **PN:** PN_M1_07

### Critérios de Aceitação

- Cada mudança de estado da ausência fica registada com data.
- Histórico completo de estados é consultável por pedido de ausência.

## AC_RF_M1_33 — Clock-in

**RF:** RF_M1_33 · **PN:** PN_M1_07

### Critérios de Aceitação

- Empregado pode registar entrada com data/hora.
- Entrada duplicada sem saída intermédia segue regra de negócio (bloquear ou encerrar anterior).
- Registo fica associado ao empregado correcto.

## AC_RF_M1_34 — Clock-out

**RF:** RF_M1_34 · **PN:** PN_M1_07

### Critérios de Aceitação

- Empregado com entrada aberta pode registar saída.
- Saída sem entrada prévia é rejeitada.
- Duração entre entrada e saída é determinável.

## AC_RF_M1_35 — Consistência temporal de presença

**RF:** RF_M1_35 · **PN:** PN_M1_07

### Critérios de Aceitação

- Saída anterior à entrada no mesmo registo é impossível.
- Registos inconsistentes são rejeitados na submissão.

## AC_RF_M1_36 — Imutabilidade de presença

**RF:** RF_M1_36 · **PN:** PN_M1_07

### Critérios de Aceitação

- Registos de presença não podem ser eliminados por utilizador standard.
- Correcções seguem fluxo autorizado se existir (ajuste auditado).

## AC_RF_M1_37 — Cálculo de disponibilidade

**RF:** RF_M1_37 · **PN:** PN_M1_07

### Critérios de Aceitação

- Disponibilidade reflecte horário semanal, ausências aprovadas e presenças quando aplicável.
- Período em ausência activa marca indisponibilidade.
- Resultado é utilizável para agendamento de consultas/recursos humanos.

## AC_RF_M1_38 — Bloqueio durante ausência

**RF:** RF_M1_38 · **PN:** PN_M1_07

### Critérios de Aceitação

- Actividade operacional do empregado em ausência activa é bloqueada por defeito.
- Utilizador com permissão de excepção pode executar acções explicitamente permitidas.
- Bloqueio é verificável em teste de agendamento ou operação clínica.

## AC_RF_M1_39 — Preferências de tema e idioma

**RF:** RF_M1_39 · **PN:** PN_M1_08

### Critérios de Aceitação

- Utilizador pode escolher tema claro ou escuro.
- Utilizador pode escolher idioma PT ou EN.
- Preferências persistem entre sessões.

## AC_RF_M1_40 — Sincronização de preferências

**RF:** RF_M1_40 · **PN:** PN_M1_08

### Critérios de Aceitação

- Alteração de preferências numa conta do indivíduo reflecte-se nas outras contas do mesmo indivíduo.
- Não é necessário reconfigurar manualmente em cada conta.

## AC_RF_M1_41 — Preferências sem histórico

**RF:** RF_M1_41 · **PN:** PN_M1_08

### Critérios de Aceitação

- Apenas valor actual de tema/idioma é mantido para consulta.
- Não há histórico de versões de preferências para o utilizador.

## AC_RF_M1_42 — Eliminação ou anonimização (RGPD)

**RF:** RF_M1_42 · **PN:** PN_M1_09

### Critérios de Aceitação

- Pedido válido de titular pode iniciar eliminação ou anonimização de dados pessoais.
- Dados sujeitos a obrigação legal não são apagados em violação da lei.
- Confirmação do resultado do pedido é comunicada ao solicitante autorizado.

## AC_RF_M1_43 — Preservação legal e integridade

**RF:** RF_M1_43 · **PN:** PN_M1_09

### Critérios de Aceitação

- Dados necessários a facturação, clínica ou auditoria legal são preservados após pedido RGPD quando aplicável.
- Integridade referencial do sistema não é quebrada por anonimização.
- Campos obrigatórios para conformidade permanecem ou são substituídos por valores anonimizados aceites.

---

# Módulo 2 — Gestão de Animais

## AC_RF_M2_01 — Registo de animal

**RF:** RF_M2_01 · **PN:** PN_M2_01

### Critérios de Aceitação

- Animal pode ser registado com dados biográficos e identificadores (ex.: microchip).
- Identificador único duplicado é rejeitado quando aplicável.
- Animal registado fica disponível para processos subsequentes.

## AC_RF_M2_02 — Espécie e raça

**RF:** RF_M2_02 · **PN:** PN_M2_07

### Critérios de Aceitação

- Animal só pode ser associado a espécie e raça existentes no catálogo.
- Combinação espécie/raça inválida é rejeitada.
- Catálogo é consultável na criação/edição.

## AC_RF_M2_03 — Entrada de animal

**RF:** RF_M2_03 · **PN:** PN_M2_02

### Critérios de Aceitação

- Entrada regista origem como cliente ou entidade externa.
- Entrada sem origem identificada é rejeitada.
- Data da entrada fica registada.

## AC_RF_M2_04 — Estado clínico na entrada

**RF:** RF_M2_04 · **PN:** PN_M2_02

### Critérios de Aceitação

- Estado clínico inicial pode ser registado no momento da entrada.
- Campo obrigatório em falta impede conclusão se definido pelo processo.

## AC_RF_M2_05 — Criação automática de cliente

**RF:** RF_M2_05 · **PN:** PN_M2_02

### Critérios de Aceitação

- Quando entregador não existe como cliente, o sistema pode criar cliente automaticamente conforme fluxo.
- Cliente criado fica ligado à entrada do animal.
- Dados mínimos do novo cliente são validados.

## AC_RF_M2_06 — Entidades externas

**RF:** RF_M2_06 · **PN:** PN_M2_06

### Critérios de Aceitação

- Entidade externa pode ser registada com identificação e contacto.
- Entidade duplicada é tratada conforme regra (reutilizar ou rejeitar).
- Entidade registada pode ser origem de entregas.

## AC_RF_M2_07 — Actualização de estado do animal

**RF:** RF_M2_07 · **PN:** PN_M2_03

### Critérios de Aceitação

- Estado do animal (interno, adotado, falecido, desaparecido, etc.) pode ser actualizado.
- Estado inválido para o contexto é rejeitado.
- Estado actual é consultável.

## AC_RF_M2_08 — Histórico de estados

**RF:** RF_M2_08 · **PN:** PN_M2_03

### Critérios de Aceitação

- Cada alteração de estado gera novo registo histórico sem sobrescrever o anterior.
- Sequência temporal de estados é preservada.

## AC_RF_M2_09 — Consulta de histórico de estados

**RF:** RF_M2_09 · **PN:** PN_M2_03

### Critérios de Aceitação

- Utilizador autorizado consulta todos os estados por ordem cronológica.
- Cada entrada mostra estado e data relevante.

## AC_RF_M2_10 — Adoção / posse

**RF:** RF_M2_10 · **PN:** PN_M2_04

### Critérios de Aceitação

- Animal pode ser atribuído a cliente em processo de adoção/posse.
- Atribuição sem cliente válido é rejeitada.
- Posse activa fica identificável.

## AC_RF_M2_11 — Período de posse

**RF:** RF_M2_11 · **PN:** PN_M2_04

### Critérios de Aceitação

- Posse regista data de início e, quando aplicável, data de fim.
- Fim anterior ao início é rejeitado.
- Posse encerrada não aparece como activa.

## AC_RF_M2_12 — Responsável na adoção

**RF:** RF_M2_12 · **PN:** PN_M2_04

### Critérios de Aceitação

- Empregado responsável pode ser associado ao processo de adoção.
- Apenas empregados válidos são aceites.

## AC_RF_M2_13 — Cedência de animal

**RF:** RF_M2_13 · **PN:** PN_M2_05

### Critérios de Aceitação

- Cedência regista motivo obrigatório conforme regra de negócio.
- Animal em cedência fica associado ao evento de cedência.
- Cedência inválida (animal inexistente) é rejeitada.

## AC_RF_M2_14 — Estado clínico na cedência

**RF:** RF_M2_14 · **PN:** PN_M2_05

### Critérios de Aceitação

- Estado clínico no momento da cedência pode ser registado.
- Informação fica ligada ao registo de cedência.

## AC_RF_M2_15 — Intervenientes na cedência

**RF:** RF_M2_15 · **PN:** PN_M2_05

### Critérios de Aceitação

- Intervenientes (cliente, entidade, empregado) ficam identificados no processo.
- Pelo menos um interveniente obrigatório está presente.

## AC_RF_M2_16 — Histórico de posse

**RF:** RF_M2_16 · **PN:** PN_M2_04

### Critérios de Aceitação

- Todas as posses passadas e actual são listáveis por animal.
- Cada registo indica cliente e intervalo temporal.

## AC_RF_M2_17 — Histórico consolidado de eventos

**RF:** RF_M2_17 · **PN:** PN_M2_08

### Critérios de Aceitação

- Consulta por animal inclui entrada, adoções/posse e cedências.
- Eventos aparecem ordenados de forma compreensível para o utilizador.

## AC_RF_M2_18 — Origem do animal

**RF:** RF_M2_18 · **PN:** PN_M2_02

### Critérios de Aceitação

- Origem (cliente ou entidade que entregou) é identificável a partir do animal.
- Dados de contacto da origem respeitam permissões de acesso.

## AC_RF_M2_19 — Inactivação de animal

**RF:** RF_M2_19 · **PN:** PN_M2_01

### Critérios de Aceitação

- Animal pode ser inactivado sem apagar histórico.
- Animal inactivo não participa em novos processos que exijam animal activo.
- Histórico permanece consultável.

---

# Módulo 3 — Gestão Comercial

## AC_RF_M3_01 — Catálogo de produtos

**RF:** RF_M3_01 · **PN:** PN_M3_01

### Critérios de Aceitação

- Produtos podem ser criados, editados e desactivados.
- Produto desactivado não aparece como seleccionável em novas vendas.
- Campos obrigatórios do catálogo são validados.

## AC_RF_M3_02 — Família de produto

**RF:** RF_M3_02 · **PN:** PN_M3_01

### Critérios de Aceitação

- Cada produto pertence a uma família (categoria) existente.
- Família inexistente impede gravação.

## AC_RF_M3_03 — Preço e IVA

**RF:** RF_M3_03 · **PN:** PN_M3_01

### Critérios de Aceitação

- Preço e taxa de IVA são definíveis por produto.
- Valores negativos ou inválidos são rejeitados.
- Preço actual é usado em novas operações comerciais.

## AC_RF_M3_04 — Produtos activos em operações

**RF:** RF_M3_04 · **PN:** PN_M3_01

### Critérios de Aceitação

- Venda ou consumo de produto inactivo é bloqueado.
- Produto activado volta a estar disponível conforme stock.

## AC_RF_M3_05 — Registo de compras

**RF:** RF_M3_05 · **PN:** PN_M3_02

### Critérios de Aceitação

- Compra a fornecedor pode ser registada com linhas de produto.
- Compra sem fornecedor válido é rejeitada quando obrigatório.
- Compra concluída actualiza fluxo de stock conforme RF_M3_09.

## AC_RF_M3_06 — Fornecedor na compra

**RF:** RF_M3_06 · **PN:** PN_M3_02

### Critérios de Aceitação

- Compra associa-se a fornecedor (entidade externa) válido.
- Fornecedor inactivo ou inexistente impede registo.

## AC_RF_M3_07 — Linhas de compra

**RF:** RF_M3_07 · **PN:** PN_M3_02

### Critérios de Aceitação

- Uma compra aceita múltiplos produtos e quantidades.
- Linha com quantidade zero ou negativa é rejeitada.
- Total da compra é derivável das linhas.

## AC_RF_M3_08 — Pagamento da compra

**RF:** RF_M3_08 · **PN:** PN_M3_02

### Critérios de Aceitação

- Método de pagamento e custo total podem ser registados na compra.
- Campos obrigatórios em falta impedem fecho da compra se aplicável.

## AC_RF_M3_09 — Stock por compra

**RF:** RF_M3_09 · **PN:** PN_M3_03

### Critérios de Aceitação

- Recepção de compra cria ou incrementa lotes de stock.
- Quantidades recebidas reflectem-se no stock disponível.

## AC_RF_M3_10 — Lote: quantidade e validade

**RF:** RF_M3_10 · **PN:** PN_M3_03

### Critérios de Aceitação

- Cada lote regista quantidade, data de entrada e validade quando aplicável.
- Produto perecível sem validade pode ser rejeitado conforme RN.

## AC_RF_M3_11 — Actualização automática de stock

**RF:** RF_M3_11 · **PN:** PN_M3_03

### Critérios de Aceitação

- Compra, venda e devolução actualizam stock automaticamente.
- Stock nunca fica negativo após operação válida (rejeição ou ajuste conforme RN).

## AC_RF_M3_12 — Consulta de stock

**RF:** RF_M3_12 · **PN:** PN_M3_03

### Critérios de Aceitação

- Stock disponível é consultável por produto e por lote.
- Totais por produto são coerentes com soma dos lotes.

## AC_RF_M3_13 — Venda ou consumo

**RF:** RF_M3_13 · **PN:** PN_M3_04

### Critérios de Aceitação

- Registo de venda ou consumo reduz stock do produto.
- Operação sem produto ou quantidade válida é rejeitada.

## AC_RF_M3_14 — Validação de stock antes da venda

**RF:** RF_M3_14 · **PN:** PN_M3_04

### Critérios de Aceitação

- Venda/consumo com quantidade superior ao disponível é bloqueada.
- Mensagem indica indisponibilidade de stock.

## AC_RF_M3_15 — Associação a consulta ou venda directa

**RF:** RF_M3_15 · **PN:** PN_M3_04

### Critérios de Aceitação

- Produto pode ligar-se a consulta (consumo clínico) ou a venda directa.
- Associação duplicada inválida é tratada conforme regra.

## AC_RF_M3_16 — Selecção de lote

**RF:** RF_M3_16 · **PN:** PN_M3_04

### Critérios de Aceitação

- Sistema pode sugerir lote (ex.: FIFO) ou aceitar selecção manual autorizada.
- Lote esgotado não pode ser utilizado.

## AC_RF_M3_17 — Geração de fatura

**RF:** RF_M3_17 · **PN:** PN_M3_05

### Critérios de Aceitação

- Fatura pode ser gerada a partir de produtos e serviços seleccionados.
- Fatura sem itens é rejeitada.
- Identificador de fatura é único no âmbito do sistema.

## AC_RF_M3_18 — Fatura associada a consulta

**RF:** RF_M3_18 · **PN:** PN_M3_05

### Critérios de Aceitação

- Quando aplicável, fatura liga-se à consulta de origem.
- Uma consulta não acumula múltiplas faturas activas se regra o proíbe.

## AC_RF_M3_19 — Múltiplos itens na fatura

**RF:** RF_M3_19 · **PN:** PN_M3_05

### Critérios de Aceitação

- Fatura suporta várias linhas de produtos/serviços.
- Cada linha contribui para subtotal e total.

## AC_RF_M3_20 — Totais automáticos da fatura

**RF:** RF_M3_20 · **PN:** PN_M3_05

### Critérios de Aceitação

- Subtotal, impostos e total final são calculados automaticamente.
- Totais apresentados coincidem com soma das linhas e regras de IVA.

## AC_RF_M3_21 — Pagamentos da fatura

**RF:** RF_M3_21 · **PN:** PN_M3_06

### Critérios de Aceitação

- Um ou mais pagamentos podem ser registados contra fatura.
- Soma dos pagamentos não excede total da fatura sem regra explícita.

## AC_RF_M3_22 — Método de pagamento na venda

**RF:** RF_M3_22 · **PN:** PN_M3_06

### Critérios de Aceitação

- Método (dinheiro, cartão, etc.) é seleccionável no registo de pagamento.
- Método inválido é rejeitado.

## AC_RF_M3_23 — Estado da fatura

**RF:** RF_M3_23 · **PN:** PN_M3_06

### Critérios de Aceitação

- Estado evolui para pendente, parcial ou paga conforme pagamentos registados.
- Fatura totalmente paga não permanece pendente.

## AC_RF_M3_24 — Devoluções

**RF:** RF_M3_24 · **PN:** PN_M3_07

### Critérios de Aceitação

- Devolução associa-se à fatura original.
- Devolução sem fatura de referência válida é rejeitada quando obrigatório.

## AC_RF_M3_25 — Motivo e data da devolução

**RF:** RF_M3_25 · **PN:** PN_M3_07

### Critérios de Aceitação

- Motivo e data da devolução são registados.
- Devolução sem motivo obrigatório é bloqueada.

## AC_RF_M3_26 — Stock após devolução

**RF:** RF_M3_26 · **PN:** PN_M3_07

### Critérios de Aceitação

- Stock aumenta (ou reclassifica) após devolução aceite conforme política de reentrada.
- Produto não reentrável não incrementa stock disponível.

## AC_RF_M3_27 — Histórico comercial

**RF:** RF_M3_27 · **PN:** PN_M3_08

### Critérios de Aceitação

- Histórico de compras, vendas, faturas e devoluções é consultável.
- Registos históricos não são apagados por consulta.

## AC_RF_M3_28 — Filtros no histórico

**RF:** RF_M3_28 · **PN:** PN_M3_08

### Critérios de Aceitação

- Filtro por cliente, produto, período ou tipo de operação reduz resultados correctamente.
- Combinação de filtros vazia devolve conjunto vazio ou aviso adequado.

## AC_RF_M3_29 — Relatórios de vendas

**RF:** RF_M3_29 · **PN:** PN_M3_09

### Critérios de Aceitação

- Relatório de vendas/faturação pode ser gerado para período seleccionado.
- Totais do relatório são consistentes com dados transaccionais.

## AC_RF_M3_30 — Análise de stock

**RF:** RF_M3_30 · **PN:** PN_M3_09

### Critérios de Aceitação

- Análise identifica produtos abaixo do limiar de reordenação quando configurado.
- Produtos mais utilizados são classificáveis por período.

---

# Módulo 4 — Gestão de Consultas

## AC_RF_M4_01 — Registo de consulta

**RF:** RF_M4_01 · **PN:** PN_M4_01

### Critérios de Aceitação

- Consulta associa animal, veterinário, especialidade, data e intervalo horário.
- Recursos inválidos ou indisponíveis impedem agendamento.
- Consulta criada fica no estado inicial previsto (agendada).

## AC_RF_M4_02 — Validade do intervalo horário

**RF:** RF_M4_02 · **PN:** PN_M4_01

### Critérios de Aceitação

- Hora de início é estritamente anterior à hora de fim.
- Intervalo inválido é rejeitado na criação/edição.

## AC_RF_M4_03 — Anamnese

**RF:** RF_M4_03 · **PN:** PN_M4_02

### Critérios de Aceitação

- Motivo e histórico clínico podem ser registados na consulta.
- Anamnese fica ligada à consulta correcta.

## AC_RF_M4_04 — Avaliação geral

**RF:** RF_M4_04 · **PN:** PN_M4_02

### Critérios de Aceitação

- Temperatura, peso e frequências podem ser registados na avaliação.
- Valores fora de limites plausíveis podem gerar aviso conforme RN.

## AC_RF_M4_05 — Início da consulta

**RF:** RF_M4_05 · **PN:** PN_M4_06

### Critérios de Aceitação

- Consulta agendada pode passar a «em curso».
- Transição inválida (ex.: de cancelada) é bloqueada.

## AC_RF_M4_06 — Diagnóstico e observações

**RF:** RF_M4_06 · **PN:** PN_M4_03

### Critérios de Aceitação

- Diagnóstico final e observações podem ser registados antes ou na conclusão.
- Texto fica associado à consulta e visível no histórico clínico.

## AC_RF_M4_07 — Diagnóstico obrigatório na conclusão

**RF:** RF_M4_07 · **PN:** PN_M4_03

### Critérios de Aceitação

- Conclusão sem diagnóstico registado é rejeitada.
- Consulta permanece «em curso» ou estado intermédio até diagnóstico válido.

## AC_RF_M4_08 — Prescrição médica

**RF:** RF_M4_08 · **PN:** PN_M4_04

### Critérios de Aceitação

- Prescrição pode ser criada com data, validade e observações.
- Prescrição está ligada à consulta de origem.
- Prescrição sem consulta válida é rejeitada.

## AC_RF_M4_09 — Produtos na consulta e prescrição

**RF:** RF_M4_09 · **PN:** PN_M4_05

### Critérios de Aceitação

- Produtos podem associar-se ao consumo em clínica ou à prescrição externa.
- Associação duplicada inválida é tratada conforme RN.

## AC_RF_M4_10 — Stock na utilização clínica

**RF:** RF_M4_10 · **PN:** PN_M4_05

### Critérios de Aceitação

- Utilização de produto sem stock disponível é bloqueada.
- Stock é decrementado após utilização aceite.

## AC_RF_M4_11 — Ciclo de vida da consulta

**RF:** RF_M4_11 · **PN:** PN_M4_06

### Critérios de Aceitação

- Estados possíveis incluem agendada, em curso, concluída, cancelada, não realizada.
- Estado actual é visível em qualquer momento.

## AC_RF_M4_12 — Estado inicial agendada

**RF:** RF_M4_12 · **PN:** PN_M4_06

### Critérios de Aceitação

- Toda nova consulta nasce no estado «agendada».
- Não é possível criar consulta já concluída.

## AC_RF_M4_13 — Transições válidas de estado

**RF:** RF_M4_13 · **PN:** PN_M4_06

### Critérios de Aceitação

- Transições proibidas pelo ciclo de vida são rejeitadas.
- Mensagem ou código de erro identifica transição inválida.

## AC_RF_M4_14 — Cancelamento de consulta

**RF:** RF_M4_14 · **PN:** PN_M4_06

### Critérios de Aceitação

- Consulta agendada pode ser cancelada por utilizador autorizado.
- Consulta concluída não pode ser cancelada sem fluxo excepção.

## AC_RF_M4_15 — Não comparência

**RF:** RF_M4_15 · **PN:** PN_M4_06

### Critérios de Aceitação

- Consulta pode ser marcada como não realizada quando cliente não comparece.
- Estado reflecte ausência do atendimento.

## AC_RF_M4_16 — Histórico clínico do animal

**RF:** RF_M4_16 · **PN:** PN_M4_07

### Critérios de Aceitação

- Histórico lista consultas, diagnósticos, avaliações e prescrições do animal.
- Dados respeitam permissões de acesso clínico.

## AC_RF_M4_17 — Fatura automática na conclusão

**RF:** RF_M4_17 · **PN:** PN_M4_08

### Critérios de Aceitação

- Ao concluir consulta com itens facturáveis, fatura é gerada automaticamente.
- Itens da consulta e consumos associados aparecem na fatura.
- Falha na geração impede conclusão ou gera aviso conforme política acordada.

---

# Regras sem RF dedicado

Critérios complementares para [regras de negócio](02_Business_Rules.md) sem paridade RF explícita (ver [00_Functional_Requirements.md](00_Functional_Requirements.md#rastreabilidade-rf--rn-lacunas-documentadas)).

## AC_RN_M1_36 — Classificação de ausências (férias)

**RN:** RN_M1_36

### Critérios de Aceitação

- Ausências classificadas como férias seguem política de saldo definida em RN.
- Pedido que excede saldo disponível é rejeitado ou encaminhado para aprovação excepção.

## AC_RN_M1_37 — Impacto no saldo de férias

**RN:** RN_M1_37

### Critérios de Aceitação

- Aprovação de ausência de férias decrementa saldo correctamente.
- Cancelamento dentro do prazo repõe saldo conforme regra.

## AC_RN_M3_22 — Sequência legal de faturas

**RN:** RN_M3_22

### Critérios de Aceitação

- Identificadores de fatura seguem sequência legal contínua sem duplicados.
- Quebra de sequência é detectável em auditoria.

## AC_RN_M4_01 — Desconto 5.ª consulta

**RN:** RN_M4_01

### Critérios de Aceitação

- Na 5.ª consulta elegível do cliente, desconto acordado é aplicado na fatura.
- Cliente sem elegibilidade não recebe desconto.

## AC_RN_M4_02 — Desconto 10.ª consulta

**RN:** RN_M4_02

### Critérios de Aceitação

- Na 10.ª consulta elegível, desconto superior (ou definido) é aplicado.
- Descontos não acumulam indevidamente sem regra explícita.

## AC_RN_M4_03 — Política de fidelização

**RN:** RN_M4_03

### Critérios de Aceitação

- Contagem de consultas para fidelização é consistente por cliente/animal conforme RN.
- Relatório ou ecrã de suporte mostra consultas contabilizadas.

---

# Convenções

## Identificadores

| Tipo | Formato | Exemplo |
|------|---------|---------|
| Critério de aceitação (RF) | `AC_RF_M<modulo>_<numero>` | `AC_RF_M1_05` |
| Critério complementar (RN) | `AC_RN_M<modulo>_<numero>` | `AC_RN_M4_01` |

Relação **1:1** entre `RF_Mx_yy` e `AC_RF_Mx_yy` salvo secção complementar para RN órfãs.

## Validação

| Artefacto | Papel |
|-----------|--------|
| [06_Implementacion_Matrix.md](06_Implementacion_Matrix.md) | Onde e como está implementado |
| [07_Constraints.md](07_Constraints.md) | Limites técnicos e legais globais |
| Testes QA DataLayer | Evidência objectiva quando aplicável |

## Palavras-chave

`AC`, `critério de aceitação`, `validação`, `testável`, `RF`, `M1`, `M2`, `M3`, `M4`.

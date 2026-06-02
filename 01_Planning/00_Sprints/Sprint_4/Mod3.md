# Sprint 4 — Modulo 3: Gestao Comercial e Stock

Analise de rastreabilidade entre a especificacao da Sprint 4 e a implementacao real do Modulo 3, focada em **Gestao Comercial e Stock**.

Fonte funcional analisada: `Sprint 04.pdf`.

Repositorios verificados:

- Aplicacao/API: `MiaCaoMigo_`
- Base de dados/QA: `MiaCaoMigo_DataLayer`

Legenda:

- **Implementado**: existe fluxo funcional e/ou regra executavel no frontend, API ou base de dados.
- **Parcial**: existe parte relevante, mas falta um detalhe pedido no PDF.
- **Nao evidenciado**: nao foi encontrada implementacao real suficiente.

## Sumario Executivo

O Modulo 3 esta implementado para os fluxos principais de catalogo, consulta de stock, reposicao por compra, venda ao balcao, emissao/listagem/download de faturas, devolucoes e atualizacao automatica de stock.

As principais lacunas face ao PDF sao:

- **RF_M3_01**: existe criacao e consulta de produtos, mas nao foi encontrada edicao/desativacao via API/UI.
- **RF_M3_05 / RF_M3_06**: existe registo de compras/reposicao, mas nao ha fornecedor formal associado no fluxo aplicacional.
- **RF_M3_08 / RF_M3_21 / RF_M3_22 / RF_M3_23**: metodo de pagamento e estados existem no modelo, mas nao ha fluxo completo de pagamentos; vendas ao balcao criam fatura diretamente como `paid`.
- **RF_M3_16**: a selecao de lote e automatica/FIFO na base de dados; nao ha selecao manual pelo utilizador.
- **RF_M3_18**: a ligacao fatura-consulta existe estruturalmente, mas nao foi encontrada geracao/associacao automaticas a partir do fecho de consulta.
- **RF_M3_29 / RF_M3_30**: existem vistas de stock e historicos operacionais, mas nao ha relatorios analiticos completos de vendas/faturacao/produtos mais usados.

## Prova Geral de Implementacao

### Aplicacao e API

| Area | Evidencia |
|------|-----------|
| Hub comercial | `Backend/routes/Mod3_Commercial/index.js` monta `/stock`, `/restock`, `/sales`, `/return`, `/invoices` com `requireCommercialAreaAccess` para staff comercial |
| Catalogo e stock | `Backend/routes/Mod3_Commercial/stockRoutes.js`, `stockControllers.js`, `stockModels.js` |
| Compras/reposicao | `Backend/routes/Mod3_Commercial/restockRoutes.js`, `restockControllers.js`, `restockModels.js` |
| Vendas e faturacao | `Backend/routes/Mod3_Commercial/salesRoutes.js`, `salesControllers.js`, `salesModels.js` |
| Faturas | `Backend/routes/Mod3_Commercial/invoiceRoutes.js`, `invoiceControllers.js`, `invoiceModels.js`, `Backend/services/invoicePdf.js` |
| Devolucoes | `Backend/routes/Mod3_Commercial/returnRoutes.js`, `returnControllers.js`, `returnModels.js` |
| UI catalogo | `FrontEnd/Pages/AdminPanel/productCatalog.html`, `FrontEnd/Js/Mod3/productCatalog.js` |
| UI stock | `FrontEnd/Pages/AdminPanel/StockManagement.html`, `FrontEnd/Js/Mod3/StockManagement.js` |
| UI reposicao | `FrontEnd/Pages/AdminPanel/restock.html`, `FrontEnd/Js/Mod3/restock.js` |
| UI vendas | `FrontEnd/Pages/AdminPanel/salesManagement.html`, `FrontEnd/Js/Mod3/salesManagement.js` |
| UI faturas/devolucoes | `FrontEnd/Js/Mod3/invoiceHistory.js`, `invoiceDetails.js`, `returnManagement.js` |

### DataLayer

| Area | Evidencia |
|------|-----------|
| Tabelas Mod3 | `DataBase/Schema/03_Module3_Commercial_Management/00_Tables_Mod3.sql` cria `family`, `product`, `stock`, `purchase`, `purchase_line`, `invoice`, `invoice_line`, `"return"` |
| Integridade referencial | `DataBase/Schema/03_Module3_Commercial_Management/01_ForeignKeys_Mod3.sql` liga produto-familia, stock-produto, compra-empregado, linhas-compra, linhas-fatura e devolucoes |
| Funcoes de validacao | `DataBase/Schema/03_Module3_Commercial_Management/02_Functions_Mod3.sql` implementa stock disponivel, bloqueio por stock insuficiente, FIFO, totais de fatura, reposicao por devolucao e bloqueio de produto inativo |
| Triggers | `DataBase/Schema/03_Module3_Commercial_Management/03_Triggers_Mod3.sql` aplica validacao de stock, desconto FIFO, total de fatura, devolucao/stock e produto inativo |
| Indices | `DataBase/Schema/03_Module3_Commercial_Management/04_Indexes_Mod3.sql` cobre `invoice.id_app`, `stock.id_pro`, `purchase_line.id_pur`, `invoice_line.id_inv` |
| Procedures | `DataBase/Schema/03_Module3_Commercial_Management/05_Procedures_Mod3.sql` define `sp_receive_purchase` e `sp_check_restock_needs` |
| Views/API SQL | `DataBase/Schema/03_Module3_Commercial_Management/07_Views_Mod3.sql` e `DataBase/Services/03_Module3/99_Public_API.sql` expõem stock consolidado e produtos a encomendar |
| DemoData | `DataBase/DataSeed/03_DemoData/13_Products.sql`, `14_Commercial.sql` |
| QA integridade | `DataBase/QA/01_Integrity/03_Module3/*` cobre stock antes de venda, produto inativo, devolucao e total de fatura |
| QA stress | `DataBase/QA/04_Stress/03_Module3/*` cobre vendas concorrentes, volume de linhas, FIFO e devolucoes em massa |

## Processos de Negocio

| ID | Processo do PDF | Estado | Prova / Observacao |
|----|-----------------|--------|--------------------|
| PN_M3_01 | Gestao de Catalogo e Stock | **Parcial** | Catalogo, familia, produto, stock, minimos e consulta existem; falta edicao/desativacao funcional via app |
| PN_M3_02 | Gestao de Operacoes Comerciais | **Implementado com lacunas** | Vendas, faturas, compras/reposicao e devolucoes existem; pagamentos/fornecedores formais estao incompletos |
| PN_M3_03 | Consulta e Historico Comercial | **Parcial** | Historico de faturas/devolucoes e stock existe; filtros/relatorios analiticos completos nao foram evidenciados |

## Requisitos Funcionais

| ID | Requisito do PDF | Estado | Prova / Observacao |
|----|------------------|--------|--------------------|
| RF_M3_01 | Criar, editar e desativar produtos no catalogo comercial | **Parcial** | `createNewProduct`/`createProduct` e UI `productCatalog.js`; nao foram encontrados endpoints de edicao ou desativacao (`ina_dat_pro`) |
| RF_M3_02 | Associar produtos a uma familia/categoria | **Implementado** | `product.id_fam not null`, FK `fk_product_family`; `createProduct` recebe `id_fam`; DemoData cria `family` |
| RF_M3_03 | Definir preco e IVA para cada produto | **Implementado** | `product.pri_pro`, `product.iva_pro`; UI envia `pri_pro` e `iva_pro`; faturas guardam `uni_pri_inv_lin` e `iva_inv_lin` |
| RF_M3_04 | Apenas produtos ativos podem ser usados em operacoes comerciais | **Implementado na venda; parcial no catalogo UI** | Trigger `trg_prevent_inactive_product_sale`; view `vw_product_stock_levels` filtra `ina_dat_pro is null`; app nao expoe desativacao |
| RF_M3_05 | Registar compras a fornecedores | **Parcial** | `restock.js`/`createAndReceivePurchase` criam `purchase` e `purchase_line`; nao ha entidade/campo fornecedor no fluxo |
| RF_M3_06 | Associar compra a fornecedor valido | **Nao evidenciado** | O modelo `purchase` nao tem FK para entidade externa/fornecedor; app nao recolhe fornecedor |
| RF_M3_07 | Registar multiplos produtos e quantidades numa compra | **Implementado** | `restock.js` acumula `purchaseItems`; `createAndReceivePurchase` insere varias `purchase_line` |
| RF_M3_08 | Registar metodo de pagamento e custo total da compra | **Parcial** | Tabela `purchase` tem `tot_val_pur` e `pay_met_pur`; app envia `total_price`, mas nao recolhe metodo de pagamento na reposicao |
| RF_M3_09 | Criar automaticamente registos de stock por lote aquando de uma compra | **Implementado** | `svc_receive_purchase` chama `sp_receive_purchase`, que cria `stock` por linha e grava `purchase_line.id_sto` |
| RF_M3_10 | Registar quantidade, data de entrada e validade por lote | **Parcial** | Tabela `stock` tem `qty_sto`, `ent_dat_sto`, `val_dat_sto`, `bat_sto`; `sp_receive_purchase` grava quantidade/data e `bat_pln`, mas app de reposicao nao recolhe lote/validade |
| RF_M3_11 | Atualizar stock apos compra, venda ou devolucao | **Implementado** | Compra: `sp_receive_purchase`; venda: `trg_stock_after_sale`; devolucao: `trg_return_restock` e app tambem incrementa stock |
| RF_M3_12 | Consultar stock disponivel por produto e lote | **Parcial** | App consulta stock consolidado por produto via `svc_list_product_stock_levels`/`svc_get_product_stock_level`; consulta por lote existe na tabela, mas UI/API exposta e consolidada, nao detalhada por lote |
| RF_M3_13 | Registar consumo ou venda de produtos | **Implementado** | `registerNewSale` e `createInvoiceAndLines` criam `invoice` e `invoice_line`; Mod4 tambem usa `rel_app_product` para consumo clinico |
| RF_M3_14 | Validar stock antes de venda ou consumo | **Implementado para vendas; parcial para consumo clinico no M3** | Venda valida em `createInvoiceAndLines` e trigger `trg_check_stock_before_sale`; consumo clinico e tratado no Mod4/DataLayer |
| RF_M3_15 | Associar produtos a consulta ou venda direta | **Parcial** | Venda direta implementada por `invoice_line`; produtos de consulta existem em Mod4 `rel_app_product`; fatura de consulta automatica nao evidenciada |
| RF_M3_16 | Selecionar automaticamente ou manualmente o lote a utilizar | **Parcial** | Seleciona automaticamente por FIFO em `tfn_stock_after_sale`; nao ha selecao manual na UI/API |
| RF_M3_17 | Gerar fatura com base nos produtos e servicos associados | **Implementado para venda direta; parcial para servicos/consulta** | `createInvoiceAndLines` gera fatura e linhas para produtos; nao ha servicos nem fatura automatica de consulta |
| RF_M3_18 | Associar fatura a consulta quando aplicavel | **Parcial** | `invoice.id_app`, `appointment.id_inv`, `uq_invoice_appointment` e sync Mod4 existem; app cria vendas com `id_app null` |
| RF_M3_19 | Incluir multiplos itens numa fatura | **Implementado** | `salesManagement.js` cria carrinho; `createInvoiceAndLines` insere varias `invoice_line` |
| RF_M3_20 | Calcular automaticamente totais, impostos e valor final | **Implementado** | Trigger `trg_update_invoice_total` usa `tfn_update_invoice_total`; UI/PDF calcula e mostra totais |
| RF_M3_21 | Registar pagamentos associados a uma fatura | **Parcial** | `invoice.sta_inv` e `purchase.pay_met_pur` existem; venda ao balcao cria fatura `paid`, mas nao ha entidade/fluxo de pagamento separado |
| RF_M3_22 | Definir metodo de pagamento | **Parcial** | `purchase.pay_met_pur` existe; vendas criam `pay_met_pur='counter'`; UI de venda/reposicao nao recolhe metodo detalhado |
| RF_M3_23 | Atualizar automaticamente estado da fatura | **Parcial** | Estados `pending`, `paid`, `overdue`, `cancelled` existem; venda cria `paid` diretamente e DemoData marca `overdue`; nao foi encontrado fluxo automatico de parcial/pago por pagamento |
| RF_M3_24 | Registar devolucoes associadas a fatura original | **Implementado** | `returnManagement.js` usa `id_inv_lin`; `registerProductReturn`; trigger valida linha de fatura |
| RF_M3_25 | Registar motivo e data da devolucao | **Implementado** | `"return".mot_ret`, `ina_dat_ret`; `trg_set_return_return_date`; UI recolhe motivo |
| RF_M3_26 | Atualizar stock apos devolucao | **Implementado** | `tfn_return_restock`/`trg_return_restock`; `returnModels.js` tambem repoe stock no fluxo app |
| RF_M3_27 | Consultar historico de compras, vendas, faturas e devolucoes | **Parcial** | Faturas e devolucoes têm listagem; compras/vendas historicas completas nao têm UI dedicada clara |
| RF_M3_28 | Filtrar historico por cliente, produto, periodo ou tipo | **Parcial** | Devolucoes filtram localmente por IDs; faturas listam origem/cliente; nao ha filtros completos por periodo/tipo/produto |
| RF_M3_29 | Gerar relatorios de vendas e faturacao | **Nao evidenciado** | Foram encontradas listagens e PDF de fatura, mas nao relatorios agregados de vendas/faturacao |
| RF_M3_30 | Analisar niveis de stock e produtos mais utilizados | **Parcial** | Niveis de stock e produtos a encomendar via `vw_product_stock_levels`/`vw_products_to_reorder`; produtos mais utilizados nao evidenciado |

## Requisitos Nao Funcionais

| ID | Requisito do PDF | Estado | Prova / Observacao |
|----|------------------|--------|--------------------|
| RNF_M3_01 | Garantir consistencia do stock durante operacoes simultaneas | **Implementado** | Triggers de stock, `fn_get_available_stock`, FIFO e stress `01_Concurrent_Sales.sql`; ainda assim o fluxo app faz validacao defensiva antes da BD |
| RNF_M3_02 | Operacoes comerciais devem ser transacionais | **Implementado** | `createInvoiceAndLines`, `createAndReceivePurchase`, `registerProductReturn` usam `BEGIN`/`COMMIT`/`ROLLBACK`; procedures SQL tambem operam atomicamente |
| RNF_M3_03 | Precisao monetaria com duas casas decimais | **Implementado** | Campos `numeric(10,2)` para valores/precos; trigger de totais usa `invoice.val_inv numeric(10,2)` |

## Regras de Negocio

| ID | Regra do PDF | Estado | Prova / Observacao |
|----|--------------|--------|--------------------|
| RN_M3_01 | Produto deve possuir designacao, preco e taxa de IVA validos | **Parcial** | `nam_pro not null`; app exige nome/preco/familia; preco/IVA nao têm CHECK de positividade/obrigatoriedade forte na BD |
| RN_M3_02 | Produto deve estar associado a uma unica categoria | **Implementado** | `product.id_fam not null` com FK para `family` |
| RN_M3_03 | Apenas produtos ativos participam em operacoes comerciais | **Implementado para venda** | `trg_prevent_inactive_product_sale`; views filtram inativos |
| RN_M3_04 | Compra deve estar associada a fornecedor valido | **Nao evidenciado** | Sem fornecedor formal no modelo/fluxo de reposicao |
| RN_M3_05 | Compra deve conter pelo menos um produto | **Implementado** | App valida `items.length > 0`; `sp_receive_purchase` rejeita compra sem linhas |
| RN_M3_06 | Cada registo de stock deve estar associado a produto e lote validos | **Parcial** | `stock.id_pro not null` com FK; lote `bat_sto` e validade sao opcionais |
| RN_M3_07 | Quantidade em stock nao pode ser negativa | **Implementado** | `ck_qty_sto`; triggers bloqueiam venda sem stock; stress verifica ausencia de stock negativo |
| RN_M3_08 | Produto so pode ser vendido se houver stock disponivel | **Implementado** | Validacao app e `trg_check_stock_before_sale` |
| RN_M3_09 | Quantidade utilizada nao pode exceder stock disponivel | **Implementado** | `tfn_check_stock_before_sale`; QA `01_Stock_Before_Sale.sql` |
| RN_M3_10 | Fatura deve conter pelo menos um item faturavel | **Implementado na app; parcial na BD** | `registerNewSale` exige items; BD permite criar `invoice` sem linhas |
| RN_M3_11 | Total da fatura corresponde a soma dos itens e impostos | **Implementado** | `tfn_update_invoice_total`; QA `04_Invoice_Total_Update.sql` |
| RN_M3_12 | Apos emissao, fatura nao pode ser alterada, apenas anulada/retificada | **Nao evidenciado** | Nao foi encontrada trigger que bloqueie alteracao de `invoice` ou `invoice_line` apos emissao |
| RN_M3_13 | Faturas devem possuir identificador unico e sequencial | **Implementado** | `invoice.id_inv generated always as identity`, PK `pk_invoice` |
| RN_M3_14 | Fatura so e paga quando total pago corresponde ao total faturado | **Nao evidenciado** | Nao ha entidade/fluxo de pagamentos nem soma de pagamentos |
| RN_M3_15 | Devolucao deve estar associada a fatura existente | **Implementado funcionalmente; parcial por FK** | App exige `id_inv_lin`; trigger valida existencia da linha; FK formal foi removida por design |
| RN_M3_16 | Devolucao deve indicar motivo obrigatorio | **Parcial** | UI/controller exigem `mot_ret`; BD permite `mot_ret` nulo |
| RN_M3_17 | Operacoes comerciais preservadas para consulta futura | **Implementado** | Listagens de faturas/devolucoes, DemoData, ausencia de deletes na API |
| RN_M3_18 | Nao e permitido eliminar registos historicos comerciais | **Parcial** | API nao expoe delete; BD usa cascades em linhas de fatura/compra e nao tem trigger de bloqueio geral |

## Modelacao / Dicionario de Dados do PDF

| Entidade do PDF | Estado | Prova / Observacao |
|-----------------|--------|--------------------|
| Familia de Produto | **Implementado** | Tabela `family`; DemoData `13_Products.sql`; FK em `product` |
| Produto | **Parcial** | Tabela `product`, catalogo e criacao; edicao/desativacao nao expostas na app |
| Stock | **Implementado** | Tabela `stock`, views, triggers de venda/devolucao/compra |
| Compra | **Parcial** | Tabela `purchase`, app de reposicao e `sp_receive_purchase`; fornecedor/metodo pagamento incompletos |
| Linha de Compra | **Implementado** | Tabela `purchase_line`, multiplas linhas, link a stock criado |
| Fatura | **Implementado com lacunas** | Tabela `invoice`, listagem/PDF/estado/valor; pagamento e imutabilidade nao evidenciados |
| Linha de Fatura | **Implementado** | Tabela `invoice_line`, multiplos itens, total automatico, stock FIFO |
| Devolucao | **Implementado com lacunas** | Tabela `"return"`, UI/API e stock; motivo obrigatorio so na app e FK formal para `invoice_line` ausente |

## Evidencia de QA

| Tipo | Ficheiro | Cobertura |
|------|----------|-----------|
| Integridade | `DataBase/QA/01_Integrity/03_Module3/01_Stock_Before_Sale.sql` | bloqueio de venda com stock insuficiente |
| Integridade | `DataBase/QA/01_Integrity/03_Module3/02_Inactive_Product_Sale.sql` | bloqueio de venda de produto inativo |
| Integridade | `DataBase/QA/01_Integrity/03_Module3/03_Return_Quantity.sql` | bloqueio de devolucao superior a quantidade vendida |
| Integridade | `DataBase/QA/01_Integrity/03_Module3/04_Invoice_Total_Update.sql` | calculo automatico do total da fatura |
| Stress | `DataBase/QA/04_Stress/03_Module3/01_Concurrent_Sales.sql` | tentativas de venda contra stock fixo sem oversell |
| Stress | `DataBase/QA/04_Stress/03_Module3/02_High_Volume_Invoice_Lines.sql` | carga de 500 linhas de fatura |
| Stress | `DataBase/QA/04_Stress/03_Module3/03_FIFO_Consumption.sql` | consumo FIFO por validade/lote |
| Stress | `DataBase/QA/04_Stress/03_Module3/04_Return_Storm.sql` | devolucoes em massa e reposicao de stock |

### Notas de Cobertura Tecnica

- `sp_receive_purchase` nao impede segunda rececao de uma compra ja `received`, podendo duplicar stock; nao foi encontrado teste de integridade para este procedimento.
- Ao receber compra, `sp_receive_purchase` grava `val_dat_sto = null` em `stock`, pelo que a validade recolhida em `purchase_line` nao e propagada automaticamente.
- Nao existe entidade `payment` nem estado `partial` em `invoice_status`; `sta_inv` nao e atualizado por soma de pagamentos (apenas por DML/demo ou criacao direta como `paid` na app).
- Nao existe `DataBase/QA/05_Manual/03_Module3/` (Mod1 e Mod4 tem scripts de defesa manual).
- Consumo clinico no Mod4 (`tfn_deduct_product_stock` em `rel_app_product`) nao segue o FIFO de `tfn_stock_after_sale` — dois caminhos de reducao de stock coexistem.
- `DataBase/Schema/03_Module3_Commercial_Management/06_Jobs_Mod3.sql` e placeholder (sem jobs agendados).
- `DataBase/Queries/03_Module3/queries_03Module.sql` esta marcado como deprecado e referencia colunas inexistentes (`stock_minimo` em vez de `min_sto`).

## Conclusao por Area

| Area | Estado global | Justificacao |
|------|---------------|--------------|
| Catalogo | **Parcial** | Criacao/listagem/familia/preco/IVA existem; faltam editar/desativar na app |
| Stock | **Implementado** | Stock consolidado, minimos, reposicao, FIFO e guards SQL existem |
| Compras/reposicao | **Parcial** | Compra com linhas e stock automatico; falta fornecedor e recolha de lote/validade/metodo pagamento |
| Vendas ao balcao | **Implementado** | Carrinho, fatura, linhas, stock e PDF funcionam |
| Faturacao | **Implementado com lacunas** | Faturas/linhas/totais/PDF; faltam pagamentos formais, imutabilidade e consulta-fatura automatica |
| Devolucoes | **Implementado com lacunas** | Associadas a linha de fatura e repoe stock; motivo/FK historica dependem mais da app/trigger que de constraint forte |
| Historico/relatorios | **Parcial** | Listagens e filtros simples existem; faltam relatorios agregados e analise de produtos mais usados |

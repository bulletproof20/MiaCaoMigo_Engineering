# Módulo 3 — Gestão comercial

!!! info "Fonte de verdade"
    `01_MiaCaoMigo_DataLayer` — `Comments/Schema/03_Module3/00_Tables_Mod3_Comments.sql`  
    DDL: `Schema/03_Module3_Commercial_Management/00_Tables_Mod3.sql`

**8 entidades** · família, produto, stock, compras, faturação, devoluções.  
Tabela **`return`** é identificador SQL reservado (nome entre aspas no DDL).

!!! note "Referências soft (sem FK física)"
    `purchase.id_cli`, `purchase.id_inv`, `purchase_line.id_sto`, `return.id_inv_lin` — ver [arquitetura M3](../../../04_Architecture/01_Database/01_Schemas/00_Public_Schema/03_Module3_Architecture.md#soft-references-logical-not-physical-fk).

---

## 1. family (família de produto)

Agrupamento de catálogo por família.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da família | `id_fam` | Identificador único da família de produtos. |
| Nome da família | `nam_fam` | Nome apresentável da família. |
| Descrição | `des_fam` | Descrição textual da família. |

---

## 2. invoice (fatura)

Cabeçalho de faturação; pode ligar-se a uma consulta (M4).

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da fatura | `id_inv` | Identificador único da fatura. |
| Valor total | `val_inv` | Valor monetário total da fatura (mantido por triggers). |
| Data de emissão | `dat_inv` | Data e hora de emissão. |
| Corpo / notas | `bod_inv` | Texto livre ou observações da fatura. |
| Estado | `sta_inv` | Estado do fluxo (`invoice_status`: pending, paid, overdue, cancelled). |
| Consulta (back-link) | `id_app` | Referência lógica à consulta M4; espelhada com `appointment.id_inv` (soft). |

---

## 3. product (produto)

Artigo do catálogo com preço, IVA e ciclo de vida.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do produto | `id_pro` | Identificador único do SKU (≠ `profile.id_pro` do M1). |
| Referência interna | `ref_pro` | Código de referência interno. |
| Código de barras | `bar_pro` | Código de barras ou chave alternativa de leitura. |
| Nome do produto | `nam_pro` | Nome comercial do produto. |
| Descrição | `des_pro` | Descrição detalhada do artigo. |
| Preço de lista | `pri_pro` | Preço unitário de tabela. |
| Taxa de IVA | `iva_pro` | Percentagem de IVA aplicável. |
| Data de registo | `reg_dat_pro` | Data de registo no catálogo. |
| Data de inativação | `ina_dat_pro` | Data em que o produto deixa de estar ativo. |
| Família | `id_fam` | Família obrigatória do produto (FK). |
| Stock mínimo | `min_sto` | Limiar de stock para alertas de reabastecimento. |

---

## 4. stock (stock / lote)

Quantidades por produto e lote, com validade e data de entrada.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador do stock | `id_sto` | Identificador único da linha de stock. |
| Produto | `id_pro` | Produto armazenado (FK). |
| Lote | `bat_sto` | Identificador de lote ou batch. |
| Quantidade | `qty_sto` | Quantidade disponível no lote (≥ 0). |
| Data de validade | `val_dat_sto` | Data de expiração do lote. |
| Data de entrada | `ent_dat_sto` | Data de entrada no armazém. |

---

## 5. purchase (compra / encomenda)

Cabeçalho de encomenda de aprovisionamento ou espelho de venda ao cliente.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da compra | `id_pur` | Identificador único da encomenda. |
| Data da compra | `pur_dat_pur` | Data e hora da compra. |
| Valor total | `tot_val_pur` | Valor total da encomenda. |
| Número de encomenda | `ord_num_pur` | Referência externa do fornecedor ou ordem. |
| Método de pagamento | `pay_met_pur` | Etiqueta do método de pagamento. |
| Estado | `sta_pur` | Estado (`purchase_status`: pending, received, cancelled). |
| Fatura associada | `id_inv` | **Soft** — fatura ligada quando aplicável; PO de fornecedor pode omitir. |
| Cliente | `id_cli` | **Soft** — cliente em compras retail; encomendas a fornecedor podem omitir. |
| Colaborador responsável | `id_emp` | Colaborador responsável pela compra (FK M1). |

---

## 6. purchase_line (linha de compra)

Detalhe de linhas de entrada de stock associadas a uma compra.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da linha | `id_pur_lin` | Identificador único da linha. |
| Compra | `id_pur` | Cabeçalho de compra (FK). |
| Produto | `id_pro` | Produto adquirido (FK). |
| Lote na linha | `bat_pln` | Designação de lote capturada na receção. |
| Quantidade encomendada | `qty_pln` | Quantidade encomendada (positiva). |
| Custo unitário | `uni_cos_pln` | Custo unitário de aquisição. |
| Stock gerado | `id_sto` | **Soft** — linha de stock criada na receção (`sp_receive_purchase`). |

---

## 7. invoice_line (linha de fatura)

Linhas de venda que contribuem para o total da fatura.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da linha | `id_inv_lin` | Identificador único da linha de venda. |
| Fatura | `id_inv` | Cabeçalho de fatura (FK). |
| Produto | `id_pro` | Produto vendido (FK). |
| Quantidade vendida | `qty_inv_lin` | Quantidade vendida (positiva). |
| Preço unitário | `uni_pri_inv_lin` | Preço unitário de venda. |
| IVA da linha | `iva_inv_lin` | Taxa de IVA aplicada à linha. |

---

## 8. return (devolução)

Cabeçalho de devolução comercial: um cliente, um colaborador, um produto por registo.

| Nome do atributo | Nome físico | Descrição |
|------------------|-------------|-----------|
| Identificador da devolução | `id_ret` | Identificador único da devolução. |
| Cliente | `id_cli` | Cliente que devolve o produto (FK M1). |
| Colaborador | `id_emp` | Colaborador que processou a devolução (FK M1). |
| Produto devolvido | `id_pro` | Produto devolvido — origem do restock (FK). |
| Motivo | `mot_ret` | Motivo narrativo da devolução. |
| Data de encerramento | `ina_dat_ret` | Data de encerramento ou inativação do registo. |
| Linha de venda de origem | `id_inv_lin` | **Soft** — linha de fatura opcional; validada em `tfn_return_restock` no INSERT. |
| Quantidade devolvida | `qty_ret` | Quantidade devolvida (por defeito 1). |

---

## Relacionado

- [Módulo 2](02_Module2.md) · [Módulo 4](04_Module4.md) · [Índice](README.md)

# Documentação MiaCaoMigo (ApplicationLayer)

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Website docs</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">MkDocs hub</span>
</div>

Este índice reúne a documentação técnica da aplicação (`MiaCaoMigo_`): guias em Markdown, API Swagger/OpenAPI e referência JSDoc gerada para backend e frontend.

A **fonte editável** continua no repositório do website. Este hub no Engineering replica a navegação do `Docs/index.html` do website, adaptada ao portal MkDocs.

---

## Explorar a documentação

<div class="grid cards" markdown>

- **Backend**

    Explica como o Express monta rotas, serve Swagger UI, OpenAPI JSON e a rota JSDoc em localhost.

    [:octicons-arrow-right-24: Ver documentação backend](Backend.md)

- **Frontend**

    Mostra o fluxo das páginas, os principais formulários e como a autenticação e o painel staff funcionam.

    [:octicons-arrow-right-24: Ver documentação frontend](Frontend.md)

- **Fluxo Frontend**

    Apresenta o diagrama e os passos de navegação do frontend do MiaCaoMigo.

    [:octicons-arrow-right-24: Ver fluxo frontend](Frontend_Flow.md)

- **Swagger**

    Explica a fonte dos comentários `@swagger`, os schemas globais e como regenerar o contrato OpenAPI.

    [:octicons-arrow-right-24: Ver documentação Swagger](Swagger.md)

- **Especificação OpenAPI**

    Onde encontrar o contrato JSON e a visualização Redoc (website).

    [:octicons-arrow-right-24: Abrir guia OpenAPI](OpenAPI.md)

- **Code Reference**

    Referência JSDoc gerada a partir do código backend e frontend (comentários em inglês).

    [:octicons-arrow-right-24: Abrir referência de código](Code_Reference.md)

- **Atualizar documentação**

    Comandos para regenerar OpenAPI, JSDoc e HTML a partir das fontes no website.

    [:octicons-arrow-right-24: Ver guia de atualização](Update_Docs.md)

</div>

---

## URLs com servidor ligado

Com `npm start` no repositório **`MiaCaoMigo_`**:

| URL | Conteúdo |
|-----|----------|
| [http://localhost:3000/docs/](http://localhost:3000/docs/) | Hub HTML original (website) |
| [http://localhost:3000/api-docs/](http://localhost:3000/api-docs/) | Swagger UI interativo |
| [http://localhost:3000/api-docs.json](http://localhost:3000/api-docs.json) | OpenAPI JSON em runtime |
| [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) | Referência JSDoc servida pelo backend |

---

## Modelo de documentação

| Camada | Fonte editável (`MiaCaoMigo_`) | Saída gerada |
|--------|-------------------------------|--------------|
| API REST | `@swagger` em `Backend/routes/**` e `Backend/swaggerConfig.js` | Swagger UI, `Docs/Swagger/openapi.json`, Redoc HTML |
| Código | JSDoc em `Backend/**/*.js` e `FrontEnd/Js/**/*.js` | `Docs/site/CodeReference/` e `/jsdoc/` |
| Guias | Markdown em `Docs/**/*.md` | HTML em `Docs/site/**/*.html` |

Comentários técnicos no código: **inglês**. Texto visível na UI: **português**.

---

## Relação com outras páginas desta secção

| Documento | Uso |
|-----------|-----|
| [Application overview](../00_Application_Overview.md) | Stack, módulos e limites da ApplicationLayer |
| [Website flows](../01_Website_Flows.md) | Fluxos para defesa (narrativa + sequências) |
| [Runtime setup](../02_Runtime_Setup.md) | Execução local/Docker e ligação à BD |
| [Implementation evidence](../03_Implementation_Evidence.md) | Mapeamento RF/RNF ↔ implementação |

---

[← Application architecture](../README.md)

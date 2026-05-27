# Referência de código (JSDoc)

Fonte no website: `MiaCaoMigo_/Docs/CODE_REFERENCE.md`

Referência HTML gerada a partir de comentários JSDoc no backend e no frontend do repositório **`MiaCaoMigo_`**.

---

## Âmbito

| Área | Caminhos |
|------|----------|
| Backend | `Backend/**/*.js` — Express, rotas, controllers, models, middleware, config |
| Frontend | `FrontEnd/Js/**/*.js` — sessão, login, dashboards, animais, consultas, sidebars |

Configuração: `jsdoc.json`  
Geração: `scripts_docs/generate-jsdoc.js`

---

## Onde ver

Com `npm start` em **`MiaCaoMigo_`**:

| URL | Descrição |
|-----|-----------|
| [http://localhost:3000/jsdoc/](http://localhost:3000/jsdoc/) | Referência servida pelo Express (card **Code Reference** do hub website) |

Sem servidor (após `npm run docs:build`):

```text
MiaCaoMigo_/Docs/site/CodeReference/index.html
```

---

## Como atualizar

Executar no repositório **`MiaCaoMigo_`**:

| Comando | Resultado |
|---------|-----------|
| `npm run docs:code` | Só regenera `Docs/site/CodeReference/` |
| `npm run docs:build` | OpenAPI + JSDoc + Markdown→HTML + Redoc |

---

## Regras de comentários

- Comentários técnicos no código: **inglês**
- Texto visível na UI: **português**
- Preferir `@module`, `@param`, `@returns` em funções exportadas e helpers relevantes
- Documentar guards de autenticação, fetch à API e comportamento não óbvio

---

## Relação com Swagger

| Ferramenta | Documenta | URL típica |
|------------|-----------|------------|
| Swagger / OpenAPI | Endpoints REST, payloads, respostas | `/api-docs/` |
| JSDoc | Estrutura e funções do código | `/jsdoc/` |

---

[← Hub documentação](README.md)

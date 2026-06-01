# Estrutura de apresentação (~15 min)

Guia rápido alinhado com o [Relatório da Aplicação](../01_Academic_Reports/Application_Report.md).

---

## Cronograma sugerido

| Min | Secção | Conteúdo |
|-----|--------|----------|
| 0–2 | Contexto | O que é o MiaCaoMigo; três camadas (Frontend, API, PostgreSQL); repositórios `MiaCaoMigo_`, `MiaCaoMigo_DataLayer`, Engineering |
| 2–4 | Utilizadores | Visitante, cliente, funcionário; perfis RBAC; domínio `@miacaomigo.pt` |
| 4–9 | Funcionalidades | Fluxo login → área cliente → consultas → área staff → operação protegida; 3–4 prints principais |
| 9–12 | Autenticação e segurança | JWT, `localStorage`, middlewares, permissões na BD, Swagger |
| 12–14 | Ferramentas | Node, Express, PostgreSQL, Docker, MkDocs, Bootstrap |
| 14–15 | Limitações e conclusão | Mod3 reservado, protótipos RH, mensagem de integração real |

---

## Mensagem central

> Não é só um site estático: é uma aplicação modular com API documentada, regras na base de dados e controlo de acesso em várias camadas.

---

## Demonstração ao vivo (opcional)

1. Página pública → login cliente.
2. Marcar ou listar consulta.
3. Login staff → dashboard com menus por perfil.
4. Abrir `/api-docs/` e mostrar um endpoint protegido.

---

[← Presentation hub](README.md)

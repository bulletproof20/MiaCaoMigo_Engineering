# Relatório Académico da Aplicação Web

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#2563eb;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">ApplicationLayer</span>
  <span style="background:#059669;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Apresentação 15 min</span>
  <span style="background:#64748b;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">Defesa académica</span>
</div>

Este relatório resume a aplicação web implementada no repositório `MiaCaoMigo_`, com foco na apresentação académica de aproximadamente 15 minutos. A aplicação demonstra a integração entre frontend estático, API Node/Express e base de dados PostgreSQL, usando autenticação JWT, permissões por perfil e documentação Swagger/OpenAPI.

---

## 1. Contexto / Introdução

O sistema **MiaCaoMigo** representa uma plataforma de apoio à gestão de uma clínica veterinária. O objetivo principal é centralizar operações que, num contexto real, seriam distribuídas por atendimento, equipa clínica, gestão de animais, marcação de consultas e acompanhamento de clientes.

A aplicação web está organizada em três camadas principais:

| Camada | Responsabilidade |
|--------|------------------|
| Frontend | Páginas HTML/CSS/JavaScript, navegação pública, áreas autenticadas de cliente e funcionário |
| Backend | API REST em Node.js/Express, autenticação, autorização, validação de pedidos e ligação aos modelos |
| DataLayer | PostgreSQL, funções de negócio, tabelas, perfis, permissões, sessões e regras de integridade |

Na apresentação, o sistema deve ser introduzido como uma solução modular: o utilizador interage com páginas web, o frontend comunica com a API através de `fetch`, e a API delega persistência e regras críticas à base de dados.

### Sugestão de tempo

| Parte | Duração sugerida |
|-------|------------------|
| Contexto e utilizadores | 2 min |
| Funcionalidades e fluxos | 5 min |
| Autenticação, permissões e segurança | 3 min |
| Ferramentas e arquitetura técnica | 2 min |
| Limitações e conclusão | 3 min |

---

## 2. Utilizadores

O website distingue utilizadores públicos, clientes autenticados e funcionários autenticados. A separação é feita através do login, do tipo de conta e dos perfis/permissões carregados da base de dados.

| Utilizador | Acesso principal | Exemplos de ações |
|------------|------------------|-------------------|
| Visitante | Páginas públicas | Consultar serviços, adoções, loja pública, contactos e informação institucional |
| Cliente | Área de cliente | Ver animais, marcar consultas, reagendar/cancelar consultas, consultar notificações e prescrições |
| Funcionário | Área interna | Ver agenda pessoal, presenças, ausências e operações conforme permissões |
| Administrador / RH | Área de funcionários | Criar funcionários, consultar quadro de funcionários e aceder a vistas de gestão |
| Veterinário / equipa clínica | Área clínica | Gerir consultas, consultar pacientes e registar ciclo de vida clínico quando autorizado |
| Assistente / secretaria | Operações de atendimento | Registar/associar animais e apoiar marcações |
| Gestor comercial | Área reservada | Entradas de menu para área comercial e relatórios, ainda em desenvolvimento |

A distinção cliente/funcionário usa o domínio institucional `@miacaomigo.pt` e os perfis associados ao funcionário na base de dados.

---

## 3. Funcionalidades

### 3.1 Visão geral por módulo

| Módulo | Estado no website | Funcionalidades demonstráveis |
|--------|-------------------|-------------------------------|
| Mod1 - Utilizadores | Implementado de forma central | Registo de cliente, login, logout, sessão JWT, tema claro/escuro, área de cliente, área de funcionário, RBAC e criação de funcionários |
| Mod2 - Animais | Implementado parcialmente/operacional | Catálogos de espécies/raças, listagem de animais do cliente, adoções públicas e operações internas sobre animais |
| Mod3 - Comercial | Reservado/parcial | Loja pública como placeholder e entradas internas desativadas para área comercial/relatórios |
| Mod4 - Consultas | Implementado de forma relevante | Marcação, disponibilidade, listagem, cancelamento, reagendamento, notificações, prescrições e ciclo de vida de consultas |

### 3.2 Fluxo do sistema

O fluxo principal começa em páginas públicas e evolui para áreas protegidas após autenticação.

1. O visitante acede à página inicial e navega pelas páginas públicas.
2. O utilizador cria conta de cliente ou faz login.
3. O backend valida as credenciais na base de dados e devolve um JWT.
4. O frontend guarda o token e os dados do utilizador em `localStorage`.
5. A navegação pós-login separa cliente e funcionário.
6. O cliente acede à sua área, aos seus animais e às suas consultas.
7. O funcionário acede ao dashboard interno e vê menus conforme perfis/permissões.
8. Cada pedido protegido envia `Authorization: Bearer <token>` para a API.
9. O backend valida o JWT e aplica permissões antes de executar os modelos.

### 3.3 Prints do sistema e descrição

Para a apresentação de 15 minutos, recomenda-se selecionar poucos prints, mas representativos. A explicação deve focar o objetivo funcional de cada ecrã e a ligação ao backend.

| Print sugerido | Ecrã | O que explicar |
|----------------|------|----------------|
| 1 | Página inicial / páginas públicas | Entrada no sistema, navegação pública e separação entre visitante e utilizador autenticado |
| 2 | Login | Credenciais enviadas para `/api/users/auth/login`, validação na BD e emissão de JWT |
| 3 | Área de Cliente | Dashboard do cliente, atalhos para consultas, animais, notificações e adoções |
| 4 | Minhas Consultas | Marcação, disponibilidade por veterinário/data, cancelamento, reagendamento e histórico |
| 5 | Meus Animais / Adoções | Animais associados ao cliente e fluxo de interesse em adoção |
| 6 | Área de Funcionário | Dashboard interno, agenda, presenças, ausências e operações disponíveis |
| 7 | Quadro / Registo de Funcionários | Demonstração de gestão RH protegida por `manage_employees` |
| 8 | Gestão de Consultas | Operações internas sobre o ciclo de vida clínico |
| 9 | Swagger UI | Prova da documentação técnica da API e dos endpoints implementados |

### 3.4 Autenticação

A autenticação é feita com **JWT (JSON Web Tokens)** através da package `jsonwebtoken`.

Fluxo implementado:

1. O formulário de login chama `POST /api/users/auth/login`.
2. O backend chama a função de autenticação na base de dados através do model `authModel`.
3. A password é convertida para SHA-256 antes da validação na base de dados.
4. Em caso de sucesso, o backend gera um JWT com `sub`, `email`, `staff`, `permissions` e `profiles`.
5. O frontend guarda o token em `localStorage` com a chave `jwtToken`.
6. Os pedidos protegidos usam o header `Authorization: Bearer <token>`.
7. O middleware `requireAuth` valida assinatura, emissor e expiração do token.

O JWT tem emissor `miacaomigo-api` e tempo de vida configurável por `JWT_EXPIRES_IN`, com valor de desenvolvimento de `6h`.

### 3.5 Permissões e controlo de acesso

O sistema combina controlo de acesso no frontend e no backend.

| Local | Mecanismo |
|-------|-----------|
| Frontend | Guards locais, menus por perfil, redirecionamento de páginas cliente/staff |
| JWT | Transporte de `staff`, `permissions` e `profiles` |
| Backend | Middlewares `requireAuth`, `requireStaff`, `requirePermission` e `requireClinicSecretary` |
| Base de dados | Perfis e permissões obtidos das tabelas de RBAC (`profile`, `permission`, relações de ocupação/permissão) |

Exemplos de permissões:

| Permissão | Uso |
|-----------|-----|
| `manage_employees` | Criar funcionários e aceder a gestão RH |
| `manage_animals` | Consultar clientes ativos para associação de animais |
| `manage_appointments` | Gerir consultas, check-in, início e encerramento |
| `manage_commercial` | Entrada reservada para área comercial |
| `view_reports` | Entrada reservada para relatórios |

Mesmo que o frontend esconda ou desative entradas, a autorização relevante acontece no backend. Isto evita depender apenas da interface para proteger operações críticas.

### 3.6 Segurança

A segurança implementada assenta em várias camadas:

| Área | Implementação |
|------|---------------|
| Autenticação | JWT assinado com segredo do servidor |
| Sessão | Registo de login/logout na base de dados e encerramento de sessões abertas no arranque do servidor |
| Autorização | Middlewares de staff, permissões e validação específica de secretaria clínica |
| Passwords | Hash SHA-256 antes da validação/persistência via serviços da BD |
| SQL | Queries parametrizadas com `pg`, reduzindo risco de SQL injection |
| Configuração | Variáveis de ambiente para ligação à BD e JWT |
| Documentação | Swagger/OpenAPI expõe contrato técnico e facilita testes controlados |

Pontos importantes para explicar na defesa:

- O token identifica o utilizador, mas não substitui as permissões verificadas no servidor.
- As permissões vêm da base de dados e são transportadas no JWT para guiar frontend e backend.
- O backend rejeita pedidos sem token, token expirado ou permissões insuficientes.
- A API usa JSON e rotas REST organizadas por módulo.

### 3.7 Usabilidade

O website usa uma navegação simples por áreas:

| Aspeto | Evidência |
|--------|-----------|
| Separação por contexto | Área pública, área cliente e área funcionário |
| Sidebars | Menu do cliente e menu de funcionários gerados com base no perfil |
| Feedback ao utilizador | Mensagens de carregamento, erro e sucesso em formulários e tabelas |
| Consistência visual | CSS partilhado em dashboards, cards, tabelas e botões |
| Tema | Preferência light/dark persistida no setup do utilizador |
| Responsividade base | Meta viewport e layouts com grids/flex em várias páginas |

A experiência é adequada para demonstração académica: o utilizador entende rapidamente onde está, que ações pode executar e que secções ainda estão em desenvolvimento.

### 3.8 Integração com API e base de dados

O backend é iniciado em `Backend/server.js`, serve os ficheiros estáticos do `FrontEnd/` e monta as principais rotas API:

| Prefixo | Responsabilidade |
|---------|------------------|
| `/api/users/auth` | Login, registo, logout, sessão atual e preferências |
| `/api/users/clients` | Pesquisa/listagem de clientes para staff autorizado |
| `/api/users/staff/me` | Agenda pessoal, horário, assiduidade, ausências e clock toggle |
| `/api/users/employees` | Criação de funcionários com permissão `manage_employees` |
| `/api/animals` | Catálogos, animais do cliente, adoções e gestão interna |
| `/api/appointments` | Marcações, disponibilidade, notificações, ciclo de vida e histórico |
| `/api-docs` | Swagger UI da API |
| `/api-docs.json` | Especificação OpenAPI em JSON |

Os modelos usam `pg` e um pool PostgreSQL partilhado. Parte da lógica de negócio, como login, logout e criação de cliente, é delegada a funções da base de dados, alinhando a aplicação com o DataLayer.

### 3.9 Arquitetura de navegação

A navegação do frontend foi centralizada em `FrontEnd/Js/geral/routes.js`. Este ficheiro define rotas atuais, caminhos legados e funções de redirecionamento/guard.

As sidebars são compostas por:

| Ficheiro | Função |
|----------|--------|
| `SidebarMenuCatalog.js` | Catálogo central de itens e mapeamento perfil → menus |
| `SidebarShell.js` | Estrutura comum da sidebar |
| `ClientSidebar.js` | Menu do cliente |
| `EmployeeSidebar.js` | Menu de funcionários |

Esta abordagem evita duplicar links por página e permite que o menu reflita o perfil do utilizador autenticado.

### 3.10 Documentação técnica

A API inclui documentação Swagger/OpenAPI, disponível em:

- `/api-docs/` para consulta visual;
- `/api-docs.json` para contrato JSON.

Isto é relevante para a defesa porque permite demonstrar que a aplicação não é apenas visual: existe um contrato técnico navegável, com endpoints, schemas, respostas esperadas e rotas protegidas.

### 3.11 Tópicos adicionais recomendados para a apresentação

Além dos tópicos pedidos, estes pontos ajudam a valorizar o trabalho:

| Tópico | Porquê abordar |
|--------|----------------|
| Separação por módulos | Mostra organização por áreas funcionais M1-M4 |
| Alinhamento com DataLayer | Demonstra que a aplicação respeita a arquitetura da BD |
| RBAC | Mostra maturidade na gestão de permissões |
| Swagger/OpenAPI | Evidencia documentação e testabilidade |
| Docker | Mostra preocupação com execução reprodutível |
| Limitações assumidas | Demonstra consciência técnica e transparência |

---

## 4. Ferramentas, frameworks e packages

| Categoria | Ferramentas / packages |
|-----------|------------------------|
| Frontend | HTML5, CSS3, JavaScript, Font Awesome, Bootstrap |
| Backend | Node.js, Express |
| Base de dados | PostgreSQL, package `pg` |
| Autenticação | `jsonwebtoken`, JWT Bearer |
| Configuração | `dotenv`, variáveis de ambiente |
| API/documentação | `swagger-jsdoc`, `swagger-ui-express`, OpenAPI |
| Segurança/API | `cors`, middlewares Express |
| PDF/documentos | `pdfkit` para geração de prescrições/documentos |
| Containers | Docker e Docker Compose |
| Integração externa | `@supabase/supabase-js`, presente como dependência preparada para integração |

O `docker-compose.yml` da aplicação expõe o serviço em `http://localhost:3000`, executa `npm start` e liga a API ao PostgreSQL através de variáveis de ambiente.

---

## 5. Limitações

O estado atual é adequado para demonstração académica, mas existem limitações importantes:

| Limitação | Impacto |
|-----------|---------|
| Mod3 comercial ainda reservado | A loja pública e as entradas internas existem, mas faturação, stock e relatórios não estão totalmente integrados no contrato montado |
| Algumas vistas RH são de apresentação/protótipo | Suportam a narrativa visual, mas nem todas representam fluxos completos API-backed |
| Token em `localStorage` | Simples para contexto académico, mas em produção exigiria análise de risco XSS e possível uso de cookies `HttpOnly` |
| Segredo JWT de desenvolvimento | Existe fallback caso `JWT_SECRET` não esteja configurado; em produção deve ser obrigatório |
| Password com SHA-256 simples | Funciona com o formato esperado pela BD, mas em produção seria preferível hash adaptativo como bcrypt/argon2 |
| CORS aberto | Útil em desenvolvimento, mas deve ser restringido por origem em produção |
| Validação frontend/backend variável | Há validações relevantes, mas podia haver uma camada mais uniforme de schemas de input |
| Testes automatizados limitados | A validação é sobretudo por execução manual, Swagger e fluxo de demonstração |

Estas limitações não invalidam a solução académica; pelo contrário, ajudam a demonstrar consciência crítica sobre a diferença entre protótipo funcional e sistema pronto para produção.

---

## 6. Conclusão

O website MiaCaoMigo demonstra uma aplicação web modular e integrada com base de dados, adequada ao contexto académico proposto. A solução cobre páginas públicas, autenticação, áreas distintas para cliente e funcionário, gestão de animais, marcação e acompanhamento de consultas, perfis de acesso e documentação técnica da API.

Os pontos mais fortes são a separação entre frontend/backend/DataLayer, a utilização de JWT com RBAC, a centralização da navegação e a existência de Swagger/OpenAPI. Para a apresentação, a melhor estratégia é mostrar um fluxo completo: visitante → login → área cliente → marcação de consulta → área funcionário → operação protegida → Swagger.

A principal mensagem final deve ser que o projeto não é apenas um conjunto de páginas, mas uma aplicação organizada por módulos, com integração real entre interface, API, permissões e base de dados, mantendo limitações claras para evolução futura.

---

[← Academic reports](README.md) · [Application architecture](../../04_Architecture/02_Application/README.md)

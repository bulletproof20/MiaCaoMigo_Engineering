# Sprint 4 — Modulo 2: Gestao de Animais

Analise de rastreabilidade entre a especificacao da Sprint 4 e a implementacao real do Modulo 2, focada em **Gestao de Animais**.

Fonte funcional analisada: `Sprint 04.pdf` (assumindo que o PDF contém os requisitos para este módulo).

Repositorios verificados:

- Aplicacao/API: `MiaCaoMigo_`
- Base de dados/QA: `MiaCaoMigo_DataLayer`

Legenda:

- **Implementado**: existe fluxo funcional e/ou regra executavel no frontend, API ou base de dados.
- **Parcial**: existe parte relevante, mas falta um detalhe pedido no PDF.
- **Nao evidenciado**: nao foi encontrada implementacao real suficiente.

## Sumario Executivo

O Módulo 2 está implementado para os fluxos principais de registo de animais, gestão de posse (associação cliente-animal), listagem de espécies e raças, listagem de animais para adoção e o processo de adoção por parte do cliente. A camada de base de dados inclui validações robustas para a consistência da posse e dados do animal.

As principais lacunas face a um sistema completo de gestão de animais (e inferidas do contexto disponível) são:

-   **Gestão de Ciclo de Vida do Animal**: Embora existam estados como 'Falecido' e 'Adotado' na lógica de negócio da base de dados, a interface/API para gerir explicitamente o ciclo de vida completo do animal (e.g., desativar, marcar como falecido) não foi evidenciada.
-   **Gestão de Entregas/Resgates**: As funções de base de dados suportam a consistência temporal de datas de entrega e resgate, mas não foram encontrados endpoints de API ou interfaces de utilizador para registar e gerir estes processos.
-   **Histórico de Posse**: A base de dados impede posses sobrepostas, mas não há um fluxo claro na API/UI para consultar o histórico completo de posse de um animal.
-   **Gestão de Fotos**: O modelo de dados prevê um `photo_path` para animais de adoção, mas não há endpoints de API para upload ou gestão de fotos.

## Prova Geral de Implementacao

### Aplicacao e API

| Area | Evidencia |
|------|-----------|
| Catalogo de especies | `Docs/Swagger/openapi.json` (`/api/animals/species` GET) |
| Catalogo de raças | `Docs/Swagger/openapi.json` (`/api/animals/breeds` GET) |
| Animais para adoção | `Docs/Swagger/openapi.json` (`/api/animals/adoptions` GET) |
| Adoção de animal | `Docs/Swagger/openapi.json` (`/api/animals/{id}/adopt` POST) |
| Meus animais (cliente) | `Docs/Swagger/openapi.json` (`/api/animals/me` GET) |
| Registar novo animal (staff) | `Docs/Swagger/openapi.json` (`/api/animals` POST) |
| Listar todos os animais (staff) | `Docs/Swagger/openapi.json` (`/api/animals` GET) |
| Listar animais de cliente (staff) | `Docs/Swagger/openapi.json` (`/api/animals/client/{clientId}` GET) |
| Associar animal a cliente (staff) | `Docs/Swagger/openapi.json` (`/api/animals/associate` POST) |
| Detalhe de animal | `Docs/Swagger/openapi.json` (`/api/animals/{id}` GET) |
| Atualizar animal (staff) | `Docs/Swagger/openapi.json` (`/api/animals/{id}` PUT) |
| Remover associação de animal (staff) | `Docs/Swagger/openapi.json` (`/api/animals/{id}` DELETE) |

### DataLayer

| Area | Evidencia |
|------|-----------|
| Bloqueio de posse animal inativo | `DataBase/Schema/02_Module2_Animal_Management/02_Functions_Mod2.sql` (`tfn_block_ownership_if_animal_inactive`) e `03_Triggers_Mod2.sql` (`trg_block_ownership_if_animal_inactive`) |
| Consistencia data entrega/resgate | `DataBase/Schema/02_Module2_Animal_Management/02_Functions_Mod2.sql` (`tfn_check_delivery_date_after_rescue`) e `03_Triggers_Mod2.sql` (`trg_check_delivery_date_consistency`) |
| Prevenção de posse sobreposta | `DataBase/Schema/02_Module2_Animal_Management/02_Functions_Mod2.sql` (`tfn_prevent_overlapping_ownership`) e `03_Triggers_Mod2.sql` (`trg_prevent_duplicate_active_ownership`) |
| Consistencia raça/espécie | `DataBase/Schema/02_Module2_Animal_Management/02_Functions_Mod2.sql` (`tfn_validate_breed_species_consistency`) e `03_Triggers_Mod2.sql` (`trg_validate_animal_breed_species`) |

## Processos de Negocio (Inferidos)

| ID | Processo (Inferido) | Estado | Prova / Observacao |
|----|---------------------|--------|--------------------|
| PN_M2_01 | Registo e Gestão de Animais | **Implementado** | Criação, visualização e atualização de animais via API (staff); visualização por cliente. |
| PN_M2_02 | Gestão de Posse de Animais | **Implementado** | Associação e remoção de posse via API (staff); validações de unicidade e estado do animal na BD. |
| PN_M2_03 | Gestão de Adoções | **Implementado** | Listagem de animais para adoção e processo de adoção por cliente via API. |
| PN_M2_04 | Gestão de Catálogos (Espécies/Raças) | **Implementado** | Listagem de espécies e raças via API. |
| PN_M2_05 | Gestão de Entregas/Resgates | **Parcial** | Lógica de validação de datas na BD existe, mas não há API/UI para o processo completo. |

## Requisitos Funcionais (Inferidos)

| ID | Requisito (Inferido) | Estado | Prova / Observacao |
|----|----------------------|--------|--------------------|
| RF_M2_01 | Registar um novo animal | **Implementado** | Endpoint `/api/animals` (POST) para staff. |
| RF_M2_02 | Visualizar detalhes de um animal | **Implementado** | Endpoint `/api/animals/{id}` (GET). |
| RF_M2_03 | Atualizar dados de um animal | **Implementado** | Endpoint `/api/animals/{id}` (PUT) para staff. |
| RF_M2_04 | Associar um animal a um cliente | **Implementado** | Endpoint `/api/animals/associate` (POST) para staff. |
| RF_M2_05 | Remover a associação de um animal a um cliente | **Implementado** | Endpoint `/api/animals/{id}` (DELETE) para staff. |
| RF_M2_06 | Listar animais de um cliente | **Implementado** | Endpoint `/api/animals/client/{clientId}` (GET) para staff e `/api/animals/me` (GET) para cliente. |
| RF_M2_07 | Listar espécies de animais | **Implementado** | Endpoint `/api/animals/species` (GET). |
| RF_M2_08 | Listar raças de animais (com filtro por espécie) | **Implementado** | Endpoint `/api/animals/breeds` (GET). |
| RF_M2_09 | Listar animais disponíveis para adoção | **Implementado** | Endpoint `/api/animals/adoptions` (GET). |
| RF_M2_10 | Cliente pode adotar um animal | **Implementado** | Endpoint `/api/animals/{id}/adopt` (POST). |
| RF_M2_11 | Gerir o ciclo de vida do animal (e.g., desativar, falecido) | **Nao evidenciado** | Estados são usados em validações de BD, mas não há API/UI explícita para transições de estado. |
| RF_M2_12 | Registar e gerir entregas/resgates de animais | **Nao evidenciado** | Funções de BD existem, mas não há API/UI para este processo. |
| RF_M2_13 | Consultar histórico de posse de um animal | **Nao evidenciado** | A API atual retorna apenas o proprietário ativo. |
| RF_M2_14 | Gerir fotos de animais | **Nao evidenciado** | O campo `photo_path` existe, mas não há API para upload/gestão. |

## Requisitos Nao Funcionais (Inferidos)

| ID | Requisito (Inferido) | Estado | Prova / Observacao |
|----|----------------------|--------|--------------------|
| RNF_M2_01 | Consistência de dados de posse | **Implementado** | Triggers e funções de BD garantem que um animal tem apenas um proprietário ativo e que não pode ser associado se inativo/falecido/adotado. |
| RNF_M2_02 | Consistência de dados de raça/espécie | **Implementado** | Trigger de BD garante que a raça pertence à espécie selecionada. |
| RNF_M2_03 | Consistência temporal de datas de entrega/resgate | **Implementado** | Trigger de BD garante que a data de entrega não é anterior à de resgate. |

## Regras de Negocio (Extraídas de `02_Functions_Mod2.sql` e `03_Triggers_Mod2.sql`)

| ID | Regra do PDF / Regra de BD | Estado | Prova / Observacao |
|----|----------------------------|--------|--------------------|
| RN_M2_01 | Não é possível atribuir posse a um animal inativo, falecido ou já adotado. | **Implementado** | `tfn_block_ownership_if_animal_inactive` e `trg_block_ownership_if_animal_inactive`. |
| RN_M2_02 | A data de entrega de um animal não pode ser anterior à sua data de resgate. | **Implementado** | `tfn_check_delivery_date_after_rescue` e `trg_check_delivery_date_consistency`. |
| RN_M2_03 | Um animal não pode ter mais de uma posse ativa simultaneamente. | **Implementado** | `tfn_prevent_overlapping_ownership` e `trg_prevent_duplicate_active_ownership`. |
| RN_M2_04 | A raça de um animal deve pertencer à espécie selecionada para esse animal. | **Implementado** | `tfn_validate_breed_species_consistency` e `trg_validate_animal_breed_species`. |

## Modelacao / Dicionario de Dados (Extraído de `openapi.json` e funções de BD)

| Entidade do PDF / Schema | Estado | Prova / Observacao |
|--------------------------|--------|--------------------|
| Species | **Implementado** | Schema `Species` no `openapi.json`, endpoint `/api/animals/species`. |
| Breed | **Implementado** | Schema `Breed` no `openapi.json`, endpoint `/api/animals/breeds`. |
| Animal | **Implementado com lacunas** | Schema `Animal` no `openapi.json`, endpoints de criação/visualização/atualização. Lacunas na gestão de ciclo de vida e fotos. |
| AdoptionAnimal | **Implementado** | Schema `AdoptionAnimal` no `openapi.json`, endpoint `/api/animals/adoptions`. |
| Ownership | **Implementado com lacunas** | Schema `Ownership` no `openapi.json`, endpoint `/api/animals/associate`. Lacunas na visualização do histórico. |
| Delivery | **Parcial** | Funções de BD (`tfn_check_delivery_date_after_rescue`) existem, mas não há schema ou endpoints explícitos na API. |

## Conclusao por Area

| Area | Estado global | Justificacao |
|------|---------------|--------------|
| Registo de Animais | **Implementado** | Criação, visualização e atualização de dados básicos do animal estão funcionais via API. |
| Gestão de Posse | **Implementado** | A associação e remoção de proprietários funciona, com validações robustas na BD para evitar inconsistências. |
| Adoção de Animais | **Implementado** | O fluxo de listagem e adoção de animais por clientes está funcional. |
| Catálogos (Espécies/Raças) | **Implementado** | A listagem e validação de espécies e raças estão implementadas. |
| Ciclo de Vida do Animal | **Parcial** | Os estados são reconhecidos na BD, mas a gestão completa do ciclo de vida via API/UI não está evidenciada. |
| Entregas/Resgates | **Nao evidenciado** | A lógica de BD existe, mas a funcionalidade não é exposta na API/UI. |
| Histórico de Posse | **Nao evidenciado** | A API atual não oferece uma forma de consultar o histórico completo de proprietários. |
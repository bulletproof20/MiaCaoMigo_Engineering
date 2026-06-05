-- =========================================================
-- {{MODULE_TITLE}} — PUBLIC API
-- FILE: Services/{{MODULE_FOLDER}}/99_Public_API.sql
-- =========================================================
--
-- Sole Services layer for this module: public entry points only.
-- Workflows live in Schema (or Services/01_Module1 for Module 1).
-- =========================================================

-- [optional] cleanup removed legacy aliases
-- drop function if exists {{LEGACY_NAME}}(...);

-- --- drops (idempotent reload) ---
drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});
-- repeat per function

-- --- {{SECTION_LABEL}} (e.g. lifecycle / read) ---

-- paste: public_api_delegate_call.tpl | public_api_view_read.tpl | public_api_custom_read.tpl | public_api_controlled_dml.tpl

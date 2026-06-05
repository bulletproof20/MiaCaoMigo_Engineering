-- Use header: 00_Meta/sql_file_header_schema.tpl (or compact core header below)
-- =========================================================
-- CORE TYPES
-- FILE: {{FILE_PATH}}
-- =========================================================
-- PURPOSE:   {{PURPOSE}}
-- DOMAIN:    Core
-- LOADED BY: {{LOADED_BY}}
-- CLEANUP:   inline DROP TYPE then CREATE
-- =========================================================

-- --- CLEANUP ---
drop type if exists {{TYPE_NAME}} cascade;

create type {{TYPE_NAME}} as enum (
    '{{ENUM_VALUE_1}}',
    '{{ENUM_VALUE_2}}'
);

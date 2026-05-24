-- =========================================================
-- MASTER DATA — {{MODULE_SCOPE}}
-- =========================================================
-- Tier: 00_MasterData (catalog / reference rows)
-- Loaded by: Bootstrap/Loaders/11_MasterData.sql
-- Prerequisite: init_core + TRUNCATE via 00_Data_Cleanup.sql
-- =========================================================

set timezone to 'Europe/Lisbon';

insert into {{TABLE_NAME}} ({{COLUMN_LIST}})
values
    ({{ROW_1_VALUES}}),
    ({{ROW_2_VALUES}});

[optional] on conflict (...) do nothing;

[optional] select setval(
    pg_get_serial_sequence('{{TABLE_NAME}}', '{{SERIAL_COLUMN}}'),
    (select coalesce(max({{SERIAL_COLUMN}}), 1) from {{TABLE_NAME}})
);

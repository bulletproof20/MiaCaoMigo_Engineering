-- Section: 00_Meta/object_section_header.tpl
-- File may start with DROP INDEX IF EXISTS for idempotent reload (Module 1 pattern).

-- =========================================================
-- {{INDEX_PURPOSE_TITLE}}
-- =========================================================
-- Optimizes:
--   - {{OPTIMIZATION_1}}
-- [optional] - {{OPTIMIZATION_2}}
-- =========================================================

drop index if exists {{INDEX_NAME}};

create {{UNIQUE_IF_NEEDED}} index {{INDEX_NAME}}
    on {{TABLE_NAME}} ({{INDEX_COLUMNS}})
    [optional] where ({{PARTIAL_INDEX_PREDICATE}});

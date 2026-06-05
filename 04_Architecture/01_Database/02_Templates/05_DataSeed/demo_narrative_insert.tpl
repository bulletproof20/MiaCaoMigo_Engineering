-- =========================================================
-- NARRATIVE DEMO — {{SCRIPT_TITLE}}
-- Story: {{NARRATIVE_SUMMARY}}
-- =========================================================
-- [optional] id anchors / cast notes for reviewers
-- =========================================================

set timezone to 'Europe/Lisbon';

insert into {{TABLE_NAME}} ({{COLUMN_LIST}})
overriding system value
values
    ({{ROW_VALUES}});

[optional] update {{TABLE_NAME}} set {{UPDATE_SET}} where {{UPDATE_WHERE}};

select setval(
    pg_get_serial_sequence('{{TABLE_NAME}}', '{{SERIAL_COLUMN}}'),
    (select coalesce(max({{SERIAL_COLUMN}}), 1) from {{TABLE_NAME}})
);

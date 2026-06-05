-- Section: 00_Meta/object_section_header.tpl
-- Requires pg_cron and target procedure from 05_Procedures_ModX.

select cron.schedule(
    '{{JOB_NAME}}',
    '{{CRON_EXPRESSION}}',
    $$ call {{PROCEDURE_NAME}}(); $$
);

-- Section: 00_Meta/object_section_header.tpl
-- Schema-layer procedures (Modules 2–4 primary pattern).

drop procedure if exists {{PROCEDURE_NAME}}({{ARG_TYPES}});

create or replace procedure {{PROCEDURE_NAME}}(
    {{PARAMETER_LIST}}
)
language plpgsql
as $$
declare
    {{DECLARE_VARIABLES}}
begin
    {{PROCEDURE_BODY}}
end;
$$;

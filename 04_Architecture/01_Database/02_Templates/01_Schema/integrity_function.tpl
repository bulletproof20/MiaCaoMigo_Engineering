-- Section: 00_Meta/object_section_header.tpl
-- Non-trigger functions (validation, helpers) in 02_Functions_ModX.

drop function if exists {{FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{FUNCTION_NAME}}({{ARGUMENTS}})
returns {{RETURN_TYPE}}
language {{LANGUAGE}}
[optional] stable
as $$
    {{FUNCTION_BODY}}
$$;

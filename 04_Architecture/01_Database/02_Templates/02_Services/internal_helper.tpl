-- Header + block: sql_file_header_services.tpl + services_object_block.tpl (Module 1 style)

drop function if exists {{FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{FUNCTION_NAME}}({{ARGUMENTS}})
returns {{RETURN_TYPE}}
language sql
stable
as $$
    {{HELPER_BODY}}
$$;

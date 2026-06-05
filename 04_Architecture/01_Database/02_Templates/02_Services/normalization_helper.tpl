-- Header: 00_Meta/sql_file_header_services.tpl (Core normalization files)

drop function if exists {{FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{FUNCTION_NAME}}({{ARGUMENTS}})
returns {{RETURN_TYPE}}
language sql
immutable
[optional] parallel safe
[optional] returns null on null input
as $$
    {{NORMALIZATION_EXPRESSION}}
$$;

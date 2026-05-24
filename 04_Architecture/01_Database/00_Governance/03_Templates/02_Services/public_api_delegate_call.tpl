-- Public API entry — delegates to Schema or Services procedure via CALL.
-- Used in 99_Public_API (Modules 2–3 write paths).

drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});

create function {{API_FUNCTION_NAME}}(
    {{PARAMETER_LIST}}
)
returns void
language plpgsql
as $$
begin
    call {{TARGET_PROCEDURE}}(
        {{CALL_ARGUMENTS}}
    );
end;
$$;

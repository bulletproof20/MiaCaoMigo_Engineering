-- Public API with controlled DML (exceptional — prefer Schema procedure when multi-step).
-- Pattern: svc_animal_exit (Module 2).

drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});

create function {{API_FUNCTION_NAME}}(
    {{PARAMETER_LIST}}
)
returns void
language plpgsql
as $$
begin
    {{DML_STATEMENTS}}

exception
    when others then
        raise exception using
            message = format('{{API_FUNCTION_NAME}} failed: %s', {{CONTEXT_ID}}),
            detail = sqlerrm,
            errcode = sqlstate;
end;
$$;

-- Public API entry — delegates to Services workflow function via SELECT (Module 1 pattern).

drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{API_FUNCTION_NAME}}(
    {{PARAMETER_LIST}}
)
returns {{RETURN_SHAPE}}
language sql
volatile
as $$
    select * from {{TARGET_FUNCTION}}({{FORWARD_ARGUMENTS}});
$$;

-- Variant (scalar return):
-- as $$
--     select {{TARGET_FUNCTION}}({{FORWARD_ARGUMENTS}});
-- $$;

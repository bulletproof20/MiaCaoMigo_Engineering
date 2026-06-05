-- Public API read with custom SQL (not a single-view passthrough).
-- Example: timeline union in Module 2.

drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});

create function {{API_FUNCTION_NAME}}({{PARAMETER_LIST}})
returns {{RETURN_SHAPE}}
language sql
stable
parallel safe
as $$
    {{CUSTOM_SELECT_BODY}}
$$;

-- Public API read facade over a Schema view (Modules 2–4 common pattern).

drop function if exists {{API_FUNCTION_NAME}}({{ARG_TYPES}});

create function {{API_FUNCTION_NAME}}(
    [optional] {{PARAMETER_LIST}}
)
returns {{RETURN_SHAPE}}
language sql
stable
parallel safe
as $$
    select *
    from {{TARGET_VIEW}}
    [optional] where {{FILTER_PREDICATE}}
    [optional] order by {{ORDER_BY}};
$$;

-- Single-row variant: returns {{ROW_TYPE}} instead of setof, limit implicit via where pk = $1

-- Header: file header from 05_Query_Helpers pattern
-- Section: object_section_header.tpl

drop function if exists {{FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{FUNCTION_NAME}}({{ARGUMENTS}})
returns {{RETURN_TYPE}}
language sql
stable
as $$
    with {{CTE_NAME}} as (
        select
            {{INNER_SELECT_LIST}},
            row_number() over (
                {{PARTITION_BY}}
                order by {{ORDER_BY_CLAUSE}}
            ) as {{RANK_ALIAS}}
        from {{SOURCE_TABLE}} {{ALIAS}}
        where {{FILTER_PREDICATE}}
    )
    select {{OUTER_SELECT}}
    from {{CTE_NAME}} {{ALIAS}}
    where {{ALIAS}}.{{RANK_ALIAS}} = 1;
$$;

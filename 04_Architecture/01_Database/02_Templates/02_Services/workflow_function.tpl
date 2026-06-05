-- Header: workflow_short or services full header

drop function if exists {{FUNCTION_NAME}}({{ARG_TYPES}});

create or replace function {{FUNCTION_NAME}}(
    {{PARAMETER_LIST}}
)
returns {{RETURN_SHAPE}}
language plpgsql
as $$

declare
    {{DECLARE_VARIABLES}}

begin

    {{WORKFLOW_BODY}}

    [optional] return query
    select {{RETURN_COLUMNS}};

end;
$$;

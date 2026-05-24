-- Header: workflow_short or services full header

drop procedure if exists {{PROCEDURE_NAME}}({{DROP_ARG_TYPES}});

create or replace procedure {{PROCEDURE_NAME}}(
    {{PARAMETER_LIST}}
)
language plpgsql
as $$
declare
    {{DECLARE_VARIABLES}}
begin

    {{WORKFLOW_BODY}}

end;
$$;

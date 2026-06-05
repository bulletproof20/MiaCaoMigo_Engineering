-- Section: 00_Meta/object_section_header.tpl

drop function if exists {{FUNCTION_NAME}}();

create or replace function {{FUNCTION_NAME}}()
returns trigger
language plpgsql
as $$
begin
    {{VALIDATION_OR_MUTATION_LOGIC}}

    return {{RETURN_CLAUSE}};
end;
$$;

-- Section: 00_Meta/object_section_header.tpl

drop trigger if exists {{TRIGGER_NAME}} on {{TABLE_NAME}};

create trigger {{TRIGGER_NAME}}
{{TIMING}} {{EVENT}} on {{TABLE_NAME}}
for each row
execute function {{FUNCTION_NAME}}();

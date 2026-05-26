-- Section: 00_Meta/object_section_header.tpl
-- Typically co-located in 04_Indexes_ModX (requires btree_gist extension).

alter table {{TABLE_NAME}} drop constraint if exists {{CONSTRAINT_NAME}};

alter table {{TABLE_NAME}}
    add constraint {{CONSTRAINT_NAME}}
    exclude using gist (
        {{EXCLUDE_COLUMNS_AND_OPERATORS}}
    )
    [optional] where ({{PARTIAL_PREDICATE}});

-- File header: 00_Meta/sql_file_header_schema.tpl or tables-specific header
-- Tables file may include module-level DROP CASCADE block before CREATE (Module 1 pattern).

--=========================================================
-- {{SECTION_NUMBER}}. {{TABLE_NAME_UPPER}}
--=========================================================
-- {{TABLE_PURPOSE}}

drop table if exists {{TABLE_NAME}} cascade;

create table {{TABLE_NAME}} (
    {{COLUMN_NAME}} {{COLUMN_TYPE}} {{NULLABILITY}},
    -- column comment

    constraint pk_{{TABLE_NAME}} primary key ({{PK_COLUMN}}),

  [optional] constraint uq_{{CONSTRAINT_SUFFIX}} unique ({{UNIQUE_COLUMNS}}),

  [optional] constraint ck_{{CONSTRAINT_SUFFIX}} check ({{CHECK_EXPRESSION}})
);

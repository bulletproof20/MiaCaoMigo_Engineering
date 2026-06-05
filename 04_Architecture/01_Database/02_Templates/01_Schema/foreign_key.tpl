-- File header: architecture note (FK layer) — see 01_ForeignKeys_ModX in DataLayer
--=========================================================
-- {{TABLE_NAME}} → {{REFERENCED_TABLE}}
--=========================================================

alter table {{TABLE_NAME}} drop constraint if exists {{CONSTRAINT_NAME}};
alter table {{TABLE_NAME}}
    add constraint {{CONSTRAINT_NAME}}
        foreign key ({{FK_COLUMNS}})
        references {{REFERENCED_TABLE}}({{REFERENCED_COLUMNS}})
        on delete {{ON_DELETE_ACTION}};

-- Section: 00_Meta/object_section_header.tpl
-- Entities / Purpose lines optional (see 07_Views_ModX).

drop view if exists {{VIEW_NAME}};

create view {{VIEW_NAME}} as
select
    {{SELECT_LIST}}
from {{FROM_CLAUSE}}
[optional] inner join {{JOIN_TABLE}} on {{JOIN_CONDITION}}
[optional] where {{FILTER_CONDITION}};

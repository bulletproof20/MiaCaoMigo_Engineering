-- =========================================================
-- QA FIXTURE — {{MODULE_SCOPE}} — {{FIXTURE_TITLE}}
-- =========================================================
-- TYPE:     fixture (data only)
-- REQUIRES: {{REQUIRES}}
--
-- SEMANTIC CATALOG (stable contract keys):
--   {{KEY_1}}  -> {{CONTRACT_FUNCTION_1}}()
--   {{KEY_2}}  -> {{CONTRACT_FUNCTION_2}}()
--
-- IDEMPOTENT: {{IDEMPOTENCE_STRATEGY}}
-- =========================================================

do $$
declare
    {{DECLARE_VARIABLES}}
begin
  [optional] if {{PRECONDITION}} is null then
        raise exception 'QA fixture: {{PRECONDITION_ERROR}}';
    end if;

    {{UPSERT_OR_INSERT_LOGIC}}
end;
$$;

-- postflight (optional):
-- select {{CONTRACT_FUNCTION_1}}();

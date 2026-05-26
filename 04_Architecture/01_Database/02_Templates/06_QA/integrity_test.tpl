-- =========================================================
-- INTEGRITY — {{MODULE_SCOPE}} — {{TEST_TITLE}}
-- =========================================================
-- TYPE:     01_Integrity
-- REQUIRES: {{REQUIRES}}
-- RULE:     {{RULE_UNDER_TEST}}
-- CONTRACT: {{CONTRACT_FUNCTIONS}}
-- =========================================================

do $$
declare
    {{DECLARE_VARIABLES}}
begin
    {{ACTION_THAT_SHOULD_FAIL_OR_PASS}};

    raise notice 'FAIL: {{FAIL_MESSAGE}}';
exception
    when others then
        if {{PASS_CONDITION_ON_SQLERRM}} then
            raise notice 'PASS: {{PASS_MESSAGE}} — %', sqlerrm;
        else
            raise notice 'FAIL: unexpected error — %', sqlerrm;
        end if;
end;
$$;

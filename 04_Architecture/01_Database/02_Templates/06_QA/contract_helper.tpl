-- =========================================================
-- QA CONTRACT — semantic lookup functions (Tests only)
-- =========================================================
-- Loaded by runners/run_fixtures.ps1 (QA layer only).
-- Resolves stable fixture / contract keys to current surrogate IDs.
-- Does not alter application Services or Bootstrap init.
-- =========================================================

create or replace function {{CONTRACT_FUNCTION_NAME}}()
returns {{RETURN_TYPE}}
language sql
stable
as $$
    select {{LOOKUP_EXPRESSION}}
    limit 1;
$$;

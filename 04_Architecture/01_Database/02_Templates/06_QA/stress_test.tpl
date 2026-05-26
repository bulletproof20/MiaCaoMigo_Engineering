-- =========================================================
-- STRESS — {{MODULE_SCOPE}} — {{TEST_TITLE}}
-- =========================================================
-- OBJECTIVE: {{OBJECTIVE}}
-- VOLUME:    {{VOLUME_DESCRIPTION}}
-- EXPECTED:  {{EXPECTED_BEHAVIOUR}}
-- METRICS:   {{METRICS_LIST}}
-- REQUIRES:  {{REQUIRES}}
-- CONTRACT:  {{CONTRACT_FUNCTIONS}}
-- =========================================================

do $$
declare
    v_attempts int := {{ATTEMPT_COUNT}};
    v_ok int := 0;
    v_block int := 0;
    v_i int;
    v_t0 timestamptz := clock_timestamp();
    v_t1 timestamptz;
    v_ms numeric;
begin
    {{SETUP_BLOCK}}

    for v_i in 1..v_attempts loop
        begin
            {{CONCURRENT_ACTION}};
            v_ok := v_ok + 1;
        exception
            when others then
                v_block := v_block + 1;
        end;
    end loop;

    v_t1 := clock_timestamp();
    v_ms := round(extract(epoch from (v_t1 - v_t0)) * 1000, 2);

    raise notice 'STRESS {{TEST_ID}}: attempts=% ok=% block=% duration_ms=%',
        v_attempts, v_ok, v_block, v_ms;

    {{POSTFLIGHT_ASSERTIONS}}
end;
$$;

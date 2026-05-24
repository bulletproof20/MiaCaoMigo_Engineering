-- =========================================================
-- BOOTSTRAP PROFILE — {{PROFILE_NAME}}
-- =========================================================
--
-- Pipeline: {{PIPELINE_SUMMARY}}
-- =========================================================

\echo '>>> profile: {{PROFILE_ID}}'

\set ON_ERROR_STOP on

\i /docker-entrypoint-initdb.d/Profiles/{{BASE_PROFILE}}.sql
\i /docker-entrypoint-initdb.d/Loaders/{{LOADER_1}}.sql
[optional] \i /docker-entrypoint-initdb.d/Loaders/{{LOADER_2}}.sql
\i /docker-entrypoint-initdb.d/Loaders/{{FINAL_LOADER}}.sql

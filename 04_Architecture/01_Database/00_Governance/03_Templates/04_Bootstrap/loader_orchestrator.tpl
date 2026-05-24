-- =========================================================
-- {{LAYER_NAME}} LOADER
-- =========================================================
--
-- DESCRIPTION
-- {{DESCRIPTION}}
--
-- [optional] ARCHITECTURE / PREREQUISITE / LOAD ORDER notes
-- =========================================================

\echo '========================================'
\echo '{{ECHO_BANNER}}'
\echo '========================================'

[optional] \set ON_ERROR_STOP on

\echo '=== {{SECTION_TITLE}} ==='

\echo '--- {{STEP_LABEL}} ---'
\i /docker-entrypoint-initdb.d/{{INCLUDE_PATH}}

-- repeat \echo + \i blocks in dependency order

\echo '========================================'
\echo '{{COMPLETION_BANNER}}'
\echo '========================================'

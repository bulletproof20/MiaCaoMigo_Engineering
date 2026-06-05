-- =========================================================
-- MIACAOMIGO — DATABASE INITIALIZATION (Bootstrap/init.sql)
-- =========================================================
--
-- DEFAULT PROFILE: Profiles/{{DEFAULT_PROFILE}}.sql
--
-- MOUNTS (docker-compose.yml)
--   DataBase/Bootstrap  → /docker-entrypoint-initdb.d
--   DataBase/Schema     → /docker-entrypoint-initdb.d/Schema
--   DataBase/Comments   → /docker-entrypoint-initdb.d/Comments
--   DataBase/Services   → /docker-entrypoint-initdb.d/Services
--   DataBase/DataSeed   → /docker-entrypoint-initdb.d/DataSeed
-- =========================================================

\echo '========================================'
\echo 'MIACAOMIGO DATABASE INITIALIZATION'
\echo '========================================'

\set ON_ERROR_STOP on
\set QUIET 1
set client_min_messages to warning;

\echo '>>> setting timezone to Europe/Lisbon'
set timezone to 'Europe/Lisbon';

\i /docker-entrypoint-initdb.d/Profiles/{{DEFAULT_PROFILE}}.sql

\set QUIET 0

\echo '========================================'
\echo 'INITIALIZATION COMPLETE'
\echo '========================================'

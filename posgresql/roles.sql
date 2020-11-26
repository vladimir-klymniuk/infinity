SELECT datname FROM pg_database;

CREATE ROLE readonly;
CREATE ROLE readwrite;

CREATE ROLE api_app_readonly NOINHERIT;
CREATE ROLE adm_app_readonly NOINHERIT;
CREATE ROLE twitch_app_readonly NOINHERIT;
CREATE ROLE tds_app_readonly NOINHERIT;

CREATE ROLE api_app_readwrite NOINHERIT;
CREATE ROLE adm_app_readwrite NOINHERIT;
CREATE ROLE twitch_app_readwrite NOINHERIT;
CREATE ROLE tds_app_readwrite NOINHERIT;

CREATE ROLE tds_app;
CREATE ROLE twitch_app;
CREATE ROLE adm_app;
CREATE ROLE api_app;

CREATE ROLE user;
CREATE ROLE wheel NOINHERIT;
CREATE ROLE admin;

CREATE DATABASE api_app OWNER wheel;
CREATE DATABASE adm_app OWNER wheel;
CREATE DATABASE tds_app OWNER wheel;
CREATE DATABASE twitch_app OWNER wheel;

ALTER DATABASE api_app SET geqo TO off;
ALTER DATABASE adm_app SET geqo TO off;
ALTER DATABASE tds_app SET geqo TO off;
ALTER DATABASE twitch_app SET geqo TO off;

GRANT readonly TO admin;
GRANT readwrite TO admin;

CREATE USER vk WITH PASSWORD 'ek9dtb0yr33at3g';
GRANT admin TO vk;

GRANT tds_app_readwrite TO tds_app;
GRANT twitch_app_readwrite TO twitch_app;
GRANT adm_app_readwrite TO adm_app;
GRANT api_app_readwrite TO api_app;

-- tds_app
-- twitch_app
-- adm_app
-- api_app

REVOKE ALL ON DATABASE tds_app FROM public;
REVOKE ALL ON DATABASE twitch_app FROM public;
REVOKE ALL ON DATABASE adm_app FROM public;
REVOKE ALL ON DATABASE api_app FROM public;

GRANT CONNECT ON DATABASE tds_app TO tds_app_readonly;
GRANT CONNECT ON DATABASE twitch_app TO twitch_app_readonly;
GRANT CONNECT ON DATABASE adm_app TO adm_app_readonly;
GRANT CONNECT ON DATABASE api_app TO api_app_readonly;

GRANT CONNECT ON DATABASE tds_app TO tds_app_readwrite;
GRANT CONNECT ON DATABASE twitch_app TO twitch_app_readwrite;
GRANT CONNECT ON DATABASE adm_app TO adm_app_readwrite;
GRANT CONNECT ON DATABASE api_app TO api_app_readwrite;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA tds_app.public TO tds_app_readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA twitch_app.public TO twitch_app_readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA adm_app.public TO adm_app_readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA api_app.public TO api_app_readwrite;

-- GRANT USAGE ON ALL SEQUENCES IN SCHEMA tds_app.public TO tds_app_readwrite;
-- GRANT USAGE ON ALL SEQUENCES IN SCHEMA twitch_app TO twitch_app_readwrite;
-- GRANT USAGE ON ALL SEQUENCES IN SCHEMA adm_app.public TO adm_app_readwrite;
-- GRANT USAGE ON ALL SEQUENCES IN SCHEMA api_app.public TO api_app_readwrite;

-- Users creation
CREATE USER tds_app_user WITH PASSWORD '__';
CREATE USER twitch_app_user WITH PASSWORD '__';
CREATE USER adm_app_user WITH PASSWORD '__';
CREATE USER api_app_user WITH PASSWORD '__';

GRANT tds_app_readwrite TO tds_app_user;
GRANT twitch_app_readwrite TO twitch_app_user;
GRANT adm_app_readwrite TO adm_app_user;
GRANT api_app_readwrite TO api_app_user;


-- GRANT CONNECT ON DATABASE adm_app TO adm_app_readonly;
-- GRANT SELECT ON DATABASE adm_app IN SCHEMA public TO adm_app_readonly;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA dm_app.public GRANT SELECT ON TABLES TO adm_app_readonly;

-- GRANT CONNECT ON DATABASE adm_app TO adm_app_readwrite;
-- GRANT USAGE, CREATE IN SCHEMA public TO adm_app_readwrite;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA dm_app.public TO adm_app_readwrite;

-- ALTER DEFAULT PRIVILEGES IN SCHEMA dm_app.public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO adm_app_readwrite;
-- GRANT USAGE ON ALL SEQUENCES IN SCHEMA dm_app.public TO adm_app_readwrite;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA dm_app.public GRANT USAGE ON SEQUENCES TO adm_app_readwrite;

-- Users creation
-- CREATE USER adm_app_user WITH PASSWORD '__';
-- GRANT readwrite TO adm_app_user;

-- REVOKE ALL ON DATABASE adm_app FROM public;
-- GRANT CONNECT ON DATABASE adm_app TO adm_app_readonly;
-- GRANT USAGE ON SCHEMA adm_app TO adm_app_readonly;

-- GRANT USAGE ON ALL SEQUENCES ON DATABASE adm_app IN SCHEMA public TO adm_app_readwrite;
-- ALTER DEFAULT PRIVILEGES ON DATABASE adm_app IN SCHEMA public GRANT USAGE ON SEQUENCES TO adm_app_readwrite;
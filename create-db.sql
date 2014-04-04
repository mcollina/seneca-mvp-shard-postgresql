--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.1
-- Started on 2014-03-24 16:38:19 GMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE noshard;
--
-- TOC entry 2240 (class 1262 OID 16393)
-- Name: noshard; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE noshard WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE noshard OWNER TO postgres;

\connect noshard

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 176 (class 3079 OID 12018)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


-- DROP TABLE sys_entity;

CREATE TABLE sys_entity
(
  base character varying(255),
  name character varying(255),
  zone character varying,
  fields json,
  id uuid NOT NULL,
  seneca json,
  CONSTRAINT pk_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_entity
  OWNER TO postgres;



-- DROP TABLE sys_account;

CREATE TABLE sys_account
(
  id uuid NOT NULL,
  orignick character varying,
  name character varying,
  origuser character varying,
  active boolean,
  users character varying,
  projects character varying,
  seneca character varying,
  CONSTRAINT pk_sys_account_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_account
  OWNER TO postgres;



-- DROP TABLE sys_login;

CREATE TABLE sys_login
(
  id uuid,
  nick character varying,
  email character varying,
  "user" uuid,
  "when" date,
  why character varying,
  token character varying,
  active boolean,
  seneca character varying,
  ended character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_login
  OWNER TO postgres;



-- DROP TABLE sys_project;

CREATE TABLE sys_project
(
  id uuid NOT NULL,
  kind character varying,
  account uuid,
  name character varying,
  active boolean,
  code character varying,
  CONSTRAINT pk_sys_project_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_project
  OWNER TO postgres;



-- DROP TABLE sys_settings;

CREATE TABLE sys_settings
(
  id uuid NOT NULL,
  kind character varying,
  spec character varying,
  data json,
  seneca json,
  ref uuid,
  settings json,
  CONSTRAINT pk_sys_settings_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_settings
  OWNER TO postgres;



-- DROP TABLE sys_user;

CREATE TABLE sys_user
(
  id uuid NOT NULL,
  nick character varying,
  email character varying,
  name character varying,
  active boolean,
  "when" date,
  confirmed boolean,
  confirmcode uuid,
  salt character varying,
  pass character varying,
  dateregistered date,
  admin boolean,
  accounts character varying,
  seneca character varying,
  CONSTRAINT pk_sys_user_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_user
  OWNER TO postgres;


-- DROP TABLE sys_case;

CREATE TABLE sys_case
(
  id uuid NOT NULL,
  name character varying NOT NULL,
  subject character varying,
  message character varying,
  custom json,
  seneca character varying,
  CONSTRAINT pk_sys_case_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_case
  OWNER TO postgres;

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;



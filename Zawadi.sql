--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u89ucbqd2f5cc7
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u89ucbqd2f5cc7;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pwwoiqfkebqgtp
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO pwwoiqfkebqgtp;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA heroku_ext;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_abnfeature; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_abnfeature (
    id bigint NOT NULL,
    type_of character varying(150),
    total integer NOT NULL,
    total_urg integer NOT NULL,
    created_at date NOT NULL,
    transaction_id text,
    seller_id bigint,
    count integer NOT NULL,
    expired_date date,
    is_freed boolean NOT NULL
);


ALTER TABLE public.app_abnfeature OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_abnfeature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_abnfeature_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_abnfeature_id_seq OWNED BY public.app_abnfeature.id;


--
-- Name: app_admintoken; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_admintoken (
    id bigint NOT NULL,
    name character varying(150),
    token text,
    is_checked boolean NOT NULL
);


ALTER TABLE public.app_admintoken OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_admintoken_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_admintoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_admintoken_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_admintoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_admintoken_id_seq OWNED BY public.app_admintoken.id;


--
-- Name: app_category; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_category (
    id bigint NOT NULL,
    name character varying(250),
    is_visible boolean NOT NULL,
    label_id bigint,
    dprice integer NOT NULL
);


ALTER TABLE public.app_category OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_category_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_category_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_category_id_seq OWNED BY public.app_category.id;


--
-- Name: app_client; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_client (
    id bigint NOT NULL,
    point integer NOT NULL,
    user_id bigint,
    phone character varying(200),
    whatsapp character varying(200)
);


ALTER TABLE public.app_client OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_client_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_client_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_client_id_seq OWNED BY public.app_client.id;


--
-- Name: app_clientdemand; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_clientdemand (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    category_id bigint,
    client_id bigint,
    subs_id bigint,
    emergency character varying(250),
    point integer NOT NULL,
    is_out boolean NOT NULL,
    date date,
    budget character varying(150),
    detail text,
    num integer,
    num_vend integer NOT NULL,
    quart text,
    slug text,
    state character varying(100),
    parrain_id bigint,
    sold boolean NOT NULL
);


ALTER TABLE public.app_clientdemand OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_clicked; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_clientdemand_clicked (
    id bigint NOT NULL,
    clientdemand_id bigint NOT NULL,
    selleraccount_id bigint NOT NULL
);


ALTER TABLE public.app_clientdemand_clicked OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_clicked_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_clientdemand_clicked_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_clientdemand_clicked_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_clicked_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_clientdemand_clicked_id_seq OWNED BY public.app_clientdemand_clicked.id;


--
-- Name: app_clientdemand_files; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_clientdemand_files (
    id bigint NOT NULL,
    clientdemand_id bigint NOT NULL,
    myfiles_id bigint NOT NULL
);


ALTER TABLE public.app_clientdemand_files OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_clientdemand_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_clientdemand_files_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_clientdemand_files_id_seq OWNED BY public.app_clientdemand_files.id;


--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_clientdemand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_clientdemand_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_clientdemand_id_seq OWNED BY public.app_clientdemand.id;


--
-- Name: app_feedback; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_feedback (
    id bigint NOT NULL,
    "user" character varying(250),
    seller character varying(250),
    picture character varying(100),
    text text,
    rank integer NOT NULL
);


ALTER TABLE public.app_feedback OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_feedback_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_feedback_id_seq OWNED BY public.app_feedback.id;


--
-- Name: app_label; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_label (
    id bigint NOT NULL,
    name character varying(150),
    is_on boolean NOT NULL
);


ALTER TABLE public.app_label OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_label_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_label_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_label_id_seq OWNED BY public.app_label.id;


--
-- Name: app_myfiles; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_myfiles (
    id bigint NOT NULL,
    name character varying(150),
    file character varying(100),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.app_myfiles OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_myfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_myfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_myfiles_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_myfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_myfiles_id_seq OWNED BY public.app_myfiles.id;


--
-- Name: app_parrain; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_parrain (
    id bigint NOT NULL,
    whatsapp character varying(150),
    full_name character varying(250),
    email character varying(254),
    ident character varying(150),
    money integer,
    current integer NOT NULL,
    status boolean NOT NULL,
    tof character varying(100),
    act_err text,
    veracity integer
);


ALTER TABLE public.app_parrain OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_parrain_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_parrain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_parrain_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_parrain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_parrain_id_seq OWNED BY public.app_parrain.id;


--
-- Name: app_retrait; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_retrait (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    montant integer,
    solded boolean NOT NULL,
    parrain_id bigint
);


ALTER TABLE public.app_retrait OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_retrait_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_retrait_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_retrait_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_retrait_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_retrait_id_seq OWNED BY public.app_retrait.id;


--
-- Name: app_selleraccount; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_selleraccount (
    id bigint NOT NULL,
    name character varying(250),
    user_id bigint,
    count bigint NOT NULL,
    created_at date,
    last_abn timestamp with time zone,
    picture character varying(100),
    type_of character varying(150),
    speed integer NOT NULL,
    abn_count integer NOT NULL,
    rest integer NOT NULL,
    expired_date date,
    has_freed boolean NOT NULL,
    whatsapp character varying(150),
    damount integer,
    damount_init integer,
    dprice integer,
    dm_alert boolean NOT NULL,
    format_number character varying(100)
);


ALTER TABLE public.app_selleraccount OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_category; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_selleraccount_category (
    id bigint NOT NULL,
    selleraccount_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.app_selleraccount_category OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_selleraccount_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_category_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_selleraccount_category_id_seq OWNED BY public.app_selleraccount_category.id;


--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_selleraccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_selleraccount_id_seq OWNED BY public.app_selleraccount.id;


--
-- Name: app_selleraccount_subs; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_selleraccount_subs (
    id bigint NOT NULL,
    selleraccount_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


ALTER TABLE public.app_selleraccount_subs OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_selleraccount_subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_subs_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_selleraccount_subs_id_seq OWNED BY public.app_selleraccount_subs.id;


--
-- Name: app_subcategory; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_subcategory (
    id bigint NOT NULL,
    name character varying(250),
    is_visible boolean NOT NULL,
    box_id bigint,
    default_price integer,
    sub_box_id bigint
);


ALTER TABLE public.app_subcategory OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_subcategory_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_subcategory_id_seq OWNED BY public.app_subcategory.id;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150),
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(150),
    last_name character varying(150),
    country character varying(15),
    towns character varying(250),
    quart text
);


ALTER TABLE public.app_user OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_groups; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_user_groups OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_groups_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_user_groups_id_seq OWNED BY public.app_user_groups.id;


--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- Name: app_user_user_permissions; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_user_user_permissions OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_permissions_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_user_user_permissions_id_seq OWNED BY public.app_user_user_permissions.id;


--
-- Name: app_usergame; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_usergame (
    id bigint NOT NULL,
    value1 character varying(150),
    value2 character varying(150),
    day date NOT NULL,
    user_id bigint
);


ALTER TABLE public.app_usergame OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_usergame_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_usergame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usergame_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_usergame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_usergame_id_seq OWNED BY public.app_usergame.id;


--
-- Name: app_weekcustom; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_weekcustom (
    id bigint NOT NULL,
    begun date,
    "end" date,
    is_on boolean NOT NULL,
    seller_id bigint,
    next integer NOT NULL,
    prev integer NOT NULL,
    max integer NOT NULL,
    max_urg integer NOT NULL
);


ALTER TABLE public.app_weekcustom OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_weekcustom_demandes; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_weekcustom_demandes (
    id bigint NOT NULL,
    weekcustom_id bigint NOT NULL,
    clientdemand_id bigint NOT NULL
);


ALTER TABLE public.app_weekcustom_demandes OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_weekcustom_demandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_weekcustom_demandes_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_weekcustom_demandes_id_seq OWNED BY public.app_weekcustom_demandes.id;


--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_weekcustom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_weekcustom_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_weekcustom_id_seq OWNED BY public.app_weekcustom.id;


--
-- Name: app_zawadidetail; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.app_zawadidetail (
    id bigint NOT NULL,
    key character varying(250),
    value text
);


ALTER TABLE public.app_zawadidetail OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.app_zawadidetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_zawadidetail_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.app_zawadidetail_id_seq OWNED BY public.app_zawadidetail.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: blog_articles; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_articles (
    id bigint NOT NULL,
    title character varying(150),
    subtitle text NOT NULL,
    vues integer NOT NULL,
    rvues integer NOT NULL,
    html text,
    created_at timestamp with time zone NOT NULL,
    slug text,
    dem character varying(180),
    dem_pk integer,
    main_img_id bigint,
    video_id bigint,
    whatsapp_title character varying(65)
);


ALTER TABLE public.blog_articles OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_articles_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_articles_id_seq OWNED BY public.blog_articles.id;


--
-- Name: blog_articles_ssubject; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_articles_ssubject (
    id bigint NOT NULL,
    articles_id bigint NOT NULL,
    subsubjects_id bigint NOT NULL
);


ALTER TABLE public.blog_articles_ssubject OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_ssubject_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_articles_ssubject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_articles_ssubject_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_ssubject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_articles_ssubject_id_seq OWNED BY public.blog_articles_ssubject.id;


--
-- Name: blog_articles_subject; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_articles_subject (
    id bigint NOT NULL,
    articles_id bigint NOT NULL,
    subject_id bigint NOT NULL
);


ALTER TABLE public.blog_articles_subject OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_articles_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_articles_subject_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_articles_subject_id_seq OWNED BY public.blog_articles_subject.id;


--
-- Name: blog_articles_subs; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_articles_subs (
    id bigint NOT NULL,
    articles_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


ALTER TABLE public.blog_articles_subs OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_subs_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_articles_subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_articles_subs_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_articles_subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_articles_subs_id_seq OWNED BY public.blog_articles_subs.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_comment (
    id bigint NOT NULL,
    text text,
    for_zawadi boolean NOT NULL,
    point integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_published boolean NOT NULL,
    article_id bigint,
    user_id bigint,
    date_seen timestamp with time zone
);


ALTER TABLE public.blog_comment OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;


--
-- Name: blog_subject; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_subject (
    id bigint NOT NULL,
    name character varying(150),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_subject OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_subject_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_subject_id_seq OWNED BY public.blog_subject.id;


--
-- Name: blog_subsubjects; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_subsubjects (
    id bigint NOT NULL,
    name character varying(150),
    created_at timestamp with time zone NOT NULL,
    box_id bigint
);


ALTER TABLE public.blog_subsubjects OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_subsubjects_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_subsubjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_subsubjects_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_subsubjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_subsubjects_id_seq OWNED BY public.blog_subsubjects.id;


--
-- Name: blog_videoart; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.blog_videoart (
    id bigint NOT NULL,
    file_id bigint
);


ALTER TABLE public.blog_videoart OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_videoart_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.blog_videoart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_videoart_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: blog_videoart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.blog_videoart_id_seq OWNED BY public.blog_videoart.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: fcm_django_fcmdevice; Type: TABLE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE TABLE public.fcm_django_fcmdevice (
    id integer NOT NULL,
    name character varying(255),
    active boolean NOT NULL,
    date_created timestamp with time zone,
    device_id character varying(255),
    registration_id text NOT NULL,
    type character varying(10) NOT NULL,
    user_id bigint
);


ALTER TABLE public.fcm_django_fcmdevice OWNER TO pwwoiqfkebqgtp;

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE SEQUENCE public.fcm_django_fcmdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fcm_django_fcmdevice_id_seq OWNER TO pwwoiqfkebqgtp;

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER SEQUENCE public.fcm_django_fcmdevice_id_seq OWNED BY public.fcm_django_fcmdevice.id;


--
-- Name: app_abnfeature id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_abnfeature ALTER COLUMN id SET DEFAULT nextval('public.app_abnfeature_id_seq'::regclass);


--
-- Name: app_admintoken id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_admintoken ALTER COLUMN id SET DEFAULT nextval('public.app_admintoken_id_seq'::regclass);


--
-- Name: app_category id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_category ALTER COLUMN id SET DEFAULT nextval('public.app_category_id_seq'::regclass);


--
-- Name: app_client id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_client ALTER COLUMN id SET DEFAULT nextval('public.app_client_id_seq'::regclass);


--
-- Name: app_clientdemand id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand ALTER COLUMN id SET DEFAULT nextval('public.app_clientdemand_id_seq'::regclass);


--
-- Name: app_clientdemand_clicked id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_clicked ALTER COLUMN id SET DEFAULT nextval('public.app_clientdemand_clicked_id_seq'::regclass);


--
-- Name: app_clientdemand_files id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_files ALTER COLUMN id SET DEFAULT nextval('public.app_clientdemand_files_id_seq'::regclass);


--
-- Name: app_feedback id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_feedback ALTER COLUMN id SET DEFAULT nextval('public.app_feedback_id_seq'::regclass);


--
-- Name: app_label id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_label ALTER COLUMN id SET DEFAULT nextval('public.app_label_id_seq'::regclass);


--
-- Name: app_myfiles id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_myfiles ALTER COLUMN id SET DEFAULT nextval('public.app_myfiles_id_seq'::regclass);


--
-- Name: app_parrain id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_parrain ALTER COLUMN id SET DEFAULT nextval('public.app_parrain_id_seq'::regclass);


--
-- Name: app_retrait id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_retrait ALTER COLUMN id SET DEFAULT nextval('public.app_retrait_id_seq'::regclass);


--
-- Name: app_selleraccount id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_id_seq'::regclass);


--
-- Name: app_selleraccount_category id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_category ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_category_id_seq'::regclass);


--
-- Name: app_selleraccount_subs id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_subs ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_subs_id_seq'::regclass);


--
-- Name: app_subcategory id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_subcategory ALTER COLUMN id SET DEFAULT nextval('public.app_subcategory_id_seq'::regclass);


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- Name: app_user_groups id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_groups ALTER COLUMN id SET DEFAULT nextval('public.app_user_groups_id_seq'::regclass);


--
-- Name: app_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_permissions_id_seq'::regclass);


--
-- Name: app_usergame id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_usergame ALTER COLUMN id SET DEFAULT nextval('public.app_usergame_id_seq'::regclass);


--
-- Name: app_weekcustom id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom ALTER COLUMN id SET DEFAULT nextval('public.app_weekcustom_id_seq'::regclass);


--
-- Name: app_weekcustom_demandes id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom_demandes ALTER COLUMN id SET DEFAULT nextval('public.app_weekcustom_demandes_id_seq'::regclass);


--
-- Name: app_zawadidetail id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_zawadidetail ALTER COLUMN id SET DEFAULT nextval('public.app_zawadidetail_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: blog_articles id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles ALTER COLUMN id SET DEFAULT nextval('public.blog_articles_id_seq'::regclass);


--
-- Name: blog_articles_ssubject id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_ssubject ALTER COLUMN id SET DEFAULT nextval('public.blog_articles_ssubject_id_seq'::regclass);


--
-- Name: blog_articles_subject id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subject ALTER COLUMN id SET DEFAULT nextval('public.blog_articles_subject_id_seq'::regclass);


--
-- Name: blog_articles_subs id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subs ALTER COLUMN id SET DEFAULT nextval('public.blog_articles_subs_id_seq'::regclass);


--
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);


--
-- Name: blog_subject id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_subject ALTER COLUMN id SET DEFAULT nextval('public.blog_subject_id_seq'::regclass);


--
-- Name: blog_subsubjects id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_subsubjects ALTER COLUMN id SET DEFAULT nextval('public.blog_subsubjects_id_seq'::regclass);


--
-- Name: blog_videoart id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_videoart ALTER COLUMN id SET DEFAULT nextval('public.blog_videoart_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: fcm_django_fcmdevice id; Type: DEFAULT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.fcm_django_fcmdevice ALTER COLUMN id SET DEFAULT nextval('public.fcm_django_fcmdevice_id_seq'::regclass);


--
-- Data for Name: app_abnfeature; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_abnfeature (id, type_of, total, total_urg, created_at, transaction_id, seller_id, count, expired_date, is_freed) FROM stdin;
5	free	0	0	2022-12-04	...	5	0	2023-01-03	t
6	free	0	0	2022-12-05	...	6	0	2023-01-04	t
7	free	0	0	2022-12-05	...	7	0	2023-01-04	t
8	free	0	0	2022-12-05	...	8	0	2023-01-04	t
9	free	0	0	2022-12-05	...	9	0	2023-01-04	t
10	free	0	0	2022-12-05	...	10	0	2023-01-04	t
11	free	0	0	2022-12-05	...	11	0	2023-01-04	t
12	free	0	0	2022-12-05	...	12	0	2023-01-04	t
13	free	0	0	2022-12-06	...	13	0	2023-01-05	t
14	free	0	0	2022-12-06	...	14	0	2023-01-05	t
15	free	0	0	2022-12-06	...	15	0	2023-01-05	t
16	free	0	0	2022-12-06	...	16	0	2023-01-05	t
17	free	0	0	2022-12-06	...	17	0	2023-01-05	t
18	free	0	0	2022-12-06	...	18	0	2023-01-05	t
19	free	0	0	2022-12-06	...	19	0	2023-01-05	t
20	free	0	0	2022-12-06	...	20	0	2023-01-05	t
22	free	0	0	2022-12-07	...	22	0	2023-01-06	t
23	free	0	0	2022-12-07	...	23	0	2023-01-06	t
24	free	0	0	2022-12-07	...	24	0	2023-01-06	t
25	free	0	0	2022-12-07	...	25	0	2023-01-06	t
26	free	0	0	2022-12-07	...	26	0	2023-01-06	t
27	free	0	0	2022-12-07	...	27	0	2023-01-06	t
28	free	0	0	2022-12-07	...	28	0	2023-01-06	t
29	free	0	0	2022-12-07	...	29	0	2023-01-06	t
30	free	0	0	2022-12-07	...	30	0	2023-01-06	t
31	free	0	0	2022-12-07	...	31	0	2023-01-06	t
32	free	0	0	2022-12-07	...	32	0	2023-01-06	t
33	free	0	0	2022-12-08	...	33	0	2023-01-07	t
34	free	0	0	2022-12-08	...	34	0	2023-01-07	t
35	free	0	0	2022-12-08	...	35	0	2023-01-07	t
36	free	0	0	2022-12-08	...	36	0	2023-01-07	t
37	free	0	0	2022-12-08	...	37	0	2023-01-07	t
38	free	0	0	2022-12-08	...	38	0	2023-01-07	t
39	free	0	0	2022-12-08	...	39	0	2023-01-07	t
40	free	0	0	2022-12-08	...	40	0	2023-01-07	t
41	free	0	0	2022-12-08	...	41	0	2023-01-07	t
42	free	0	0	2022-12-10	...	42	0	2023-01-09	t
43	free	0	0	2022-12-10	...	43	0	2023-01-09	t
44	free	0	0	2022-12-10	...	44	0	2023-01-09	t
45	free	0	0	2022-12-10	...	45	0	2023-01-09	t
46	free	0	0	2022-12-11	...	46	0	2023-01-10	t
47	free	0	0	2022-12-11	...	47	0	2023-01-10	t
48	free	0	0	2022-12-12	...	48	0	2023-01-11	t
49	free	0	0	2022-12-14	...	49	0	2023-01-13	t
50	free	0	0	2022-12-21	...	50	0	2023-01-20	t
51	free	0	0	2022-12-21	...	51	0	2023-01-20	t
52	free	0	0	2022-12-22	...	52	0	2023-01-21	t
53	free	0	0	2022-12-30	...	53	0	2023-01-29	t
54	free	0	0	2022-12-31	...	54	0	2023-01-30	t
55	free	0	0	2023-01-02	...	55	0	2023-02-01	t
56	free	0	0	2023-01-07	...	56	0	2023-02-06	t
57	free	0	0	2023-01-14	free_account	57	0	2023-02-13	t
58	free	0	0	2023-01-16	free_account	58	0	2023-02-15	t
59	free	0	0	2023-01-18	free_account	59	0	2023-02-17	t
61	free	0	0	2023-01-18	free_account	61	0	2023-02-17	t
62	basique	0	0	2023-01-19	5814364490023911	26	0	2023-02-18	f
63	free	0	0	2023-01-19	free_account	62	0	2023-02-18	t
64	free	0	0	2023-01-20	free_account	63	0	2023-02-19	t
65	free	0	0	2023-01-20	free_account	64	0	2023-02-19	t
66	free	0	0	2023-01-24	free_account	65	0	2023-02-23	t
67	free	0	0	2023-01-24	free_account	66	0	2023-02-23	t
68	free	0	0	2023-01-24	free_account	67	0	2023-02-23	t
69	free	0	0	2023-01-24	free_account	68	0	2023-02-23	t
70	free	0	0	2023-01-25	free_account	69	0	2023-02-24	t
71	free	0	0	2023-01-25	free_account	70	0	2023-02-24	t
72	free	0	0	2023-01-25	free_account	71	0	2023-02-24	t
73	free	0	0	2023-01-25	free_account	72	0	2023-02-24	t
74	free	0	0	2023-01-25	free_account	73	0	2023-02-24	t
75	free	0	0	2023-01-25	free_account	74	0	2023-02-24	t
76	free	0	0	2023-01-25	free_account	75	0	2023-02-24	t
77	free	0	0	2023-01-25	free_account	76	0	2023-02-24	t
78	free	0	0	2023-01-25	free_account	77	0	2023-02-24	t
79	free	0	0	2023-01-25	free_account	78	0	2023-02-24	t
80	free	0	0	2023-01-26	free_account	79	0	2023-02-25	t
81	free	0	0	2023-01-26	free_account	80	0	2023-02-25	t
82	free	0	0	2023-01-26	free_account	81	0	2023-02-25	t
83	free	0	0	2023-01-26	free_account	82	0	2023-02-25	t
84	free	0	0	2023-01-26	free_account	83	0	2023-02-25	t
85	free	0	0	2023-01-26	free_account	84	0	2023-02-25	t
86	free	0	0	2023-01-26	free_account	85	0	2023-02-25	t
87	free	0	0	2023-01-26	free_account	86	0	2023-02-25	t
88	free	0	0	2023-01-28	free_account	87	0	2023-02-27	t
89	free	0	0	2023-01-31	free_account	88	0	2023-03-02	t
90	basique	0	0	2023-02-01	1451011186980770	85	0	2023-03-03	f
91	basique	0	0	2023-02-01	1451011186980770	85	0	2023-03-03	f
92	free	0	0	2023-02-03	free_account	89	0	2023-03-05	t
93	free	0	0	2023-02-04	free_account	90	0	2023-03-06	t
\.


--
-- Data for Name: app_admintoken; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_admintoken (id, name, token, is_checked) FROM stdin;
1	alert:38	EYR2ewS7YytxDaAnNMVDVWWrfJit3v0rmm38CA1p1CGbPM9lj5apbGK4zpbo3sKOT1tCFx0QSV1ZksUWZ6Mp	f
2	alert:38	x193WDcg0FjOFmAtN7BRecB5Wh7NFqZKszAqIipLEAnYMi7qAewwjXPlz5DQ1oQatBQGvEDZ	f
3	alert:19	AqkFwElMhyqmABWdjhcHw65rm1PHnez4Asx49LznqBreN3tZuB7O	f
4	alert:38	q1QchtJPqisFmPmhQG5RFsf7YtZcvJ9uqAXXwRt1IyTZGWNwlc6cqoFgEG2TqirmV97DUIrEJtBlvihNX6AMiznhoe	f
5	alert:38	3O0W2mRs6XyNBp9nFfKkbnzNPdmehPUmvcYxEftWTjGxGRPMIL	f
6	alert:38	l3fjX9QKCbnZCp9h4unJJO2KGVOPqdLXZhLfSi1ZLAoC1qtfuwMmZfbedfPdTrKeLKawOMAMFEwEFtri	f
7	alert:14	vhiC1Yx3yYlz1OzX2uWIOAo6dhm17BpkNgmzL5IUpWIDcFf5pRMbLu60Qc0ZATY4jCjXYZhXdacLDoZQfrcQtt	f
8	alert:56	Fhwf9RDowkJMRSJP2sLtEwO65CACB7bmPZLhSN8yosYMAdd0kWMmIfBE81KcDl8d1hjT	f
9	alert:65	6ipWf9FI9D5R7rw5y4WqfIzHcr8lyoEt6hrAwNXWkIedQH1woWiYQ76EOXA9si	f
10	alert:22	bmVrZtcGufLKnmqUVaKk3shwDnlkMunMaaivS9Nz6gR3slltOJje	f
11	alert:41	DXvN8KE40jf7fmDyAGYIi7tQsyhficpgzkquyNRphpVHh3iFQYkrN2f4f9oISXmYlkdsKQMl	f
12	alert:50	poUXAQ8FvO3swWduBJP8pyaqAuMyVO6wETzdh3ZBUvMeI8OCXit3elFhetap0uR3bgEu9KK1nsM4Vg	f
13	alert:41	ZIdm6ISCYHJ53I9PPhrDgKonKFgatqILC5MmHYOTq4w84B8kTVjAGVhxLVfn4h5eUg9U6nuE1H	f
14	alert:50	BtbVP5mTH702CystoaUJE1fQMeUWnDl5AMILJH8zgDL8Zv0btPbBv0l0bNwNXZbVkZIa9kUOhf2g3l	f
15	alert:31	Y8CpVuJZgybJQUchH1vx8NbtLoaczli1o1dxpH8CjpFbGS8hjCmllSkBub0UWwUETqB6ivD0	f
16	alert:50	Vth3DBHU1ZJzX2zTPPvbkp8CaTb5gREWcG5w0vxeCO28sqajnJyCNa3Qlo9m0Od0cbnYW6Lk79F2s81C0MpX	f
17	alert:38	496Jc2UZ9bEwfoucBGggD3jtQlJL5C3Q3jNrrWNb886eUmKsGALAsXcLIEoiQ0l00YfxQH	f
18	alert:53	tE9VApdOtJBIJtbhzJQZUUJIo9OVjwyUqz1tzExkkA67gPr6nJ9ACD1te9VkyqpCaeVjeM	f
19	alert:58	sjwK3GX3Kljnq3waIKr6B1mvG583zTRWWZdQqtM4cqbe8ftTazChkowWfJB34PTu3yDSDGVQUrCMYaMyRFTVblSVw8	f
20	alert:38	J12ZozgqY4cPMP2VjrvWS2B2ttLQgpxzdnCPKNBp1PFFLst2U5JQWsLj7kaoEaSwE5o19vZ70wHMfZya	f
21	alert:38	yqnTzd1ge9QTrtCTokoQD37ER8L7n7BdGJx58G8lu2L7eOyXJKE1kWBDklyoqvEHoBoFWJKj5G	f
22	alert:38	3L220y72O9Xu443tZi0Pjk4uJMjiCdaYEZ9DO6gUgazjrHjnBbZkbxsOQmJ4Hj2LF5FdWZ4HoIALNbkc1X	f
23	alert:38	YgyFJMVJ78uZOMhVQeU8kDBYVhL2crjRr7IpTBTu73FVH4cFA18sULvgwFiH7mSHNwyUeFGPwFkGwIzc5riNHbKV7Y	f
24	alert:38	Tac4UNG0Rs4xkqwU6OXOrFDvJ1oM5fhNVarzx9eOwbpGb7TLH6qRFtF3DE6VHNZCC36356	f
25	alert:14	aBSiXay3Hw6mA7z7YcuV8EXaXW0t82olSj8cSUQ5UeFLdd1ksmOV5yrl6tFvUCLukjMMbkMPUZKvOhKu	f
26	alert:65	cvIyxpCfYkQU3TooLcr4h7LgbzO3WhhgWx2WDE3TwlVJUwtm7jssSJpXKlwG	f
27	alert:22	5Tk1uDNt1AKnPEPuI41LPbtjID35mLikmhavO8kNLP31RyqPnIInZqshUHzTheSXIhsYc3	f
28	alert:41	SdiNVaV6WCaCGgYuBthaVFO7xKgvvyCPYQFGJbSD8PTl3BePcVCg2b9cjC	f
29	alert:41	1sqJm0MkqJjVAeYTHd6GIJCVrMLZTkW81iurIlcux693UqQ6Y3XuZphYyxp1quF5x3fB9Mby3P	f
30	alert:31	xTkTMCzgjS9Dp8WDm9yXMFUjSOKa20yRqkmxBHRnr24sdEncckP0R0N76BJv4vYujNhoX2GNLFwQuw	f
31	alert:38	cJ9jwZ704QNGWEXW81vilu3QRIhSwMWUjzNvXAvBBj3tPOG0wQCMEAipao	f
32	alert:53	nEii2k95cJyNEJ7Fq2blIhyiUV9Cxc2qoeAWxxEzBRK3a29IvWEH1RLWVzafQUlLXQKkGYkeYTpW	f
33	alert:56	cSD70NJ46J6A0K9E9kZpJyExtKu3sDcehZnVxQO35kHDXlIzXBQJhPKz	f
34	alert:53	4l5htdDRyBXAiF1mjqh0Qi1BP7i4ZYMvGqTqMrU9GKvjJfJEmlHqxWJQ	f
35	alert:14	jiwZkuaR6TkvcMGJRQJUoKRO1EZH03X0ManYsxqdb30cubi8BQFf0QIdZhfPxkoB	f
36	alert:38	KRXqaKdCrCINC8lNoilTT91McU68KKJUZIbpYrwzAu1EmwBOkdue0U32AS0izPgRGCMv32qQ9WqidpXLX7dbnyqLhn	f
37	alert:38	Td4Phb9qYhghpOR7eLXTLir8pWFxq0ruiBUFXvwRmApsxGemriRr26azsp9ejw2IWG36	f
38	alert:14	YRYhNz7aM6twHU1A3gVJJZba6lc9ZQJPbYu7Ha0s3U4QvAxcdqmlC3pGFmi9WrqhYtkj3C	f
39	alert:36	dv79OBM665f4vVw0ASJKtvzE0wXjva3l2Z5rVnBjWzmKz1YaCv9SxHeOPirLRNGUy1yovxT0	f
40	alert:14	7OnQt0FqR7TKJA0y2Gr9kenNfskPEld20JhXaZAInEWkLvDnN8ehtHymoocLmflNFVRfaDkk59So	f
41	alert:14	YcVyZlXODhpvnKneZjvCeMDOhdkotrGkEbDoeX0q51m2yGiMeWdx1w7LjE2pOQvdaOehJ2WzhkGkRaPSaacI	f
42	alert:58	qybi80zYYuojFsQ3JzPCYyI9LNayHa6ncNFDhTBbbsie4R5a1eK5Td5NslJ2AVQHC7k6HO0dYk36UP9fKeHJlXDC	f
43	alert:50	beDA2W3TKsCXMrxxg1nvHRyuopUurp0QERLbv8cd2iUwcb8eimAbETIu4fvf0UYaOXvBkDfgz5TfPa	f
44	alert:58	6hDfPRNwZEQ2jDL4dEGSKWTmmBk0mY8lXaPWvtTPnqnPcegNnbVNpx1R	f
45	alert:14	tCAFku4NMFx5zGCAijqkvzZBkPAC3p4pHYCeZtbRkUgi7BCUjSmFV5oVkSYSeHsu0C9T9k	f
46	alert:20	A4g57o5BW6sWwA6ry2ss0gJyc6MOjt3wpytJtsWZ8wgkIXpwBZUVNN7inwB1yNpJBITOXzz0rkt7FMBhRU	f
47	alert:53	mmD808tbWacn3tU243jZRR0NQPZFXLSyShithH1qC2Cz8NdECzGg01g37AWLQXW57s1jJ7g9iATPVuRDfIeXNI	f
48	alert:14	pC5Kw3RFFVLF2fta6kbUE8HrC39qeS1AHiYNllN2zqsIdDhJWp9rfCrVnku6u21T0A2zucdnjgu3e0F5rUCSYvMw3j	f
49	alert:56	IrC7GfMjqVzCbYvcEfJyrgNspwmB1IosII3DtZGxGhnhayZ2NUovMANgPMrhcBHsFNu1DM	f
50	alert:50	DPnp0f2jTqUFS3bSMN9d0W5MpatG2k7wyCyMRENXheOKfm0QLxrtUR4f	f
51	alert:14	ZaipOxGkjOAzqwyctZTMg3s1rkFwR9iTCyTUr1IIYbTxtEjzXPZ57JwDCrHLS4sRuZ2PgeAJPm19eaE6pk	f
52	alert:41	yaUvQvenewb3kMXBc6r2A4rs52iNAqgs0BsEPHS9tFjT5s6prFbDIVZTSquvUgoB59AKTBJ0ty	f
53	alert:44	XNUfxHAR0xtR3TLsemtKXkGiOIzrrGklr0LgQSIIrAQxufSqmoliPUO0pwTlOL7dggI9So	f
54	alert:53	BAUESbvAXTsfkgRgEMABgdKM95PtMonX9QIeGL86sZZi0B5PiicRkCkjXBOjpKG0XWxjQWEyzL2keOygj5jVvbPM0w	f
55	alert:41	hpTTSV0C7kkiodoL7JyEeP4JWNFsqg8zYrISXHl2GC6ViSUK626EpbgQ5wX5LmXS9BvXDLrZ8h2AH0mV0CB0	f
56	alert:109	1Hz9qhJfZCrpsToSXnm11dZf0TyGOd0lj0cl1Sxu6E0HKQZwYFndMVbfOWRiSfI2CKFR0Oj6jaRNmJHbcg	f
57	alert:38	097ql5l71PckYGsu7kjuFpzNTfDepdqIHlUxGdim6FOzDhDAMUQYVBFJRgsSbPJWjQdIt2	f
58	alert:38	Xm90TmFfrReH4dBSlBaxoDu0UvnSTVnzajkBRAF0eB1wJ2CkuzaxgKUFiF9DcREBTHTOuGhJDmB4pCweeFrlYVDY83	f
59	alert:38	PV4mcLVwBO8enIu5Wx6furPjMvywLXE1rtFpuGUm26KAH1hGVuFy7AlVcksPJuU3xl	f
60	alert:38	Eaqw9QncbCDfL1kWgX0UPQgGqADANGxZPXQnUKy4LkhgmIKIJhBaXx8yoW4cB5neocIycjbFEqfZZ2WvYEkJlQ	f
61	alert:14	2V13zUq2xIHP10JlOkV1GqnadtbDTNNfmOJkbb3fB3jPSi0UU36nECpYoiQAbJxGggdcP9	f
62	alert:38	siUadV9o46aJCXDN39QBYnRzfncOmR1a3blB1okMCxuXgzvxQZEdanNNYSIjpWZjOEpIVP	f
63	alert:38	KvKtWMZf8VwBdsD6SmZjKFQ1F1ASrbIEtNOt6fw6n0XH0tNN0BxgJCAHJZyGmhry	f
64	alert:14	ID7Bbyj8lbI18L5moRUs2A1HjL3XehfzIEgpLvwZ7p32PPrjhz6CcHb1	f
65	alert:14	hbPB5vnmur3EmvC4JJTrvbCBGZZ574PI2aeJw2rHD29o0LCHIdA3PsV7FCFhkS7HNvtcyQPj3usVNXf6Ol2wlCbh1a	f
66	alert:14	Nvsus8i7fiaferqoZ8BDqZUQ04xuepqSj3NoWCkCkFJNMXc6LTjTuYATnIEzulq4HeIvFD6BVhc4OXnybwlz	f
67	alert:58	rpGx9hp26gUhymtWZlnmOnVG7n7cCQ6R1d2jNYxakbj3NpY1kncmi5x6oYkudg0EQyjizx2guYde34h6f0EcSu	f
68	alert:58	efYOgaP1uENWH2brY11xFragpP9JJvxTEJoEYQ3MvXgAbnkv8gFWEGIH	f
69	alert:119	IxtnZZalzwdzYofJxLMit06iQn40WnGR6IqWeOOvuIu8gA7QF9cCmjuNMslPenAQPP	f
70	alert:53	Fqv4ukaES1WSo5NB7OrzujOe65teumvYb5jSTzwdpED1uebWla5TeLDr7S	f
71	alert:63	79eIrxBMWiv4itVKAXmhuIOp02QALj4XlErfgc5XovZi933yMxTbOyop	f
72	alert:24	lqKMbN8CHIMpkYRPel3l3OUydKFpduCXha8ARmMRBhRgFg0KSo48aTYzljcRe2TX	f
73	alert:14	27aGotNrMz8WZqyLKO1d3gwDMlBloI1C64J4jBeJZ6jeMfs3NuOuffTWkXEoZjNp5GkoZC9SqMaK	f
74	alert:38	5G0UgN0JEWFYYozGtn9PrcK1wZn0JsnRIVBSJFZXJPBN7GMBZokdJHjDIGi8vOdgjiho9X9aiAD11m0R	f
75	alert:38	nmNpxHqnXQDh08iIAaognuUqJcdnS57CWbxRFyOzZP2UwBS7gR9uSBr9f0mhBEgIVIq2ShH9tcIxbGfoCbmITi	f
76	alert:38	xVVncYvkdi079pTRLQa6AFSWwPnOfkMsUaYL6JD05bK0wgFyFe0peyAgKujnVdrisSrXWzdzY1	f
77	alert:38	UYak9pg0QUpKkGp2gonTyxn7RkBA6d3kMXjyrmN5QnzFyUJX4zkJj9K1vfrrpxZPD20lCM9RF1Kjx2	f
78	alert:14	KenGObHTDG6VNgJcVmRpiueCLC0kZAthWxxY7aGj2nCmmPdKMNqLWqF1z4JUQVaJfk	f
79	alert:38	X4Z5Oaz0oRldIsuv37i129WhuzCs5Go5LC59aPYNDenNPJGOx6clJgS45NmS1UZEJy9wiYksm3Li71Bx	f
80	alert:38	3UYAAGlDW5ICDGN9mrjCUcYjGCObIxPPz3iXU1jyMGf9dMCAFrymZMHXzCrNT6Prn1YCsD244JFTjXcpAzlkqB	f
81	alert:14	8Xo4ucaIULknmw05RCfY383ax8HGo6Dfv9KIFRwt1q9aRnTUtNgtQqbSUQ6DR3scBD8Ec00WZXjC86xeQknyGVfg2L	f
82	alert:14	woW1VnlSGsPoNG7fnINRrSENx3nfDHir5iefsfCRWjaGHaNNwJqpgaYOmVAj9QKtaIpXGdtwTfsawb1X	f
83	alert:119	mhAytXkmozsXhW2dDkF67MEnS7m2fNHQqGPAfeOHQ6FhSVduSD	f
84	alert:58	e2pvPLE3dbmrOghy3kTgruBQm8calovnu5O8m7i1TjEJtBpXxjZhbDCb	f
85	alert:56	wQcoPhdVaIrKFfOBVbY9Tm4i17DzplXOKlWdwstyZFnPAVe38d	f
86	alert:41	xQiqGyeMAT9vC8NCYaAr9z2P3bKlrZIUTIhfAC2d8CZ7UARBuCBUTB5tCuRY7MOLZxYPMveQp2WlbVSGLD28	f
87	alert:50	8c6Nj3uQ9BtVXbCX9rzm1TiUI65BYRk21BGr7upTeDnKnlqfh5SbUbeHMvETjh3HLb4f8085HFEE	f
88	alert:41	V7KzSyMixAQ38G9r869UCw7ZH8FSXiCfZvxYWtdvOQ6UAINRbgcU8W8kfd6KIeo1Si1hs7W8cxRD2uFPMMJ6	f
89	alert:50	rmMILWXnduedOeRfGYOfAcRZy8QJ48Kna4sRYvjAffTDCzI4rKnySAJL5VPHgUZTYH	f
90	alert:31	sO7QEctAIu6Wj7emiIHJT9tEPtfyEAkmayJuJIPzh9Q3FKwkFahVr6UJjti7ekwzEW6XPo1OnMCJqAdt	f
91	alert:50	3fWDNa6U5pi5RUIsHpGXFvKKWsMjeWuKmOlL8CPdKbzzJJlVvKhkIY8HoOsbu0So1tT97m1DY3vI	f
92	alert:38	ER52XOrtXbcd7lA5DxrzgkPI6z9FYPS9iAEdJ1oatJ4uL57gFqetYAsLrsiyaD7C	f
93	alert:38	Uzz99t5GxRhXE2Fq3jHaohwrZvLDSjmX504F0eQi6bDYQAJSwTRe	f
94	alert:19	WanaDNSagVXKVCNYT2MfPDFCM5dkwlBa96S0nYQkV6kgWexYNt2q6J68T4toeqcfEx	f
95	alert:26	zfd0BvmxsGY1Ug3WDDMD78ZtUJbhHcZ1As1BBz0VeNpRLjpHBXf4ogjBliuUpusMndUU1o	f
96	alert:65	NcjhPwQw1Bg2fliLQPpM5CEQqanzmvfOOtv7pH34R2IUaKsYPigzZJfr8UB2lhTOMfhp54H54F4WUt8w	f
97	alert:39	NPcKhqYB3NXhyuxvTaffes48ifTMMxsFXeFQt38mOfdsQWUPojpxQ20vU1z6	f
98	alert:56	GPIdq0GmnK3pDSB6WN09HNJJwYNcwaGJay6izSlKAO60rpM6FGq8OH7xL8dgrdf7	f
99	alert:19	UJsdKIaUshxofTzbudC8vj27sBPxsJk7zjf3lBkoQLg48MZRnaZ1rPb8bxhWqtyLGSb1N1IpH8R2A6	f
100	alert:14	2JqKsFwAy2hsKY9f6fqxAeY8R8ws9kCrOXZeRmELLrKUMEZM5pxv0Z8HrKuRTExkX2EfAZXO1Dts	f
101	alert:63	exk31O3yrUiFpfumnIkYRXUMebaPc2sNti3wlUZnPzKz4YDWf4eJ2tzSfqn2qp	f
102	alert:24	qiIzarRXE4yIJ6sdt9WZJEaE0zczkPACUOVdwAUHgu1vKBpuV1UhEcqzwBydEKomuEcSjv	f
103	alert:14	PSRRoyQQ4MSgZdxpHxcJFQV09YRt93WikWHHwjgniiUxzdcnC7F5OJvxNWDLWN2yXHvyoMYbyNBzdAWpAjwg	f
104	alert:14	5U45Q5ebHmsgWoHbJ0QZGbnR4EpiqQg7vn3IGXt5uPL661EBfdExVvaucSpji665fM0gLBe5CFckBNW01b2d3IoL	f
105	alert:36	uKG8dt6r2z16cNz6Vw2snG9Ss2n7UCNluDAPs0BQyFWFKAmw4udhpWaHIY2AOaHouimVzevPRtVKLd	f
106	alert:14	xHzxPb8TFcnmYhZLqpjzsWymHuld2px1ZHZKdmWjTu6ZulZdQUMD	f
107	alert:41	z2LVmVNEFqZKxrcrd1BV0EHVZvqfWmtMJM3A9zlcBX5posz1HfIuhV4c	f
108	alert:44	Bk2wB9dfB1qtSLgx48t2WgNSatv4JGZYacYdiSEFh7dJX009F7wQEZ1yQaKLFhUIt7hXo275Qxnc1TGLl8ZzECcL	f
109	alert:58	ouk0g2VyrE7pqSoH0M3dhvLM22sDd6m22SZa1t5FxovaPXCdE379AWloWIHMrv	f
110	alert:50	nVizDz5fRCOgTlC0rZSs6U0G4lzkMBEytwBqe7ZP5WzvMihQ5mGfaE63b0jBPjKlZATPsvUV	f
111	alert:53	2hqT7xC6ZdO5KVewLeBhxa2BMCqhZC0kSPo259HT9u8D44DXTWO2dZNY0DGFoB0H9m	f
112	alert:41	PfC4JgyFJT7383NCzaRWhn3cDcAw9mX2inpaxVsvKbWgdlM6xTe1cstQ6cKHMU41bqPpkVk0NAUPNw	f
113	alert:65	fxddgrycfsG7DZelSf0fjUmMAluAp2PBqZ8WSfHpTTTq53GPCS	f
114	alert:22	590E4R0kq4UwsJuTfl8ByUkVLIfFpYhDCSnqv9ITjrtu0R8j2PKigzFHAWhw	f
115	alert:53	YTHwD5DdelOwLRABNII0CHaeAUdje7QF8sYDR7KE92KB3JuWzy2JdxAb9f1lmDUxJC7FptG4VcWeJuq5UdfLXYBCKg	f
116	alert:58	5xAKmGa9huTJgJ8sQf7FHuWl1uzdQOquVgInOSBlBsGB50nXAE8AzG56XNqLJXvrGjC6KdGEVdNC	f
117	alert:14	3j0dcH2BPrK2VhPlLOo2TUIsdcd2Ahb9YCehSDWB8CfwXR1NFFMWvDqUSQssu08NTZn8rHMdoDDV64nrA0hpn8	f
118	alert:20	taWCnBdYpjK8Uz3fF0IMsLHQgG0aPhWugmRwLC8UHmPYADWYTuBJAQtsJC0UdQkFmCpm4EjwbkXo3vOAOqVJjTX4Xw	f
119	alert:53	B5uhLBbDJJE9QuQYespjeLnMkSL9B9EFpQchDsBTTh0bMbO5cCEAWAjj60sVPA	f
120	alert:14	LrN4LPNpvVYU6XXHshWaMqeA0ISjMkHWVffDqPsHP4mx9JvEiMJwsvZWhDpUKUQx	f
121	alert:56	5emN4u5O8vjzxbpLrtbpwA27Xdg75RNnn65athkfRsDPxrbYg727mRm3w2sg7qlC698fMtJLR4	f
122	alert:50	spXEjbyRte9APRSNIac213JuDN3j2UbVOKqE7VLYq9lzCbrEH26mg8qJYpoz9L5AEP	f
123	user:63	black-gold-paqqword	f
124	alert:53	yBqfK1Aha0kex2xcUPRIlAdL3pjVUUB7kdMQlOtIIrM9nYJD7eeqt2wule8Z	f
125	alert:50	Uz9d4n31zgWu0GRM38EAlfPILuizIVhGQb34cpr20toG4v5tcamdavHoxlQq9bLW8QY11vAaJz0ephD7FW	f
126	alert:58	NDRoSLpcX67eAsUutjkIrfsNF1T2O1gnn3Sh7EjWhhf8q7VgZARaV2ZIDJkU3QfdB5p7nSDn6W	f
127	alert:50	KAxtc1dGBiFB0n6gYgfLypNh3KsITEruP36gy66G5j9kCWDn0l	f
128	alert:58	KEGrJeEn0ToXFDldluTvzVgwou8kNBUW1fUjLkEMQfgRawu3LGV28f	f
129	alert:58	YT2gLfBPOvLNQWa5ekr30tUtbt21WK69XBu3CZu13Yfv5rqws50k7euzYwGRuiZJYmHkyVqo37ITSf2v3H5UARNH	f
130	alert:40	xBcbABZvKjjtRrKlfE6Yqio1q5L9oSVTAcfalroUTmqdyM7oMu3CBl6XDyJg	f
131	alert:50	uH1V4aZAJiyk63kLj3cLLSucZLdLrlm5BhtmrCMrmKNnbzjN8ZccVKRYpkZ4z2YDjXWV4T	f
132	user:40	lihonou:40	f
133	alert:50	K91y10cXx2vBzJH1rJ2XIRgkDMtNOKIDjV6N9i1JKyaEmew2uih6fsWKBoUAKkL6GqFe	f
134	alert:22	8KGIq4NjfWEdzxFWqNTm9NX3vCo4NsY8kIvDS9x3HOUASq6Q4IG1OO8j26W4	f
135	alert:65	7Dmx0MuDztgckKVvNflekcSEWWqMWdiyXLWiIWbgmC6Vw9bg5iyHTUEmQQCCezcIRIPuZhjY2SoZi7	f
136	alert:20	KOgufCSJXrd3sQNCjQz3eJCL1aD6IAIi9sjKr2hwj1m2JVpXFC	f
137	alert:38	3jJIDaiUsRKYxFwgk8tUyH5PMRBSzW30tuGzjCRy1QSRyRooWUblvdI4iCmmELyqqY4gseGHLTmg76	f
138	alert:19	FN6Cb6PsPZleFNY0mzmM1bdVbu3hyt5UTpV2SUv9m9gu4j8DXySjqL16Jc56B9gj128izEgQXGjly6BpjN	f
139	alert:38	1qRRfz4U9Vr9Cv92gR5kajCf3BEmVHDRFK1IupFjTDFYR9Vhegz10tmFZbUT	f
140	alert:19	tyY7NEqi1aD6wu9IUlX13jv3oWVptIVA8aAJJJbqDjfjGpySRTGM0pWZ	f
142	alert:14	M8BB2uWSWTNpWh4mj7s4eEii0EQ7zGEVcnhXhVNZN5FMOshXHGki7fj560BLQUxDfu8Y	f
143	alert:56	R6ygF4eCpjEs7PJ2Xe1xmcuAfHAAmKBfawfseuYYzW36GSsv6g8ODvmdpFCKCvrlvWI1sgbM	f
144	alert:50	hlVsNiTd99lAh3n6fNIIS26IFbn4jH5y4ez4YehVKdDGxXFgzG3QrPEaBYfn4QW28rLXh7N0fDW2	f
145	alert:48	L38tvqYdLn39MJBAQOcAHLuChhJodGQ6MqXZQF9lbzEPeFBbyWha	f
146	alert:65	jvDBNmQ5heCAblJgEpoI1JT8YfhnuJyR7hgwjtnu6zt9cwFaWA	f
147	alert:41	PhGwESa7gI1flraeFUYdkNpIP9IVTrSJsHRmR0eO2XCsGR0rTW0s7gtUw3LPAEVfr1f7at6cvrfS	f
148	alert:26	o6ybAAr6q5B1L7wuDbV5sypBhE3CUvDo0tI5pv62hDGfZjSg67d7bELeaUJhKS4WuFMFODTMsjmmfQinoBZ2LCgh	f
149	alert:65	XLXl6NEucKXYhLJGnCqRt3E44wQrTTUbFXnMmGhlDZVf8g6j1oMTvcMhnxezaCAXKK	f
150	alert:41	nqBSQxkvKhAmZkdDCqfFQ8UxTLrXvtyWedWfdjer0UW061Wyj1cd68ztlc1V5othNJP77iPiF3RhNY	f
151	alert:39	kfntTsXC9nFLP1NpFYQ4qWDmpifzaBBpxi7yGlMJTU8qOsFG1gu7gHiTVP53FviiU9	f
152	alert:48	HQ8lfpDNavO6CodoAcVqzE6NwGNu6Q9cAQibEBwysnfOsmVXRuGVwJmGA1rSORMjIQ7UKTdTRUuiucAOnQEQIX	f
153	alert:26	KM8tVWnFVColsPktY45lAa4ib8UvOiTCLKc4lBDXQGfbpkjEmKy7zlkrGpGe	f
154	alert:39	0Z4K0SiXc8oxhJnUdoeMfr0ZmMkNqtZ8zPA6TETQ48bGp7a9upTMGR918ufegiimpEtbam	f
155	alert:45	2oJVR4ZyE9Pj604tvVls0l4QJCgUkIY6TSjTFeXdCVJFiccMrARiGiGG	f
156	alert:48	b9g3kpWI9VJNMVl0bVS3WIXrZV5wNnrvt6JG54Pcz0GcVEGr34pRu0l0grmohUES3lhTb1xXevEoL64BZ6oyjE	f
157	alert:65	KD1F6IyLbH4zAqs8hrFJxprDRQ9fUNdCnFScTW4SkgBDpSwkOgkeeMjKdO	f
158	alert:41	UvfjSvzFsloh0CGms6TnL0GJampKSnT2B9sVdwBmlNoLnOPYoYFM4CUnu7SbWzTU8b	f
159	alert:65	rRdqoqjFkKqupmFaGdiBPcLVTFcnXlmeWM0ZKSV7DXPeXGbmMzDLtJftlD21J6xs2BX8Isxr95Mc	f
160	alert:65	g8wmsQf30Dx23F3ooENjI6GrDS4LtYIBeCra2OmXcos3BKTgtd7t8EIEcoCxoKrw5LBRigoo48wOsXG4dqFIcBK2hi	f
161	alert:41	STXTPIUdky0VnztLl9euvFSqNkG52NNmSXgvWjCtrUcvCIV3nk8C7hUIRtv6LYo4xSizALft3k	f
162	alert:41	PteySzZXD2Ibvxd4DGpH1EXJ5eBQ2xybPLTeA1hSCx6nBGVVpwLJFE4b	f
163	alert:65	zuuFjt3KFcIrbGhWvkvbwTnh1GUqG3golfpvykB32iB67bsdgKTvDvGy4tVjwkdodbhCb0	f
164	alert:65	u5yepTXi3hXEZwuq1kxUIPZTIHKiBO5pGJeGlU2w6RbGD87kzy	f
165	alert:54	UkroQSoqsGLclPoe2nYWaK4nc9EvBDji02Q4mpvwMOiQaxtq4mAoKmCAGMhW	f
166	alert:39	3fdWhjis9Dn2MYIyQxXM6QNOjAV8PI55alBJsYanQyKhfm0p3AjxuE	f
167	alert:65	OUNKvbXQU9yQL8xMeJgGPWN8BjzoSA8Y3anW5ZFC93LncbemtsmVbAjACAqD8Bcsjm	f
168	alert:65	enfI9fnJx2NjR2hcZLZykDoiQbL2mor4vjKM8fu5uoFEFUziU6HCxKeFG83qU2nQaS	f
169	alert:111	1U906EYiGcctM80uRDOZRo2ZyfCGIad5j8dItKJVPEQPd3kY4pyAqHbntfC164zolSN6b3ZzaRzIalgfdKb2BYPd	f
170	alert:109	fmd1DK4efTMXwraTNRqG84S0pwKXsFkcMXS0QvpDpl1GNsKjBGNGR3zbSxRqzpkiV0KWYSgWr1	f
171	alert:109	6kJOt7QUcWX4tSkagqq0LBV8eVpcHBltmd1qxrozgw6oYSdMS5i0Hc2OAXblEo3JSuJ5DWTvItUZ7l	f
172	alert:147	yTMEPcynVLy0fpmR1myqPfFwb4i1UEM7IvZo6E0BDOzBFgGcZTLIpJh64jJItUzneaQGz174	f
173	alert:147	MInR3Qfh09Z3N9RGZQncl8YAqlVRpI6BgzByHkTCWTmnPcqRxwvvXRTgaMPE	f
174	alert:152	XMrubgS9xRNA7oi0HNJ2aYokp4Luu89AOvsFHnSHnQhuwzsf0VrF6H9q6fyjsEvmysty4j	f
175	alert:152	ZjXAdoPvBWnTMd1JJlN1H38ehxAbd3nUz77N5Clfb6QZxydUKKTHvifMrjDZdDKHMk5cXG	f
176	alert:14	QJ4fmOKk3Mr8pst90b2QOBlbibLBhHjLFBSmdwPP3S3uI9l7A1hBaqfIxOwC7kbisRV12qSPpQ4a4jug	f
177	alert:14	SqQQma3tRARcxLa7dKXn724H2FnExoHGzzUeVduk2zfOas7f1XD1wp71H2lQRNhY	f
178	alert:11	1rbKSKV8PejVzIY9QTRLaW5hLJFlkzgog02eo9HmRcHISmmm2J3AB1ECN4shp6hCkFELEmMjcElxJRhlJXibWpit	f
179	alert:11	0ZTHsDCQsDDEEQY0JiiBTlNqe8AjEemEzNUTbzqeg9S1HktAkeIA0Q0bqk5wcX	f
180	alert:176	zRWv39cTChDIE4P5jtdJ3BakHpONI67BqCtMybya255NTZ9yvDDu	f
181	alert:176	ODAxDUXwaDDB9Kupw2K2gLXSLsfezDkYJb1ocY8ag5rL84CfkoVVlZMe1oPeC5BbjTzmfuj7N0ZRgiWVc3sZ	f
182	alert:168	Yw4rDxI8280DaU5JfkSd0FpKYz6P74JVBbGO7jQiltmPpiAPbAJTE5zP4L1rTaO80vQ6fQHiF4ySiB34uF73juQNjZ	f
183	alert:168	ZLyeIOsNBxE5WP96wjloHagmeKyttGNjTCzaRPgBbfue7APLsOc30wQTujxboCYvDZpgOMHvXIyP	f
184	alert:173	j4V49Uce4jkWkpMKfLRczvskgJICiiCuyj2qLu3GTlNQbP3veKujgOdWwln4MgifX10fAUYSYm1rvTXyUSpqSo2k	f
185	alert:173	h5MQ1mDU5uV3D8vzZLiOPiFDY64zXSWmOMjvjZ3nifo6TiHDuEAzUzuRI0XQ4YIOlXwbFS	f
186	alert:11	YnSdX3FN9hGMo41SZsEqHWJdrVAtWfaCY8xqMaVx5Mp77rPFUVeTeHltOgPVNQNSj9vE0ngdLCOs8S	f
187	alert:11	VWA3ZwGpv9xVJ7KC5mn0YliWvGzYVQuFqcbVvQRiT64OyQ7iopvaVnMrIvBCLwdahssbiME6	f
188	alert:160	OMS8qvrG85tYWQSQIj8qhEOcPOmnhxbGk73w8vvVckeshMd5HJ	f
189	alert:152	QRBwSAH3j9p70Ji7i2PyeqtjqVT3iqEilcXVt371WjRPA1wuNkmB6l	f
190	alert:152	JVCDFDdcSsAP4Yzqmv4Lojs7x2pbAqJlxI0u4FALLu9BwapSvkCH	f
191	alert:41	4Dk5AQq3F0eQB04B3eDE9VTzGHtxcPad9B0vDu5yRfCvmnr4Q9CwfpTeQF415X2dJ77Tlytbn8	f
192	alert:51	AThVtk1ff1SkWZ4rnap8fQJQbAfzsJnsXaoHYpbhRDnd92ycyotp	f
193	alert:41	VC61OgBjXkJrtXvb3rz1orPWCipoP863HBArEJhgVzwchRS0UIy3mcwrKNCdJVqU0HxYMu500OebN5qSgSVP6BoP	f
194	alert:41	5iVOJpqUaMvXyqU9zBVo5a3nn3QYFZkvo8rA0CZNPyfMp6IOW0oulEvo0INdY95PCnkW	f
195	alert:65	B2PaVRjhZTabJOX9E5m4tpZVrsM08yLzWIel5g9Ze2vfIAZNVIepNV1NBDerFwaLxYsalFza	f
196	alert:65	z7tH2IzNDdZnHFmPMyy4whNd7XU1ywfGnbkU24q9gGKkWHJQlw	f
197	alert:65	zMGGMgKi1rwqi3otOPz3yv5JNogMFKiAD7vOeiYiebYnAMummu8Kt6h3m5qClfxaNqHiWfWjIrcOAz	f
198	alert:54	Xw5Z8QTdHYptTShIhpYQkv8SOa1uHVXX94Dub0iRor7xecVPQRXcOpy8ao6inTkJxtvGNQi5fSyoMMj7V7aDuX	f
199	alert:160	ikzbde8SjjYHmqWBmkow656PN0pMwW3kjzb3lQVSgq9qL9VnTzzXTVMz2PPcFrEU76kUIQxGi2yhuZBYB6fYE7	f
200	alert:160	w0m51hkduG5KXxOQsCj47hsBVVTvkKidOxHErGzbAbi3qn1UQE3rLECRmwmSsZHjgm	f
201	alert:11	NIKnlEKzPYYotNOrD3bPfeeJWrP6unFRSP9yyypOBKAHV8nvEAVBdQ11wK4WDucENu0OqPS3XdRot5ja	f
202	alert:14	ndEfz3Gqa6cmuZJL5sHRurPQoP9r5sGF9Zk27pisYOquUhDOUF59ZrXjxlMhoDzKyvySoUHbhOulMu	f
203	alert:14	LUmxzCVUShsEAZv1ryad9zZm3Uf1l0sol7GfTeRc40LTaNXDtP	f
204	alert:53	rO3bNDSEWNPi4EcF617viSEGLDplIpU0XA96P2YHbDKqhw63OP1SondTzi	f
205	alert:50	H0pQcHdJMYU9zEP0m1iYFrSOsunfsGGrHGAV7MUgHt28S4C8tSsmLsvmTR2UJ8nJJdWq9ToXnBGkenA72iGnK1zSBH	f
206	alert:162	oVDcQIn58XSCDxEbarl7ynx6TF1u0oTPRbYg3ObfTxNl6BK4Pra8NZ8QTgUhm4YwOf	f
207	alert:176	KP87xJt6yLxaxNVND2277Xlvo6BuinGsAzPTtKJQMvlBd2HaI2tbTCkKOHtNx8N72uaH0Eqz0zJ0Lq8V	f
208	alert:176	LAJPh3jZzkjFHN5s2Gmf0R5y2ZRUrIlMfTH8HOZ3L07yHCGLoNhxFYKE4Vg6oyd9BOg8mupMJejyYL9pfbAU	f
209	alert:168	Tc7NmEHTGge4cX9wYvDIQthVcGujGd4FHyi4OuzyPbYVvQ6WVMQn6LmsVrIFXIz0k3fq9uC2ttpLyVsNmpQS	f
210	alert:168	PCDiGXRr3TpvZVv9kd2X6iT0Vo7vaHcAOZrLpof9a15h3cMia6sXDrFdrF	f
211	alert:50	Bn7B5xyEpALpl7YJc9xAHvJTJOqWxl2uRt7d4SfIEJDKEm8UnxwT	f
212	alert:50	kS3JffKhLEc2CYNJQF9yMozfslq41WQNbFBVFd07wSepLgNXWkxpgLrLFpuUKC4MGKLlMJZIj4ryW97hvJ	f
213	alert:162	oygLFEgeGYYnUoDmNqe2ySNBh561ilkDU9bpkYW4XcRnsHBUkYa2dAsV5qA4cIBg1iNn9fKJLRg56XzV	f
214	alert:162	vKDYa9KDZfjEmhqnSx4f8I1t2wB3fw55ZPYiyBQa13nZsiuKQTvjnmiY0LYM30nMD2RlCSFi	f
215	alert:162	4jtzXhIziz9G09FVkQooyUCVnQE2Vy43NjX8daMAlADFgtXbNXHE	f
216	alert:162	ya3zUQjQV8GOtDqGMmlRvMXbp3COAEBPUfPYa48l49UmUMjmbRViemXFB0Lx7dRK0jVF3YVOZgRO3D	f
217	alert:145	XyVdboInHo0yf022Jdq2StzvCxhi2CZCM7oxPjxTzbrZenwfZCYZ9ZccGqs93VE5RpQWlEZKba	f
218	alert:36	q5Vo9BqjNQ5VdIbgtS33JXivwprT6DzYjGyTdpN9DmGTgvpfdhnG	f
219	alert:167	w4EiExizwqswDQ2i7DKoV9pAIMecDYUDhC0i1fzmd5M1SHN3DKEFOegG3nRynrfnvxUkOHi2zf	f
220	alert:161	vrINAW4P0YpzRq6wdb1mTomJmXQxjjrOYNH3VRcakFL4B5qZNMn3lT	f
221	alert:24	JEwfXwQIlmgB5b9BDR11l4hIFHpnTdz4nSnCzlW7pcdQqdrNYCXA3SK5hsb3QvmfMn8x7097RCMFe754	f
222	alert:19	Ubg7Yfo330ALOJCR807WPC7aFStnxzWuQPfY94AhQ7eEr4DnerR5WeNPzmDqtKUu06onnsleAiA1w0pE	f
223	alert:119	WRtyEYv2cFgkiy7CwME5pkIOCuzZ6Rp8acMQC20z3FQzLn7BBsOqcJCxhlza2U1dRqljue	f
224	alert:176	e1ReUyFWWIkKlZaEMF8epWd8DFSKBHWIZEn7ZzTUMLWIRS38sebEnBsftvEsrCNGWZUtjvKCL9	f
225	alert:119	r311SIpVTOF5i6LDi5FR9I0RUfyNVNNd7Xdy243hHuYpvH3KvPO5wSAX1Iaf	f
226	alert:119	aM01ynRYVZCIsglha1nbtMyrSlI9TaAj9l6KojoITd9yJhtUT4olj2Qlnj	f
141	user:19	beaute-dor:19	f
227	user:119	olowookere-friip	f
228	alert:56	J1UGdolrAxgCF1fuYlOrRqrrHa3zGjnuNxGrDoytdFOgax3jHoUvVtjaN2SIfSOBjWOqlwBdVPR1	f
229	alert:14	z5IWSM4FcJ2BQ7rx8PsKJ2x8MT70cQxiEyCG3H2HyrrKt32tnNgOcixDmNl8SqadO9	f
230	alert:14	vj64eTzpoZQBusqPF3dAlvCcJ9nVwh4J7Dv4i1sjr3ziiW4LJGCShv2dmFgslYT0R2xG9EQiJrUWekD0WW	f
231	alert:20	m5PXjyjqhxYBmNdQ3SFB3X1ROQEhMxrwxIIC2TIDzkT2g4AoHYrL6jMhyvaLHBMcajgXUZKs4GfH729H	f
232	alert:56	XyGFiJXq5GTfMhRZg9k8yyWzmeXZJpdi6DKxHUUtwvEJ8XKxursi6Lxw0uofEcAyvgP23fzj3UcgidzQ0j	f
233	alert:56	zp5YPfwldaQBMR96cTPa73FwY2MNaAALYDPucWO18W7tHob2kga4gakH7w83yf7O5OEFtwWaDcHXZRTiVAhm4P	f
234	alert:168	mOu6VCj1jnd7p173mVGNpeymowz5q7CEf5dtwev4WHgDzNOuymYvXVUB9WxvhtlHkIQRN3GX0sc324xe7PvBVg	f
235	alert:168	QBFqo2TadAXumbphw2jMkTA55hyyfJ8YFkogx1GwqkI9FNKsWKdR	f
236	alert:53	aXnw2UVl5p6Ik5RfnV2dhrWRm5anrcCkCxgWO6RA5yfJMnXMSLKv	f
237	alert:53	s9mwLhcigtqASMs3RHeieQf9TFB7aIK43IZKVr1ISygIE20uMCSDaYnGtrvrlbFbJ3YqGnyY	f
238	alert:162	jcVFYt1PVeJqVZZWhzMO9WOg1H3L9pEIoQwai0qnK8wIOxJyk1ET	f
239	alert:162	4MIkXAAJGCENLTxJsaXtaaL68zW7FYf9NcZyRBPdZbdUWngbPsBPwbaEFYQmo3gpRwHs1Gw3BEjsD586zh4LEn	f
240	alert:176	Pyhdc5kfTtlscmhQDeh4H4vxwjFaEwa86OoVw5mK1S6DAjYoG7	f
241	alert:171	kFTsWxcfrXnixpmkeuts6GTagHmD7RsddL4CQQK9kl83IXHkPwH6mmluWQsbcqwT1ecP0PXsAzNzg2	f
242	alert:180	HJmio4FLJtstu7vrLJotwQwPcIGuev0uYenu15GC2zadHEGuLQR3VPdmoraTR1LPnfCLPzT3KAxS	f
243	alert:180	hV4T0Ai55YZLY1ZtLE9ex1f3u4PrQ0RAhi7skacKtsRNVMEgatqgCsJTbPNLtEh5EsfKZAvu2ty3G5Ortl	f
244	alert:176	rkZPOEdZH3CdukflWnPeMSr8s9aSr8TJBwo7BSDllERmaBE0KSDlxKyhZa5kWw	f
245	alert:171	4sFBD69fWxB1kfLdGbokU0rwNczxwYT2mV3XSoGj8gVy0YgP1fkvjqrtun3U5LPkRFdcRq30d4U5yXXWIvDziWpZ	f
246	alert:171	Vsf742BdpUekhClYHt4AbSlDgoQITB6biXhBx62E9drQ1zg0RFpLPVveSQYnuHIcTbwDWUbEW9geFRLs	f
247	alert:156	2OMLjOIlPr8k7T8c49kq2Xq9GvVqqRYGzdeApk1AnNeG7Fwex47kcEAhgdH84ivvd5	f
248	alert:172	5rdtxS8UC5PybhWabHso5RQmDyvRon7qtffWN6z4COyCNnMYrzEOb85dyw5eEvsHNZ5Mh1TZwA7YHl8MQ3JK	f
249	alert:163	3Z3YFBe2M47Bwn5PMHeuZGWgipKLZqNcSlL2DW3702WZUWah1xjrksLeusPAG1juCTnhA8prrl0l7zyi9ogyV1F3	f
250	alert:20	LFiqtko7ZoCm7UnJIpHV5RHWZ9DAdzrjFt669XL1jMkph3C44jX1XNkgt0Z4FdMIv6m0qvl3Gw	f
251	alert:20	SVNBOYiDUauSxA5IbvqEg4n8VeAlGcVGt2To8t3fvhOVAN5NvujGlF6cKULcAvAD3wpH7mEhdIsp04mQ	f
252	alert:156	rPsqCHELhEuNVidvA5EwlyeMGEkTiZd0DJghgB6ny8hM0OMMwCPWRMqEwLQMb6unWovdhhSZRtY51RzE	f
253	alert:40	r8F1SmgUdMen2Jg7XQPqJ83B3DE3EadtzOJqfXTqS0nElLE3g37Z1C1mhubGzBo9qvSvgYq3mGy4bAz1sNHV	f
254	alert:145	v3dTDaORP5axFFGw1GchqMAb8Zwqvi6txDHYMP26T3VuF1963Jbv8Ay9uQItcocRVgLJ8qBGL4sDCuhM	f
255	alert:145	txFTDQCllVQt3obcToU7ThTWvHAQWlrwZzXEtCfwe8J6rai0bcf73hQYSTKFjail4g2D	f
256	alert:166	3fRc0GtAwvlWB27sQeO3EIrM9TXxHAMC5uXMOLs6HFtKz6bvc3WWtpjHx08jvEYCMNBe7XnzPbtW80bcRrHr	f
257	alert:171	GSNEJoyriAprsHNcHBXP7tp09caKq0PvwBR9o5ZbTmYzPADxEU7UohTO9WUCG357VUmcWeDMvEttIXp9MwZvX7ZQ	f
258	alert:171	kETY5dijlc2TUAuayIIh3zh2pbPoISQPZeaqJgVnxyhtZOtVQxFdaQYPl9	f
259	alert:41	hmtsMMVLHyd5etfPk7sXOpyk23WQMEV6mYj8Fe18Lfa9b9wBT5ADFiFDPvo4OQvr2KzP	f
260	alert:41	yEov2Nss6oTo4HGXk075Y42g6U9qdwIDqpNxzw1l51DyXz628zXwIKG7nmVeq2Kn5PgHcQO62BK7d513wW11XktA	f
261	user:145	hapiness-markeet	f
262	alert:168	2KZ2tcWuGDDVDmibH3hSrYDBfV89FK9xeqlIs9YonpTwE438pvm2GptdG3q6JxXtKvWreD6NJ8Ef2Fh9buYxJeMI	f
263	alert:168	X7dwYpgWka2f0kwZY0uKylqLsVCySCSPHAiJ6ggHiPLlNATNxW8E6NMnIsOUqkTavp7YmRao86xO2wkHSWrcLC	f
264	alert:176	xMhfSxoyWX4SEkLU18LUijLBRWiWeUqpoOhMqTZdZaRHX7o5bJs0eEuFHOSzKiXhsOiaBozeHpJ7USh8n5iIT5	f
265	alert:14	dQTqUpPMSU2zYVSn0Hrt6Dq6HJF8uEhOfJN2vdJqef1ddHLaa2Ft4F8lUbpnhNegpjhHmg3bfDslZTex	f
266	alert:14	GZKHwyvemeXH6LMKq7TyyploQb2V2ZcH4Id6O6Bc8fYw650faVdWNuUEJBKQO31iLSscmJhkeh	f
267	alert:65	HFlKVz3SdceBoNNHNYLOEUFgOwz4K6IwPII9SFa8EGOz4pyZ5HvPj2NVB52921Qv4jAaM42WICTWln3AX699eQ	f
268	alert:39	p1SLj24ixKthnaX8XObe897OySRf4AQOO4rN5eeqaEb88xLUgfBMMU2AazBifl2PNmf2V6	f
269	alert:111	TfwWil4AjJfDuT7O0Wys8GhhtgfQLaAfY0NCQlNrniAK5nQNzD	f
270	alert:53	LMgmb83Om9xP74lWM93u0HGO5mAliPQodq7QISxQGTLZnAH0bcNVIbvlntomYF	f
271	alert:53	RwMZSFPxMCBuPhsr3tz8G4SZjYlmAoVvjSrdgr1cunk7qFjy3x1XvMUFcz3etQjLlqEwTlme74ADhFpP	f
272	alert:56	XPzxooKykXhxTlkiCceHeOTipOGAKYNxbKTdN4LnJOSIbNx69umWo1LMeYNvmKBTM5BymYxNNRwZ	f
273	alert:56	E8lfFqqGnS4f2YYYLg9GrXPSXsckd9QxM2Bd3EJQA8YvgD7OWTyBJsDhxgc4pJyMg3PFIWbn4HWE7VZIMH0UkD	f
274	alert:41	f2PWdplLT9IFdwtL0sOkly9Cn6OnZWGjTltPs8n54tYxQzfafu4vvbIvzE05bHTn0SpU6OZIEG	f
275	alert:41	M074QOQZtCWDfua1FuAey40BvvUqAQyTFAsb7bd1J1KDfcF047tC1UCpXpygHoANNEvD2E9iRizPU5	f
276	alert:192	5GcpEthN71n60FlHlBpynzHlyHWBVtprEsdjXNi0XMVWc5vYJgP5GlAWxNFDPQqxEOvhM1D2uJg9WTcpgz	f
277	alert:192	iTmHyPWSggmfi8rQmlrevQE5j61dv4AxDEIuwI0eH3wn6cxXuTi4S8MiRTuPZQh1ep	f
278	chang_parrain	zwd_vrdvjfeehjdd	f
279	alert:162	ALcIPLEMawDZyJ9Kn16bAep4qMVj0uwOeErh2l34jHT2by5RKymk	f
280	alert:162	oJizkCTNYjhRw0OxMzcwFUggbHsVeq68pGOuQCPVIi3c0OpwuLnB	f
281	alert:56	80mRZZ98h95oWpo3RMPjvOAwwlsitDxwXyPt8XcliZItm79wXT89HXGne1	f
282	alert:56	QOKY28ioeRs7g9aBtQtlWR91mIy3LngEovQvdA95cycWbyRlx9dhBan4XBrQicLwxRVmbb	f
283	alert:168	ehLfWIK4iPOyIwEU0jKavyjBd30Sk0c6XIXTJkUFhmD6eJTv7VfSQEhm	f
284	alert:168	U22uxbpitHu17bBJA9j1mfvjKSY2RHRbaoaOKnaoxafSS1A4llh2IcOG3vnlle	f
285	alert:187	rMY30ls4Iy3KBcgIMtgM7EsuARqPqS0FpJsHoNdoSIKFO3n5V85lnI5uf8HTuYfc	f
286	alert:187	vV6eaa7RATve80FwR3OYe3MIwroXNBeHpYvdwxw4AJOQ1zFsLYaAYM	f
287	alert:177	QfP1Uch7Q2Wi6E0aWDoWtx90JhLbpZTD8ITFrDA5JJvwGNAEunhi22qoWBLj	f
288	alert:44	b9D5t4KblES368seJsCmGfo17sD7fkMQ4MRbkCYDR6exh6INdHO9u6A7Qiw0U7gPddZmusVy	f
289	alert:156	eoFvuSDMZS2eVEvOTjpIbElwTnM2UhKIBBJAgPmrnxtyL9ffUuwVwK4bSgGag266V062XaSGHXcbcLfETWBb	f
290	alert:40	gLY4buLYU5nKywFngz3GAyRkqCF1F3z6cHsDOkKIWQqVH2vMAsZVmRKAF2coWxZ47v	f
291	alert:40	uLe4azZMzbdTkTQnjgHO982Fr7vFRuLsuwOnrqWlgJAx7eDxCgdSbfON7NZIITcJ	f
292	alert:145	oXSsYdqVgwJojLfGLZQV23xvOwvQouqyuyugfGsguA1s3UKOBgy2uI1BRhUz1ffAiOqam72aztx2lQKaYbzEzULS6e	f
293	alert:145	f5MvE70q9NISzWHB0tYKfEGMOaWYTmC6UnuseAKUZBqsvi4ds5xCJDLVO2DSdfWmLA	f
294	alert:166	soolzwQUWmZknEoSdP3ChOuEYkIscSbdDTN1OGjY2PCsIQsArj2uVrmiiPbcB6pghw1SBAewgqFV4svcF9Pzt1dS	f
295	alert:166	Zl2CUdETFSm5e6Qwaf2mQd7u4VMDOYrHVQkNXQYwU6lgLf3LhsOFV3YKaeu2LfkBRe2T4RUqSvuaJypcUkmh	f
296	alert:145	F8WDmBSbhWL73hdbMswapAiuQ0EJuvrtIriPHEMQV35WWqg8XxcdDZAm	f
297	alert:156	Ud9bh8kowyFjdv6RSLDK82iRh11EUlLMy9wmKAGExa6HzPM8X7jwjfaBe5W3htIhSxhI	f
298	alert:166	XP4NUEohXtTOI47JUOvILrhZY4aFDInOHeJv9yNvVFmGv5ld1pGWDYgFpUGq87	f
299	alert:166	WRdWo34iZljjRHkZ3FqneXeXpQLxYl2STE3trNOPItSIGmf4UNg4DSEU8QiahksoUdjyyliocq4uBbkQfqEm	f
\.


--
-- Data for Name: app_category; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_category (id, name, is_visible, label_id, dprice) FROM stdin;
43	Mode Masculine	t	13	95
44	Mode Feminine	t	13	94
45	Mode Africaine(pagnes,...)	t	13	98
46	Accessoire(chapeau, lunette,...)	t	13	95
47	Produits Cosmétique et Parfums	t	13	100
48	Téléphone & Tablette	t	14	120
49	Accessoires ( battérie, ecouteurs...)	t	14	95
50	Ordinateur	t	15	125
51	Accessoirs Informatique	t	15	95
52	Consoles de jeux et accessoires	t	15	125
53	Jeux	t	15	100
54	Meubles et Outils	t	16	115
55	Appareils Electroménagers	t	16	105
\.


--
-- Data for Name: app_client; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_client (id, point, user_id, phone, whatsapp) FROM stdin;
3	0	9	+22961555705	+22961555705
4	0	8	+22961555705	+22961555705
5	0	10	+22961555705	+22961555705
7	0	60	+22996540922	+22996540922
8	0	61	+22990158846	+22990158846
9	0	52	+22961555705	+22961555705
10	0	50	+22961555705	+22961555705
12	0	64		
11	0	62	+22952793636	+22952793636
13	0	67	+22997205789	+22997205789
14	0	69		
6	0	34	+22952405727	+22952405727
16	0	70	+22991303142	+22991303142
17	0	71	+22996239597	+22996239597
18	0	72	+22997441396	+22997441396
19	0	73	+22966140770	+22966140770
20	0	74	+22961616464	+22961616464
21	0	75	+22951019681	+22951019681
22	0	110	\N	+22956500608
23	0	34	+22952405727	+22952405727
24	0	112	+22968104989	+22968104989
25	0	113	+22996288914	+22996288914
26	0	114	+22962949354	+22962949354
28	0	116	+22991574971	+22991574971
30	0	118	+22969849814	+22969849814
31	0	120	+22963071792	+22963071792
32	0	121	\N	\N
33	0	122	\N	\N
34	0	120	\N	\N
35	0	123	\N	\N
36	0	124	\N	\N
37	0	125	\N	\N
38	0	126	\N	\N
39	0	127	\N	\N
40	0	128	\N	\N
41	0	129	\N	\N
42	0	130	\N	\N
43	0	131	\N	\N
44	0	132	\N	\N
27	0	115		+22959300004
29	0	117		+22959037159
45	0	133	+22967484808	+22967484808
46	0	134	+22990093130	+22998652552
47	0	136	+22963789868	+22963789868
48	0	139	+22968565632	+22968565632
49	0	142	+22995104010	+22995104010
50	0	75	+33765821818	
51	0	143	+22994642735	+22994642735
52	0	146	+22997628881	+22997628881
53	0	164	+22997411705	+22997411705
54	0	178	+22961555705	+22961555705
55	0	182	+22966637464	+22966637464
56	0	183	+22998687821	+22998687821
57	0	184	+22997050031	+22997050031
58	0	185		
59	0	186	+22999831730	+22999831730
60	0	188		
61	0	189	+22961983115	+22961983115
62	0	190	+22999563958	+22999563958
63	0	193	+22968837420	+22966657059
64	0	194	+22965864202	+22965864202
65	0	195		
66	0	196		
67	0	197	+22962395757	+22962395757
68	0	193	+22968837420	+22968837420
69	0	198	+22961069379	+22961069379
70	0	199	+22990011234	+22990011234
71	0	200	+22969638524	+22969638524
72	0	201		
73	0	202	+22999309630	+22999309630
74	0	203	+22961555705	+22961555705
75	0	204		
76	0	205	+22961742671	+22961742671
77	0	206	\N	+22958517150
78	0	206	\N	+22958517150
\.


--
-- Data for Name: app_clientdemand; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_clientdemand (id, created_at, category_id, client_id, subs_id, emergency, point, is_out, date, budget, detail, num, num_vend, quart, slug, state, parrain_id, sold) FROM stdin;
70	2022-12-22 17:00:43.885263+00	43	14	450	Peu urgent	0	f	2022-12-22	\N	\N	1	5	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:14__2i3Cp1ucJaxwLVkmvf0LdfNKtHqJVlQlogMuu94XQEyD91vVeOpLtXhBy7nwz55uIf9QIrryh76lwGLOSCx46SaBTg7vqkltd3wbRc82fNfe8JZxdTmlzU8e7NFFYYKgoYHv5YRcw3gzEHxgaaxfUyqqndfJrVP5YHoXB6GM1F	Neuf	\N	f
146	2023-02-01 09:03:20.074965+00	47	60	622	Urgent	0	t	2023-02-01	\N	\N	\N	3	{"name":"Hotel Tibi Libi","lat":6.4860963,"lng":2.3373378}	client:60__n449zHfE3kGHhYZxzrR6j4QrUHY9VmpVKStKATYRy5wuC3qEa6K52kNOjQqsVdxOGbENZfL1GBWdDsJoGCJOI7027zvlvJ92FJvPCs8Cbj	Neuf	25	f
52	2022-12-20 14:30:39.271887+00	43	8	452	Peu urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:8__l2MbjxYhKUVS9hiECpRYjS777FuwRqnuxHKIXQtcgmkOJMmvnFmS70Bz7BM7EeXurleKY7Mx6jZ0XemHUzRj5SqK6FKf0m3JgrxwfDpjvfsCLWojDqqKSPLr0FIw1S4zEcSc0xB89IPMw0ktZbRDYQI9nT3WY0TrMPQhT4G4KVq5qSCroCXzUJ8wTamRWhJ4wi	Neuf	\N	f
53	2022-12-20 14:32:57.870027+00	43	8	454	Peu urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:8__WW7Y16wmZGc0JZiXCtxn5gkgDhzA1FPDS52KJfIMJUIIQAfuiHZjMHzdZM5ARGbzO4XehEW5ctIySViDZWGqTWwuCAlrqla6HMKwMQyt4Dy6YaTW	Neuf	\N	f
79	2022-12-28 17:32:24.163906+00	44	19	501	Urgent	50	f	2022-12-28	\N	\N	\N	3	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}	client:19__SZgD6lJRltKmsk1Vfz3BZzeF5hOxtpYGR1RgWKmAMEDYh2K83FoSGUOmfdOJ4rZSQ7Pvkz41NQhqqbT1d64uvQA9NmmWaOXVQhY9Q19HfiI26ZVJ8pz0hBN0GS13FTXE1ixsOFK7PSQTvf9GWSBnaNIb5fFo4z	Neuf	\N	f
78	2022-12-28 16:58:55.402797+00	47	18	619	Peu urgent	0	f	2022-12-28	\N	Zara	1	3	{"name":"Université d'Abomey Calavi du Bénin","lat":6.4180733,"lng":2.3430427}	client:18__K8jaf3bqTN3bNtxrY2Ce7CC5o5c5JUrED4nPytFYjY6wQF01CjjD2XKXdTnSASWQVFef0LFHzRz5QMuuwonlNIQ2YZA8ZGdo37XhDp4F	Neuf	\N	f
60	2022-12-20 22:02:44.978787+00	47	11	619	Pas urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:11__eGHFJN0HzT0JrvNsBzWt5ZIxuo83ibtMdxsUH2t1Oq36xbsSaZDmBu0Tss9hMyW2aw7oYotc4lTfZhYKhnPGwBm1vtU3NLstI6rtjEbLFo61LNWO	Neuf	\N	f
61	2022-12-20 22:02:44.983339+00	47	11	618	Pas urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:11__eGHFJN0HzT0JrvNsBzWt5ZIxuo83ibtMdxsUH2t1Oq36xbsSaZDmBu0Tss9hMyW2aw7oYotc4lTfZhYKhnPGwBm1vtU3NLstI6rtjEbLFo61LNWO	Neuf	\N	f
62	2022-12-20 22:02:44.987285+00	47	11	614	Pas urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:11__eGHFJN0HzT0JrvNsBzWt5ZIxuo83ibtMdxsUH2t1Oq36xbsSaZDmBu0Tss9hMyW2aw7oYotc4lTfZhYKhnPGwBm1vtU3NLstI6rtjEbLFo61LNWO	Neuf	\N	f
73	2022-12-24 07:33:52.58805+00	50	16	688	Urgent	0	t	2022-12-24	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:16__EAOVEfSApsyKxVXDYH0zJiwmoG3qVYTdzGQCS2khNIAFK5Iu2oXQxFrPRyC72Y2duOG0UZy7AN3VUUTxBMgIsXBGum6wP1THRQUJYXSDmPnR1Sx8Dq2UuUdWQjn04jlrYufKF5nCkwkY4f	Neuf	\N	f
66	2022-12-22 15:56:47.097068+00	49	6	681	Urgent	0	f	2022-12-22	\N	\N	\N	5	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:6__jlGtjldTBimxNEOoTk4MtHAPaLgOzPUQ6gXKl3euDpnLePLeMAP0KijWhp7AZGPZq2cJlZGS1lqolwAQBOYGlIULPNNRrrYBtADR5kBtqkiiG0xhtEXTVLWA	Neuf	\N	f
67	2022-12-22 15:56:47.105213+00	49	6	679	Urgent	0	f	2022-12-22	\N	\N	\N	5	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:6__jlGtjldTBimxNEOoTk4MtHAPaLgOzPUQ6gXKl3euDpnLePLeMAP0KijWhp7AZGPZq2cJlZGS1lqolwAQBOYGlIULPNNRrrYBtADR5kBtqkiiG0xhtEXTVLWA	Neuf	\N	f
68	2022-12-22 15:56:47.111842+00	49	6	680	Urgent	0	f	2022-12-22	\N	\N	\N	5	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:6__jlGtjldTBimxNEOoTk4MtHAPaLgOzPUQ6gXKl3euDpnLePLeMAP0KijWhp7AZGPZq2cJlZGS1lqolwAQBOYGlIULPNNRrrYBtADR5kBtqkiiG0xhtEXTVLWA	Neuf	\N	f
65	2022-12-22 08:57:18.135426+00	48	13	638	Urgent	0	t	2022-12-22	\N	iPhone 13 pro	1	5	{"name":"African University of Benin, Akpakpa Campus","lat":6.3637881,"lng":2.4917049}	client:13__JI5Zp7OzZTbnI1cPXI7kWc5xDmW2ENga6ZZKi9Zfr4PgFGNGpsr3nWj4XHZt2hlQlrNDAfqJA41VciGKPWGBoOz2ZqNlWBLFTVHOu9xkjzZbQDDH	Neuf	\N	f
72	2022-12-23 09:27:01.250657+00	50	6	688	Urgent	0	t	2022-12-23	\N	\N	\N	5	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:6__NDvvuukvPDMIi3975rTRGKL3jrstXgtYKq76GAkwic0HKauNzdgFGICgsNPnK0aswWUTkTdscV6Fqmx0yJvqFqsbOSi4FxBwhSkMwbO3VuUclHME82QNuKhkui4mY1MXR7xex0sFvDv3CgpZONgh05WlnMP01XNAVDA2NFKFWdlBrF1cUyCo0OXQINWyfQlrHpbAx5Pk3eYHK9mIgBx2HMEX43Z40tmG	Neuf	\N	f
81	2022-12-28 18:14:53.368653+00	43	20	445	Urgent	0	t	2022-12-28	\N	\N	\N	3	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}	client:20__yaKEzvYDNefcyqx8JZObLXlZSmt6omuA05M7Ua8UJHp3QF4OXKsLGIXA2Lh5WRqQDH942vqRVM6BDDACLb3e8opIsH4VStLekOOUXYxz9OUMfQsjakgCbNwlaVrALDDMABPgnC9vuwHCIfZguERCewepAfT2p1sXKOaE4jwMEEM576eB67O5n9av2RoLoE5h	Neuf	\N	f
59	2022-12-20 22:02:44.974125+00	47	11	612	Pas urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:11__eGHFJN0HzT0JrvNsBzWt5ZIxuo83ibtMdxsUH2t1Oq36xbsSaZDmBu0Tss9hMyW2aw7oYotc4lTfZhYKhnPGwBm1vtU3NLstI6rtjEbLFo61LNWO	Neuf	\N	f
63	2022-12-20 22:02:44.991775+00	47	11	613	Pas urgent	0	f	2022-12-20	\N	\N	\N	5	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:11__eGHFJN0HzT0JrvNsBzWt5ZIxuo83ibtMdxsUH2t1Oq36xbsSaZDmBu0Tss9hMyW2aw7oYotc4lTfZhYKhnPGwBm1vtU3NLstI6rtjEbLFo61LNWO	Neuf	\N	f
82	2022-12-28 20:05:07.978747+00	43	21	467	Peu urgent	0	t	2022-12-28	\N	\N	\N	3	{"name":"Dr Claire EKPE","lat":48.873456,"lng":2.4819566}	client:21__yJaV2Wy5qRp371xV5VrUB6UQCFfNZeSuv4MJ1kKL7DTPIGyiPYyzKMI5mo3flazCq9QeFth2OrSC7Hm3SduUA22RR4QAn4LQxN6zx9cyH5XtmZ9Z5uPtzpY0szhkTvgWqUATbhyd47OSgTqp8Z8jDupXZsRFGdJmGRC35dS8OdmFwTFiADKX4muatFifEF575ZXL8ZNtja1QamCfsl0uEKkcyji9FXVIs4x9mu	Neuf	\N	f
84	2022-12-30 20:17:16.004406+00	43	22	468	Pas urgent	0	t	2022-12-30	\N	\N	\N	3	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:22__w6No7JjDTLWsSRSelbyVJgwifgCBXJVnMaVdJVqkT3ec09EJsNjWOkOYO6AXPh4JBzwQigp0YEM6SZbRQrakZPW3JGF7HHTRYHd5sumoUAGOio0F3NhZj2Eyhs3isZh0T29vRO2jRHdcTAeG	Neuf	\N	f
83	2022-12-30 14:35:34.507606+00	53	4	772	Urgent	0	f	2022-12-30	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__WnDijN6YNV0MlofNhb6vLmJBwDhT81JKmPAA5qyncxEXrxozBuiOudkK7EiyzvIMCAOouomKTJMJ3I5rIexI38CZIIOmNDuvItxIvq	Neuf	\N	f
80	2022-12-28 17:32:24.170669+00	44	19	500	Urgent	0	t	2022-12-28	\N	\N	\N	3	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}	client:19__SZgD6lJRltKmsk1Vfz3BZzeF5hOxtpYGR1RgWKmAMEDYh2K83FoSGUOmfdOJ4rZSQ7Pvkz41NQhqqbT1d64uvQA9NmmWaOXVQhY9Q19HfiI26ZVJ8pz0hBN0GS13FTXE1ixsOFK7PSQTvf9GWSBnaNIb5fFo4z	Neuf	\N	f
69	2022-12-22 17:00:43.872443+00	43	14	445	Peu urgent	0	t	2022-12-22	\N	\N	\N	5	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:14__2i3Cp1ucJaxwLVkmvf0LdfNKtHqJVlQlogMuu94XQEyD91vVeOpLtXhBy7nwz55uIf9QIrryh76lwGLOSCx46SaBTg7vqkltd3wbRc82fNfe8JZxdTmlzU8e7NFFYYKgoYHv5YRcw3gzEHxgaaxfUyqqndfJrVP5YHoXB6GM1F	Neuf	\N	f
88	2023-01-02 11:10:39.435407+00	47	25	618	Peu urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:25__Lg5GEDpYw2s76gUvQs35walZdkaDKrEks6sgDRW65hyJalbVeNWHVbX6RoXajOdBCFvMzZpT3fBWb3FtYaUOv2iEGkNuD2F9Q6mPWFDUTH5hX5ZYtyM2rcC9C7xqcOCYvHHXJhwLO4dVn4QirL	Neuf	\N	f
95	2023-01-02 11:50:07.064118+00	43	28	449	Pas urgent	0	t	2023-01-02	\N	\N	\N	3	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:28__Rr5rxZxHJHJqQfPIKzRWw1r80AKeUrMzcb8XvlhMP4qePE9ZeafeQzEai1w6r4UZijaQoYCrdpjYAPS4G9ygOb0CScUMxF2CalfCWElIaTAbbBLfGX	Neuf	\N	f
90	2023-01-02 11:13:29.917716+00	44	26	555	Pas urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:26__LHkYLHUN3JbVCps3x0w5zRWr6JlFT7v9yAjJMX19coLlR5B8DzpUrBtztEqJPZ9Q5d2PUlHT6FnBuUfogW0Jhmnwn51t2ns203aqhcM9CHaxZV14ERDPGB2iG8Ydve5rdRroF55MHlMBsE89ZNj5WwsikAjsfhZHW8pJ9d4ib1DI4J5xZwqTY0jhsZK5CLVpeX0V	Neuf	\N	f
89	2023-01-02 11:13:29.911089+00	44	26	554	Pas urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:26__LHkYLHUN3JbVCps3x0w5zRWr6JlFT7v9yAjJMX19coLlR5B8DzpUrBtztEqJPZ9Q5d2PUlHT6FnBuUfogW0Jhmnwn51t2ns203aqhcM9CHaxZV14ERDPGB2iG8Ydve5rdRroF55MHlMBsE89ZNj5WwsikAjsfhZHW8pJ9d4ib1DI4J5xZwqTY0jhsZK5CLVpeX0V	Neuf	\N	f
92	2023-01-02 11:22:59.352008+00	44	26	528	Pas urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:26__r6Y3UO5SK4FuRhPCPYjGo2n1kvZSKLPh2YqMEI5XUlIZCik1EtZVUfw8twEUijMLn3T4EKeUVXqhTXlr2T7AIJZ7XkeFFvW0ai5F9oAUZ6pU0Kt8xwFb	Neuf	\N	f
98	2023-01-02 13:27:36.466253+00	43	30	461	Urgent	0	f	2023-01-02	\N	Boy friends 	1	3	{"name":"Commissariat tokpegble","lat":6.365387,"lng":2.4853978}	client:30__s2Sp8rE03AJdbvJtUR5Xv1SVpLDqcbFc1lA4eS9tIDlPRBiMDCDGCfJpA7wuVhKj3StOLtCJUtCH6NPr3eKe3ezjtgiZkflIh7avTqDadCN6SxksL86bgRhm	Neuf	\N	f
101	2023-01-02 18:52:32.398225+00	44	31	525	Urgent	0	t	2023-01-02	\N	\N	\N	3	{"name":"Agla Akplomey","lat":6.380312699999999,"lng":2.3521924}	client:31__fBpY3047tHXFMU6fpVAIsjjKllcCd2mYJOb0ttZIgLexhei1y9wJTzniJIDqICHj6cOo9s9poKC0hArpKGzHhq515gE85gdUyokmo50FqF074zgBFk0xIwDDdyuKawyClnkrYBUHK4fEhglS31wgdzsQDZRdT8	Neuf	\N	f
96	2023-01-02 12:00:07.329449+00	43	29	467	Pas urgent	0	t	2023-01-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:29__VF89dDeD35sgQjuueQsDdUPR2fS2SWl5P0Ld48z0VzgaAXyOXEzhkom9FLjipwHEDRzSsCBJCpGiCUjjNUE8teU8qVHOvezfPPoQTpDQd7LmuaDO72BZZ74IvvNwQpnk1wK43fwQAKYJXPBNdXINqWAqpZptWseQsF	Neuf	\N	f
91	2023-01-02 11:13:29.923557+00	44	26	556	Pas urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:26__LHkYLHUN3JbVCps3x0w5zRWr6JlFT7v9yAjJMX19coLlR5B8DzpUrBtztEqJPZ9Q5d2PUlHT6FnBuUfogW0Jhmnwn51t2ns203aqhcM9CHaxZV14ERDPGB2iG8Ydve5rdRroF55MHlMBsE89ZNj5WwsikAjsfhZHW8pJ9d4ib1DI4J5xZwqTY0jhsZK5CLVpeX0V	Neuf	\N	f
51	2022-12-20 08:48:15.970138+00	50	6	692	Urgent	0	f	2022-12-20	200000	Core i7 ram 8	1	5	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:6__ltz9PIWzmvFI2T6td2z2vXhkiIyZBNXsdTqEHNGWhtJx4Ftq0w73awHerChkI7e0BhN0zkkb6DKKn6abLf74jw6YlkMSp37MNBMPUNA4E9tZtuoeB1oidlHmoLZocTMcVp5nJsAkekCTbbm8QOMN4NLyVPIwCYZcmxNQJD7BDrEGi1	Neuf	\N	f
102	2023-01-04 14:40:05.51006+00	44	45	505	Peu urgent	0	f	2023-01-04	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:45__CK08AgfFsuPk7S8RRNt6ziZkROIrRS7YfPeU9Oz2uXWxBc3pxFKaIdudCENpFRw4zEXLd9m2CxLumxSed3LDX4bluf6DY0mlcW85pLucTeDwuc6diKFjDUt8edEzhWQkq0ZfZRctGvR5D0eYtuKjpHzAZxkc95lWvZgzjOLx4BkyiRl6	Neuf	\N	f
147	2023-02-01 21:13:21.955101+00	44	61	521	Peu urgent	0	t	2023-02-01	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:61__1BIubUnyek0m3zmjNsWGGwz01ZLhwa37EcX9ccUwLEaeZm5rBK46FDzXHZQmFhtAdjT4MadQrb7joLyIxtKqkujia4IBJq83KX55JUssHNqDFXVOUIxP6P1GPmDwHYd4xRlSRHfh4etO	Neuf	\N	f
85	2023-01-01 16:32:09.51019+00	44	23	530	Urgent	0	f	2023-01-01	\N	\N	\N	3	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}	client:23__qZAu4clQXTSLPU5HMnqpMo4sPZZQBPPiWNL34dL4bdTKY4bs3KptlFjc9o4i0dFGKyp1nRi4vtMBMVslqXMEWaaD4Y3VJfCJUdwNkuvR0I19uBF8fvvm1DBMcR6h9FYnkFeDkafaKbU3cdiOOmXE7YlZiJsOwHeqDR3ucPyX	Neuf	\N	f
103	2023-01-04 21:08:26.964719+00	44	46	527	Pas urgent	0	f	2023-01-04	\N	\N	\N	3	{"name":"Collège d'Enseignement Général (CEG) Sèkandji","lat":6.3761022,"lng":2.5100206}	client:46__es8ZjHUb8QJioU5hPiHDlNzrKMBVqb32HCPYgFacCfMVr1PAymRsW93697l9kN6DVi5yPdZm6lcF3lzIAvtW0iPC0Bz7kaphrXtpTBRITGAGk9vCEW55SirTNwTkWKVqnVrPXRijM8C7yThBk8s6rTBCS4BQXCcpHT3hzYp07dLn8lH13NAZt0B5SvlvDjjW0nyJM4hgK7EYD3ne	Neuf	\N	f
99	2023-01-02 13:28:54.953312+00	44	30	515	Peu urgent	35	f	2023-01-02	\N	Boy friend	1	3	{"name":"Commissariat tokpegble","lat":6.365387,"lng":2.4853978}	client:30__p2UQsTHIc1D1Wy3DYxXQNw7vyP0qCFrGfSyGNukWJjZLR3bVvigyXu9eHwQrtSYwlnSQV8E1z6pozATUIk71I1MEmL76WUQdD2DfsGZpqBwEcDJjjJ6AFsbVAgLSOmdyhOyOhKHjH173oB6qDW6jGth5LeqSQ9osgQfZ1Wp3MVai2bS8F7zSsghoCxXPqJVOSxy8uaNjeEq2Yea13numjp75lD9DvEm7XVkj	Neuf	\N	f
104	2023-01-04 21:08:26.969974+00	44	46	529	Pas urgent	0	f	2023-01-04	\N	\N	\N	3	{"name":"Collège d'Enseignement Général (CEG) Sèkandji","lat":6.3761022,"lng":2.5100206}	client:46__es8ZjHUb8QJioU5hPiHDlNzrKMBVqb32HCPYgFacCfMVr1PAymRsW93697l9kN6DVi5yPdZm6lcF3lzIAvtW0iPC0Bz7kaphrXtpTBRITGAGk9vCEW55SirTNwTkWKVqnVrPXRijM8C7yThBk8s6rTBCS4BQXCcpHT3hzYp07dLn8lH13NAZt0B5SvlvDjjW0nyJM4hgK7EYD3ne	Neuf	\N	f
87	2023-01-02 11:10:39.426739+00	47	25	619	Peu urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:25__Lg5GEDpYw2s76gUvQs35walZdkaDKrEks6sgDRW65hyJalbVeNWHVbX6RoXajOdBCFvMzZpT3fBWb3FtYaUOv2iEGkNuD2F9Q6mPWFDUTH5hX5ZYtyM2rcC9C7xqcOCYvHHXJhwLO4dVn4QirL	Neuf	\N	f
93	2023-01-02 11:22:59.358389+00	44	26	529	Pas urgent	0	f	2023-01-02	\N	\N	\N	3	{"name":"PK10","lat":6.3704164,"lng":2.5213408}	client:26__r6Y3UO5SK4FuRhPCPYjGo2n1kvZSKLPh2YqMEI5XUlIZCik1EtZVUfw8twEUijMLn3T4EKeUVXqhTXlr2T7AIJZ7XkeFFvW0ai5F9oAUZ6pU0Kt8xwFb	Neuf	\N	f
106	2023-01-07 11:50:54.661796+00	44	47	511	Urgent	0	f	2023-01-07	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:47__73UXoiQ09xUbOuwWWa1QdWzVKXUMbwuZShhdslmXmpKncapw2L0QwArA8H6bXqkb4u3orEZOuav6JQqB4rAMyZhGGodxiceJ9a3ZMkcmVK3ZP92peOyjgGMM0hr8d6PykPQyFh8RNBhikXuVVUpuTc	Neuf	\N	f
105	2023-01-04 21:08:26.974984+00	44	46	532	Pas urgent	0	t	2023-01-04	\N	\N	\N	3	{"name":"Collège d'Enseignement Général (CEG) Sèkandji","lat":6.3761022,"lng":2.5100206}	client:46__es8ZjHUb8QJioU5hPiHDlNzrKMBVqb32HCPYgFacCfMVr1PAymRsW93697l9kN6DVi5yPdZm6lcF3lzIAvtW0iPC0Bz7kaphrXtpTBRITGAGk9vCEW55SirTNwTkWKVqnVrPXRijM8C7yThBk8s6rTBCS4BQXCcpHT3hzYp07dLn8lH13NAZt0B5SvlvDjjW0nyJM4hgK7EYD3ne	Neuf	\N	f
107	2023-01-07 11:50:54.67526+00	44	47	513	Urgent	0	f	2023-01-07	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:47__73UXoiQ09xUbOuwWWa1QdWzVKXUMbwuZShhdslmXmpKncapw2L0QwArA8H6bXqkb4u3orEZOuav6JQqB4rAMyZhGGodxiceJ9a3ZMkcmVK3ZP92peOyjgGMM0hr8d6PykPQyFh8RNBhikXuVVUpuTc	Neuf	\N	f
131	2023-01-27 10:48:58.238339+00	44	4	497	Urgent	0	t	2023-01-27	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__f1SUN2gqyzjidF6iaC4ZL4XXXxFOrIR3NOunxxWjfXYySo2I9BtrH5AlA9mY6w4Se7aWINDEnHet2UeZi18VBwDKkTxCq64yh5Ib2p4KqN7mJS	Neuf	\N	f
109	2023-01-10 19:42:41.806118+00	47	49	626	Urgent	0	f	2023-01-10	\N	Huile de bissap 	1	3	{"name":"Place Bulgarie","lat":6.3621535,"lng":2.4139868}	client:49__57VyuBzn3N3YFjgtT2PGfRgfu7XBSEtzN3fmcIe74rWCICcpszf4w8VCIPKM9O2xaAg4vX2VTD80xc84w6ntYoyy4qjVmJZwmzSU	Neuf	\N	f
110	2023-01-10 19:42:41.81273+00	47	49	628	Urgent	0	f	2023-01-10	\N	Poudre de bissap 	1	3	{"name":"Place Bulgarie","lat":6.3621535,"lng":2.4139868}	client:49__57VyuBzn3N3YFjgtT2PGfRgfu7XBSEtzN3fmcIe74rWCICcpszf4w8VCIPKM9O2xaAg4vX2VTD80xc84w6ntYoyy4qjVmJZwmzSU	Neuf	\N	f
118	2023-01-16 22:58:30.42965+00	49	52	835	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
111	2023-01-11 17:40:39.779725+00	43	51	449	Urgent	0	t	2023-01-11	\N	\N	\N	3	{"name":"Université d'Abomey-Calavi (UAC - Entrée principale)","lat":6.4130104,"lng":2.3449665}	client:51__ljVMnhAoFeqU4W8AMtLK4m1nBweFudBrPsqPyBO3da7tetMoILbK8REQVIQRascWJcOVj2Yo0hw2pEbmAoDohpBzSfEYS4hCLr1RA9tFiVa7NmLqLzOaWLHopOGOnRAvTwI3ZzRROk3zTQBiLREoFr3aYiZifcDlwKqY90x0fd4L3J	Neuf	\N	f
148	2023-02-01 21:13:21.96208+00	44	61	519	Peu urgent	0	f	2023-02-01	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:61__1BIubUnyek0m3zmjNsWGGwz01ZLhwa37EcX9ccUwLEaeZm5rBK46FDzXHZQmFhtAdjT4MadQrb7joLyIxtKqkujia4IBJq83KX55JUssHNqDFXVOUIxP6P1GPmDwHYd4xRlSRHfh4etO	Neuf	\N	f
115	2023-01-16 22:58:30.411454+00	49	52	666	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
116	2023-01-16 22:58:30.417427+00	49	52	667	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
136	2023-01-31 08:28:34.331339+00	49	56	668	Urgent	0	t	2023-01-31	\N	\N	\N	3	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}	client:56__kiUpyJfYAnAgyzKtqY44VdK4rDBOrzwhL3XVyezP7zbhZIHWvhmJ24D18ZXfCwUOo7NhucumSZN5E950XkyHIDHHhM9CDYN6mn79dPilGaaP	Neuf	\N	t
112	2023-01-16 22:58:30.393594+00	49	52	663	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
113	2023-01-16 22:58:30.399778+00	49	52	664	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
114	2023-01-16 22:58:30.405459+00	49	52	665	Peu urgent	0	t	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	f
119	2023-01-17 04:25:16.982525+00	48	52	642	Urgent	0	t	2023-01-17	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__NA4tAtG8ZBskqBN4wzOnoPvUwfxZSJtOmKKRgBtKBvMwRlC4i48lojhDZ7TFbBnerSBCgY7umxXAuZrhKqtBA8FeRjMc018DVPoDRrvSCAifdEgpPEONDvxBdEvuqEzYmIcfEisTBCej2Jfft7B2G2DGwxSyf2qma3SDibqVRarlAH	Neuf	\N	f
123	2023-01-25 16:15:43.909656+00	44	53	497	Pas urgent	0	f	2023-01-25	\N	\N	\N	3	{"name":"Agla","lat":6.383711,"lng":2.3640875}	client:53__21deZO99wQsn6VZCG2P6RiBMHDYS6nV1cQZW0cZIviyVcHmF33Z7bnIhoFb4CSBJs5KcL9J7JYNL9y3XTzS5FqciexHel2VQUEciJA0xQjXJDgRpnR	Neuf	\N	f
132	2023-01-30 19:00:56.171498+00	53	4	771	Urgent	0	f	2023-01-30	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__P6KYm5L7JaaOVY5fgejXQyBWn7ZTkXylwXUqHo0m1LL7FBmiWcIgsD4N0xiZBDsvaCiLAarLGEUlhjbYsyuspYHfLEx2dw4hVlDzcFR5EDZ9ewSrsk4tIOhJKH99FYWDrouFiOjXGkHS5alaSYl9LPqU0j9YiCINvQbXO0Sfl0XaKp6O4BqC4brdZtLSRSCY0wn2vhoTQgVi	Neuf	\N	f
133	2023-01-30 19:03:20.58274+00	53	4	771	Urgent	0	f	2023-01-30	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__ID40kVpGzkML8DMoMWtWnDfd9kuFvmjKnXEDqB94jGceQRtBSO4bNmlfpOPhGCbCQupXMAAHQoh5Z85uvZ7ocGWgpxXJEWkTcqpmGysc1LVgWjGspFc1mEJ27pNPHINSRNoO9l2hinU2vJ3itDDrsRhtFdeB7XnppC5V6BHNoHOHMn2ldW7FinGEsFGQj8qt7lBnKggx5pYG97Yx6J	Neuf	\N	f
130	2023-01-27 10:42:23.85858+00	53	9	771	Urgent	0	f	2023-01-27	\N	\N	\N	3	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}	client:9__gAsT3IkRy6JzyTnumhYTaizZ8kwe5Zn7yKBPSnglR5l5Iy9oavy1wSmVGL2ChvfOLNSisLKl6H5UKfyJQzPkFVOK6gHk3ijYCTmdJKzz58AJYCyfUuadKKXlnIyT9DOjtRg9wZ3tGV9Mt2rUePiSECCp0J0HmRQdS2fgcvx5fGwZdotAu5p6LamuOQJNeb9bUfDKxlWt2LrffTJtStTPQ5QNtrfVuA	Neuf	\N	f
134	2023-01-31 07:52:38.315776+00	49	55	676	Urgent	0	t	2023-01-31	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:55__zvJAJTFrl3CScpTmQL27AG1GtdzJFtKI4RSNnieIb3t55ZSLfbF9xw7y3I11FdhDMkXNUQmHLvKBufTYG4IKJXw1lbfrhMrwC0O5zzjv	Neuf	\N	f
137	2023-01-31 11:09:54.936786+00	43	57	474	Pas urgent	0	f	2023-01-31	\N	\N	\N	3	{"name":"Marché Ouando","lat":6.506603999999999,"lng":2.6111748}	client:57__VdHXKhLJdRf4YDhwzO6LLqoZA49BUERa2Xg8FIQ5u5ym4vVcY12aYHN6wPDZoJaHmBDnPot7JcJ84HJp5lMZqyU3movFtyXxcEKwUiSqzc3Wtyb5gm4PQDSXcNJ7SzUSFtIsEkjlBMZVB25j5dIOfsGJEAI1nFePlYx4zBuAJdym1nEPC5eqfxYVtCiH55	Neuf	\N	f
135	2023-01-31 08:28:34.324894+00	49	56	664	Urgent	0	t	2023-01-31	\N	\N	\N	3	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}	client:56__kiUpyJfYAnAgyzKtqY44VdK4rDBOrzwhL3XVyezP7zbhZIHWvhmJ24D18ZXfCwUOo7NhucumSZN5E950XkyHIDHHhM9CDYN6mn79dPilGaaP	Neuf	\N	f
138	2023-01-31 12:28:25.919943+00	53	4	771	Urgent	0	f	2023-01-31	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__ywjKJ9ULYRqzI0lTIlpEajfOtbXAGakIHTVXztcYucNfTJfUm9kx7zjqIChpXj44JqJuybgNwNkBK5m1t33WtPQ7xQbMtz2MfrruIlGxF56hy49Pa3tZ26c2lroTJDhfVRcZa6arPYGQtIeihTtjAgPzq9uj9aslNOBltSIY	Neuf	1	f
139	2023-01-31 12:44:51.236499+00	53	9	771	Urgent	0	f	2023-01-31	\N	\N	\N	3	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}	client:9__dNyBUmuZXRUvNP0g2HI97PH8VKluaHTEZP6eVx14bpnUDC3ZbVXftkKk7DmOLOJpGPXGvcI1eTfRoWizC5S0BwXk4SCyZbwO0cZjVAPh0CLBrh2Ts24q6MAPpyUwernuBwuIF6XLUdCDXoOvPpruCO8q3QPmfsKxhhUC0l4nGgfbDoTYOMw6ITbKUb07z9qP74opaoT3rNIXp2XO71OYxkw2BDhhYS	Neuf	13	f
117	2023-01-16 22:58:30.423477+00	49	52	668	Peu urgent	0	f	2023-01-16	\N	\N	\N	3	{"name":"Senade","lat":6.3779802,"lng":2.4529976}	client:52__MKgHIpHWKtgCxyPbcoTLPJypYhD8yFoHBLOVhxbwbqkDIXsQBwQmBa8hoUJ6iybcBksSHdip9OhJyAFIKObjOZ9N6MVPGxKYbNTrBioFv6QsXwSDLn7IxIQlmv8BqgPekN0RQaLRAeyJDi9qSA3apuXo5X	Neuf	\N	t
140	2023-01-31 14:15:21.138367+00	51	58	698	Peu urgent	0	f	2023-01-31	\N	\N	\N	3	{"name":"Gbegamey","lat":6.363550000000001,"lng":2.4122257}	client:58__Rww8xt01mQPhTEXKT5gnDWRrr5p7RP2VRM7ZQ2WOAvHxQH4MqkrocaJQcrKCML5lRRs07LmGqO4MI0HEvaEUm2zxKxBSALMp1xQJLCAk2wk37f40cWxHeZOSVZAwfwTWuJSisDXF8z7CqgRVjYKoYqxG1EqF8w3dGfjPgwZaV8ExzVxJgKGhV6sEhgIh62fXXCDFzyiAklvMNgt21JhsMhNYaJIzJK09eTT82l5N9zstj7QTTYGayo	Neuf	\N	f
149	2023-02-01 21:13:21.968567+00	44	61	518	Peu urgent	0	f	2023-02-01	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:61__1BIubUnyek0m3zmjNsWGGwz01ZLhwa37EcX9ccUwLEaeZm5rBK46FDzXHZQmFhtAdjT4MadQrb7joLyIxtKqkujia4IBJq83KX55JUssHNqDFXVOUIxP6P1GPmDwHYd4xRlSRHfh4etO	Neuf	\N	f
143	2023-01-31 20:54:48.805282+00	44	59	508	Urgent	0	f	2023-01-31	\N	\N	1	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__gqI7nNCLckqJaiQ9l2KTxsghNldnDQFkxCNS6DVtqXDa5OQhWPOkTlPfpGSAyU7qxKfwJfGtcawvOcyahAZSNOYZbSPhUdSlERjwZgBxq44Z0O7R4pmxJc1HY0EADzGYyVrCLwG9BR5shEadWyiwYzrkzwyjUtphk3qiTh	Neuf	\N	f
141	2023-01-31 20:54:48.794612+00	44	59	505	Urgent	0	t	2023-01-31	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__gqI7nNCLckqJaiQ9l2KTxsghNldnDQFkxCNS6DVtqXDa5OQhWPOkTlPfpGSAyU7qxKfwJfGtcawvOcyahAZSNOYZbSPhUdSlERjwZgBxq44Z0O7R4pmxJc1HY0EADzGYyVrCLwG9BR5shEadWyiwYzrkzwyjUtphk3qiTh	Neuf	\N	f
142	2023-01-31 20:54:48.800002+00	44	59	504	Urgent	0	t	2023-01-31	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__gqI7nNCLckqJaiQ9l2KTxsghNldnDQFkxCNS6DVtqXDa5OQhWPOkTlPfpGSAyU7qxKfwJfGtcawvOcyahAZSNOYZbSPhUdSlERjwZgBxq44Z0O7R4pmxJc1HY0EADzGYyVrCLwG9BR5shEadWyiwYzrkzwyjUtphk3qiTh	Neuf	\N	f
144	2023-01-31 21:29:26.203971+00	43	19	455	Urgent	0	f	2023-01-31	\N	\N	\N	3	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}	client:19__GaulqoxCDVhQe9zXvp52oTnpKyuFkP9TThHQWcYm2MQSZFffhGkz88uhLbDWOubDBh3hb60DlBAvIErzB3hshVpZxn5qzHUmM0nGixDWiVP3XECKKyJvro0fvlV3mQIFe9c6AKQFKFLPm8KaNf90WATANYljEDND3G7aUH51PT14MX6GAzMSxdiTOYXGLzhCoPZbX4MMlAy8d4	Neuf	\N	f
145	2023-01-31 21:58:58.084515+00	43	4	455	Urgent	0	f	2023-01-31	7000	\N	1	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__7EDFXlowVgJj0Ea2m8FufU06UWmPxCma5xi9q4NgK2YT8HAVj2lBj3NMfV0vSwRcOZ2mm5ymlPbysMc42aqDD2qUf4hk9c1aReqA60Zfzte8Wn9MWb5zmCVvU4mErpZIKlmOWJf35uODvk6jXaA0zsLf5aH2WAGwk1pRxz3pRxZMYyRneWryawscqGIEAtw5rQJVekJWjRI8LWnzqAdOMAWlukM5EHF3yQuuODJM	Neuf	1	f
150	2023-02-01 21:13:21.974404+00	44	61	515	Peu urgent	0	f	2023-02-01	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:61__1BIubUnyek0m3zmjNsWGGwz01ZLhwa37EcX9ccUwLEaeZm5rBK46FDzXHZQmFhtAdjT4MadQrb7joLyIxtKqkujia4IBJq83KX55JUssHNqDFXVOUIxP6P1GPmDwHYd4xRlSRHfh4etO	Neuf	\N	f
152	2023-02-02 19:39:56.163384+00	43	62	448	Pas urgent	0	f	2023-02-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:62__LhN9y16YvFX1WrQHnEuum4myBJAvd1wRfHkurP9bmvMfdQKlBmEYPJDn7bH53QHkcfpxS02bSRbriCBA6G8ELaJ75WX4EcRWy2HjjrlXmshgwdUqg7IU	Neuf	\N	f
153	2023-02-02 19:39:56.168736+00	43	62	449	Pas urgent	0	f	2023-02-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:62__LhN9y16YvFX1WrQHnEuum4myBJAvd1wRfHkurP9bmvMfdQKlBmEYPJDn7bH53QHkcfpxS02bSRbriCBA6G8ELaJ75WX4EcRWy2HjjrlXmshgwdUqg7IU	Neuf	\N	f
151	2023-02-02 19:39:56.156846+00	43	62	445	Pas urgent	0	t	2023-02-02	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:62__LhN9y16YvFX1WrQHnEuum4myBJAvd1wRfHkurP9bmvMfdQKlBmEYPJDn7bH53QHkcfpxS02bSRbriCBA6G8ELaJ75WX4EcRWy2HjjrlXmshgwdUqg7IU	Neuf	\N	f
94	2023-01-02 11:49:07.449567+00	43	27	445	Urgent	0	t	2023-01-02	\N	\N	\N	3	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}	client:27__8BBisgcyxyQAftdiRjksny15CQ1CKpIFPFB76yqDfBkWM5R9eLzGNDekLaQEli882W3zuIPjQEaqD6C5whGFbrVe6tgFFCLrYClYz1H6gPSlPJhMT3QRRcZ5AzLsEhiMPkbo19PlETw6St3ZBuV1XWaNfMfQb4VLILJRGnd1Y27OU4H3ZtmJ7sqYNvsp0GlRyRxM1fulpgB2tC0jPOo8wtHC	Neuf	\N	f
154	2023-02-04 01:02:45.899773+00	44	59	511	Urgent	0	f	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
155	2023-02-04 01:02:45.91916+00	44	59	512	Urgent	0	f	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
156	2023-02-04 01:02:45.927443+00	44	59	505	Urgent	0	f	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
158	2023-02-04 01:02:45.94437+00	44	59	497	Urgent	0	f	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
159	2023-02-04 01:02:45.952059+00	44	59	519	Urgent	0	f	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
157	2023-02-04 01:02:45.936364+00	44	59	496	Urgent	0	t	2023-02-04	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:59__Tx4B6XHmZKmnEfBVPTfwjV4eMN6KhEC6jdPydY1sTwUb47QrxpwZPSUEXmjwevvsDvE3HAja6v986xMhccZUt2OZvfsDEUqWI1uybbG4ntgHCkANeniZuvWlZ6kxp4EfSN	Neuf	\N	f
161	2023-02-05 13:18:35.889043+00	43	64	445	Peu urgent	0	f	2023-02-05	\N	\N	\N	3	{"name":"Ahogbohoue","lat":6.3743317,"lng":2.380128}	client:64__B387fP2SPvcXXjr8JPbawbK83RmQtbfmpQuyNwoPwrek9p1RY45bzJQ4bbAa8BuEDRTG69tECtbPEzJAthx0WjMPAS1y1B8oLSYKCI8ASAsnLFO0TNZsRlvJl2Df9mkdJBmGBdp6OIMKj4bvUAqElp90FnQuqbQ5KyYLMhf7B0rIBPDS9Chw	Neuf	36	f
160	2023-02-05 12:45:04.610585+00	44	63	539	Peu urgent	0	t	2023-02-05	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:63__gfGTRz5YgkucAaBVdjC1HbdsWymR9AQyAoEFDQqy9hN9AMZVR96WDA4yqR2jC46LzgzGu8jEpGHs0h7J8du4eMiD2c5ux0cSYmQEb3GwE1dMKYGaMk0qo4NsDwVQHxIYR7ChTwTvPRhdoTyyI6H16924zc99Gpd6iMg7Uvhq3UKrOSg7CfS66K0wbHk67wwWk9EKdM0VlFiNtkpQzoxSt2pF5s7Z1H	Neuf	36	t
163	2023-02-05 16:40:02.51326+00	44	65	831	Urgent	0	f	2023-02-05	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:65__RILWjt9CmX9elhb5fsq3josj29ftGJuCxjbBOcWsfTmwb4mFPrRtBqWI3CrxRDuIwn2LJgTRQKyaa1EQd8fxsJIpz1ir0227oFUEYmyn1ZtJEqVz2F8csHep48ggQtK2xw6URm0RbajO6t3gNRxWl7MJiY744cRBmpNjgkAwkYnzhZsk8u9r4klh	Neuf	25	f
162	2023-02-05 16:40:02.495325+00	44	65	550	Urgent	0	t	2023-02-05	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:65__RILWjt9CmX9elhb5fsq3josj29ftGJuCxjbBOcWsfTmwb4mFPrRtBqWI3CrxRDuIwn2LJgTRQKyaa1EQd8fxsJIpz1ir0227oFUEYmyn1ZtJEqVz2F8csHep48ggQtK2xw6URm0RbajO6t3gNRxWl7MJiY744cRBmpNjgkAwkYnzhZsk8u9r4klh	Neuf	25	t
164	2023-02-06 01:52:57.435318+00	54	60	775	Urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Hotel Tibi Libi","lat":6.4860963,"lng":2.3373378}	client:60__UkiQEQ9xCRpkg2F2nacR1PLKHyEItyfUCNIVvErHJ09i67BxqQEwbWJQw4TU7kpniV3Nqv2xqGwThj7GQEynQYOwXuM6YuksnMTb3zzi0BlNd62A5QEAMFVtEMsjR6vvveuovvvUDlYhLuHQ1hJrIOUFTIVbbqMCKfacmUjg7pZ95WIBbVp315NdD1cJipQQvZvqSOSe1CM9fbwLc1jHTbnBFfQVyqA4vjr2mSUU	Neuf	25	f
165	2023-02-06 10:43:31.845007+00	43	66	452	Peu urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Godomey","lat":6.413202399999999,"lng":2.3123031}	client:66__V5Ta5NFRRglGHwMGPyqXWd6rCChJMaA3vaDNfZYU5VhiuaObmvGj8Cbvqpo4wJYwW49K294DNpzeoQnuehPPF64rNrVDitNzLIwG3ZgZRGHvNeEeI811xtjqOXdY2ZLCZjsipgNXTzTgWrMU533o5Lazjo95R7cZamRZgcaTZ5dgqVER	Neuf	\N	f
166	2023-02-06 17:17:59.149256+00	44	67	504	Pas urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:67__VLLv5XeUxuD3iyp3N8kxxs3FhNtiqriqEsPEpUgqzJwOTncYk0VXeWZMnwrXtOV1JP6NtLCSBSfCWTBBAEdmMRmVxThSqdb2FARNV5zWxYoABa9uTltZ3g0gnPS5WNi6gVNNxnQp6yCqOj	Neuf	36	f
167	2023-02-06 17:44:54.781812+00	43	68	470	Urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"","lat":0,"lng":0}	client:68__ep1cH8tTTLdUGEUtjEJQjOCMlU6isSaHDaqEdBKXIKNS10q806vZhfL39TP9P2kTfxvjiMnzy42UtnlePWLecgQUwscvUXGxuI0ubTdINd6GkzSk1aA75KtepRHDIAe9YOUcViJ7WPkRFZWHBxejffPLNNvsUM1ucZlhQIILJxA1jtxcjj9RRgfA5uVOv69vrtRRK6hehkJPeDYYvMdMlLSYxPWHCOjDZAqVhq1h	Neuf	36	f
168	2023-02-06 18:59:25.209707+00	45	69	571	Pas urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Plage Akpakpa","lat":6.3595998,"lng":2.4838771}	client:69__08Q5V1MoqC7YBgNXtziXndW7TbY78T88euOvqHPr29Gh8eF5zaTqAieUI98D0M7YqXgYl7FocOChlvzmd6dRmd90ym4RqMnDQZeDIdivTnnm32I2A59oCNik0M9IJgZL5G6bJ37Y9H84IoJ1B8KdVP4zOKFkxbbaPWA6890W62aeH0n1MomhikfEKIKScXjC7AFVKmwCJme5V2nejW4fSqyy	Neuf	36	f
169	2023-02-06 19:05:40.397336+00	48	70	642	Peu urgent	0	t	2023-02-06	\N	\N	\N	3	{"name":"Paris","lat":48.856614,"lng":2.3522219}	client:70__AxrYGpP8nCCdVJZ3W1E93TwKAcqeeMM93mViWvakBG986VHwMSMgSNhMtf6iVK3UEIBeqV2GCQW7p2amxvOhaHqyYPBV6OKHtiSXbLey7taNllgfHPoq0TQUDSiOrrFHwNkAxawoZ4gyb7S8oVZCutj1ya2fGa7F7kdpObuHgMH5UYoG9HfIWkQdcQrrLq8ozuVmV3G2ZoGbkCZazdE0nd	Neuf	36	f
170	2023-02-06 19:37:06.853477+00	44	71	506	Urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Cotonou Akpakpa/Minontchou","lat":6.3905371,"lng":2.4548505}	client:71__lZ500vwRUZHMFBFOhRqGBrsLhSaubx45eT6T9RVpf7a7e1dVxx8bdtiH7DbWkAz0yUlwKkqa4UPaKcHBkHe43tEqEDKcoAPjyJX5HEUtdrXaT1w5SodPriwGaryQfyUUBrTQwvLYPamOsNe8maMBV0	Neuf	36	f
171	2023-02-06 19:50:40.856833+00	43	72	449	Peu urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Calavi Aïtchedji","lat":6.4502826,"lng":2.3468111}	client:72__UZoAgbSM4mr590KFyKALA58eiWfJ1RLW70knBi8FAfK57773MDuGBGOdRWjpLLH83QwD5i0XVxZ6XkuGlTC9vNnByNEF4RYcnq5F22Xvp3PEYlBya1kiGvqDdgnoUb2TSadzrKIhqZpeBHY4oCXbPH1w0m3H5vi06wKfVBbUm9BjWfLUPB	Neuf	36	f
172	2023-02-06 20:45:46.881712+00	43	73	462	Pas urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Marché Midombo","lat":6.377594999999999,"lng":2.4437915}	client:73__SKlF8hoSKQOTJHc1I7MXhUUEfFSaPbsTtdJHOTySGNL9nh9wOOaYm0bwjpHVdBw75PiKAt8arOGYxSl1hC3BdT1dW1gQbpVbps22mlRd4X5nzk2UAXL5ii5LEeqPi8Yhb5cinENkdsuT2FvxSdtcLC3Yr6pXFo4B7W8T71YrLYPKyEL6aSGZ5j70ISY4etpRmfQNX7XhQtZXCeLriSXZEZEnm0DUc4epPhsHHIKa5UDUYdtS	Neuf	36	f
173	2023-02-06 20:45:46.897272+00	43	73	461	Pas urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Marché Midombo","lat":6.377594999999999,"lng":2.4437915}	client:73__SKlF8hoSKQOTJHc1I7MXhUUEfFSaPbsTtdJHOTySGNL9nh9wOOaYm0bwjpHVdBw75PiKAt8arOGYxSl1hC3BdT1dW1gQbpVbps22mlRd4X5nzk2UAXL5ii5LEeqPi8Yhb5cinENkdsuT2FvxSdtcLC3Yr6pXFo4B7W8T71YrLYPKyEL6aSGZ5j70ISY4etpRmfQNX7XhQtZXCeLriSXZEZEnm0DUc4epPhsHHIKa5UDUYdtS	Neuf	36	f
174	2023-02-06 20:45:46.910975+00	43	73	463	Pas urgent	0	f	2023-02-06	\N	\N	\N	3	{"name":"Marché Midombo","lat":6.377594999999999,"lng":2.4437915}	client:73__SKlF8hoSKQOTJHc1I7MXhUUEfFSaPbsTtdJHOTySGNL9nh9wOOaYm0bwjpHVdBw75PiKAt8arOGYxSl1hC3BdT1dW1gQbpVbps22mlRd4X5nzk2UAXL5ii5LEeqPi8Yhb5cinENkdsuT2FvxSdtcLC3Yr6pXFo4B7W8T71YrLYPKyEL6aSGZ5j70ISY4etpRmfQNX7XhQtZXCeLriSXZEZEnm0DUc4epPhsHHIKa5UDUYdtS	Neuf	36	f
175	2023-02-07 06:36:24.752255+00	43	74	455	Urgent	0	f	2023-02-07	2500	\N	1	3	{"name":"Institut de Mathématiques et de Sciences Physiques (IMSP)","lat":6.584084,"lng":2.5534002}	client:74__Zh7gjrP5gEW4ZWEjLIgfa9CljizCY6HaXhqR0wiZT2NsMGpKp9fJXoh7ynCyESVWSExwUVDgqSpZEiyHWrLiwNQBnA5Z5O1zNW6dhpvcNAIgydOonLpphGArewX4CLdtlVQ6hTDIBEgPTuABnh38qfYUcZt9SXkTLe	Neuf	\N	f
176	2023-02-07 08:04:37.927635+00	43	75	448	Pas urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Bohicon","lat":7.179768399999999,"lng":2.0714223}	client:75__ZQ9qqaF3N5KFyXNCuD2IxOz46mNZ9bvug3I7i7RFoLnz2BAkpg5aHJlAw10TYjdQKLfmO82Jj79kYhyio2ZJcynpEJiapotMEPitcbhoRcaTepVow24RWejfdcIzQeNwGnqVPol4y6vrVp26xzt2pH2deo3lLwlV42YOguzUqBPsyAd2CdJWyRNLZSUzFRiLa5Yi14LvogmKA1lp	Neuf	36	f
177	2023-02-07 08:04:37.945922+00	43	75	449	Pas urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Bohicon","lat":7.179768399999999,"lng":2.0714223}	client:75__ZQ9qqaF3N5KFyXNCuD2IxOz46mNZ9bvug3I7i7RFoLnz2BAkpg5aHJlAw10TYjdQKLfmO82Jj79kYhyio2ZJcynpEJiapotMEPitcbhoRcaTepVow24RWejfdcIzQeNwGnqVPol4y6vrVp26xzt2pH2deo3lLwlV42YOguzUqBPsyAd2CdJWyRNLZSUzFRiLa5Yi14LvogmKA1lp	Neuf	36	f
178	2023-02-07 08:04:37.961543+00	43	75	450	Pas urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Bohicon","lat":7.179768399999999,"lng":2.0714223}	client:75__ZQ9qqaF3N5KFyXNCuD2IxOz46mNZ9bvug3I7i7RFoLnz2BAkpg5aHJlAw10TYjdQKLfmO82Jj79kYhyio2ZJcynpEJiapotMEPitcbhoRcaTepVow24RWejfdcIzQeNwGnqVPol4y6vrVp26xzt2pH2deo3lLwlV42YOguzUqBPsyAd2CdJWyRNLZSUzFRiLa5Yi14LvogmKA1lp	Neuf	36	f
180	2023-02-07 09:47:21.39072+00	45	60	571	Urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Hotel Tibi Libi","lat":6.4860963,"lng":2.3373378}	client:60__oRGSNbl0OP4tCq89q6yei3iekGui2OtjOgJckq3usdstKUWuQygC4Jx5EYExdqNXS9jOrSVGSbj5CfAsdqUYCsQ54atGdTDmOSJQPjyJXiicaTT7eILwDVUmPbQQly	Neuf	25	f
179	2023-02-07 08:46:52.916478+00	43	76	471	Pas urgent	0	t	2023-02-07	\N	\N	\N	3	{"name":"Fidjrossè","lat":6.357872599999999,"lng":2.3721562}	client:76__K8JpaDGTmaFJWttBk5dCyMrrQBj48ddYMA6oK1knVoJycEaryErFtUhI3nWC45cWolCKtuLACY6WQZV1IphLSTWmxM705XwoANzOdFjoHaIeG5tEcJEgI9MHVfiIAu	Neuf	36	f
181	2023-02-07 09:56:11.763334+00	53	4	771	Urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}	client:4__9wPd3GAtKvFHAskEPBSPJmpkGxSFawpJXuy6H2Dyn0nDncdAB5ci7T7YSHWpgfGbqCRonneGUtQ5QcqYbLq6tKIlJKp1SNwpm54XjgY35q4ogf7ScUWghBhTxxHlipl6gZeSZu7oPMyThL4Pj9OWjSpZYwxkvyuYxiqD	Neuf	1	f
182	2023-02-07 10:10:57.763124+00	44	77	550	Urgent	0	t	2023-02-07	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:77__uviwSUrnzvPRABnMfbbRoLNFprK1zAYuqKiYWL8PjnvG2tEWtMOtS31qIADeG5h1dFW6U8KXJxtqtjnPQurXvXwbdeN1lfsxse5Ey4DwnZDYgJdbUJnhybyJKVr6e0RBhN8BJVUumnBmAijWCAx9Uxfcabb8EfLhi3Cw5k	Neuf	25	f
183	2023-02-07 10:10:57.776242+00	44	77	831	Urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:77__uviwSUrnzvPRABnMfbbRoLNFprK1zAYuqKiYWL8PjnvG2tEWtMOtS31qIADeG5h1dFW6U8KXJxtqtjnPQurXvXwbdeN1lfsxse5Ey4DwnZDYgJdbUJnhybyJKVr6e0RBhN8BJVUumnBmAijWCAx9Uxfcabb8EfLhi3Cw5k	Neuf	25	f
185	2023-02-07 15:18:02.859158+00	44	78	831	Urgent	0	f	2023-02-07	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:78__5HpIVQq2UQwhJyZb0OJc8OTXJ43FomCK02OaJ5NYt0AJ8RI0150s5YnNLpMF7dvlyle4yWqqRsf44iTb4Mc4zFJKis0aBpjuy5OLEgcbKHZKA4ot09Um75LXNjS2y0L5b9WDrWgQzNQFK5a5ffY9lENKQ6b2SfxylUPpOFm8jOMpW0copRUhKrNZ	Neuf	25	f
184	2023-02-07 15:18:02.841895+00	44	78	550	Urgent	0	t	2023-02-07	\N	\N	\N	3	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}	client:78__5HpIVQq2UQwhJyZb0OJc8OTXJ43FomCK02OaJ5NYt0AJ8RI0150s5YnNLpMF7dvlyle4yWqqRsf44iTb4Mc4zFJKis0aBpjuy5OLEgcbKHZKA4ot09Um75LXNjS2y0L5b9WDrWgQzNQFK5a5ffY9lENKQ6b2SfxylUPpOFm8jOMpW0copRUhKrNZ	Neuf	25	f
\.


--
-- Data for Name: app_clientdemand_clicked; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_clientdemand_clicked (id, clientdemand_id, selleraccount_id) FROM stdin;
1	98	33
2	96	33
3	82	5
6	81	47
7	69	47
8	95	47
9	96	36
10	70	9
11	52	42
13	102	42
16	103	42
18	105	32
21	82	36
23	98	45
24	94	45
25	102	45
26	85	45
28	72	31
29	106	42
31	78	30
32	94	12
34	101	50
37	111	42
40	118	41
41	113	41
42	114	41
43	73	51
44	51	51
45	131	80
46	123	80
47	123	77
49	131	77
50	134	70
52	117	46
53	136	46
54	146	28
55	131	85
56	142	85
57	123	85
58	149	85
59	147	29
61	59	15
62	110	15
64	151	12
65	89	28
67	157	85
68	160	65
69	162	65
75	163	75
82	162	32
86	160	81
87	119	54
88	169	54
89	146	57
92	162	57
93	182	65
96	182	57
99	179	36
100	183	75
104	184	65
108	184	75
\.


--
-- Data for Name: app_clientdemand_files; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_clientdemand_files (id, clientdemand_id, myfiles_id) FROM stdin;
\.


--
-- Data for Name: app_feedback; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_feedback (id, "user", seller, picture, text, rank) FROM stdin;
1	Thomas t. Atade	Luxurious Mall	media/feedback/jeans_l4sdi2_xkp0cc	J'avoue que j'avais un doute au début. Mais après avoir découvert la plateforme Zawadi pour les clients où des acheteurs enregistrent des demandes plus ou moins urgentes et avoir reçu les premiers clients je suis vraiment satisfait de la platefor👍👍	100
2	Roland Migan	SHOP LABS	media/feedback/liviu-c-ti3P_Bm2zio-unsplash_buguio	Au début les clients venaient lentement mais après un moment ça a commencé a aller plus vite et les clients que je contactais étaient prêts a acheter mes produits.	108
3	Aristide	Golden Clothe	media/feedback/gold-gradient-background_d2xisf	J'écris cet avis parce que je pense que cette plateforme mérite réellement. \r\nMême si tous les clients n'achète pas c'est un excellent moyen de garder contact et de présenter d'autres produits car les clients sont vraiment accueillant.	1
4	William	Will Shop	media/feedback/MacBook_pro_hgbp4y_fydi36	Il faudra peut être penser à ajouter le budget du client sinon moi ça m'aide beaucoup parce que c'est comme un canal de secours pour avoir plus de clients.	10
5	da Silva  Elfried 	Amir Shop		Nous tenons là sûrement la révolution en matière d'achat vente. J'ai essayé et j'ai beaucoup apprécié le concept. 	1
\.


--
-- Data for Name: app_label; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_label (id, name, is_on) FROM stdin;
13	Mode et Beauté	t
14	Téléphonie	t
15	Electronique	t
16	Maisons, Ménage	t
\.


--
-- Data for Name: app_myfiles; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_myfiles (id, name, file, created_at) FROM stdin;
1	blog_main	media/demandes/png_20230107_192509_0000_so0kld	2023-01-02 10:15:40.787355+00
2	Politique_de_confidentialite	media/demandes/politique_de_confidentialite_vqepdq	2023-01-23 13:00:30.551745+00
3	market1	media/demandes/sample_jqnbvg	2023-02-01 06:18:32.266432+00
4	bonus+	media/demandes/african-american-woman-outdoors-by-skyscraper_ce6fjc	2023-02-08 15:29:17.623675+00
\.


--
-- Data for Name: app_parrain; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_parrain (id, whatsapp, full_name, email, ident, money, current, status, tof, act_err, veracity) FROM stdin;
27	\N	CAKPO DIANE 	djcakpo@gmail.com	WS9	0	0	t		\N	100
19	\N	HOUESSOU-AYELO Expédit	vigninnou@gmail.com	mMO	0	0	t		\N	100
2	\N	Batcho Clémence 	clemencebatcho3@gmail.com	MVH	0	0	t		\N	100
3	\N	FOUTA Aboudou Razack 	aboudourazackf@gmail.com	QoZ	0	0	t		\N	100
21	\N	Hounye Raymond 	juandanielmesio@gmail.com	OyT	0	0	t		\N	100
22	\N	ADIKPONTO Valette 	valetteadikponto@gmail.com	2sb	0	0	t		\N	100
4	\N	FOUTA Aboudou Razack 	aboudourazackf@gmail.com	xEd	0	0	t	media/FB_IMG_16691937824021151_u9qovy	\N	100
5	\N	Vidjinnagni sabin brice Dansou	sabinbricedansou@gmail.com	a4e	0	0	t		\N	100
23	\N	MEVO Anne	annemevo2017@gmail.com	A82	0	0	t		\N	100
46	66521130	TOKPLONOU Ornelle M.Z.	otokplonou@gmail.com	QTW	0	0	t		\N	100
24	\N	HOUINSOU Nelly 	joie2019amor@gmail.com	9KK	0	0	t		\N	100
12	\N	DUROJAYE  Marie Michelle 	durojayepamela271@gmail.com	Io5	0	0	t		\N	100
6	\N	Vidjinnagni sabin brice Dansou	sabinbricedansou@gmail.com	vjo	0	0	t	media/IMG-20230131-WA0013_lm7o4p	\N	100
7	\N	HOUNDJO Cathérine	catherinehoundjo499@gmail.com	PZa	0	0	t		\N	100
8	\N	Fassinou Alexandre	alexandrefassinou7@gmail.com	LGQ	0	0	t		\N	100
35	\N	Estelle ADJOVI 	estelleadjovi579@gmail.com	SUT	0	0	t		\N	100
10	\N	ADOGBAGBE AMEYO 	Ameyoadogbagbe@gmail.com	19f	0	0	t		\N	100
9	\N	Fassinou Alexandre	alexandrefassinou7@gmail.com	TiL	0	0	t		\N	100
11	\N	DUROJAYE  Marie Michelle 	durojayepamela271@gmail.com	pUr	0	0	t		\N	100
13	\N	Noël ZOHOUE	zohouenol@gmail.com	ej8	56085	10528	t			30
43	61664759	Enock 	enockdossou01@gmail.com	Ua7	0	0	t		\N	100
26	\N	AMOUSSA zilal 	aadouni383@gmail.com	79G	0	0	t		\N	100
20	66492410	HOUESSOU-AYELO Expédit	vigninnou@gmail.com	WTm	0	0	t		\N	100
14	\N	AGBOTON A. J. Isaïe Tudi	agbotonisaie09@gmail.com	8XK	0	0	t		\N	100
15	\N	AGBOTON A. J. Isaïe Tudi	agbotonisaie09@gmail.com	h1F	0	0	t		\N	100
16	\N	Awlo Charlemagne	charlemagneawlo1@gmail.com	Zfm	0	0	t		\N	100
44	+229 54042924	Rouchdan KPOZEHOUIN	kpozehouinrouchdan@gmail.com	eeI	0	0	t		\N	100
17	\N	ALIDJINOU Moui-Deen 	mouideenprofessionnel@gmail.com	S5Z	0	0	t		\N	100
18	\N	HOUESSOU-AYELO	vigninnou@gmail.com	jBK	0	0	t		\N	100
40	\N	Karl	boyissoukarl@gmail.com	sPQ	0	0	t		\N	100
29	\N	Nabilath MOUSTAPHA 	Jaquelinemoustapha@gmail.com	s3t	0	0	t		\N	100
28	\N	Hounmenou Carrel	carrelhounmenou5@gmail.com	00d	0	0	t		\N	100
30	\N	Armand Ogoubiyi 	armandhouetchenou@gmail.com	RBb	0	0	t		\N	100
31	\N	Armand Ogoubiyi 	armandhouetchenou@gmail.com	WjL	0	0	t		\N	100
32	\N	Armand Ogoubiyi 	armandhouetchenou@gmail.com	tme	0	0	t	media/IMG_20221017_073915_tcfopz	\N	100
37	\N	ADIKPONTO Valette 	valetteadikponto@gmail.com	mLP	0	0	t		\N	100
33	\N	Armand Ogoubiyi 	armandhouetchenou@gmail.com	7qw	0	0	t		\N	100
34	\N	Armand Ogoubiyi 	armandhouetchenou@gmail.com	awn	0	0	t		\N	100
39	62799675	OGOUTEÏBO Ornéla 	temiogouteibo@gmail.com	p3o	0	0	t		\N	100
1	\N	ENOUHERAN Georis	georiseno@gmail.com	zNN	285	285	t		\N	30
38	\N	ADIKPONTO Valette 	valetteadikponto@gmail.com	G3I	0	0	t		\N	100
42	\N	TCHOUKPA laurenda	laurendatchoukpa355@gmail.com	VtC	0	0	t		\N	100
45	66 22 19 20 	DUROJAYE  Marie Michelle 	durojayepamela271@gmail.com	v2C	0	0	t		\N	100
41	\N	Karl	boyissoukarl@gmail.com	asP	0	0	t		\N	100
47	56461130	ADJAYIBO Lisias 	lisiasadjayibo@gmail.com	6XX	0	0	t		\N	100
48	+22953764591	Robaniyath Chouti 	robaniyathchouti@gmail.com	Cnb	0	0	t		\N	100
36	+22966657059	ADIKPONTO Valette	valetteadikponto@gmail.com	GXk	1450	1450	t			30
25	66 22 19 20	DUROJAYE  Marie Michelle	durojayepamela271@gmail.com	9Lt	872	872	t		warning::Nous avons remarqué une activité suspecte liée a des emails incorrects. Veuillez contacter le service client pour corriger si vous pensez que c'est une erreur.	30
\.


--
-- Data for Name: app_retrait; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_retrait (id, created_at, montant, solded, parrain_id) FROM stdin;
1	2023-02-06 22:12:45.5699+00	1000	f	36
\.


--
-- Data for Name: app_selleraccount; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_selleraccount (id, name, user_id, count, created_at, last_abn, picture, type_of, speed, abn_count, rest, expired_date, has_freed, whatsapp, damount, damount_init, dprice, dm_alert, format_number) FROM stdin;
42	Sam modèle	50	0	2022-12-10	2022-12-10 00:00:00+00		free	3	0	0	2023-01-09	t	57290905	0	200	100	f	+22957290905
32	LIHONOU Bénédite	40	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	0	2023-01-06	t	94801023	0	200	100	f	+22994801023
51	Ordinateur-Teléphone shop	65	0	2022-12-21	2022-12-21 00:00:00+00		free	3	0	1	2023-01-20	t	52109010	400	200	100	f	+22952109010
24	Dina's design 	32	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	\N	200	200	100	f	\N
12	Christi🥰shop	20	0	2022-12-05	2022-12-05 00:00:00+00		free	3	0	1	2023-01-04	t	51879311	100	200	100	f	+22951879311
6	LAST SHOP	11	0	2022-12-05	2022-12-05 00:00:00+00		free	3	0	1	2023-01-04	t	\N	100	200	100	f	\N
11	Domnus Com Business	18	0	2022-12-05	2022-12-05 00:00:00+00		free	3	0	1	2023-01-04	t	\N	200	200	100	f	\N
37	TomImport	45	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	\N	200	200	100	f	\N
35	Ets GOD’s plan	43	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	\N	200	200	100	f	\N
13	Black-gold parfumery et lingerie 	21	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	\N	200	200	100	f	\N
55	Olowookere frip	119	0	2023-01-02	2023-01-02 00:00:00+00	media/accounts/Cap_20230102_192812_i58uzz	free	3	0	1	2023-02-01	t	94917020	100	200	100	f	+22994917020
19	Land	27	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	\N	200	200	100	f	\N
15	Beauté d'Or	19	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	59189196	100	200	100	f	+22959189196
7	Shoppy	12	0	2022-12-05	2022-12-05 00:00:00+00		free	3	0	1	2023-01-04	t	\N	200	200	100	f	\N
56	Adambadji	138	0	2023-01-07	2023-01-07 00:00:00+00		free	3	0	1	2023-02-06	t	67909499	200	200	100	f	+22967909499
17	Aurorashop 	25	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	\N	200	200	100	f	\N
52	Noll GSM	68	0	2022-12-22	2022-12-22 00:00:00+00		free	3	0	1	2023-01-21	t	97568775	200	200	100	f	+22997568775
27	Ulrich service express 	37	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	\N	200	200	100	f	\N
40	Shadé's Beads	47	0	2022-12-08	2022-12-08 00:00:00+00	media/accounts/IMG_20230114_235610_449_i22rqy	free	3	0	1	2023-01-07	t	64127373	200	200	100	f	+22964127373
43	Mahouna Services Ventes MSV	51	0	2022-12-10	2022-12-10 00:00:00+00		free	3	0	1	2023-01-09	t	95 20 40 52	100	200	100	f	+22995204052
49	CHRIST ALONE (CA)	59	0	2022-12-14	2022-12-14 00:00:00+00	media/accounts/20221127_130851_gljh09	free	3	0	1	2023-01-13	t	+22967080601	200	200	100	f	+22967080601
38	Open Gold	29	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	\N	200	200	100	f	\N
54	Ana	111	0	2022-12-31	2022-12-31 00:00:00+00		free	3	0	1	2023-01-30	t	60340248	100	200	100	f	+22960340248
47	Kevin shop	56	0	2022-12-11	2022-12-11 00:00:00+00	media/accounts/IMG-20221201-WA0020_oqwxly	free	3	0	0	2023-01-10	t	67296100	0	200	100	f	+22967296100
39	ZIGI Apple Store 🍏🍎👏	46	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	\N	200	200	100	f	\N
46	AUBIN MARKETPLACE	54	0	2022-12-11	2022-12-11 00:00:00+00		free	3	0	1	2023-01-10	t	default	100	200	100	f	+22997310401
57	HAPPINESS MARKET	145	0	2023-01-14	2023-01-14 00:00:00+00		free	3	0	1	\N	t	default	400	200	100	f	+22994044921
58	Luli	147	0	2023-01-16	2023-01-16 00:00:00+00		free	3	0	1	\N	t	97628881	100	100	100	f	+22997628881
41	ÉLECTRONIQUE ARTS	48	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	61018048	200	200	100	f	+22961018048
23	Beauty	31	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	54006290	200	200	100	f	+22954006290
44	Tchéké Shop	52	0	2022-12-10	2022-12-10 00:00:00+00		free	3	0	1	2023-01-09	t	61555705	200	200	100	f	+22961555705
33	LOLA SHOP	41	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	0	2023-01-07	t	97283759	0	200	100	f	+22997283759
50	Black gold parfumery et lingerie🤤	63	0	2022-12-21	2022-12-21 00:00:00+00		free	3	0	1	2023-01-20	t	69144188	200	200	100	f	+22969144188
5	BAGAM Shop	8	0	2022-12-04	2022-12-04 00:00:00+00	media/accounts/edgar-nKC772R_qog-unsplash_m2gbou	free	3	0	1	2023-01-03	t	61 55 57 05 	200	200	100	f	\N
53	Geodasbax	109	0	2022-12-30	2022-12-30 00:00:00+00		free	3	0	1	2023-01-29	t	62775744	200	200	100	f	+22952405727
22	Elegance House Benin 	30	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	\N	200	200	100	f	\N
25	Joy	33	0	2022-12-07	2022-12-07 00:00:00+00	media/accounts/FotoGrid_20221201_143248559_e2xghx	free	3	0	1	2023-01-06	t	+22963426111	200	200	100	f	+22963426111
34	Data five	42	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	52711122	200	200	100	f	+22952711122
30	Longrich	38	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	66066996	200	200	100	f	+22966066996
29	Mana's Shop	24	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	51820913	100	200	100	f	+22951820913
31	ANDREZZY SHOP	39	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	+22961325758	100	200	100	f	+22961325758
14	Luthor informatique	22	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	96286526	200	200	100	f	+22996286526
18	Fad store	26	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	\N	200	200	100	f	\N
28	Ingrid shop	36	0	2022-12-07	2022-12-07 00:00:00+00		free	3	0	1	2023-01-06	t	63705734	100	200	100	f	+22963705734
16	ADk store	15	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	+22966107320	200	200	100	f	+22966107320
20	Yêyi Sacs et accessoires	28	0	2022-12-06	2022-12-06 00:00:00+00		free	3	0	1	2023-01-05	t	\N	200	200	100	f	\N
36	Vignon Vigil Fashion	44	0	2022-12-08	2022-12-08 00:00:00+00		free	3	0	1	2023-01-07	t	96173492	100	200	100	f	+22996173492
59	Esséname business	149	0	2023-01-18	2023-01-18 00:00:00+00		free	3	0	1	\N	t	96054920	200	200	100	f	+22996054920
76	Stella beauty 	167	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	1	\N	t	default	100	200	100	f	+22966636940
73	MT-ACCESS	163	0	2023-01-25	2023-01-25 00:00:00+00	media/accounts/IMG-20230118-WA0072_eyokja	free	3	0	1	\N	t	default	100	200	100	f	+22964971835
48	Adjademe fashion prêt à porter	58	0	2022-12-12	2022-12-12 00:00:00+00	media/accounts/Screenshot_20221121-090624_wdh6so	free	3	0	1	2023-01-11	t	(229)62-69-50-06	200	200	100	f	+22962695006
68	noblesse shop	158	0	2023-01-24	2023-01-24 00:00:00+00	media/accounts/b47bd128494a4c71b7b9cac8bc8490af_dnb4ff	free	3	0	1	\N	t	default	200	200	100	f	+22996410411
67	Elvis shop 	157	0	2023-01-24	2023-01-24 00:00:00+00	media/accounts/IMG-20230108-WA0012_jzumtp	free	3	0	1	\N	t	default	200	200	100	f	+22960493910
77	Ulvisshop	168	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	0	\N	t	default	0	100	100	f	+22966468339
79	KÀ TÁ	170	0	2023-01-26	2023-01-26 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	+22999000157
62	Top Informatique	152	0	2023-01-19	2023-01-19 00:00:00+00		free	3	0	1	\N	t	61361629	100	100	100	f	+22961361629
84	Faith	175	0	2023-01-26	2023-01-26 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	+22967571914
71	Adinas bonheur	161	0	2023-01-25	2023-01-25 00:00:00+00		buisness	3	0	1	\N	t	default	1800	1900	100	f	+22965576570
69	Fashion Empire Collection 	159	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	+22994322889
65	Sacoches et bracelets	156	0	2023-01-24	2023-01-24 00:00:00+00		buisness	3	0	1	\N	t	default	1440	1800	90	f	+22968453781
89	Emmashop	191	0	2023-02-03	2023-02-03 00:00:00+00		free	3	0	1	\N	t	default	100	100	100	f	\N
63	Natacha Cosmétiques sarl	154	0	2023-01-20	2023-01-20 00:00:00+00	media/accounts/Screenshot_20221204-105533_1_afmo9w	buisness	3	0	1	\N	t	97195909	3825	3825	95	f	+22997195909
74	Le designer L.E.D	165	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	+22962014448
45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	53	0	2022-12-10	2022-12-10 00:00:00+00		free	3	0	1	2023-01-09	t	99081739	100	200	100	f	+22999081739
26	First choice	35	0	2022-12-07	2023-01-19 00:00:00+00		basique	1	0	1	2023-01-06	t	68090139	1300	1300	65	f	+22968090139
85	Tony shop et cosmétiques 	176	0	2023-01-26	2023-02-01 00:00:00+00		basique	1	0	1	\N	t	default	192	576	96	f	+22969694744
10	Sepopo house	17	0	2022-12-05	2022-12-05 00:00:00+00	media/accounts/45A912FB-E199-4494-95E7-000F476BF18A_xjfdyz	free	3	0	1	2023-01-04	t	\N	200	200	100	f	\N
75	MAHOUGNON SHOP	166	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	1	\N	t	default	100	200	100	f	+22995354470
78	Berline store	169	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	+22966014425
87	Ben shop	180	0	2023-01-28	2023-01-28 00:00:00+00		free	3	0	1	\N	t	default	100	100	100	f	+22969993184
83	Olouwa Sheyi	174	0	2023-01-26	2023-01-26 00:00:00+00		free	3	0	1	\N	t	default	200	200	100	f	\N
70	Vente de téléphonie et accessoires	160	0	2023-01-25	2023-01-25 00:00:00+00	media/accounts/IMG-20230110-WA0124_uetpx4	free	3	0	1	\N	t	default	100	200	100	f	+22998522500
81	Fifa store	172	0	2023-01-26	2023-01-26 00:00:00+00	media/accounts/IMG-20230110-WA0032_hi3wxd	free	3	0	1	\N	t	default	100	200	100	f	+22994465142
61	Établissements Sira & Fils ( ventes des ordinateurs portatifs bureautiques et autres accessoires)	151	0	2023-01-18	2023-01-18 00:00:00+00	media/accounts/IMG_20221210_151009_niwpdb	free	3	0	1	\N	t	+22969963994	200	200	100	f	+22969963994
8	Ziyeux	13	0	2022-12-05	2022-12-05 00:00:00+00	media/accounts/4EF1988F-6C5F-4FAE-BFC9-2145F2B1F944_uwuehm	free	3	0	1	2023-01-04	t	+229 58540277	200	200	100	f	+22958540277
72	GRADO Shop's	162	0	2023-01-25	2023-01-25 00:00:00+00		free	3	0	0	\N	t	default	0	200	100	t	+22954072191
9	C-Divers	14	0	2022-12-05	2022-12-05 00:00:00+00		free	3	0	0	2023-01-04	t	57370409	0	100	100	f	+22957370409
90	Vêtements	192	0	2023-02-04	2023-02-04 00:00:00+00		free	3	0	1	\N	t	default	500	500	100	f	\N
66	Test shop for abn	11	0	2023-01-24	2023-01-24 00:00:00+00		free	3	0	0	\N	t	default	0	100	100	f	+22961555705
64	Pur Eden shop	155	0	2023-01-20	2023-01-20 00:00:00+00		free	3	0	1	\N	t	61001775	200	200	100	f	+22961001775
82	Mawoussé	171	0	2023-01-26	2023-01-26 00:00:00+00	media/accounts/f5cc49855a1f47829d15f119086ffb0f_l7zhdg	free	3	0	1	\N	t	default	100	200	100	f	\N
80	AraShop	173	0	2023-01-26	2023-01-26 00:00:00+00	media/accounts/20230113_002059_0000_bkaowe	buisness	3	0	1	\N	t	default	1200	1200	95	f	+22996185771
88	La gamme posey 	187	0	2023-01-31	2023-01-31 00:00:00+00	media/accounts/IMG-20230120-WA0007_bn3gxa	free	3	0	0	\N	t	default	0	100	100	f	+22966468339
86	Kemishop	177	0	2023-01-26	2023-01-26 00:00:00+00		free	3	0	1	\N	t	default	100	200	100	f	+22966397466
\.


--
-- Data for Name: app_selleraccount_category; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_selleraccount_category (id, selleraccount_id, category_id) FROM stdin;
30	6	43
37	8	46
40	7	44
42	7	45
43	9	44
47	9	43
72	9	45
83	11	54
93	14	50
97	15	43
99	15	45
102	15	46
103	15	47
104	15	44
117	16	53
122	16	54
123	16	48
126	17	46
130	18	48
135	18	49
145	20	46
147	20	44
148	20	45
154	22	45
159	23	44
163	24	43
167	24	46
168	24	44
175	25	43
179	25	44
185	19	44
188	27	47
190	29	44
195	30	47
213	31	46
216	31	49
218	31	55
219	31	48
224	31	50
228	32	44
231	32	46
233	32	43
237	12	43
238	12	44
239	12	50
240	12	47
241	33	55
253	33	54
261	33	49
271	33	46
276	33	43
296	34	51
301	34	50
302	35	54
303	36	43
309	37	49
310	38	55
311	38	46
315	38	54
316	38	45
317	39	48
320	40	44
324	41	51
328	41	52
329	41	49
334	41	46
336	42	43
337	42	44
356	43	49
360	43	50
361	44	43
364	46	51
365	46	49
369	47	43
395	48	44
397	28	44
400	28	47
403	28	54
404	28	55
418	28	48
420	49	45
421	50	44
422	51	49
436	51	48
457	51	50
461	52	48
468	53	53
469	54	48
478	45	43
479	45	44
480	45	46
481	55	44
483	57	55
484	57	54
497	57	44
506	57	45
507	57	47
508	58	47
519	58	49
526	59	55
527	59	54
542	26	43
543	62	51
553	62	49
557	62	48
569	62	52
573	62	50
608	64	47
609	65	44
614	66	53
615	67	50
619	67	53
623	67	48
625	68	45
628	69	43
632	69	46
635	69	45
639	69	44
644	69	55
649	70	49
670	71	44
673	72	43
674	72	45
675	72	44
681	73	44
685	73	43
689	73	47
690	73	46
696	74	44
699	74	46
703	74	55
704	74	54
707	74	49
713	75	44
722	76	47
726	77	44
732	77	46
739	77	43
745	78	44
747	78	43
749	79	47
777	81	44
779	81	54
787	81	55
793	81	46
800	82	54
801	82	50
804	82	48
807	82	49
814	82	44
820	82	43
825	83	54
826	84	54
828	84	55
859	86	44
863	86	43
868	80	43
871	80	44
885	80	45
893	61	50
896	87	44
897	87	45
898	87	49
901	88	43
934	85	44
952	85	47
961	89	47
969	89	54
970	89	55
972	90	43
983	63	47
988	63	50
\.


--
-- Data for Name: app_selleraccount_subs; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_selleraccount_subs (id, selleraccount_id, subcategory_id) FROM stdin;
35	6	474
36	6	473
37	6	472
38	6	471
39	6	469
40	6	468
41	6	467
42	8	586
43	8	585
44	8	583
45	7	547
46	7	548
47	7	566
48	9	557
49	9	556
50	9	555
51	9	554
52	9	480
53	9	479
54	9	478
55	9	477
56	9	550
57	9	548
58	9	547
59	9	487
60	9	486
61	9	485
62	9	482
63	9	483
64	9	484
65	9	521
66	9	525
67	9	523
68	9	522
69	9	474
70	9	473
71	9	471
72	9	472
73	9	467
74	9	468
75	9	469
76	9	470
77	9	567
78	9	566
79	9	499
80	9	502
81	9	495
82	9	498
83	9	497
84	9	496
85	9	445
86	9	450
87	9	449
88	11	780
89	11	776
98	14	688
99	14	690
100	14	692
101	14	694
102	15	471
103	15	467
104	15	568
105	15	567
106	15	566
107	15	605
108	15	612
109	15	524
110	15	521
111	15	495
112	15	496
113	15	625
114	15	632
115	15	628
116	15	631
117	15	629
118	15	626
119	15	630
120	15	627
121	15	624
122	7	565
123	16	758
124	16	757
125	16	756
126	16	755
127	16	752
128	16	783
129	16	640
130	16	639
131	16	638
132	17	593
133	17	591
134	17	590
135	17	589
136	18	643
137	18	641
138	18	640
139	18	639
140	18	638
141	18	663
142	18	665
143	18	664
151	20	601
152	20	580
153	20	548
154	20	566
155	20	565
160	20	832
161	20	547
162	22	577
163	22	567
164	22	566
167	23	501
168	23	498
169	23	496
170	23	495
171	24	484
172	24	486
173	24	485
174	24	482
175	24	600
176	24	545
177	24	544
178	24	543
179	24	541
180	24	540
181	24	539
182	24	537
183	25	483
184	25	482
185	25	484
186	25	485
187	25	542
188	25	541
189	25	540
190	25	539
191	25	537
193	19	539
196	27	629
198	29	525
199	29	524
200	29	523
201	29	522
202	29	521
203	30	636
204	30	632
205	30	631
206	30	628
207	30	627
208	30	626
209	30	625
210	30	624
211	30	623
212	30	622
213	30	620
214	30	619
215	30	618
216	30	616
217	30	615
218	30	614
219	30	613
220	30	612
221	31	593
222	31	590
223	31	591
224	31	664
225	31	665
226	31	812
227	31	642
228	31	638
229	31	639
230	31	640
231	31	641
232	31	688
233	31	694
234	31	829
235	31	828
236	32	549
237	32	548
238	32	550
239	32	590
240	32	589
241	32	471
242	32	473
243	32	532
244	32	533
245	12	545
246	12	482
247	12	483
248	12	484
249	12	485
250	12	541
251	12	487
252	12	498
253	12	499
254	12	500
255	12	540
256	12	537
257	12	538
258	12	539
259	12	444
260	12	445
261	12	446
262	12	688
263	12	586
264	33	830
265	33	829
266	33	828
267	33	827
268	33	826
269	33	825
270	33	823
271	33	821
272	33	820
273	33	815
274	33	811
275	33	810
276	33	793
277	33	791
278	33	790
279	33	789
280	33	788
281	33	782
282	33	780
283	33	776
284	33	686
285	33	677
286	33	676
287	33	674
288	33	672
289	33	835
290	33	667
291	33	666
292	33	664
293	33	663
294	33	608
295	33	601
296	33	600
297	33	598
298	33	595
299	33	480
300	33	479
301	33	478
302	33	477
303	33	475
304	33	473
305	33	472
306	33	471
307	33	468
308	33	467
309	33	464
310	33	463
311	33	462
312	33	461
313	33	456
314	33	455
315	33	454
316	33	453
317	33	452
318	33	448
319	34	719
320	34	718
321	34	716
322	34	714
323	34	715
324	34	688
325	35	803
326	36	473
327	36	475
328	36	472
329	36	471
330	36	468
331	36	467
332	37	665
333	38	829
334	38	593
335	38	591
336	38	592
337	38	589
338	38	793
339	38	565
340	39	639
341	39	640
342	39	638
343	40	539
344	40	537
345	40	543
346	40	544
347	41	712
348	41	705
349	41	704
350	41	703
351	41	749
352	41	671
353	41	664
354	41	835
355	41	665
356	41	723
357	41	592
358	41	591
359	42	468
360	42	527
361	42	528
362	42	532
363	42	504
364	42	511
365	42	510
366	42	506
367	42	505
368	42	500
369	42	499
370	42	498
371	42	471
372	42	456
373	42	455
374	42	454
375	42	452
376	42	449
377	42	446
378	42	445
379	43	835
380	43	663
381	43	664
382	43	665
383	43	688
384	44	490
385	44	492
386	44	489
387	46	715
388	46	668
392	47	449
393	47	448
394	47	445
418	48	528
419	48	532
420	28	557
421	28	554
422	28	525
423	28	636
424	28	635
425	28	634
426	28	798
427	28	829
428	28	828
429	28	827
430	28	826
431	28	823
432	28	632
433	28	631
434	28	630
435	28	629
436	28	627
437	28	625
438	28	624
439	28	623
440	28	622
441	28	656
442	28	657
443	49	565
444	50	525
445	51	835
446	51	668
447	51	667
448	51	666
449	51	665
450	51	664
451	51	663
452	51	685
453	51	684
454	51	683
455	51	686
456	51	672
457	51	671
458	51	670
459	51	658
460	51	657
461	51	656
462	51	655
463	51	661
464	51	660
465	51	648
466	51	649
467	51	650
468	51	651
469	51	652
470	51	653
471	51	646
472	51	645
473	51	644
474	51	643
475	51	642
476	51	641
477	51	640
478	51	639
479	51	638
480	51	694
481	51	692
482	51	688
483	51	690
484	52	640
485	52	646
486	52	645
487	52	644
488	52	643
489	52	639
490	52	638
491	53	772
492	54	646
493	54	645
494	54	644
495	54	643
496	54	641
497	54	642
498	54	640
499	54	638
500	54	639
501	48	529
502	48	530
503	48	527
504	45	530
505	45	533
506	45	536
507	45	537
508	45	539
509	45	541
510	45	445
511	45	461
512	45	462
513	45	589
514	45	590
515	45	591
516	45	592
517	45	593
518	45	469
519	45	481
520	45	482
521	45	483
522	45	484
523	45	485
524	45	505
525	45	506
526	55	518
527	55	515
528	57	815
529	57	851
530	57	850
531	57	849
532	57	803
533	57	829
534	57	830
535	57	828
536	57	827
537	57	826
538	57	824
539	57	822
540	57	821
541	57	820
542	57	547
543	57	549
544	57	551
545	57	550
546	57	548
547	57	534
548	57	533
549	57	529
550	57	528
551	57	566
552	57	622
553	58	857
554	58	632
555	58	631
556	58	630
557	58	629
558	58	628
559	58	627
560	58	626
561	58	625
562	58	623
563	58	622
564	58	835
565	58	668
566	58	667
567	58	666
568	58	665
569	58	664
570	58	663
571	59	815
572	59	796
573	59	828
587	26	456
588	62	708
589	62	706
590	62	705
591	62	704
592	62	703
593	62	712
594	62	710
595	62	711
596	62	696
597	62	698
598	62	670
599	62	671
600	62	672
601	62	686
602	62	657
603	62	835
604	62	668
605	62	667
606	62	666
607	62	665
608	62	664
609	62	663
610	62	677
611	62	676
612	62	675
613	62	674
614	62	751
615	62	749
616	62	748
617	62	747
618	62	694
619	62	692
620	62	690
621	62	688
622	62	718
623	62	717
624	62	716
625	62	715
626	62	723
627	62	721
628	62	719
629	62	714
650	64	631
651	65	541
652	65	542
653	65	537
654	65	539
655	65	550
656	66	771
657	67	688
658	67	690
659	67	692
660	67	694
661	67	759
662	67	758
663	67	757
664	67	755
665	67	656
666	67	657
667	68	567
668	68	566
669	68	565
670	69	483
671	69	485
672	69	484
673	69	482
674	69	593
675	69	590
676	69	589
677	69	568
678	69	567
679	69	566
680	69	565
681	69	528
682	69	527
683	69	532
684	69	533
685	69	827
686	69	825
687	69	830
688	69	829
689	69	828
690	69	824
691	70	686
692	70	685
693	70	684
694	70	683
695	70	681
696	70	680
697	70	679
698	70	672
699	70	671
700	70	670
701	70	835
702	70	668
703	70	667
704	70	666
705	70	665
706	70	664
707	70	663
708	70	677
709	70	676
710	70	675
711	70	674
712	71	521
713	71	525
714	71	522
715	72	455
716	72	566
717	72	533
718	72	529
719	72	527
720	72	505
721	72	496
722	72	445
723	73	542
724	73	541
725	73	539
726	73	537
727	73	485
728	73	484
729	73	483
730	73	482
731	73	631
732	73	589
733	73	590
734	73	585
735	73	584
736	73	583
737	73	586
738	74	539
739	74	541
740	74	537
741	74	590
742	74	589
743	74	593
744	74	586
745	74	826
746	74	782
747	74	779
748	74	783
749	74	679
750	74	672
751	74	675
752	74	835
753	74	663
754	74	665
755	75	831
756	75	551
757	75	550
758	75	548
759	75	547
760	75	533
761	75	527
762	75	529
763	75	528
764	76	622
765	76	628
766	76	627
767	76	625
768	77	547
769	77	543
770	77	544
771	77	541
772	77	537
773	77	539
774	77	579
775	77	580
776	77	581
777	77	589
778	77	527
779	77	532
780	77	497
781	77	449
782	77	515
783	77	519
784	77	518
785	77	516
786	77	504
787	78	537
788	78	539
789	78	486
790	78	485
791	79	629
792	79	632
793	79	631
794	79	612
795	79	619
796	79	618
819	81	548
820	81	547
821	81	851
822	81	842
823	81	841
824	81	843
825	81	791
826	81	788
827	81	789
828	81	790
829	81	830
830	81	829
831	81	828
832	81	827
833	81	825
834	81	823
835	81	593
836	81	590
837	81	589
838	81	537
839	81	545
840	81	538
841	81	539
842	82	775
843	82	688
844	82	692
845	82	694
846	82	655
847	82	656
848	82	660
849	82	677
850	82	674
851	82	676
852	82	670
853	82	671
854	82	672
855	82	686
856	82	502
857	82	500
858	82	499
859	82	498
860	82	497
861	82	496
862	82	459
863	82	452
864	82	454
865	82	456
866	82	453
867	83	624
868	84	797
869	84	851
870	84	829
871	84	846
872	84	795
873	84	828
901	86	527
902	86	528
903	86	529
904	86	533
905	86	471
906	86	551
907	86	547
908	86	548
909	86	456
910	80	467
914	61	688
915	61	690
916	61	692
917	87	496
918	87	566
919	87	667
920	87	664
921	87	663
922	88	474
923	88	473
924	88	472
925	88	471
926	88	468
927	88	467
955	85	496
956	85	497
957	85	498
958	85	499
959	85	501
960	85	504
961	85	516
962	85	517
963	85	518
964	85	527
965	85	528
966	85	529
967	85	530
968	85	531
969	85	533
970	85	534
971	85	548
972	85	550
973	85	834
974	85	622
975	85	623
976	85	625
977	85	626
978	85	627
979	85	631
980	85	632
981	85	857
982	89	625
983	89	626
984	89	629
985	89	857
986	89	632
987	89	631
988	89	630
989	89	627
990	89	790
991	89	844
992	89	815
993	90	463
994	90	461
995	90	462
1004	63	614
1005	63	612
1006	63	625
1007	63	626
1008	63	627
1009	63	692
1010	63	690
1011	63	688
\.


--
-- Data for Name: app_subcategory; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_subcategory (id, name, is_visible, box_id, default_price, sub_box_id) FROM stdin;
444	Complet(haut + bas)	t	43	2500	\N
445	Complet stylé(haut et bas)	t	\N	10000	444
446	Complet de sport	t	\N	10000	444
447	Maillot	t	\N	5000	444
448	Costume homme	t	\N	40000	444
449	Vêtement à la mode	t	\N	18000	444
450	Pyjamas	t	\N	5000	444
451	Vêtements de Haut	t	43	2500	\N
452	T-shirt	t	\N	4000	451
453	Veste	t	\N	4500	451
454	Polos, Lacoste	t	\N	8500	451
455	Pulls, Sweat	t	\N	8500	451
456	Chemise	t	\N	4000	451
457	Manteaux	t	\N	15000	451
458	Bombers	t	\N	10000	451
459	Gilets	t	\N	2500	451
460	Vêtements de Bas	t	43	2500	\N
461	Jeans	t	\N	6000	460
462	Pantalon	t	\N	8000	460
463	Short(culotte)	t	\N	1000	460
464	Jogging	t	\N	3500	460
465	Bermuda	t	\N	1200	460
466	Chaussures 	t	43	2500	\N
467	Chaussure a la mode	t	\N	5000	466
468	Chaussure de sortie	t	\N	2500	466
469	Pour la maison	t	\N	3000	466
470	De chambre	t	\N	2500	466
471	Sport( basket, tenis...)	t	\N	2500	466
472	Cuir(fermé, tapette)	t	\N	5000	466
473	Tapette	t	\N	2000	466
474	Sandale	t	\N	1000	466
475	Chausson	t	\N	600	466
476	Sous-vêtements	t	43	2500	\N
477	Slip	t	\N	1500	476
478	Calisif, caleçon	t	\N	1500	476
479	Boxeurs	t	\N	1500	476
480	Debardeur	t	\N	1000	476
481	Bijoux d'hommes	t	43	2500	\N
482	Collier	t	\N	4000	481
483	Collier avec Pendentif	t	\N	5000	481
484	Chaîne	t	\N	2000	481
485	Bracelet	t	\N	1500	481
486	Bijoux en perles	t	\N	1200	481
487	Bagues	t	\N	2500	481
488	Bébé Garçon	t	43	2500	\N
489	Vetements	t	\N	2500	488
490	Chaussure	t	\N	2500	488
491	Bijoux	t	\N	2500	488
492	Chapeaux	t	\N	2500	488
493	Bonnet	t	\N	2500	488
494	Complet(haut + bas)	t	44	2500	\N
495	Tendance	t	\N	10000	494
496	Robe	t	\N	1500	494
497	Robe courte	t	\N	1500	494
498	Combinaison simple	t	\N	5000	494
499	Combinaison élégante	t	\N	6000	494
500	Combishort	t	\N	5000	494
501	Salopette	t	\N	5000	494
502	Pyjamas	t	\N	5000	494
503	Vêtements de Haut	t	44	2500	\N
504	Robe	t	\N	1500	503
505	Tee-shirts	t	\N	2500	503
506	Chemise	t	\N	5000	503
507	Blouse	t	\N	2500	503
508	Gilets	t	\N	3000	503
509	Manteau	t	\N	3500	503
510	Polos, Lacoste	t	\N	2000	503
511	Pulls, Sweat	t	\N	2500	503
512	Slim	t	\N	2500	503
513	Vestes	t	\N	2000	503
514	Vêtements de Bas	t	44	2500	\N
515	Jeans	t	\N	2000	514
516	Joggings	t	\N	1500	514
517	Jupes	t	\N	3000	514
518	Pantalons	t	\N	4500	514
519	Shorts	t	\N	3500	514
520	Lingerie et sous-vêtements	t	44	2500	\N
521	Culotte(slips,shorty,strings...)	t	\N	1200	520
522	Soutien	t	\N	1300	520
523	Pyjama	t	\N	4000	520
524	Maillots de bain	t	\N	4000	520
525	lingerie sexy	t	\N	1500	520
526	Chaussures	t	44	2500	\N
527	Chaussure a la mode	t	\N	5000	526
528	Chaussure de sortie	t	\N	2500	526
529	Chaussure à talon	t	\N	2500	526
530	Pour la maison	t	\N	3000	526
531	De chambre	t	\N	2500	526
532	Sport(basket, tenis...)	t	\N	2500	526
533	Tapette	t	\N	2000	526
534	Sandale	t	\N	1000	526
535	Chausson	t	\N	600	526
536	Bijoux	t	44	2500	\N
537	Collier	t	\N	1600	536
538	Bagues	t	\N	1600	536
539	Bracelet	t	\N	1500	536
540	Boucles d'oreilles	t	\N	600	536
541	Chaîne	t	\N	2500	536
542	Pendentif	t	\N	2500	536
543	Bijoux en perles	t	\N	3000	536
544	Bijoux de hanche	t	\N	1000	536
545	Parure	t	\N	3000	536
546	Sac 	t	44	2500	\N
547	Sac à la mode	t	\N	2500	546
548	Sac de sortie	t	\N	3000	546
549	Sac d'epaule	t	\N	6000	546
550	Sacoche	t	\N	6000	546
551	En cuir	t	\N	6000	546
552	En perle	t	\N	5000	546
553	Ongles,Mèches,Cils	t	44	2500	\N
554	Ongles	t	\N	1000	553
555	Mèche	t	\N	2500	553
556	Mèche naturel	t	\N	6000	553
557	Faux cils	t	\N	1500	553
558	Bébé Fille	t	44	2500	\N
559	Vetements	t	\N	2500	558
560	Chaussure	t	\N	2500	558
561	Bijoux	t	\N	2500	558
562	Chapeaux	t	\N	2500	558
563	Bonnet	t	\N	2500	558
564	Pagnes & Tissus	t	45	2500	\N
565	Pagne de haute qualité	t	\N	8000	564
566	Pagne	t	\N	3000	564
567	Bazzin	t	\N	5000	564
568	Lessi	t	\N	4500	564
569	Complet cousu(prêt à porter)	t	45	2500	\N
570	Costume pour Homme	t	\N	3000	569
571	Costume pour Femme	t	\N	5000	569
572	Costume pour enfants	t	\N	1500	569
573	Good luck homme	t	\N	6000	569
831	Minaudière	t	\N	4000	546
833	Produits pour moustiques	t	\N	2500	611
834	Produits pour moustiques	t	\N	2500	621
662	Ecouteur et Woofers	t	49	2500	\N
836	Câbles et connectique	t	51	2500	\N
838	Câbles HDMI	t	\N	6000	836
624	Savon	t	\N	2600	804
574	Good luck femme	t	\N	5500	569
575	Chapeau	t	45	2500	\N
576	Chapeau pour Homme	t	\N	1500	575
577	Chapeau pour Femme	t	\N	2500	575
578	Chapeau & Casquettes	t	46	2500	\N
579	Casquette à la mode	t	\N	2500	578
580	Chapeau	t	\N	1500	578
581	Casquette	t	\N	1500	578
582	Lunette	t	46	2500	\N
583	lunette de mode	t	\N	5000	582
584	lunette de sortie	t	\N	6000	582
585	lunette de soleil	t	\N	5000	582
586	lunette à protection numérique	t	\N	8000	582
587	lunette d'ordornance	t	\N	35000	582
588	Montre	t	46	2500	\N
589	Montre simple	t	\N	2500	588
590	Montre de luxe	t	\N	6000	588
591	Montre connectés	t	\N	5000	588
592	Montre de Sport	t	\N	4500	588
593	Montre en cuir	t	\N	5000	588
594	Cravate	t	46	2500	\N
595	Cravate pour Homme	t	\N	15000	594
596	Cravate de Femme	t	\N	15000	594
597	Cravate d'enfant	t	\N	5000	594
598	Noeud de papillon	t	\N	15000	594
599	Ceinture	t	46	2500	\N
600	Centure elegant	t	\N	5000	599
601	Simple	t	\N	5000	599
602	Ceinture d'enfant	t	\N	2000	599
603	Foulards & Echarpes	t	46	2500	\N
604	Foulard elegant	t	\N	3000	603
605	Foulard simple	t	\N	2000	603
606	Echarpe	t	\N	3000	603
607	Autres(boutons, badges..)	t	46	2500	\N
608	Bouton(de manchette)	t	\N	500	607
609	Badge	t	\N	2500	607
610	Gant	t	\N	1500	607
611	Cosmétique pour Homme	t	47	2500	\N
612	Savon	t	\N	2000	611
613	Produit Pour le visage	t	\N	800	611
614	Pour la peau	t	\N	1500	611
615	Pour les cheveux	t	\N	500	611
616	Pour la barbe(après-rasage...)	t	\N	2500	611
617	Pour les lèvres	t	\N	1500	611
618	Déodorant	t	\N	3000	611
619	Parfum	t	\N	1500	611
620	Contre le soleil	t	\N	3000	611
621	Cosmétique pour femme	t	47	2500	\N
622	Soin pour les cheveux	t	\N	1500	621
623	Shampoing	t	\N	3000	621
625	Gommages	t	\N	3000	621
626	Huiles	t	\N	1500	621
627	Lait corporel	t	\N	3000	621
628	Poudres	t	\N	3000	621
629	Produit pour l'epilation	t	\N	3600	621
630	Maquillage(rouge à lèvres, vernis..)	t	\N	1500	621
631	Parfum	t	\N	3000	621
632	Déodorant	t	\N	1500	621
633	Pour Enfant/Bébé	t	47	2500	\N
634	Produits pour cheveux	t	\N	4000	633
635	Produit d'hygiène(soins)	t	\N	3000	633
636	Produit pour la peau(poudres...)	t	\N	3000	633
637	De marque célèbre	t	48	2500	\N
638	Iphone	t	\N	60000	637
639	Samsung	t	\N	50000	637
640	Huawei	t	\N	45000	637
641	Xiaomi	t	\N	40000	637
642	Google Pixel	t	\N	48000	637
643	Infinix	t	\N	48000	637
644	Tecno	t	\N	32000	637
645	Itel	t	\N	28000	637
646	Nokia	t	\N	25000	637
647	D'autres marques	t	48	2500	\N
648	Oppo	t	\N	32000	647
649	OnePlus	t	\N	30000	647
650	Mobicel	t	\N	18000	647
651	Wiko	t	\N	36000	647
652	htc	t	\N	40000	647
653	Alcatel	t	\N	12000	647
654	Tablette	t	48	2500	\N
655	Tablette de marque	t	\N	180000	654
656	Tablette moins chère	t	\N	80000	654
657	Tablette pour enfant	t	\N	50000	654
658	Tablette pour dessiner	t	\N	55000	654
659	A touche et autre type	t	48	2500	\N
660	Téléphone à touche	t	\N	15000	659
661	Téléphone fixe	t	\N	25000	659
663	Ecouteur à fil	t	\N	1000	662
664	Casque	t	\N	3000	662
665	Airpods	t	\N	5000	662
666	Casque circulaire	t	\N	1500	662
667	Casque à fil	t	\N	3000	662
668	Casque antibruit	t	\N	2000	662
669	Battérie,PowerBank	t	49	2500	\N
670	Pour portable à touche	t	\N	600	669
671	Pour Smartphone	t	\N	5000	669
672	Power Bank(externe)	t	\N	6000	669
673	Chargeurs,Câbles	t	49	2500	\N
674	Chargeur Android	t	\N	15000	673
675	Chargeur Iphone	t	\N	1500	673
676	Cables	t	\N	1000	673
677	Adaptateur(tête de chargeur)	t	\N	1000	673
678	Coques et Decoration	t	49	2500	\N
679	Coques élégant	t	\N	2000	678
680	Coques antichoc	t	\N	2000	678
681	Décoration pour téléphone	t	\N	1500	678
682	Ecrans et Protections	t	49	2500	\N
683	Protections(Incassables)	t	\N	1000	682
684	Ecrans smartphone	t	\N	15000	682
685	Ecrans tablettes	t	\N	13000	682
686	Carte Mémoire	t	49	2500	\N
687	Tout	t	\N	5000	686
688	PC(Ordinateur personnel)	t	50	2500	\N
689	Tout	t	\N	150000	688
690	Ordinateur de Bureau(fixe)	t	50	2500	\N
691	Tout	t	\N	250000	690
692	Mini PC	t	50	2500	\N
693	Tout	t	\N	100000	692
694	Tablette PC	t	50	2500	\N
695	Tout	t	\N	85000	694
696	Unité Centrale	t	51	2500	\N
697	Tout	t	\N	65000	696
698	Mémoire RAM	t	51	2500	\N
699	Tout	t	\N	25000	698
700	Processeurs	t	51	2500	\N
701	Tout	t	\N	25000	700
702	Périphérique d'entrée(manette,clavier...)	t	51	2500	\N
703	Clavier	t	\N	15000	702
704	Souris	t	\N	3000	702
705	Micro	t	\N	6000	702
706	Webcam	t	\N	12000	702
707	Appareil photo	t	\N	8000	702
708	Manette pour PC	t	\N	6000	702
709	Périphérique de sortie(ecran,...)	t	51	2500	\N
710	Ecran	t	\N	50000	709
711	Imprimante	t	\N	50000	709
712	Haut-parleurs	t	\N	15000	709
713	Stockage(clé, disques, cd)	t	51	2500	\N
714	Clé USB	t	\N	1500	713
715	Disques durs	t	\N	3000	713
716	CD	t	\N	3000	713
717	DVD	t	\N	3500	713
718	Carte mémoires	t	\N	2400	713
719	Projecteurs	t	51	2500	\N
720	Tout	t	\N	30000	719
721	Régulateur	t	51	2500	\N
722	Tout	t	\N	35000	721
723	Routeur et Moderm Wi-fi	t	51	2500	\N
724	Tout	t	\N	25000	723
725	PC gamers	t	52	2500	\N
726	Tout	t	\N	350000	725
727	Playstation(PS..)	t	52	2500	\N
728	PS2	t	\N	25000	727
729	PS3	t	\N	80000	727
730	PS4	t	\N	120000	727
731	PS5	t	\N	180000	727
732	PSP	t	\N	25000	727
733	PS Vita	t	\N	45000	727
734	Nitendo	t	52	2500	\N
735	Wii	t	\N	120000	734
736	Wii U	t	\N	180000	734
737	Nitendo Switch	t	\N	200000	734
738	Nitendo DS	t	\N	250000	734
739	Nitendo 2DS	t	\N	35000	734
740	Nitendo 3DS	t	\N	50000	734
741	XBOX(Microsoft)	t	52	2500	\N
742	XBOX	t	\N	50000	741
743	XBOX 360	t	\N	85000	741
744	XBOX One	t	\N	180000	741
745	XBOX Series	t	\N	210000	741
746	Manette	t	52	2500	\N
747	Manette Pc	t	\N	6000	746
748	Manette PS2	t	\N	3000	746
749	Manette PS3, PS4, PS5	t	\N	8000	746
750	Commande Wii et Wii U	t	\N	8000	746
751	Manette XBOX	t	\N	8000	746
752	Jeux PC	t	53	2500	\N
753	Tout	t	\N	2000	752
754	Jeux Playstation(PS..)	t	53	2500	\N
755	Jeux PS2	t	\N	1500	754
756	Jeux PS3	t	\N	6000	754
757	Jeux PS4	t	\N	12000	754
758	Jeux PS5	t	\N	20000	754
759	Jeux PSP	t	\N	6000	754
760	Jeux PS Vita	t	\N	8000	754
761	Nitendo	t	53	2500	\N
762	Jeux Wii	t	\N	15000	761
763	Jeux Wii U	t	\N	15000	761
764	Jeux Nitendo Switch	t	\N	15000	761
765	Jeux Nitendo DS	t	\N	3000	761
766	Jeux Nitendo 2DS	t	\N	3000	761
767	Jeux Nitendo 3DS	t	\N	3500	761
768	XBOX(Microsoft)	t	53	2500	\N
769	Jeux XBOX	t	\N	6000	768
770	Jeux XBOX 360	t	\N	6000	768
771	Jeux XBOX One	t	\N	6000	768
772	Jeux XBOX Series	t	\N	12000	768
773	Pour le Salon	t	54	2500	\N
774	Canapé	t	\N	150000	773
775	Fauteuils	t	\N	300000	773
776	Guéridon	t	\N	35000	773
777	Coussins	t	\N	900	773
778	Tapis	t	\N	1500	773
779	Lampe	t	\N	2000	773
780	Meuble télé	t	\N	3500	773
781	Rideaux décoratifs	t	\N	1800	773
782	Décoration	t	\N	1600	773
784	Pour la Chambre	t	54	2500	\N
785	Lit	t	\N	2500	784
786	Draps	t	\N	1600	784
787	Matelas	t	\N	5000	784
788	Lampes de chambre	t	\N	1600	784
789	Veuilleuses	t	\N	2500	784
790	Armoire	t	\N	8000	784
791	Meuble pour ranger	t	\N	7000	784
792	Table de chambre	t	\N	15000	784
795	Casseroles	t	\N	1600	794
796	Couteaux	t	\N	700	794
800	Couvert	t	\N	1600	794
801	Cuilleres	t	\N	1200	794
802	Assiètes	t	\N	3000	794
805	Balaie	t	\N	2000	804
806	Torchon	t	\N	6000	804
807	Serpière	t	\N	1200	804
808	Serviette	t	\N	4000	804
809	Pour le Salon 	t	55	2500	\N
810	Télévision	t	\N	30000	809
811	Radio	t	\N	5000	809
812	Montre murales	t	\N	6000	809
813	Pour l'entretien	t	55	2500	\N
814	Aspirateur	t	\N	30000	813
815	Fer à repasser	t	\N	25000	813
816	Lave-vaisselle	t	\N	60000	813
817	Sèche-linge	t	\N	3000	813
818	Nettoyeur	t	\N	5000	813
819	Pour la cuisine	t	55	2500	\N
820	Congelateur	t	\N	15000	819
821	Réfrigerateur	t	\N	10000	819
822	Frigo	t	\N	25000	819
823	Four	t	\N	60000	819
824	Gaz	t	\N	5000	819
825	Micro-ondes	t	\N	15000	819
826	Machine à Cafe	t	\N	25000	819
827	Cuisinières	t	\N	20000	819
828	Moulinex	t	\N	6000	819
829	Mixeur	t	\N	5000	819
830	Autocuiseurs - Boulloire	t	\N	15000	819
832	Sac en pagne	t	\N	5000	546
835	Woofers	t	\N	4500	662
837	Câble Ecran-ordinateur	t	\N	6000	836
804	Pour l'entretien et l'hygiène	t	54	2500	\N
839	Feuille de Savon	t	\N	500	804
840	Pour un dressing(vêtements)	t	54	2500	\N
841	Cintre	t	\N	1000	840
842	Porte cintre	t	\N	2500	840
843	Armoire	t	\N	8000	840
844	Appareil soin visage	t	\N	5000	813
794	Essentiel pour la cuisine	t	54	2500	\N
845	Fourchette	t	\N	2500	794
846	Bol	t	\N	1500	794
847	Passoire	t	\N	2500	794
848	Autres outils pour la cuisine	t	54	2500	\N
797	Outils de Patisserie	t	\N	6000	848
798	Friteuse	t	\N	3000	848
799	Lisseur	t	\N	1300	848
803	Poêles	t	\N	4000	848
849	Théière	t	\N	1600	848
850	Louches	t	\N	1500	848
851	Presse jus	t	\N	1500	848
852	Glacière	t	\N	800	\N
853	Pour la décoration	t	54	2500	\N
783	Montre murale	t	\N	2500	853
793	Outil de Décoration	t	\N	3000	853
854	Rideaux décoratifs	t	\N	3000	853
855	Accroches murale	t	\N	5000	853
856	Petales de rose	t	\N	1800	853
857	Masque	t	\N	600	621
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_user (id, password, last_login, is_superuser, username, email, is_staff, is_active, date_joined, first_name, last_name, country, towns, quart) FROM stdin;
18	pbkdf2_sha256$260000$afe1DXTiJE3HxrAULxIij7$m41y/E78mnbk//pNtXWYSuAjRnUJkToO3S8j8w4lGv4=	2022-12-05 17:57:51.684912+00	f	\N	ganglozoundomnus0@gmail.com	f	t	2022-12-05 17:57:51.508569+00	Ganglozoun	Domnus	BJ	\N	{"name":"","lat":0,"lng":0}
11	pbkdf2_sha256$260000$gWzApxDHSxndfcbE6z68Y4$Wcl2BqpsEgGUJIa+RpH/MQExesRY7bVV/AeOhjE/yf0=	2022-12-22 18:22:37.211446+00	f	\N	groupeelife@gmail.com	f	t	2022-12-05 10:20:17.352744+00	ENOUHERAN	Georis	BJ	\N	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}
33	pbkdf2_sha256$260000$0DLRkiRPUkes19PhHewZJN$iUlIENDXrwGmYi7CywRdbJD7ev7mStEXS/a/hYZMcVg=	2023-02-09 11:08:41.136392+00	f	\N	clegbazajoyce@gmail.com	f	t	2022-12-07 10:50:16.577746+00	CLEGBAZA	Murielle	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
19	pbkdf2_sha256$260000$mNwLVAuPb6B3pLRK2mIC0a$IxzE464MyekinXTHI7Cut2ebXdDQ2UYMs1UYeE3ENh4=	2023-02-02 09:28:15.45151+00	f	\N	tellaanato206@gmail.com	f	t	2022-12-05 18:08:54.198002+00	ANATO	Christella	BJ	\N	{"name":"Lycée Mathieu Bouke","lat":9.354255199999999,"lng":2.6158261}
9	pbkdf2_sha256$260000$pOp5z1nQV6QToTZjOzztZT$fSbwA+5OqWO+NC/YiDDMWYUXVOjDxobMctPhSYXCpuU=	2022-12-04 07:59:50.780472+00	f	\N	georisenou@gmail.com	f	t	2022-12-04 07:59:50.590017+00	ENOUHERAN	Georis	BJ	\N	{"name":"Institut de Mathématiques et de Sciences Physiques (IMSP)","lat":6.584084,"lng":2.5534002}
12	pbkdf2_sha256$260000$WoGpSJX91B1RaJavwSgM9J$bFoYy8SkD91tKP32np0B7s2eiCKTbZoTXUErrEsLU6g=	2022-12-05 12:31:16.927958+00	f	\N	dohoukevina@gmail.com	f	t	2022-12-05 12:31:16.754893+00	DOHOU 	Kévina	BJ	\N	{"name":"Godomey","lat":6.413202399999999,"lng":2.3123031}
29	pbkdf2_sha256$260000$aqPDUjMue49as5dWQWU1Gf$fYijOEpDzR+ZH3PrusumQeQcIV3iAQLOVTXWvknsOjQ=	2022-12-08 11:09:00.983289+00	f	\N	larissioagbessi90@gmail.com	f	t	2022-12-06 21:36:15.478185+00	Agbessi 	Larissio 	BJ	\N	{"name":"Fidjrossè","lat":6.357872599999999,"lng":2.3721562}
21	pbkdf2_sha256$260000$nVqPXOxXcHixwtz2eDCaaQ$cJT5bC1uSVq/O9kCcwLA5HAkz3lF3h4LUSYgZ75ITLk=	2022-12-06 01:24:00.708661+00	f	\N	avolontochanie@gmail.com	f	t	2022-12-06 01:24:00.533935+00	Avolonto	Chanie	BJ	\N	{"name":"Agla","lat":6.383711,"lng":2.3640875}
27	pbkdf2_sha256$260000$tT8f0K7Tad7kLjyZkulkdS$K7hsSdw9Rvu8lNxfT2e8TIS7eNVx0IfxijWiH9/kYxw=	2022-12-09 20:26:06.147083+00	f	\N	houansoulandry0@gmail.com	f	t	2022-12-06 20:08:27.33197+00	Houansou 	Landry Albert 	BJ	\N	{"name":"Albarika Shop","lat":6.3726178,"lng":2.4218166}
133	pbkdf2_sha256$260000$nSzAxfoqMyh8MD9CoIDOTz$Rs8NVJrjlRMErH07jv/wviZmQeDtCMVPbqUoyLGcydE=	2023-01-04 14:40:05.500144+00	f	\N	stelm.com@gmail.com	f	t	2023-01-04 14:40:05.263608+00	ADAGBENON	Stella	BJ	\N	{"name":"PK10","lat":6.3704164,"lng":2.5213408}
10	pbkdf2_sha256$260000$dcfMJ0YZ1hAxs69cA1kN4C$cZfl+RMgXlpAyRIo8oMcDGnt+/dlACjUdg2MEO2XCjk=	2023-01-27 10:31:31.101124+00	f	\N	kitabulife.com@gmail.com	f	t	2022-12-05 03:49:09.927395+00	ENOUHERAN	Geoface	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
16	pbkdf2_sha256$260000$2UoEzzrOb4SUNFCHn4K3lJ$VT0498+FA5YWlSpb5ruck3N62FxlpXsaR2SuWqhW0a0=	2022-12-05 16:10:52.155109+00	f	\N	marcellebego@gmail.com	f	t	2022-12-05 16:10:51.979512+00	BEGO 	Sonia 	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
162	pbkdf2_sha256$260000$HP6Tfn6TgHWu6GUrTGb0OY$1+52srP85UQiO/SRKQchexcQCGD7dFzXwmwOlG3TCfQ=	2023-02-10 15:18:08.006449+00	f	\N	gwladyshouedande54@gmail.com	f	t	2023-01-25 15:15:02.141076+00	Gwladys	HOUEDANDE	BJ	\N	{"name":"Malé","lat":4.1754959,"lng":73.5093474}
15	pbkdf2_sha256$260000$nubFDHbfM1m5f22ABGf2t5$Pqa5dJ1M3Y8t6T0fgLW+IhVYvkauRMphBA/zjYrM39I=	2023-01-26 15:25:53.431487+00	f	\N	adovmann@gmail.com	f	t	2022-12-05 15:14:38.252126+00	ADOVOEKPE	Freemann	BJ	\N	{"name":"","lat":0,"lng":0}
8	pbkdf2_sha256$260000$Y0eyz81M2isLGaazyNcRaE$Qeof4Rv6K0vNKpSuXYD3b0CeKVc7EMU2wgDxeLoB0Fk=	2023-02-07 09:56:11.758055+00	f	\N	georiseno@gmail.com	f	t	2022-12-03 20:48:28.372818+00	Nail 	BIGAM	BJ	\N	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}
17	pbkdf2_sha256$260000$WC2TRmZlBayycXvyW5yZPw$oTsCvl18xDJBuDGw73+C/2qF3F7U82mwBQwbK2KMoFI=	2022-12-05 16:41:52.75067+00	f	\N	sonybego9@gmail.com	f	t	2022-12-05 16:41:52.575438+00	BEGO 	Sonia 	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
23	pbkdf2_sha256$260000$YDDINPwoOTpHNguunMCuxc$tAtsnVFudTCcsLII3UQjEpqKvWMvaESwjEQH0detWos=	2022-12-06 11:50:45.132774+00	f	\N	medotsa28@gmail.com	f	t	2022-12-06 11:50:44.883696+00	 SALAKO 	Mechack	BJ	\N	{"name":"Carrefour Abattoir","lat":6.3689013,"lng":2.4850814}
32	pbkdf2_sha256$260000$Fjwq9F3xos2yhveRHNras8$q2yGIJoD8LjGaLl3yszdb9MFKSANX/IuxKuqI/nsyOg=	2022-12-21 16:39:32.542254+00	f	\N	muriellegeordina@gmail.com	f	t	2022-12-07 10:37:29.888658+00	Tchodo 	Murielle Geordina 	BJ	\N	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}
25	pbkdf2_sha256$260000$cufbxbGJyzdwdOXTMQ5qHq$NcmfMRamswCywq81klOL7JGaUuCKycxd8rMVoOAhR1w=	2022-12-06 17:09:22.072603+00	f	\N	kindivin07@gmail.com	f	t	2022-12-06 17:09:21.88543+00	KINHA 	Divin 	BJ	\N	{"name":"LE LABEL COTON DU BENIN","lat":6.3634156,"lng":2.4493602}
26	pbkdf2_sha256$260000$GhOm279Nbs5DaV3OFPm0xY$3ULIZHzdcrkoERwFjQbpYpALVOXmfB+Obot4BJfOR/w=	2022-12-06 19:38:16.176249+00	f	\N	Fadilbadarou@icloud.com	f	t	2022-12-06 19:38:15.987569+00	BADAROU	Fadil	BJ	\N	{"name":"Plage Akpakpa","lat":6.3595998,"lng":2.4838771}
14	pbkdf2_sha256$260000$99YsXljjxkIHjG9v8FIk2P$VOHKED3H4M6B3E9tjJDuSDjJvkIyQekl08XGZJDbWvg=	2023-01-06 07:07:15.819437+00	f	\N	celimenekpodekon2oo4@gmail.com	f	t	2022-12-05 15:00:13.672026+00	KPODEKON 	Célimène 	BJ	\N	{"name":"Pharmacie Fidjrossè","lat":6.3640047,"lng":2.3846274}
28	pbkdf2_sha256$260000$zUuvT9eAakbJNY71xlqYyM$23YVokzC3qgD5cKfB9APzq+xjICUIZH269Eq/AvNaxA=	2022-12-06 21:08:37.79875+00	f	\N	noemiesintondji@gmail.com	f	t	2022-12-06 21:08:37.605786+00	SINTONDJI 	Noémie 	BJ	\N	{"name":"Mairie de Sèmè Podji","lat":6.3823357,"lng":2.6035308}
30	pbkdf2_sha256$260000$Z151cbbhByQdvG22xP6CmT$pS4eNhZoIayJw2BQ+zYA6MSzDbozF3cExpAzJe3kg7Y=	2022-12-07 06:04:23.674619+00	f	\N	brianprisca17@gmail.com	f	t	2022-12-07 06:04:23.447173+00	Brian	Prisca	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
20	pbkdf2_sha256$260000$Y72PGHZsXxibbumVkhfUt7$zvvvxUPr6FaMfXcjw7hbHCRmaybSc5l/hBaXpQVsQxU=	2023-02-06 19:40:23.361579+00	f	\N	omonnolaayenikafo@gmail.com	f	t	2022-12-05 18:26:57.298504+00	AYÉNIKAFO 	Christiane	BJ	\N	{"name":"Clinique Bidossessi","lat":6.4334402,"lng":2.3420641}
35	pbkdf2_sha256$260000$e7wtPa9vfNd3fPHYagEUHy$5TxMFc86ux/I1qC+ztAgaUQFGWO4fUXwYUGIvNOzEnc=	2023-01-27 15:53:01.008849+00	f	\N	djipriv2@gmail.com	f	t	2022-12-07 12:27:04.242624+00	Private	Djidonou	BJ	\N	{"name":"FIRSTY BEACH","lat":6.3660825,"lng":2.6258765}
34	pbkdf2_sha256$260000$MVcvzak9o71XM3GwqdL8mG$+gwgb3V2tnprC/xooQdbCCXJ1COykWOwPqDSpN3EFDI=	2023-01-01 16:32:09.499952+00	f	\N	ambroisedas2003@gmail.com	f	t	2022-12-07 10:53:38.19231+00	da SILVA	Amir	BJ	\N	{"name":"Carrefour LE BELIER","lat":6.369879,"lng":2.494871}
13	pbkdf2_sha256$260000$dChKyeiJszaeuTd3Rx0u7Z$5IEHFz6ftRUiFGk7IPehfjfsPpPpCEbIVCQQTpSycBg=	2022-12-29 15:00:33.979661+00	f	\N	njun472@gmail.com	f	t	2022-12-05 12:42:31.219022+00	Nick	Jun	BJ	\N	{"name":"Calavi zogbadjè","lat":6.3494433,"lng":2.3575323}
22	pbkdf2_sha256$260000$NXtL5XNwNwVmT8x2FmpEOQ$Mz/CimK2GbwuEwJzjJAV2xqd0OrxMZ/i20hQFY+IE0w=	2023-01-01 20:50:23.632203+00	f	\N	smalmichel@gmail.com	f	t	2022-12-06 07:52:32.644125+00	FAMBO 	Michel 	BJ	\N	{"name":"Zogbo","lat":6.3928881,"lng":2.3924706}
46	pbkdf2_sha256$260000$o5scwrP8g2EQedezmtyydP$swdJCRbNVjObwCl5OrdzBg/Ewdre6wia/NqkPFYutxU=	2022-12-08 12:39:50.147371+00	f	\N	sounkerezilalalao@gmail.com	f	t	2022-12-08 12:39:49.948661+00	SOUNKERE 	Zilal	BJ	\N	{"name":"Place Bulgarie","lat":6.3621535,"lng":2.4139868}
38	pbkdf2_sha256$260000$skMidUOZr6nR5z9Vz4jFfx$cumpsXzuo6ugiUQYSKa2dSbY+wuqrJMh+guqHZXgPk0=	2023-02-09 20:40:11.093321+00	f	\N	blaise14kk@gmail.com	f	t	2022-12-07 15:52:14.942687+00	AKIOSSE 	Blaise 	BJ	\N	{"name":"Lokossa","lat":6.644809299999999,"lng":1.7198215}
37	pbkdf2_sha256$260000$rvSIzAVqHFUOkwZF40hvlI$rBaBx/UXPIztT3FT6wYI90NLfj8fC7JOzkpaU1opoHA=	2022-12-08 15:01:39.710761+00	f	\N	azondjinmonulrich98@gmail.com	f	t	2022-12-07 13:51:12.969531+00	AZONDJINMON 	Ulrich	BJ	\N	{"name":"Banikani","lat":12.116667,"lng":3.116667}
63	pbkdf2_sha256$260000$ZmUmv01jjvc4K1f6SLxi9m$55wNIgcbb7gqQYGu0c1SyKdz1ElnZwHGCXvPYQhHbDc=	2023-01-11 11:29:34.912008+00	f	\N	chanieavolonto@gmail.com	f	t	2022-12-21 00:36:54.262612+00	Avolonto	Chanie	BJ	\N	{"name":"Agla","lat":6.383711,"lng":2.3640875}
47	pbkdf2_sha256$260000$Az08FlBUXolzfO4LefBVl8$GZbTbZv0dQVZuPi8FZik1T8P7mi5LFZp1nb2XWibdRQ=	2023-01-16 16:19:58.131269+00	f	\N	shademaliki2@gmail.com	f	t	2022-12-08 19:00:43.469076+00	MALIKI	Imâne	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
40	pbkdf2_sha256$260000$64dmDSvBUYgQY2G6B6eyc1$Kb/0RUxYSSHqsxckv2c1EK6TRASqZEik9UCmJBq0b/0=	2023-02-07 18:26:44.186831+00	f	\N	bellalihonou@gmail.com	f	t	2022-12-07 18:59:58.722579+00	LIHONOU	Bénédicte	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
48	pbkdf2_sha256$260000$haHWhCfMQMImUQBKmGkg4Q$pzxp8bMPRvX5LXe637obW1l7obsMNn0lKLaPCpPkiAM=	2023-01-16 23:18:19.683546+00	f	\N	koumoloujeanfrancois@gmail.com	f	t	2022-12-08 20:49:46.277246+00	KOUMOLOU 	Jean-François 	BJ	\N	{"name":"Suru-Lere","lat":6.381903899999999,"lng":2.4665962}
62	pbkdf2_sha256$260000$llMBrVenqKLDFqH3FD6wcB$cCgYksLdbzrTP4NEs28O5Abo4y6IwZlkCUjkN7GmEU0=	2022-12-20 22:02:44.967221+00	f	\N	auresjojo@gmail.com	f	t	2022-12-20 22:02:44.744951+00	VLAVONOU 	Aurès 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
49	pbkdf2_sha256$260000$2NDnxfP5OSHCSI7s4jYTZH$oqFE0JwLOHtdzedE7me1yIl5bDmoQHkjXUWgG88qTfc=	2023-01-02 16:44:28.253529+00	f	\N	3at229@gmail.com	f	t	2022-12-09 00:48:47.844809+00	DOSSA 	Armel 	BJ	\N	{"name":"Suru-Lere","lat":6.381903899999999,"lng":2.4665962}
43	pbkdf2_sha256$260000$C2rXb2Dzap4iFLQyiIVzuK$5Xjx104OE2F3L+L9iUH5evp771klxD4HceRE8ly0qYo=	2022-12-08 09:15:49.288387+00	f	\N	enouherangeodas2000@gmail.com	f	t	2022-12-08 09:15:49.080105+00	Farès	ENOUHERAN 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
51	pbkdf2_sha256$260000$biFPPOMTqE4W4XlMJQ0DsC$LSXiVG43hvFjowwTaS4iNVlU5c+3zp1JakQrWjtLtu4=	2023-01-31 13:58:52.51083+00	f	\N	anifathedjidonou@gmail.com	f	t	2022-12-10 09:12:42.671196+00	Heya 	Lucas	BJ	\N	{"name":"Calavi Aïtchedji","lat":6.4503024,"lng":2.3468195}
45	pbkdf2_sha256$260000$rg8TnzlmER8v0vMcA9L4eL$hwnBjU5vd38leQtKUkQ59n3vZuQspvSNVYbxuKM2uO8=	2022-12-08 10:16:02.796721+00	f	\N	henockayina@gmail.com	f	t	2022-12-08 10:16:02.609748+00	AYINA	Henock	BJ	\N	{"name":"C.E.G Suru-Léré","lat":6.3782672,"lng":2.462578}
41	pbkdf2_sha256$260000$PQjwaqeAZGvjplEGHEKZon$qsMr+wmaK+XE2L20OW5DsRZZgQV02O9r7U4Xtf/kZs0=	2023-01-03 08:42:30.751164+00	f	\N	adamassy9@gmail.com	f	t	2022-12-08 06:02:40.317521+00	DEGBOGBAHOUN	Tanguy	BJ	\N	{"name":"Rte de Tankpé","lat":6.4226471,"lng":2.3200947}
59	pbkdf2_sha256$260000$s4VdCgnSd4fY1vCWsCBtYP$jGx2p/1yK65xeVqdJb1ZAGxKWNR/dFgf2AH5RINevyM=	2022-12-14 18:08:12.65063+00	f	\N	lokoamos1@gmail.com	f	t	2022-12-14 18:08:12.416366+00	Loko	Amos	BJ	\N	{"name":"Avotrou","lat":6.3752159,"lng":2.475252}
53	pbkdf2_sha256$260000$LIRdn2UZ6cstfkI07Nzeh0$dYceSb8VoDkznlFhEAlffalyeiwYQpuKltCW8EGZ560=	2023-01-11 14:56:19.070515+00	f	\N	fridaousbonkano5@gmail.com	f	t	2022-12-10 19:47:05.825853+00	Bonkano 	Frida	BJ	\N	{"name":"Plage Akpakpa","lat":6.3595998,"lng":2.4838771}
61	pbkdf2_sha256$260000$6kUg9QHeYqyBK39EnYSCYD$mlg9fjek5WtgUcCBmFt8hli5xqqREbRFdqNfB5oxQ+c=	2022-12-20 14:32:57.865138+00	f	\N	yannispeterson15@gmail.com	f	t	2022-12-20 14:30:39.076475+00	BORNA	Yannis 	BJ	\N	{"name":"Sekandji","lat":6.375026699999999,"lng":2.5130177}
39	pbkdf2_sha256$260000$Q8tj3qnwILV2yWYvq7mIun$0FJmBb2I8CB/q6hbIphHxdZEYPGeQC7+2tNOED/t4xU=	2023-02-06 19:06:20.868935+00	f	\N	andreadounvo@gmail.com	f	t	2022-12-07 17:05:03.803335+00	André	ADOUNVO	BJ	\N	{"name":"Segbeya","lat":6.3780269,"lng":2.4431102}
56	pbkdf2_sha256$260000$llYvAzsDGmnqL09GTqCtcN$NtWWfpEgbnClEBjSlw4TGhR9H+gP02GPwdF2R5fMquk=	2023-02-07 08:20:57.38979+00	f	\N	gbaguidike@gmail.com	f	t	2022-12-11 21:34:39.025275+00	GBAGUIDI	Kevin	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
36	pbkdf2_sha256$260000$wGNhEVWFvPXSWf4Ii0ajlb$vPo9hFW1d/gCkGvgyfkJ8hLv6MhVn0Jv+eYJvXHzFO4=	2023-02-09 15:42:11.932504+00	f	\N	ingridfadonougbo4@gmail.com	f	t	2022-12-07 13:43:58.856076+00	FADONOUGBO 	Ingrid 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
55	pbkdf2_sha256$260000$Vco02nerO0Fj9FOLyy7pQM$Xg/RINv9KXSptzeGSmP8HuZ4ZizXLXLBtmrd+PGEbSQ=	2022-12-11 11:03:13.579295+00	f	\N	gracianougbologni2@gmail.com	f	t	2022-12-11 11:00:25.648805+00	NOUGBOLOGNI	Gracia	BJ	\N	{"name":"Akassato","lat":6.5051345,"lng":2.3645585}
42	pbkdf2_sha256$260000$NFvZ6gvdccW57ITsdGshSS$/zCmtQ7JOf2zevjCg8/b6UgC6nvPr05IO7M5xVb87rE=	2022-12-24 16:41:24.600606+00	f	\N	emmanuelagbanlin@gmail.com	f	t	2022-12-08 08:22:10.295845+00	Chadrac	Emmanuel	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
60	pbkdf2_sha256$260000$zhc731WFJIDWD5NAFmPoqW$zkOO1erNScBshDfnbFZJQ8gl6TQyeGfxTTEsNGn4oVg=	2022-12-18 19:24:16.503954+00	f	\N	geofaceeno@gmail.com	f	t	2022-12-18 19:24:16.284709+00	ENOUHERAN 	Geoface	BJ	\N	{"name":"","lat":0,"lng":0}
57	pbkdf2_sha256$260000$2vRxiLl6bTY1P1lzqL0Qyd$kbpzVPHjSSowjxQOu7oR9gFIVWyRfjXIt8p9yZNFqmk=	2022-12-12 08:30:55.144105+00	f	\N	ulrichkandeme@gmail.com	f	t	2022-12-12 08:30:54.949674+00	KANDEME	Oscar	BJ	\N	{"name":"","lat":0,"lng":0}
54	pbkdf2_sha256$260000$L9L7xcrRtXb5SkloJEakl9$JTtkLJk7axT2B0DQ+0v2XUkxUAzZoGqKFIIt+hCAqyw=	2023-01-31 21:49:15.705941+00	f	\N	aubinjosa@gmail.com	f	t	2022-12-11 09:34:31.404509+00	Hounkpatin	Aubin 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
44	pbkdf2_sha256$260000$MVYovP3zN4y1E2KgaPTwb6$92xOsfYf7QEEkvMzk6qdmbKWqGyUxUJVFbBMLpnwQZ4=	2023-02-07 13:20:24.537569+00	f	\N	gilbertaholoukpe@gmail.com	f	t	2022-12-08 09:47:12.397294+00	Aholoukpe 	Vignon 	BJ	\N	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}
58	pbkdf2_sha256$260000$k0x4tO9C6ixyKbQJg9EN3U$aHDYsS+G/yU1WSlW1gBKbOdLPyMXGyJXCAgKvDxMuQ0=	2023-01-05 21:16:31.963441+00	f	\N	wilfridadjademe@gmail.com	f	t	2022-12-12 12:22:05.180906+00	Adjademe 	Wilfrid 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
64	pbkdf2_sha256$260000$P9og36a2BuVPDJ03Qcxkuo$2MonthwiJhpyp3yopfoWe41AiIBaJon+Ui++BHPGGDk=	2022-12-21 07:19:57.744932+00	f	\N	geodasrisfas@gmail.com	f	t	2022-12-21 07:19:57.572399+00	Georis	ENOUHERAN	BJ	\N	{"name":"","lat":0,"lng":0}
50	pbkdf2_sha256$260000$hMDSEnjMFfu2cjUkSoiYS2$3kkDNdboUtbR3ahLBliAumqOmTIb8KcS1FHEHdYX/x8=	2023-01-12 12:20:34.806005+00	f	\N	kitabu.direction@gmail.com	f	t	2022-12-10 01:07:18.239484+00	SAM	Model	BJ	\N	{"name":"Dangbo","lat":6.5935684,"lng":2.4801989}
52	pbkdf2_sha256$260000$Sa3QQhGnZ0RSjOz9ZZnN3x$zPI671HME6kMSees8UPuvGZ2dE1XQUdoe0H5PVHezbY=	2023-01-31 12:44:51.229799+00	f	\N	pretdesanges@gmail.com	f	t	2022-12-10 12:13:17.788201+00	PLANK	ENOU	BJ	\N	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}
66	pbkdf2_sha256$260000$hdsgC7hSZINsu1mJa64to0$YMyu+ZphkhX/aLTB7a4EOMaF0AlV/xwg4PXQ3eCJSe0=	2022-12-22 06:34:51.293601+00	f	\N	fouadinehoussou@gmail.com	f	t	2022-12-22 06:34:51.077925+00	Fouadine olaiya 	Houssou 	BJ	\N	{"name":"Agblangandan","lat":6.375025600000001,"lng":2.514842}
67	pbkdf2_sha256$260000$yjMQMUtfFlHduZdea4HvBv$La6/l2B2Im4h6NnvzY0tw+xAJdvdXM2EJBFQd/vqPHY=	2022-12-22 08:57:18.124805+00	f	\N	houetoaristide38@gmail.com	f	t	2022-12-22 08:57:17.904477+00	HOUETO 	Aristide	BJ	\N	{"name":"African University of Benin, Akpakpa Campus","lat":6.3637881,"lng":2.4917049}
69	pbkdf2_sha256$260000$nA0UEDnWjHin83evfcv8Zl$L1rOr5VwgwO8zgl4HBCAflt4IVCCgBu+L7ihqVRsGQ0=	2022-12-22 17:00:43.854418+00	f	\N	enockzossou@gmail.com	f	t	2022-12-22 17:00:43.593037+00	Vlavonou	Baba	BJ	\N	{"name":"PK10","lat":6.3704164,"lng":2.5213408}
110	pbkdf2_sha256$260000$JPLj6u3T9ZuFdqMMFmoHLX$mkAVpInZe+YREllRNqdpqYclSrKNAQZYrHeWLPoZ7oo=	2022-12-30 20:17:15.992485+00	f	\N	parfait.dohou@outlook.fr	f	t	2022-12-30 20:17:15.802969+00	Dohou 	Parfait8 	NL	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
111	pbkdf2_sha256$260000$CNJ9qzXmqpRlcAsk99YIfv$UJkhvTLs0qqynz1tidehJ6ZpmPQSn0on9xKT7E8QZrg=	2023-02-06 20:01:19.405756+00	f	\N	nflakanho@gmail.com	f	t	2022-12-31 17:42:34.331318+00	AKANHO	Naofal	BJ	\N	{"name":"","lat":0,"lng":0}
70	pbkdf2_sha256$260000$Xdl4bA749EyBLBoN1j8wca$xJZ7Ue3MNHecCz6/8W0LWznQDrDjUeAzHW7kg6tVgsc=	2022-12-24 07:33:52.575349+00	f	\N	romuald91303142@gmail.com	f	t	2022-12-24 07:33:52.377726+00	Romuald	Romuald	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
68	pbkdf2_sha256$260000$dd4zhi5k2XyDWBGZtUBEfO$2yq4DuQWIJwmS+iYupZozln52XPbt2KP1A1487vnQEo=	2022-12-26 11:32:51.719162+00	f	\N	princeahidje@gmail.com	f	t	2022-12-22 09:05:57.538063+00	AHIDJE	Noll	BJ	\N	{"name":"","lat":0,"lng":0}
71	pbkdf2_sha256$260000$OjwFFV2WSglXG6Q84tbOkK$bysFvXqiwgb+YJl1KsE8lS0f0jqNotrVrDsX6imx7Fc=	2022-12-27 12:06:50.612428+00	f	\N	olivierattannon@gmail.com	f	t	2022-12-27 12:06:50.202828+00	ATTANNON	Olivier	BJ	\N	{"name":"Hêvier","lat":6.4081646,"lng":2.2482705}
72	pbkdf2_sha256$260000$rR8H0sYFVqQzvcs8wcCsqc$hNfMl6QR6AuBhAfGK+TfAZRgOOI/z+J74aFBbn1LmUU=	2022-12-28 16:58:55.391802+00	f	\N	Stevelandjeli@gmail.com	f	t	2022-12-28 16:58:55.086963+00	Ldl	Steve 	BJ	\N	{"name":"Université d'Abomey Calavi du Bénin","lat":6.4180733,"lng":2.3430427}
73	pbkdf2_sha256$260000$E6siyZyKgrOoDufrioWqlb$7nUZx3ZJDYxcW4yBeG8IQxPbqivCGJdUX7aJ2y1+xSc=	2023-01-31 21:29:26.199007+00	f	\N	agbikododanielle@gmail.com	f	t	2022-12-28 17:32:23.954378+00	AGBIKODO 	Danielle 	BJ	\N	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}
74	pbkdf2_sha256$260000$GBMZcoLG6NJ1jCpeOG4XW2$Fjb5VMjcvLpQnqLl3bzPd+RyaVXy+t57MWAmpXeN8EI=	2022-12-28 18:14:53.358656+00	f	\N	arnoldkpovi@gmail.com	f	t	2022-12-28 18:14:53.168846+00	Arnold	LeK	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
75	pbkdf2_sha256$260000$tDyjwzfTU7CQ6eYXOQ4UjT$CyuemTRvVmkg9MECoFBRxBF+pG+3JJ6EFY+MsqJYq3w=	2023-01-10 21:52:56.281531+00	f	\N	dassimaickiel@gmail.com	f	t	2022-12-28 20:05:07.766275+00	Dassi	Desiré	FR	\N	{"name":"","lat":0,"lng":0}
76	pbkdf2_sha256$260000$Eq3IjTbl4ZuY2vy9zrVb6S$xigXfelQO7itzZ2Ay1Mg89niLyf4KaULuuYvVLlI10w=	2022-12-30 09:03:54.414637+00	f	\N	geodaseno@gmail.com	f	t	2022-12-30 09:03:54.206131+00	Eno	Geodas	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
109	pbkdf2_sha256$260000$9JuAaW8RW2iDb1QY1oz5lF$LcYHNIhHqOie99u7Qg3+r8uhFDAoGbZ7IUA4R34RuZA=	2022-12-30 14:04:04.692893+00	f	\N	geo@gmail.com	f	t	2022-12-30 14:04:04.461679+00	Eno	Prudence	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
116	pbkdf2_sha256$260000$ure0DZeioLjVMoHp9wd1Rv$zP65JaXciwIuws3Iz1mO4kVYTtyKqmn6+hCjLYTOTP8=	2023-01-02 11:50:07.054325+00	f	\N	mahudjroo@gmail.com	f	t	2023-01-02 11:50:06.860585+00	TCHOUKOU 	Henri Joel 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
112	pbkdf2_sha256$260000$IumPWrbOdenyeRa2kEoaYk$xKIeXckQMdBCJfzpEl2tKwnQsex+id5dAQqEYG4kwNM=	2023-01-02 11:05:30.16453+00	f	\N	alavojeremie2018@gmail.com	f	t	2023-01-02 11:05:29.929584+00	Jérémie 	ALAVO	BJ	\N	{"name":"Djeffa Gare","lat":6.3744419,"lng":2.5628863}
113	pbkdf2_sha256$260000$EZRvgjvxx5J2IkvCAeKds8$9rNPgSuxmvQfLZA2QoSdBULkqFyecczqUrp+hOgrcEw=	2023-01-02 11:10:39.413151+00	f	\N	armandguensofficiel@gmail.com	f	t	2023-01-02 11:10:39.088665+00	Armand	Guens	BJ	\N	{"name":"","lat":0,"lng":0}
117	pbkdf2_sha256$260000$mJhDErKqGB4Nlck6fCQdzZ$zpXneP/OAHnlfVU5jsrUXC/QHgc/uGI5DhyaEaRuIsk=	2023-01-02 12:00:07.31816+00	f	\N	alexhounkpatin2003@gmail.com	f	t	2023-01-02 12:00:07.065561+00	Alex Franky	Hounkpatin	BJ	\N	{"name":"","lat":0,"lng":0}
114	pbkdf2_sha256$260000$lXfVGDWF3PJCZRWglRRIPK$y+mcRrJFHfMUSaJsm8sn+U0sTKomZkOadaHzuplQ9Kg=	2023-01-02 11:22:59.344967+00	f	\N	Salomeadagbenon@icloud.com	f	t	2023-01-02 11:13:29.703635+00	Adagbenon 	Salomé 	BJ	\N	{"name":"PK10","lat":6.3704164,"lng":2.5213408}
115	pbkdf2_sha256$260000$JePdcslESewJRwmugO88Qu$cjuxApLK6dtPgTIKU+dvGUpjoR7/AV2F4tvdQgx2y0A=	2023-01-02 11:49:07.429451+00	f	\N	ichrocakannifassassi@gmail.com	f	t	2023-01-02 11:49:07.200951+00	Ichroc Akanni	FASSASSI	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
118	pbkdf2_sha256$260000$pv5ZKRV78Cfn5SszDWT652$K1/8cJfjJHBMbzQixVEB9G8npo98TLqLEmWpDrAZEI4=	2023-01-02 13:14:15.846013+00	f	\N	hchriso171@gmail.com	f	t	2023-01-02 13:14:15.549175+00	Houmavo 	Christelle 	BJ	\N	{"name":"Commissariat tokpegble","lat":6.365387,"lng":2.4853978}
119	pbkdf2_sha256$260000$zJPGyQVswhLkaIlcBRuhe2$wQ8vkoi3Gs5A4o3/5ubW5/4JAivWyYSWNcNdcZP+fqQ=	2023-02-02 15:40:06.098172+00	f	\N	josedahoueto48@gmail.com	f	t	2023-01-02 17:07:03.844941+00	Olowookere	Frip	BJ	\N	{"name":"Le Plasma Bar","lat":6.381539399999999,"lng":2.3342749}
121		\N	f	George	george.bluth@reqres.in	f	t	2023-01-03 18:18:26.935515+00	George	Bluth	BJ	\N	fake
122		\N	f	Janet	janet.weaver@reqres.in	f	t	2023-01-03 18:18:27.505429+00	Janet	Weaver	BJ	\N	fake
120	pbkdf2_sha256$260000$Rjphr9p0CoA7BNc2lMrwoU$P1tXQpeq5Tsgs3ZnrDyy9Ste1Pn7M9Tsbn2AQ6lJdgQ=	2023-01-02 18:52:32+00	f	Thierry	thierryjgodeme@gmail.com	f	t	2023-01-02 18:52:32+00	Thierry	GODEME	BJ	\N	{"name":"Agla Akplomey","lat":6.380312699999999,"lng":2.3521924}
123		\N	f	Emma	emma.wong@reqres.in	f	t	2023-01-03 18:18:27.82214+00	Emma	Wong	BJ	\N	fake
124		\N	f	Eve	eve.holt@reqres.in	f	t	2023-01-03 18:18:28.354776+00	Eve	Holt	BJ	\N	fake
125		\N	f	Charles	charles.morris@reqres.in	f	t	2023-01-03 18:18:28.786842+00	Charles	Morris	BJ	\N	fake
126		\N	f	Tracey	tracey.ramos@reqres.in	f	t	2023-01-03 18:18:29.15435+00	Tracey	Ramos	BJ	\N	fake
127		\N	f	Michael	michael.lawson@reqres.in	f	t	2023-01-03 18:18:29.791779+00	Michael	Lawson	BJ	\N	fake
128		\N	f	Lindsay	lindsay.ferguson@reqres.in	f	t	2023-01-03 18:18:30.353146+00	Lindsay	Ferguson	BJ	\N	fake
129		\N	f	Tobias	tobias.funke@reqres.in	f	t	2023-01-03 18:18:30.905666+00	Tobias	Funke	BJ	\N	fake
130		\N	f	Byron	byron.fields@reqres.in	f	t	2023-01-03 18:18:31.267726+00	Byron	Fields	BJ	\N	fake
131		\N	f	George	george.edwards@reqres.in	f	t	2023-01-03 18:18:31.605216+00	George	Edwards	BJ	\N	fake
132		\N	f	Rachel	rachel.howell@reqres.in	f	t	2023-01-03 18:18:32.082463+00	Rachel	Howell	BJ	\N	fake
65	pbkdf2_sha256$260000$0x2isZWIdNHz993Xk0lYjs$HIKivAaAeGtdgzf3WCqm1c5glMWZV2QvVM6To0J0neE=	2023-01-17 16:08:53.74378+00	f	\N	williamhounkpe6@gmail.com	f	t	2022-12-21 18:50:46.542564+00	Hkp	William	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
156	pbkdf2_sha256$260000$y8fgmB5VdnHWMcsqpyXTA2$4CeugYE+1wHEdRBr4j6MrZFBrUzXNn4hvnANO8FryEA=	2023-02-07 15:19:28.067575+00	f	\N	gloriaattikou@gmail.com	f	t	2023-01-24 09:34:58.332998+00	ATTIKOU	Gloria	BJ	\N	{"name":"Agla","lat":6.383711,"lng":2.3640875}
134	pbkdf2_sha256$260000$jm0Qj5VPlJOO7RsuKOtGlt$cuONizrWw6L72KVi/bEjoRlYaBhPJbggZO0NEjBecdg=	2023-01-04 21:08:26.955477+00	f	\N	zakiyathyessoufou3@gmail.com	f	t	2023-01-04 21:08:26.411929+00	Zakiyath	YESSOUFOU	BJ	\N	{"name":"Collège d'Enseignement Général (CEG) Sèkandji","lat":6.3761022,"lng":2.5100206}
135	pbkdf2_sha256$260000$otlAQUKZeAezf87WBBsZGx$e0rmE5hbvGnBkY4o3TNYmXxUxlDwGuuA+/CgEp1K578=	2023-01-07 09:41:15.430546+00	f	\N	meliaaminou03@gmail.com	f	t	2023-01-07 09:41:15.214091+00	AMN	Méli 	BJ	\N	{"name":"Gaya","lat":11.8852599,"lng":3.4548833}
136	pbkdf2_sha256$260000$RZUwXXL50rtyCJ51t819p7$1tDQFDJcRrf/pzOpP6d41dXxZkEB9ONxyxkUCGxEmsU=	2023-01-07 11:50:54.647472+00	f	\N	bankolewilli@gmail.com	f	t	2023-01-07 11:50:54.295965+00	Bkl	Will	BJ	\N	{"name":"","lat":0,"lng":0}
137	pbkdf2_sha256$260000$uiJw9RBa2Tgwpxs6zIRqNf$87sbzAFXCC6ri41OiwKpvfvoWdiPS4cAfm2E8wYnZhU=	2023-01-07 12:46:07.231166+00	f	\N	marianosessou085@gmail.com	f	t	2023-01-07 12:46:07.002591+00	Mariano	Sessou	BJ	\N	{"name":"Sèmè-Kpodji","lat":6.4224777,"lng":2.5990835}
138	pbkdf2_sha256$260000$qZKJQOAr9oTAd3UOVUKOon$vKQuJlrL8nLlQdPPCTCqtfyResSlOksrA+IXV1W8jo8=	2023-01-07 12:52:36.310687+00	f	\N	badambadji@gmail.com	f	t	2023-01-07 12:51:13.513822+00	ADAMBADJI 	Benoît-Labre 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
139	pbkdf2_sha256$260000$zyFSbJUPHHPWXJa9CD7c3K$T80Hy8xPpLcjs7N/fMDWntGasRvuiIDUWTWommVgikQ=	2023-01-08 10:25:08.966926+00	f	\N	hhodilc@gmail.com	f	t	2023-01-08 10:25:08.764321+00	HOUNTOWAHOUNDE 	Hodilo	BJ	\N	{"name":"Menontin","lat":6.3930129,"lng":2.3653212}
140	pbkdf2_sha256$260000$GXhhof6yGzgCLsbLwcz3jl$tvS5vvGma4Q3W++rOON60w0yKDemIoIZibZzDUD/zSU=	2023-01-09 11:35:53.793062+00	f	\N	vendeur.wadi@gmail.com	f	t	2023-01-09 11:35:53.549448+00	Blaise	Pass	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
141	pbkdf2_sha256$260000$lQiC7JgT4qQZcp137cmgt9$zZqiohlaRICZ0KlAxwQQWUq7IjrBYLb+t0B5kEnmuEo=	2023-01-10 00:48:28.612479+00	f	\N	Landryclaver607@gmail.com	f	t	2023-01-10 00:48:28.399763+00	Claver 	Diane landry 	BJ	\N	{"name":"","lat":0,"lng":0}
142	pbkdf2_sha256$260000$9ULFE5i9nZhXfQO6BGCLyj$YSi742VldGeGpzXcre9qjGipAUrDOzd96ekEeLIRNUg=	2023-01-10 19:42:41.795252+00	f	\N	houedjinelly@gmail.com	f	t	2023-01-10 19:42:41.566134+00	Houedji 	Nelly 	BJ	\N	{"name":"Place Bulgarie","lat":6.3621535,"lng":2.4139868}
143	pbkdf2_sha256$260000$x8SXyEKpIWNEMtTEDpzGtl$jDdlgkI46qre5dt+oU/o0yEQRJFfrbidffA3PI6Xads=	2023-01-11 17:40:39.76425+00	f	\N	elroilempereur@gmail.com	f	t	2023-01-11 17:40:39.456524+00	YENI 	N'DIMONTE 	BJ	\N	{"name":"Université d'Abomey-Calavi (UAC - Entrée principale)","lat":6.4130104,"lng":2.3449665}
146	pbkdf2_sha256$260000$z4yFn6yDig0uOjHgyz1D9P$7Zwl9NEk+lnWqJNfBQrfUY/NSVMwfTMwmvAVy9pRPts=	2023-01-16 22:58:30.381243+00	f	\N	jacobhoungninou94@gmail.com	f	t	2023-01-16 22:58:30.136055+00	Jacob	HOUNGNINOU	BJ	\N	{"name":"Senade","lat":6.3779802,"lng":2.4529976}
144	pbkdf2_sha256$260000$yJmatbY3p5ietwsVt4Z6iM$2msNq/rnFtjvYp80r+QGpHV6W0ZpZdo9Q6WQccW3QFo=	2023-01-14 11:14:16.248611+00	f	\N	tbiaslukte@gmail.com	f	t	2023-01-14 11:14:16.054345+00	Piage	Ge	BJ	\N	{"name":"Carrefour Sèkandji","lat":6.3700049,"lng":2.5072141}
160	pbkdf2_sha256$260000$cD8gVKXonKxkmiwgxq286I$WzNsNG5Hp58g5iFB6LiL/OO/KLQV1/P9w37yeKRWdoI=	2023-02-04 18:55:35.644372+00	f	\N	linofresnel071@gmail.com	f	t	2023-01-25 12:34:00.39455+00	Yoclounon	Fresnel	BJ	\N	{"name":"Cocotomey","lat":6.3866697,"lng":2.2975183}
148	pbkdf2_sha256$260000$YvcSyjw7SSt59rUFvVUp9V$pNB3PnY5BOlvINRGt77cuXMBMKPQ3gBXLMFdtnBASYk=	2023-01-17 21:21:28.206145+00	f	\N	millahoussou@gmail.com	f	t	2023-01-17 21:21:28.01276+00	HOUSSOU 	Bernice 	BJ	\N	{"name":"Bénin","lat":9.30769,"lng":2.315834}
149	pbkdf2_sha256$260000$ZUwUdCuaMbjwfZDw02C8Am$uhECme4PxzA9QAydgUHKFpxrs7vmnu6f+D8VvlfZPKw=	2023-01-18 10:26:31.768593+00	f	\N	fredericagandji60@gmail.com	f	t	2023-01-18 10:26:31.512624+00	GANDJI 	Esséname Frédérica 	BJ	\N	{"name":"","lat":0,"lng":0}
150	pbkdf2_sha256$260000$g8hzR4fyCdaiJRnlLTpp3z$RFPGeW3DsMrTovQbeyLRzcgeA91hv8K15I4Ll3rk9KE=	2023-01-18 10:42:02.141252+00	f	\N	georino@gmail.com	f	t	2023-01-18 10:42:01.942628+00	Eno	Global	BJ	\N	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}
155	pbkdf2_sha256$260000$Xqk18l3u2oxxu9yYsNhjcv$Rd7801j7Y+BTLhdpk62XNGY4g2wnl4H5aCogJfeiZ2U=	2023-01-20 22:08:17.410907+00	f	\N	gbeadanreas@icloud.com	f	t	2023-01-20 22:08:17.169925+00	GBEADAN	Fallone	BJ	\N	{"name":"Clinique Bidossessi","lat":6.4334402,"lng":2.3420641}
154	pbkdf2_sha256$260000$6Kplt89boKWwwiszDnvenQ$15qn55joKAoAfSNXdkXIRnbD5RxFQNJ2Ef2/rSf2bms=	2023-02-12 18:51:05.293947+00	f	\N	akoyessounatacha@gmail.com	f	t	2023-01-20 21:16:56.084457+00	Natacha 	Cosmétiques 	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
157	pbkdf2_sha256$260000$1eFH8cbdeTAywsVWRt3lZ7$II64R/Fc8fuuC1btmjT8P6Ykq0HWUAnbEzu9Jy69uf4=	2023-01-24 19:02:17.954595+00	f	\N	adjaffonelvisludovic@gmail.com	f	t	2023-01-24 19:02:17.710522+00	Elvis	ADJAFFON 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
31	pbkdf2_sha256$260000$q9BwQUJaMW1Z2G8wJ9AB88$XuJzL0xKY0zNFS8yFdX34BmTwXKyI9pFptlI1Z1J2y8=	2023-01-24 09:46:40.96497+00	f	\N	zannoumerveille4@gmail.com	f	t	2022-12-07 08:47:17.259886+00	ZANNOU 	Merveille 	BJ	\N	{"name":"","lat":0,"lng":0}
153	pbkdf2_sha256$260000$On6XuKwoUWfhHIZBEGPPL4$rHszOo/rlEwcyO3Nde3ODnWZTScwJ4BahOrFfQRt7yI=	2023-01-20 21:06:25.01006+00	f	\N	bogninnouvaleriejolli@gmail.com	f	t	2023-01-20 21:06:24.796821+00	BOGNINNOU	Valerie	BJ	\N	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}
158	pbkdf2_sha256$260000$8Ct7AhXsmJIfoiaYaekGGD$fDio0fObEozYEish6A4JxLsxxlnbNhz7izCNmGlICoo=	2023-02-02 14:43:40.605953+00	f	\N	merveilleusemarie7@gmail.com	f	t	2023-01-24 21:16:19.480431+00	SESSOU	merveille	BJ	\N	{"name":"PONT PÉAGE PK10","lat":6.371467,"lng":2.5322753}
159	pbkdf2_sha256$260000$E118DqUTzdrh0LN9cP6x6U$h4J+5vEX710l2sk18AhV0sVr/qf9B0VRyZVICOjaTYk=	2023-01-25 12:20:13.411854+00	f	\N	valenciahounye@gmail.com	f	t	2023-01-25 12:20:13.137538+00	HOUNYE 	Valencia 	BJ	\N	{"name":"Sekandji Mosquée","lat":6.3761414,"lng":2.5078515}
145	pbkdf2_sha256$260000$0HOoqJc2FFMxeAoKTNZNIK$eNOM33SxXGVsjnY8txk0kTmFFHAcBAswRy340i9fXaM=	2023-02-07 12:57:55.509387+00	f	\N	rutha6619@gmail.com	f	t	2023-01-14 11:21:40.275762+00	AGASSOUSSI	Ruth 	BJ	\N	{"name":"Rte de Tankpé","lat":6.4226471,"lng":2.3200947}
152	pbkdf2_sha256$260000$gUttgz8YgTCPZkZsHedCnv$FNYhcMEdeh/qyp9b29Ngqbmiz5/D4wXw21sRbVAMIf0=	2023-01-31 10:25:02.751942+00	f	\N	am92kk@gmail.com	f	t	2023-01-19 17:33:57.348493+00	KPATY 	Aimé 	BJ	\N	{"name":"EPP Adjarra Hounvê","lat":6.426304099999999,"lng":2.2053082}
161	pbkdf2_sha256$260000$16NHCboHX0qmjRRzreMlYu$E7g2iiaL8pVY75JtDjvUsggb4DBLcVr+WVJkdgbYgaM=	2023-02-02 10:27:20.374719+00	f	\N	adanzononida@gmail.com	f	t	2023-01-25 13:01:59.650485+00	ADANZONON	Ida	BJ	\N	{"name":"","lat":0,"lng":0}
151	pbkdf2_sha256$260000$9TFHJYJaGx9XRGvNnWIdRg$gEcVu68BEneE4YBCXrBuvr+53bHo9WwGf3HixFknMjc=	2023-01-29 10:53:54.616892+00	f	\N	hontchenoufabrice@gmail.com	f	t	2023-01-18 22:14:39.210094+00	Sira 	Eder	BJ	\N	{"name":"Porto-Novo","lat":6.4968574,"lng":2.6288523}
147	pbkdf2_sha256$260000$ztiRK6pYbaxaJ9Znjw0aEu$BVzsE2Rw1k7o1O4C6JOzQ84DdlsGcdh40ZXKAhuDSMo=	2023-01-25 16:10:31.191888+00	f	\N	ROMARICHOUNGNINOU718u@gmail.com	f	t	2023-01-16 23:11:13.319088+00	HOUNGNINOU	Jacob	BJ	\N	{"name":"Senade","lat":6.3779802,"lng":2.4529976}
164	pbkdf2_sha256$260000$36j0Ez8CamXavIstnhMruC$aApxby5AKR/AHmUaBVE+mt2vQf8JKNSNyQIdmPZ3+lQ=	2023-01-25 16:15:43.898957+00	f	\N	abecodjohoumaidath@gmail.com	f	t	2023-01-25 16:15:43.652441+00	ABE-CODJO 	Houmaïdath 	BJ	\N	{"name":"Agla","lat":6.383711,"lng":2.3640875}
165	pbkdf2_sha256$260000$MhqOa6OpeuUYi0k3lUS6gZ$oJ5VTCUFXfRKjIl8bB2w6TzsXCsMtvZKpEs782W2aqA=	2023-01-25 18:01:55.648012+00	f	\N	ericmahoule@gmail.com	f	t	2023-01-25 18:01:55.463558+00	DJROHOUEDE 	Éric 	BJ	\N	{"name":"Hôpital de zone d'Abomey-Calavi","lat":6.473284,"lng":2.3428118}
172	pbkdf2_sha256$260000$ZjOTNMYCxdMLCgAm1Ry4FA$3Z0hP2Ga84/dZpa7NSzeiTYBEi7X5CKxYde9Z0000gs=	2023-02-05 20:17:22.604857+00	f	\N	ninelledegninou@gmail.com	f	t	2023-01-26 07:54:07.901531+00	DEGNINOU	Ninelle	BJ	\N	{"name":"Cocotomey womey","lat":6.3951875,"lng":2.2920625}
167	pbkdf2_sha256$260000$GlRuhK3vKu8ineimGvBde6$1vBhEd+YtR/ETyLBko9SJpFHzK3ZJUm9ZehJm9LDv8o=	2023-01-25 22:35:04.064457+00	f	\N	lucelia67@gmail.com	f	t	2023-01-25 22:35:03.781668+00	SADELER 	Lucélia 	BJ	\N	{"name":"Senade","lat":6.3779802,"lng":2.4529976}
170	pbkdf2_sha256$260000$71jHIZgx09t1GgmR9PObaK$0N/zkDJ70jvIrLhoTBe6hXM1gwecklSkOsAB9LDOwCs=	2023-01-26 07:44:32.04273+00	f	\N	yissegnonmontonhessa@gmail.com	f	t	2023-01-26 07:44:31.825648+00	Ruth	MONTONHESSA	BJ	\N	{"name":"Pharmacie Saint Martin","lat":6.3730427,"lng":2.4641981}
171	pbkdf2_sha256$260000$N3D9Ym8m5UZ9frB57rsqAM$X+O+65HlIY9ZmjfAWqUCju0sE4Z8/z+qoyPNj6zRFS0=	2023-02-04 07:11:21.597897+00	f	\N	mauriceadja12.12@gmail.com	f	t	2023-01-26 07:47:06.446222+00	Adja	Maurice 	BJ	\N	{"name":"Golo-Djigbé","lat":6.5405601,"lng":2.3261572}
168	pbkdf2_sha256$260000$IHhXTtWKN3QfggV4T8w3oV$PikO689aFSlFl0jt3MLIP5+/TAYuMt/YGwqAWZYEEq8=	2023-02-06 20:43:26.402753+00	f	\N	ulvisgbedobou.com@gmail.com	f	t	2023-01-25 22:42:29.136768+00	GDB	Ulvis	BJ	\N	{"name":"Godomey","lat":6.413202399999999,"lng":2.3123031}
182	pbkdf2_sha256$260000$dREQ1AJdnIOlfmEx8Rem7T$gyfP+FcvmViX8VZRHMp8+POE6wK9NbXrBmjgsroEix4=	2023-01-31 07:52:38.305289+00	f	\N	houenagnonmerveil@gmail.com	f	t	2023-01-31 07:52:38.056047+00	HOUENAGNON	Merveil	BJ	\N	{"name":"","lat":0,"lng":0}
174	pbkdf2_sha256$260000$GRbSb2Z1YPTnezx6ow67Qe$KbcTgPCcEEm9TdpV9aY8GmRf31F6Ity6AVq4kZ9Z6H8=	2023-01-26 08:24:06.494783+00	f	\N	sononlarissa752@gmail.com	f	t	2023-01-26 08:24:06.275664+00	SONON	Larissa	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
175	pbkdf2_sha256$260000$LldYFGv0xGar4i5hv3yOnz$GOoGGUSr5EIaNM41NftfcN/55uN0aCFe6bkYaeVeyJ0=	2023-01-26 09:13:57.54938+00	f	\N	fantodjiclaudine8@gmail.com	f	t	2023-01-26 09:13:57.37153+00	Claudine 	Fantodji 	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
177	pbkdf2_sha256$260000$nhZq41QKHBZhQ3WWE9Jzel$GO+kLU4qcmrAJju0YpE8SP0QUuD+dV1UuVnZKMawwFM=	2023-01-26 10:48:12.596359+00	f	\N	onibonsarah6@gmail	f	t	2023-01-26 10:48:12.419381+00	onibon 	Sarah 	BJ	\N	{"name":"Rte de Tankpé","lat":6.4226471,"lng":2.3200947}
187	pbkdf2_sha256$260000$7uRj3lQJzd1zNRAxJ6JEtr$FlVRbJCrSmsEIJ9LsUYkxPSsHlrQmhI2Ga4CtUjdVvY=	2023-02-07 11:18:33.760829+00	f	\N	martelgbd@gmail.com	f	t	2023-01-31 20:58:35.682691+00	GBEDOBOU 	Martel Stébane 	BJ	\N	{"name":"Cotonou","lat":6.3702928,"lng":2.3912362}
178	pbkdf2_sha256$260000$zCjU7PgPoccSKSdV57ebqE$5ntADzlKaxu7PBAK4MOoivgvlgkNVGl/AV7RKEP3qvI=	2023-01-27 10:38:43.329221+00	f	\N	kabuirectioon@gmail.com	f	t	2023-01-27 10:38:43.127685+00	test	585	BJ	\N	{"name":"Dangbo","lat":6.583719299999999,"lng":2.5519637}
173	pbkdf2_sha256$260000$kVwq6pkLnX4KybThHaoyjR$IdZFeRKbwE/1UtQFC8SD3fU17DbeaZZpDoTGMxa0uuA=	2023-01-27 10:49:42.112009+00	f	\N	ldohounzo@gmail.com	f	t	2023-01-26 07:57:54.673241+00	Dohounzo	Larissa Florence 	BJ	\N	{"name":"Houeto","lat":6.4445217,"lng":2.302415}
183	pbkdf2_sha256$260000$3qHEZj7wHc8KWgT03EHE0n$Jll2nB1CuXWzU+riVhqk1pVidjAtH+2wnNw1ObVus/o=	2023-01-31 08:28:34.316721+00	f	\N	lavoisierdenagnon@gmail.com	f	t	2023-01-31 08:28:34.104909+00	DENAGNON	Emmanuel	bj	\N	{"name":"Zogbadjè","lat":6.4503024,"lng":2.3468195}
163	pbkdf2_sha256$260000$qOVdzvwT3rWJemdZQ5qQup$RJoqVQELzRml8Qsd5JMNPZ1SxSVzh7FCtfeH/ZaYZzE=	2023-02-02 13:41:19.078189+00	f	\N	fanibakary38@gmail.com	f	t	2023-01-25 15:45:59.341959+00	Bakary	Anifath	BJ	\N	{"name":"Gbegamey","lat":6.363550000000001,"lng":2.4122257}
176	pbkdf2_sha256$260000$UaeF6yor68N785zkltTh38$t4RUwcQTeMgrt5xLbx59ROnjqDs9IetnX65dm0oyd2U=	2023-02-04 10:47:02.371926+00	f	\N	legbanongistonie@gmail.com	f	t	2023-01-26 10:38:18.180442+00	LEGBANON	Gistonie 	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
184	pbkdf2_sha256$260000$fE2s3TzYr1iKO1ur1hLsdk$5o9zzJPLhzzCtSbR4DolPhPZjUbr4TruGpAkvQjkl+g=	2023-01-31 11:09:54.928425+00	f	\N	alexandrefassinou7@gmail.com	f	t	2023-01-31 11:09:54.748663+00	Fassinou	Fassinou	BJ	\N	{"name":"Marché Ouando","lat":6.506603999999999,"lng":2.6111748}
169	pbkdf2_sha256$260000$GBXBgWRjo6yynH9DAXrG5W$0BlngSx6nYAui50wnXJdbe/TYmrO5Ccpv1qH7vD0pME=	2023-02-02 10:05:43.95319+00	f	\N	berlinelissa75@gmail.com	f	t	2023-01-25 23:09:46.595217+00	LISSA	Berline	BJ	\N	{"name":"Arrondissement de Togba","lat":6.4630782,"lng":2.3056292}
181	pbkdf2_sha256$260000$7bJ9AiiYw31JsCYeyMw1KZ$rTTi09Wd7nouKGj5XYn9+Mub+ZnJ8TiGYg5LNKxinjE=	2023-01-30 12:49:18.930476+00	f	\N	clairekowe94@gmail.com	f	t	2023-01-30 12:39:56.094713+00	KOWE	Claire	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
186	pbkdf2_sha256$260000$0JHfOvMxAs7AtMXDiL4UkZ$gAsOLiNUG9Zh99e834cg9MK6qKRpOnOTR+x6fXYiNTU=	2023-02-04 01:02:45.891676+00	f	\N	anatofleur62@gmail.com	f	t	2023-01-31 20:54:48.554158+00	ANATO	Fleur	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
185	pbkdf2_sha256$260000$gkWXn9lXIcfopqK5hPvxZC$gViARXw3o/BP4+srYekWzFq0XlnEkgVMgpvu0Q6tS/g=	2023-01-31 14:15:21.112387+00	f	\N	elfrieddasilva@gmail.com	f	t	2023-01-31 14:15:20.774354+00	da Silva	Elfried	NL	\N	{"name":"Gbegamey","lat":6.363550000000001,"lng":2.4122257}
1	pbkdf2_sha256$260000$y6Y9o7WulA6nG7zNlCHQp2$pHwgA3kp4eXPn/WvOJC61vh8c3UW/FCqPsqbC/C3QlU=	2023-02-12 18:34:07.190636+00	t	\N	tobiaslukte@gmail.com	t	t	2022-12-03 20:03:01.975312+00	\N	\N	\N	\N	\N
188	pbkdf2_sha256$260000$7wufn78ZkH2qx7Ju9CagyR$ZHdINFPCyT0krpdvRd1LRSRRKH+R9svzW66duehN6us=	2023-02-07 09:47:21.384449+00	f	\N	durojayepamela271@gmail.com	f	t	2023-02-01 09:03:19.880096+00	DUROJAYE 	Marie Michelle 	NE	\N	{"name":"Hotel Tibi Libi","lat":6.4860963,"lng":2.3373378}
189	pbkdf2_sha256$260000$bpTvHlpgBILbR65GHVSZzN$vwemGI4YhYhH1IVpFJJ+kDOsytq5XqreyCsbvCVjb40=	2023-02-01 21:13:21.943489+00	f	\N	djcakpo@gmail.com	f	t	2023-02-01 21:13:21.726615+00	CAKPO 	Diane 	BJ	\N	{"name":"","lat":0,"lng":0}
24	pbkdf2_sha256$260000$qKaosDGQYvcwwKUs0aT5iN$nQGMomnH6+KjjxQkNt6y0f8+2WipNXVUz79y3kOkYAs=	2023-02-01 21:15:39.868534+00	f	\N	nfinagnon@gmail.com	f	t	2022-12-06 13:28:26.537225+00	GOVOECHAN	Anne Marie	BJ	\N	{"name":"Djeffa FC Football Club","lat":6.3498796,"lng":2.3565992}
180	pbkdf2_sha256$260000$av3a5eLiBDLngZDOBtLyxL$NC3r6KHFDuE2JXwh3lQvgREPQOdtQ4TLT7Zkf1XFtN4=	2023-02-04 04:42:21.942626+00	f	\N	benoitalloukoutoui56@gmail.com	f	t	2023-01-28 22:10:33.911209+00	ALLOUKOUTOUI	Benoît	BJ	\N	{"name":"Agla","lat":6.383711,"lng":2.3640875}
190	pbkdf2_sha256$260000$CiEoVIKAMCCpuAK1acpLc8$ualab78FnKHNQUpH3u8urtRFvvlpwqypKstg5iEb8qc=	2023-02-02 19:39:56.147901+00	f	\N	rudygbaguidi231@gmail.com	f	t	2023-02-02 19:39:55.91837+00	Kevin	GBAGUIDI	BJ	\N	{"name":"","lat":0,"lng":0}
166	pbkdf2_sha256$260000$Yo80suJm283MjnBtUd8tnQ$QttM9hliauUv7zR5gATOk7F84331WeQ8BCYrSAAArJs=	2023-02-07 12:48:39.905327+00	f	\N	djamagbomireille2021@gmail.com	f	t	2023-01-25 21:51:16.190458+00	Djamagbo 	Mireille 	BJ	\N	{"name":"Tokpa-Hoho","lat":6.358774599999999,"lng":2.4387851}
204	pbkdf2_sha256$260000$oQ0y5N74NNeEcU57ZaynRf$GieL8RkCD9hWvwepllGSNa5LIYMfEliTmS3eu6M8Ijk=	2023-02-07 08:04:37.916163+00	f	\N	judicaelalikponto283@gmail.com	f	t	2023-02-07 08:04:37.703672+00	Ali	Judi	BJ	\N	{"name":"Bohicon","lat":7.179768399999999,"lng":2.0714223}
194	pbkdf2_sha256$260000$EvE331COn2U8QLlpuHcWQw$55RH4ARS7lsndgs8ebbiNM0PrHxGM+1nDzYbudP/dzA=	2023-02-05 13:18:35.877317+00	f	\N	adikpontofernando@gmail.com	f	t	2023-02-05 13:18:35.669576+00	Fernando 	ADIKPONTO 	BJ	\N	{"name":"Ahogbohoue","lat":6.3743317,"lng":2.380128}
196	pbkdf2_sha256$260000$owHIKs7tqnb3gfCjqdNmLy$Qkn2cj03SG9B5VGWx4/T+/BeMMJcKEkCQl2znpnQ0pw=	2023-02-06 10:43:31.836619+00	f	\N	crepinfad@gmail.com	f	t	2023-02-06 10:43:31.650417+00	FAD	Chrys	BJ	\N	{"name":"Godomey","lat":6.413202399999999,"lng":2.3123031}
197	pbkdf2_sha256$260000$5WE7cpScvLffBpo0O6AwcH$yfPVI0yNR9Kv2vPMqD5/EDqZVIpTtlT3994bGYCEsXs=	2023-02-06 17:17:59.141138+00	f	\N	fifametgb@gmail.com	f	t	2023-02-06 17:17:58.952534+00	Merveille	TOGBE	BJ	\N	{"name":"","lat":0,"lng":0}
195	pbkdf2_sha256$260000$lOkFklCS1BvV61XbqIV0vK$aQOK78RqSPxkcdMWk0o5X30VTu58nC4OFyvxHI+/VxI=	2023-02-05 16:40:02+00	f	christie	christieshop@gmail.com	f	t	2023-02-05 16:40:02+00	AÏMASSE	Christiane	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
193	pbkdf2_sha256$260000$aPAjk19EmopcW68msLRwNB$nCraVH6JO/djxq+WBE2yYmY0lLbxnxtLfaGkvkX1Gh4=	2023-02-06 17:44:54.77195+00	f	\N	jjjkkuhgjll@gmail	f	t	2023-02-05 12:45:04.400296+00	DATA	Grâce 	BJ	\N	{"name":"","lat":0,"lng":0}
198	pbkdf2_sha256$260000$nEj3yRXAfZ9ZphQS5XiPBI$6mYEh0XllFMRDfdjXxv5/UGCEwtS8zXNB8oGb2+klzM=	2023-02-06 18:59:25.1978+00	f	\N	ayinkechoups5@gmail.com	f	t	2023-02-06 18:59:24.977172+00	AMOUSSA 	Zaïtounath	BJ	\N	{"name":"Plage Akpakpa","lat":6.3595998,"lng":2.4838771}
199	pbkdf2_sha256$260000$hdgwCSS8aKeyJIFg9eVO36$cgA3644ZPitcpqCWyQBgYQ6Frppv7v2Z09VrTJ9C0pc=	2023-02-06 19:05:40.381045+00	f	\N	exemple@gmail.com	f	t	2023-02-06 19:05:40.162138+00	Nom	Prénom 	BJ	\N	{"name":"Paris","lat":48.856614,"lng":2.3522219}
200	pbkdf2_sha256$260000$6ueDik0HgFemr7w6e2WPhA$USeKpawaIa3wcaA9wkY69s2t71vrn0oI4rjfhBjLbbk=	2023-02-06 19:37:06.844259+00	f	\N	hruiojhg@gmail.com	f	t	2023-02-06 19:37:06.64147+00	Toto	Prifi	BJ	\N	{"name":"Cotonou Akpakpa/Minontchou","lat":6.3905371,"lng":2.4548505}
201	pbkdf2_sha256$260000$fjJvuBAaBLo6hmklrHsfMK$R35ZGUZIK0e7atXtCAPAwF+/CQSFS3ssWcojVXAqTTc=	2023-02-06 19:50:40.847862+00	f	\N	raoulkahoui3@gmail.com	f	t	2023-02-06 19:50:40.660933+00	Kahoui 	Raoul 	BJ	\N	{"name":"Calavi Aïtchedji","lat":6.4502826,"lng":2.3468111}
202	pbkdf2_sha256$260000$WvQ1kz8816C2eaoEZSPSVD$FFUN6mJF/KbJ0/nX/YhtprIBy9s0tZ9oWP/jkzmlmcE=	2023-02-06 20:45:46.873914+00	f	\N	yossitchedji@yahoo.com	f	t	2023-02-06 20:45:46.69811+00	YOSSI 	Voltaire 	BJ	\N	{"name":"Marché Midombo","lat":6.377594999999999,"lng":2.4437915}
203	pbkdf2_sha256$260000$xJJv5HBg9PbAeYulfsROFu$MMxSZsNrUHyXMfzIL3wt8Fhq9X/g3eksRXl/VH/irDc=	2023-02-07 06:36:24.739117+00	f	\N	georisface@gmail.com	f	t	2023-02-07 06:36:24.55429+00	Tobi	GEO	BJ	\N	{"name":"Institut de Mathématiques et de Sciences Physiques (IMSP)","lat":6.584084,"lng":2.5534002}
205	pbkdf2_sha256$260000$8Jhur6tZ3vstiij5IyxNKJ$7bP+TeNNXi4tgaAUudywWgCI1Y62iK6/xcmx6ck1tpA=	2023-02-07 08:46:52.906918+00	f	\N	axelachidi@gmail.com	f	t	2023-02-07 08:46:52.718967+00	ACHIDI	Yann	BJ	\N	{"name":"Fidjrossè","lat":6.357872599999999,"lng":2.3721562}
206	pbkdf2_sha256$260000$f42T1JwFsC06pJelkE3bqa$bOd70mA0iyWx+SnwLaATo/c3r5eIkXn33rFXXCY77GM=	2023-02-07 15:18:02.831444+00	f	\N	christieshop@email.com	f	t	2023-02-07 10:10:57.565885+00	AÏMASSE 	Christiane 	BJ	\N	{"name":"Abomey Calavi","lat":6.4503024,"lng":2.3468195}
192	pbkdf2_sha256$260000$Vlj6dsUSRYKcS9yXHx9zbT$i+9K/WAvaaVuBynnezxqxlmeoWVT03pXN9U4G3FwDXE=	2023-02-08 05:05:31.418003+00	f	\N	geoface@gmail.com	f	t	2023-02-04 18:35:45.324266+00	patricck	test2	BJ	\N	{"name":"Institut de Mathématiques et de Sciences Physiques (IMSP)","lat":6.584084,"lng":2.5534002}
191	pbkdf2_sha256$260000$byD65JrAyziTO8uGbkwMqi$tGU9BcXXR8/k6NO+DP+dOgxhL4fzLLlzTMEIWbta+Ck=	2023-02-10 19:54:22.558022+00	f	\N	emmanuellajoachim224@gmail.com	f	t	2023-02-03 08:13:45.131938+00	JOACHIM 	Emmanuella 	BJ	\N	{"name":"","lat":0,"lng":0}
\.


--
-- Data for Name: app_user_groups; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: app_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: app_usergame; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_usergame (id, value1, value2, day, user_id) FROM stdin;
\.


--
-- Data for Name: app_weekcustom; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_weekcustom (id, begun, "end", is_on, seller_id, next, prev, max, max_urg) FROM stdin;
98	2022-12-18	2022-12-25	f	30	404	40	60	30
22	2022-12-05	2022-12-12	f	12	93	0	60	30
18	2022-12-05	2022-12-12	f	8	66	0	60	30
47	2022-12-08	2022-12-15	f	37	86	0	60	30
16	2022-12-05	2022-12-12	f	6	63	0	60	30
77	2022-12-18	2022-12-25	f	14	365	24	60	30
83	2022-12-18	2022-12-25	f	17	381	27	60	30
58	2022-12-12	2022-12-19	f	48	366	0	60	30
95	2022-12-18	2022-12-25	f	42	398	52	60	30
79	2022-12-18	2022-12-25	f	7	378	17	60	30
39	2022-12-07	2022-12-14	f	29	89	0	60	30
49	2022-12-08	2022-12-15	f	39	91	0	60	30
68	2022-12-18	2022-12-25	f	24	367	34	60	30
28	2022-12-06	2022-12-13	f	18	84	0	60	30
102	2022-12-22	2022-12-29	f	52	392	0	60	30
56	2022-12-11	2022-12-18	f	46	394	0	60	30
60	2022-12-18	2022-12-25	f	20	361	30	60	30
90	2022-12-18	2022-12-25	f	31	368	41	60	30
34	2022-12-07	2022-12-14	f	24	68	0	60	30
57	2022-12-11	2022-12-18	f	47	395	0	60	30
71	2022-12-18	2022-12-25	f	41	370	51	60	30
50	2022-12-08	2022-12-15	f	40	94	0	60	30
87	2022-12-18	2022-12-25	f	45	399	55	60	30
80	2022-12-18	2022-12-25	f	44	375	54	60	30
64	2022-12-18	2022-12-25	f	33	401	43	60	30
101	2022-12-21	2022-12-28	f	51	372	0	60	30
25	2022-12-06	2022-12-13	f	15	78	0	60	30
62	2022-12-18	2022-12-25	f	22	363	32	60	30
81	2022-12-18	2022-12-25	f	16	400	26	60	30
44	2022-12-08	2022-12-15	f	34	67	0	60	30
33	2022-12-07	2022-12-14	f	23	97	0	60	30
74	2022-12-18	2022-12-25	f	13	374	23	60	30
100	2022-12-21	2022-12-28	f	50	386	0	60	30
82	2022-12-18	2022-12-25	f	36	408	46	60	30
36	2022-12-07	2022-12-14	f	26	75	0	60	30
99	2022-12-18	2022-12-25	f	28	405	38	60	30
30	2022-12-06	2022-12-13	f	20	60	0	60	30
38	2022-12-07	2022-12-14	f	28	99	0	60	30
29	2022-12-06	2022-12-13	f	19	76	0	60	30
53	2022-12-10	2022-12-17	f	43	61	0	60	30
69	2022-12-18	2022-12-25	f	9	406	19	60	30
19	2022-12-05	2022-12-12	f	9	69	0	60	30
72	2022-12-18	2022-12-25	f	11	371	21	60	30
46	2022-12-08	2022-12-15	f	36	82	0	60	30
70	2022-12-18	2022-12-25	f	10	369	20	60	30
409	2023-01-07	2023-01-14	t	56	0	0	60	30
23	2022-12-06	2022-12-13	f	13	74	0	60	30
88	2022-12-18	2022-12-25	f	38	387	48	60	30
92	2022-12-18	2022-12-25	f	32	391	42	60	30
84	2022-12-18	2022-12-25	f	18	382	28	60	30
76	2022-12-18	2022-12-25	f	19	376	29	60	30
61	2022-12-18	2022-12-25	f	43	379	53	60	30
73	2022-12-18	2022-12-25	f	35	373	45	60	30
78	2022-12-18	2022-12-25	f	15	377	25	60	30
65	2022-12-18	2022-12-25	f	25	397	35	60	30
35	2022-12-07	2022-12-14	f	25	65	0	60	30
54	2022-12-10	2022-12-17	f	44	80	0	60	30
52	2022-12-10	2022-12-17	f	42	95	0	60	30
75	2022-12-18	2022-12-25	f	26	380	36	60	30
37	2022-12-07	2022-12-14	f	27	85	0	60	30
17	2022-12-05	2022-12-12	f	7	79	0	60	30
96	2022-12-18	2022-12-25	f	5	402	15	60	30
27	2022-12-06	2022-12-13	f	17	83	0	60	30
67	2022-12-18	2022-12-25	f	34	385	44	60	30
20	2022-12-05	2022-12-12	f	10	70	0	60	30
89	2022-12-18	2022-12-25	f	29	388	39	60	30
85	2022-12-18	2022-12-25	f	27	383	37	60	30
55	2022-12-10	2022-12-17	f	45	87	0	60	30
48	2022-12-08	2022-12-15	f	38	88	0	60	30
26	2022-12-06	2022-12-13	f	16	81	0	60	30
42	2022-12-07	2022-12-14	f	32	92	0	60	30
43	2022-12-08	2022-12-15	f	33	64	0	60	30
91	2022-12-18	2022-12-25	f	39	390	49	60	30
59	2022-12-14	2022-12-21	f	49	396	0	60	30
15	2022-12-04	2022-12-11	f	5	96	0	60	30
51	2022-12-08	2022-12-15	f	41	71	0	60	30
97	2022-12-18	2022-12-25	f	23	403	33	60	30
40	2022-12-07	2022-12-14	f	30	98	0	60	30
66	2022-12-18	2022-12-25	f	8	362	18	60	30
86	2022-12-18	2022-12-25	f	37	384	47	60	30
103	2022-12-30	2023-01-06	t	53	0	0	60	30
93	2022-12-18	2022-12-25	f	12	407	22	60	30
63	2022-12-18	2022-12-25	f	6	364	16	60	30
32	2022-12-07	2022-12-14	f	22	62	0	60	30
24	2022-12-06	2022-12-13	f	14	77	0	60	30
41	2022-12-07	2022-12-14	f	31	90	0	60	30
21	2022-12-05	2022-12-12	f	11	72	0	60	30
45	2022-12-08	2022-12-15	f	35	73	0	60	30
94	2022-12-18	2022-12-25	f	40	393	50	60	30
104	2022-12-31	2023-01-07	t	54	0	0	60	30
415	2023-01-19	2023-01-26	t	62	0	0	60	30
416	2023-01-20	2023-01-27	t	63	0	0	60	30
418	2023-01-24	2023-01-31	t	65	0	0	60	30
422	2023-01-25	2023-02-01	t	69	0	0	60	30
426	2023-01-25	2023-02-01	t	73	0	0	60	30
434	2023-01-26	2023-02-02	t	81	0	0	60	30
435	2023-01-26	2023-02-02	t	82	0	0	60	30
430	2023-01-25	2023-02-01	t	77	0	0	60	30
439	2023-01-26	2023-02-02	t	86	0	0	60	30
443	2023-02-04	2023-02-11	t	90	0	0	60	30
410	2023-01-14	2023-01-21	t	57	0	0	60	30
414	2023-01-18	2023-01-25	t	61	0	0	60	30
417	2023-01-20	2023-01-27	t	64	0	0	60	30
419	2023-01-24	2023-01-31	t	66	0	0	60	30
423	2023-01-25	2023-02-01	t	70	0	0	60	30
427	2023-01-25	2023-02-01	t	74	0	0	60	30
431	2023-01-25	2023-02-01	t	78	0	0	60	30
436	2023-01-26	2023-02-02	t	83	0	0	60	30
440	2023-01-28	2023-02-04	t	87	0	0	60	30
411	2023-01-16	2023-01-23	t	58	0	0	60	30
420	2023-01-24	2023-01-31	t	67	0	0	60	30
424	2023-01-25	2023-02-01	t	71	0	0	60	30
428	2023-01-25	2023-02-01	t	75	0	0	60	30
432	2023-01-26	2023-02-02	t	79	0	0	60	30
437	2023-01-26	2023-02-02	t	84	0	0	60	30
441	2023-01-31	2023-02-07	t	88	0	0	60	30
388	2023-01-03	2023-01-10	t	29	0	89	60	30
366	2023-01-03	2023-01-10	t	48	0	58	60	30
412	2023-01-18	2023-01-25	t	59	0	0	60	30
367	2023-01-03	2023-01-10	t	24	0	68	60	30
421	2023-01-24	2023-01-31	t	68	0	0	60	30
389	2023-01-03	2023-01-10	t	55	0	0	60	30
368	2023-01-03	2023-01-10	t	31	0	90	60	30
425	2023-01-25	2023-02-01	t	72	0	0	60	30
405	2023-01-03	2023-01-10	t	28	0	99	60	30
369	2023-01-03	2023-01-10	t	10	0	70	60	30
429	2023-01-25	2023-02-01	t	76	0	0	60	30
390	2023-01-03	2023-01-10	t	39	0	91	60	30
370	2023-01-03	2023-01-10	t	41	0	71	60	30
371	2023-01-03	2023-01-10	t	11	0	72	60	30
433	2023-01-26	2023-02-02	t	80	0	0	60	30
438	2023-01-26	2023-02-02	t	85	0	0	60	30
391	2023-01-03	2023-01-10	t	32	0	92	60	30
372	2023-01-03	2023-01-10	t	51	0	101	60	30
442	2023-02-03	2023-02-10	t	89	0	0	60	30
406	2023-01-03	2023-01-10	t	9	0	69	60	30
373	2023-01-03	2023-01-10	t	35	0	73	60	30
392	2023-01-03	2023-01-10	t	52	0	102	60	30
374	2023-01-03	2023-01-10	t	13	0	74	60	30
375	2023-01-03	2023-01-10	t	44	0	80	60	30
393	2023-01-03	2023-01-10	t	40	0	94	60	30
376	2023-01-03	2023-01-10	t	19	0	76	60	30
407	2023-01-03	2023-01-10	t	12	0	93	60	30
377	2023-01-03	2023-01-10	t	15	0	78	60	30
394	2023-01-03	2023-01-10	t	46	0	56	60	30
378	2023-01-03	2023-01-10	t	7	0	79	60	30
379	2023-01-03	2023-01-10	t	43	0	61	60	30
395	2023-01-03	2023-01-10	t	47	0	57	60	30
380	2023-01-03	2023-01-10	t	26	0	75	60	30
408	2023-01-03	2023-01-10	t	36	0	82	60	30
381	2023-01-03	2023-01-10	t	17	0	83	60	30
396	2023-01-03	2023-01-10	t	49	0	59	60	30
361	2023-01-03	2023-01-10	t	20	0	60	60	30
382	2023-01-03	2023-01-10	t	18	0	84	60	30
383	2023-01-03	2023-01-10	t	27	0	85	60	30
362	2023-01-03	2023-01-10	t	8	0	66	60	30
397	2023-01-03	2023-01-10	t	25	0	65	60	30
363	2023-01-03	2023-01-10	t	22	0	62	60	30
384	2023-01-03	2023-01-10	t	37	0	86	60	30
364	2023-01-03	2023-01-10	t	6	0	63	60	30
365	2023-01-03	2023-01-10	t	14	0	77	60	30
385	2023-01-03	2023-01-10	t	34	0	67	60	30
398	2023-01-03	2023-01-10	t	42	0	95	60	30
386	2023-01-03	2023-01-10	t	50	0	100	60	30
387	2023-01-03	2023-01-10	t	38	0	88	60	30
399	2023-01-03	2023-01-10	t	45	0	87	60	30
400	2023-01-03	2023-01-10	t	16	0	81	60	30
401	2023-01-03	2023-01-10	t	33	0	64	60	30
402	2023-01-03	2023-01-10	t	5	0	96	60	30
403	2023-01-03	2023-01-10	t	23	0	97	60	30
404	2023-01-03	2023-01-10	t	30	0	98	60	30
\.


--
-- Data for Name: app_weekcustom_demandes; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_weekcustom_demandes (id, weekcustom_id, clientdemand_id) FROM stdin;
166	395	69
167	401	52
168	398	52
169	401	53
170	398	53
171	403	79
172	398	80
173	404	78
174	404	59
175	377	59
176	382	65
177	372	73
178	368	72
179	395	81
180	377	82
181	406	84
182	386	101
183	388	101
184	406	101
185	406	89
186	405	89
187	406	96
188	401	96
189	408	96
190	366	92
191	398	92
31	77	51
32	95	52
33	64	52
34	95	53
35	64	53
36	98	63
37	98	59
38	78	59
39	98	60
40	98	61
41	98	62
42	84	65
43	90	65
44	91	65
45	101	65
46	81	65
47	69	70
48	57	69
49	69	69
50	93	69
51	95	69
52	90	72
53	101	72
54	77	72
55	93	72
56	61	72
57	101	73
58	77	73
59	90	73
60	93	73
61	67	73
192	399	98
193	401	98
194	372	51
195	365	51
196	399	85
67	98	78
68	97	79
69	95	80
70	93	80
71	57	81
72	69	81
73	93	81
74	78	82
75	63	82
76	82	82
77	96	82
78	103	83
79	69	84
80	64	84
81	82	84
197	366	85
198	406	94
199	407	94
200	399	94
201	406	95
202	395	95
203	398	95
204	399	102
205	398	102
206	366	103
207	398	103
208	366	104
209	366	105
210	391	105
211	398	105
212	398	106
216	404	109
217	377	109
218	404	110
219	377	110
220	406	111
221	395	111
222	398	111
223	370	118
224	372	118
225	401	118
226	382	112
227	372	112
228	401	112
229	368	113
230	370	113
231	382	113
232	368	114
233	384	114
234	370	114
235	372	115
236	401	115
237	372	116
238	401	116
239	372	117
240	394	117
241	368	119
242	372	119
243	104	119
246	411	115
247	415	116
248	406	123
249	419	130
250	438	131
251	430	131
252	433	131
253	433	123
254	438	123
255	430	123
256	419	132
257	423	134
258	415	134
259	401	134
260	379	135
261	401	135
262	372	135
263	372	136
264	394	136
265	423	136
266	364	137
267	406	137
268	399	141
269	398	141
155	404	63
156	404	60
157	404	61
158	404	62
159	406	70
160	404	87
161	404	88
162	406	90
163	406	91
164	389	99
165	366	93
270	425	141
271	438	142
272	430	142
273	398	142
274	425	144
275	425	145
276	410	146
277	405	146
278	429	146
279	424	147
280	388	147
281	377	147
282	389	149
283	438	149
284	389	150
285	395	151
286	406	151
287	407	151
288	395	152
289	430	153
290	399	156
291	425	156
292	438	157
293	435	157
294	440	157
295	438	158
296	435	158
297	418	160
298	434	160
299	426	160
300	407	161
301	418	162
302	391	162
303	410	162
304	428	163
305	435	164
306	401	165
307	430	166
308	438	166
309	406	167
310	372	169
311	368	169
312	104	169
313	399	170
314	395	171
315	401	172
316	443	172
317	425	175
318	395	176
319	430	177
320	441	179
321	439	179
322	408	179
323	418	182
324	391	182
325	410	182
326	428	183
327	410	184
328	418	184
329	428	184
330	428	185
\.


--
-- Data for Name: app_zawadidetail; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.app_zawadidetail (id, key, value) FROM stdin;
24	georiseno@gmail.com - sold	["Samsung", "Maillot de bain", "Sous-vetements", "Vestes", "Costumes", "Montre", "Montre", "Jeans", "Iphone", "Lunnettes"]
26	testors	["61001775", "62784327", "22997551470", "\\u202a+229\\u00a058\\u00a054\\u00a002\\u00a077\\u202c ", "66107320", "67296100", "95662741 ", "51879311", "54006290", "69144188", "57370409 ", "68935572", "+22996508330", "59189196", "96286526", "52109010", "229 51820913", "97312935", "94715819", "97587350", "+229 64127373", "52844671", "61276440", "94758141", "62434611", "59102521", "54578919", "54176422", "54176422", "+226 66721066", "96332642 ", "52399654", "+229 96 17 34 92", "68299706 ", "22996173492", "+22967205433", "67583962", "96941929", "62531898", "64289873", "+22963426111", "22968090139", "+229 68 31 23 97", "66066996", "97283759", "63705734", "66390847", "97578475", "61325758", "94801023"]
2	buisness:speed	3
3	pro:speed	2
4	basique:speed	1
5	zawadi	5000 XOF
6	buisness:max_urg	35
7	buisness:max	60
8	pro:max_urg	10
9	pro:max_urg	10
10	pro:max	30
11	basique:max_urg	4
12	basique:max	14
13	kkiapay_secret	sk_555cbdb34d14ad710cb6b25a5d63bdbe75fb0cf41e5f175ef1db4c838c4d629e
14	kkiapay_private	pk_4b417943036b8ece0e94f173f4f7c04f4c78978575053556c03e36104bf29e25
15	kkiapay_public	a6ae833131d559bdca6ca3fe135387fbc9a09092
16	kkiapay_public_sand	b5f444b02fc511eca8f5b92f2997955b
17	default:shop:picture:url	/static/shop.png
25	georiseno@gmail.com - delete	["Bottes", "T-shirt, Polos", "Bottes"]
21	free:speed	3
22	free:max	60
23	free:max_urg	30
19	site:link	https://vendeur.zawadi.site
39	WHATSAPP_ACCESS_TOKEN	EAAMi4LUWjZCEBAOZAbuO6GKdXtdTB79uugNfWZBGaQCy2FG5r90t05ZC65SVZBi5BrMfANryw8GXCv0G98XLbeYm4HnvkoIouezwfhWon2kiexiE7LXZAIKLvf8n4H2zRqYzRke5eu0pbxkIC3WAJ1ZCZAUJmRpqEz9DJUMXmUDJMM1NPZCMcB8Jm
40	WHATSAPP_PHONE_NUMBER_ID	112786665043296
32	hchriso171@gmail.com - delete	["Pantalons"]
18	contact:home	https://wa.me/+22955796831
37	WHATSAPP_PERMANENT_TOKEN	EAAMi4LUWjZCEBAOZAbuO6GKdXtdTB79uugNfWZBGaQCy2FG5r90t05ZC65SVZBi5BrMfANryw8GXCv0G98XLbeYm4HnvkoIouezwfhWon2kiexiE7LXZAIKLvf8n4H2zRqYzRke5eu0pbxkIC3WAJ1ZCZAUJmRpqEz9DJUMXmUDJMM1NPZCMcB8Jm
27	zawadipub	184
28	geo	3
30	blog_visits	309
29	zawadi_visits	17402
34	whatsapp_link	https://chat.whatsapp.com/CRpxJb8A0cY8l7DFiQmN7q
36	MESSENGER_VERIFY_TOKEN	zawadi_geox_tok
33	blog_ready	yes
42	BONUS+	90-Vêtements::
31	alavojeremie2018@gmail.com - delete	["Complet styl\\u00e9(haut et bas)"]
41	chang_parrain	zwd_kdkdbfkdjdj33j
35	hhodilc@gmail.com - delete	["PC(Ordinateur personnel)"]
20	facebook	198
1	website	1935
38	whatsapp_logs	$$$$53-121:<!0<Response [200]>0!>$$53-122:<!0<Response [200]>0!>$$welcome-65:<!0<Response [200]>0!>$$welcome-67:<!0<Response [200]>0!>$$welcome-68:<!0<Response [200]>0!>$$welcome-66:<!0<Response [200]>0!>$$58-115:<!0<Response [200]>0!>$$62-116:<!0<Response [200]>0!>$$welcome-69:<!0<Response [200]>0!>$$welcome-70:<!0<Response [200]>0!>$$welcome-71:<!0<Response [200]>0!>$$welcome-73:<!0<Response [200]>0!>$$9-123:<!0<Response [200]>0!>$$welcome-74:<!0<Response [200]>0!>$$welcome-75:<!0<Response [200]>0!>$$welcome-76:<!0<Response [200]>0!>$$welcome-78:<!0<Response [200]>0!>$$welcome-79:<!0<Response [200]>0!>$$welcome-80:<!0<Response [200]>0!>$$welcome-81:<!0<Response [200]>0!>$$welcome-84:<!0<Response [200]>0!>$$welcome-85:<!0<Response [200]>0!>$$welcome-86:<!0<Response [200]>0!>$$welcome-16:<!0<Response [200]>0!>$$66-130:<!0<Response [200]>0!>$$85-131:<!0<Response [200]>0!>$$80-131:<!0<Response [200]>0!>$$welcome-80:<!0<Response [200]>0!>$$welcome-80:<!0<Response [200]>0!>$$welcome-77:<!0<Response [200]>0!>$$welcome-77:<!0<Response [200]>0!>$$welcome-77:<!0<Response [200]>0!>$$welcome-77:<!0<Response [200]>0!>$$welcome-87:<!0<Response [200]>0!>$$66-132:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22961555705","wa_id":"22961555705"}],"messages":[{"id":"wamid.HBgLMjI5NjE1NTU3MDUVAgARGBI3QzNFQ0EzNzZCRTU4OTZBMTQA"}]}'0!>$$70-134:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22998522500","wa_id":"22998522500"}],"messages":[{"id":"wamid.HBgLMjI5OTg1MjI1MDAVAgARGBJGNzkzQjQ1QjQ2NkZFNkYzRUYA"}]}'0!>$$62-134:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22961361629","wa_id":"22961361629"}],"messages":[{"id":"wamid.HBgLMjI5NjEzNjE2MjkVAgARGBIzNzgzNDY3NTYwRDIxQkM3OEIA"}]}'0!>$$33-134:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22997283759","wa_id":"22997283759"}],"messages":[{"id":"wamid.HBgLMjI5OTcyODM3NTkVAgARGBI0MUNGOTA5MTREMEQ1MEQxOTEA"}]}'0!>$$43-135:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22995204052","wa_id":"22995204052"}],"messages":[{"id":"wamid.HBgLMjI5OTUyMDQwNTIVAgARGBJDMzEwRTQ2Q0VFMkYwMUNGNUUA"}]}'0!>$$33-135:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22997283759","wa_id":"22997283759"}],"messages":[{"id":"wamid.HBgLMjI5OTcyODM3NTkVAgARGBJBQUI3OUE3QTMzNTk5RkIzNEEA"}]}'0!>$$51-135:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22952109010","wa_id":"22952109010"}],"messages":[{"id":"wamid.HBgLMjI5NTIxMDkwMTAVAgARGBJBNEEwRTBCOEI3QkRCQzI2QzkA"}]}'0!>$$51-136:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22952109010","wa_id":"22952109010"}],"messages":[{"id":"wamid.HBgLMjI5NTIxMDkwMTAVAgARGBI1NDYwMTNFQjc0MjVFQzFFRUEA"}]}'0!>$$70-136:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22998522500","wa_id":"22998522500"}],"messages":[{"id":"wamid.HBgLMjI5OTg1MjI1MDAVAgARGBJCNzhENTY2N0JGMTQ1ODA0NEQA"}]}'0!>$$9-137:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22957370409","wa_id":"22957370409"}],"messages":[{"id":"wamid.HBgLMjI5NTczNzA0MDkVAgARGBJEMURGMDgzMzIyMDE2OTE5RUMA"}]}'0!>$$45-141:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22999081739","wa_id":"22999081739"}],"messages":[{"id":"wamid.HBgLMjI5OTkwODE3MzkVAgARGBJERTMyMDNDNDY5Rjc0ODdGM0YA"}]}'0!>$$42-141:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22957290905","wa_id":"22957290905"}],"messages":[{"id":"wamid.HBgLMjI5NTcyOTA5MDUVAgARGBJGOUYwQzFCMUYwMDZGODQ1RTYA"}]}'0!>$$85-142:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969694744","wa_id":"22969694744"}],"messages":[{"id":"wamid.HBgLMjI5Njk2OTQ3NDQVAgARGBJEOTg3REMzNjM0N0I4MTIwMkEA"}]}'0!>$$77-142:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBJGQUYxRkQzNzlDMTY2RTE3QjUA"}]}'0!>$$42-142:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22957290905","wa_id":"22957290905"}],"messages":[{"id":"wamid.HBgLMjI5NTcyOTA5MDUVAgARGBJEMkREMkU1QzYxODZFNDY0MUUA"}]}'0!>$$welcome-88:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBI1NkZBMUE2MDJCNjY5NTQwOEMA"}]}'0!>$$welcome-46:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22997310401","wa_id":"22997310401"}],"messages":[{"id":"wamid.HBgLMjI5OTczMTA0MDEVAgARGBJCQTZBRDM4RkQzMTQxNDk0N0MA"}]}'0!>$$72-145:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22954072191","wa_id":"22954072191"}],"messages":[{"id":"wamid.HBgLMjI5NTQwNzIxOTEVAgARGBI4RDE5MzNDMzhGQTdBQjIxMzAA"}]}'0!>$$28-146:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22963705734","wa_id":"22963705734"}],"messages":[{"id":"wamid.HBgLMjI5NjM3MDU3MzQVAgARGBJCQTI4NjBEREUwQ0FGQzhGOTgA"}]}'0!>$$76-146:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966636940","wa_id":"22966636940"}],"messages":[{"id":"wamid.HBgLMjI5NjY2MzY5NDAVAgARGBI3MEM1QjlFOUVDOEU1N0U2RUQA"}]}'0!>$$71-147:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22965576570","wa_id":"22965576570"}],"messages":[{"id":"wamid.HBgLMjI5NjU1NzY1NzAVAgARGBJGOTNFMTg2OEU2NUE1RDQwOTEA"}]}'0!>$$29-147:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22951820913","wa_id":"22951820913"}],"messages":[{"id":"wamid.HBgLMjI5NTE4MjA5MTMVAgARGBJGOThDQ0Q3NzRFQjk3NTlFQUUA"}]}'0!>$$15-147:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22959189196","wa_id":"22959189196"}],"messages":[{"id":"wamid.HBgLMjI5NTkxODkxOTYVAgARGBJCMTY3NDExQ0Y4REI3QTk3MTUA"}]}'0!>$$55-149:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994917020","wa_id":"22994917020"}],"messages":[{"id":"wamid.HBgLMjI5OTQ5MTcwMjAVAgARGBI4QTEwMjFEOEVERUFDODc3REQA"}]}'0!>$$85-149:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969694744","wa_id":"22969694744"}],"messages":[{"id":"wamid.HBgLMjI5Njk2OTQ3NDQVAgARGBJFRkEzNkREQzNFQTRBQzYyNjUA"}]}'0!>$$55-150:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994917020","wa_id":"22994917020"}],"messages":[{"id":"wamid.HBgLMjI5OTQ5MTcwMjAVAgARGBI4M0ZCNkY1MjBGNkVGNjFDMDYA"}]}'0!>$$47-151:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22967296100","wa_id":"22967296100"}],"messages":[{"id":"wamid.HBgLMjI5NjcyOTYxMDAVAgARGBJENkUxRDUyRDlGNDJGODRDM0MA"}]}'0!>$$9-151:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22957370409","wa_id":"22957370409"}],"messages":[{"id":"wamid.HBgLMjI5NTczNzA0MDkVAgARGBIwMEQyODc5MEVCMkQyNEVGQjgA"}]}'0!>$$12-151:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22951879311","wa_id":"22951879311"}],"messages":[{"id":"wamid.HBgLMjI5NTE4NzkzMTEVAgARGBIxQTcxQzgxMjcyREQ4QTVCOTEA"}]}'0!>$$47-152:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22967296100","wa_id":"22967296100"}],"messages":[{"id":"wamid.HBgLMjI5NjcyOTYxMDAVAgARGBI3NjI0NTE0RjBCNDgxRDA0Q0QA"}]}'0!>$$77-153:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBIzRjk3RDc5NDQ2RDkwOTQ4MjYA"}]}'0!>$$45-156:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22999081739","wa_id":"22999081739"}],"messages":[{"id":"wamid.HBgLMjI5OTkwODE3MzkVAgARGBJEMUQzQzJFODcxQ0FBQkQzNTYA"}]}'0!>$$72-156:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22954072191","wa_id":"22954072191"}],"messages":[{"id":"wamid.HBgLMjI5NTQwNzIxOTEVAgARGBJFRUY2RDUwOEY5QTk0RDExM0YA"}]}'0!>$$85-157:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969694744","wa_id":"22969694744"}],"messages":[{"id":"wamid.HBgLMjI5Njk2OTQ3NDQVAgARGBJEQzNBRkU5RUExMjg0MERDMUQA"}]}'0!>$$87-157:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969993184","wa_id":"22969993184"}],"messages":[{"id":"wamid.HBgLMjI5Njk5OTMxODQVAgARGBIyODI1NTE2OTM3M0NCRERDRjUA"}]}'0!>$$85-158:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969694744","wa_id":"22969694744"}],"messages":[{"id":"wamid.HBgLMjI5Njk2OTQ3NDQVAgARGBJEMEMzNjYzNDAwOERDQUQ2NzkA"}]}'0!>$$65-160:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22968453781","wa_id":"22968453781"}],"messages":[{"id":"wamid.HBgLMjI5Njg0NTM3ODEVAgARGBJBQjU4MTI1Qzc3ODU3NkNEM0MA"}]}'0!>$$81-160:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994465142","wa_id":"22994465142"}],"messages":[{"id":"wamid.HBgLMjI5OTQ0NjUxNDIVAgARGBI0NkZFNTQ2MDExQUIyNUUwQTcA"}]}'0!>$$73-160:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22964971835","wa_id":"22964971835"}],"messages":[{"id":"wamid.HBgLMjI5NjQ5NzE4MzUVAgARGBIyN0Y2RTk4RTZEMzFBMDYwMEMA"}]}'0!>$$12-161:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22951879311","wa_id":"22951879311"}],"messages":[{"id":"wamid.HBgLMjI5NTE4NzkzMTEVAgARGBIyNEEwMjIwQkQzMjU4NDhFMTMA"}]}'0!>$$65-162:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22968453781","wa_id":"22968453781"}],"messages":[{"id":"wamid.HBgLMjI5Njg0NTM3ODEVAgARGBJFOEUzMUIyNkNGNEUwMkY1NTgA"}]}'0!>$$32-162:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994801023","wa_id":"22994801023"}],"messages":[{"id":"wamid.HBgLMjI5OTQ4MDEwMjMVAgARGBJGMjg3OUM1NTQ5RTVCQkRGNDEA"}]}'0!>$$75-163:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22995354470","wa_id":"22995354470"}],"messages":[{"id":"wamid.HBgLMjI5OTUzNTQ0NzAVAgARGBI0QjBCRjcxQzMxMkRGNDZENzYA"}]}'0!>$$33-165:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22997283759","wa_id":"22997283759"}],"messages":[{"id":"wamid.HBgLMjI5OTcyODM3NTkVAgARGBJCNTVFRDhENjcwOUQ0N0FBODkA"}]}'0!>$$77-166:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBJBRjg1N0E0MDhBQTc5MTY0N0EA"}]}'0!>$$85-166:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22969694744","wa_id":"22969694744"}],"messages":[{"id":"wamid.HBgLMjI5Njk2OTQ3NDQVAgARGBJDNTMzMkZCMTEyRTczNUE2QjYA"}]}'0!>$$9-167:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22957370409","wa_id":"22957370409"}],"messages":[{"id":"wamid.HBgLMjI5NTczNzA0MDkVAgARGBIxMjJBODEzQUQ2RjJFNEZEQzIA"}]}'0!>$$51-169:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22952109010","wa_id":"22952109010"}],"messages":[{"id":"wamid.HBgLMjI5NTIxMDkwMTAVAgARGBJDRDY3QkE5QTYyQTZBNTE3NDMA"}]}'0!>$$31-169:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22961325758","wa_id":"22961325758"}],"messages":[{"id":"wamid.HBgLMjI5NjEzMjU3NTgVAgARGBI1N0UxMEY5NUMyRDdGM0E3RjEA"}]}'0!>$$54-169:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22960340248","wa_id":"22960340248"}],"messages":[{"id":"wamid.HBgLMjI5NjAzNDAyNDgVAgARGBJCQzU2REMzOEQ5RjA3MUYyN0YA"}]}'0!>$$45-170:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22999081739","wa_id":"22999081739"}],"messages":[{"id":"wamid.HBgLMjI5OTkwODE3MzkVAgARGBIzOTc2Njc1QjA0RjBEM0M1MDEA"}]}'0!>$$47-171:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22967296100","wa_id":"22967296100"}],"messages":[{"id":"wamid.HBgLMjI5NjcyOTYxMDAVAgARGBJGRDZBNTI1QTNBNTc4NUMzRTIA"}]}'0!>$$33-172:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22997283759","wa_id":"22997283759"}],"messages":[{"id":"wamid.HBgLMjI5OTcyODM3NTkVAgARGBI2MzlGRTFDNDUxQkVGNUUyRTUA"}]}'0!>$$retrait:ADIKPONTO Valette :<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22961555705","wa_id":"22961555705"}],"messages":[{"id":"wamid.HBgLMjI5NjE1NTU3MDUVAgARGBI0REEzOTg5M0Q0N0E1NzZEOUEA"}]}'0!>$$72-175:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22954072191","wa_id":"22954072191"}],"messages":[{"id":"wamid.HBgLMjI5NTQwNzIxOTEVAgARGBI5NDZCQjUxQUQ0NjRCODA1RDIA"}]}'0!>$$47-176:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22967296100","wa_id":"22967296100"}],"messages":[{"id":"wamid.HBgLMjI5NjcyOTYxMDAVAgARGBI1RUU0OEYyMjdBQjk4MzU1QTUA"}]}'0!>$$77-177:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBI0N0M1ODIxQkZCMkUzMDk5RTEA"}]}'0!>$$88-179:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966468339","wa_id":"22966468339"}],"messages":[{"id":"wamid.HBgLMjI5NjY0NjgzMzkVAgARGBI0QjRDN0I4MEM4QTc5NzM1RjAA"}]}'0!>$$86-179:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22966397466","wa_id":"22966397466"}],"messages":[{"id":"wamid.HBgLMjI5NjYzOTc0NjYVAgARGBIxRjFGNEYxNDU0RjlBM0ZFNkQA"}]}'0!>$$36-179:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22996173492","wa_id":"22996173492"}],"messages":[{"id":"wamid.HBgLMjI5OTYxNzM0OTIVAgARGBJGNzA5NjEyQzcxQjUxRjQ3NkYA"}]}'0!>$$65-182:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22968453781","wa_id":"22968453781"}],"messages":[{"id":"wamid.HBgLMjI5Njg0NTM3ODEVAgARGBJCOTEyQTEwNjhENDlBRDJFMTAA"}]}'0!>$$32-182:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994801023","wa_id":"22994801023"}],"messages":[{"id":"wamid.HBgLMjI5OTQ4MDEwMjMVAgARGBI1NDY3MDRGNDA4Q0NCQzYzMDMA"}]}'0!>$$75-183:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22995354470","wa_id":"22995354470"}],"messages":[{"id":"wamid.HBgLMjI5OTUzNTQ0NzAVAgARGBJGRDc3RTMyMEFCNENCQ0Q3NzIA"}]}'0!>$$welcome-57:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994044921","wa_id":"22994044921"}],"messages":[{"id":"wamid.HBgLMjI5OTQwNDQ5MjEVAgARGBJFNEU0OEIwQjBDN0IxNkMyOTQA"}]}'0!>$$57-184:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22994044921","wa_id":"22994044921"}],"messages":[{"id":"wamid.HBgLMjI5OTQwNDQ5MjEVAgARGBJDMjJEMkM5MzlEQUY0RUQ0MjUA"}]}'0!>$$65-184:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22968453781","wa_id":"22968453781"}],"messages":[{"id":"wamid.HBgLMjI5Njg0NTM3ODEVAgARGBJFMkE5RDBFMDc3QzQ3MTYzRDkA"}]}'0!>$$75-184:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22995354470","wa_id":"22995354470"}],"messages":[{"id":"wamid.HBgLMjI5OTUzNTQ0NzAVAgARGBJDMzE2MEQyMEU2RjBGNTEwNjUA"}]}'0!>$$75-185:<!0b'{"messaging_product":"whatsapp","contacts":[{"input":"+22995354470","wa_id":"22995354470"}],"messages":[{"id":"wamid.HBgLMjI5OTUzNTQ0NzAVAgARGBJFQjI1MTEyMEM4MzlCMTZENTcA"}]}'0!>
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add feedback	7	add_feedback
26	Can change feedback	7	change_feedback
27	Can delete feedback	7	delete_feedback
28	Can view feedback	7	view_feedback
29	Can add zawadi detail	8	add_zawadidetail
30	Can change zawadi detail	8	change_zawadidetail
31	Can delete zawadi detail	8	delete_zawadidetail
32	Can view zawadi detail	8	view_zawadidetail
33	Can add seller account	9	add_selleraccount
34	Can change seller account	9	change_selleraccount
35	Can delete seller account	9	delete_selleraccount
36	Can view seller account	9	view_selleraccount
37	Can add category	10	add_category
38	Can change category	10	change_category
39	Can delete category	10	delete_category
40	Can view category	10	view_category
41	Can add client	11	add_client
42	Can change client	11	change_client
43	Can delete client	11	delete_client
44	Can view client	11	view_client
45	Can add client demand	12	add_clientdemand
46	Can change client demand	12	change_clientdemand
47	Can delete client demand	12	delete_clientdemand
48	Can view client demand	12	view_clientdemand
49	Can add week custom	13	add_weekcustom
50	Can change week custom	13	change_weekcustom
51	Can delete week custom	13	delete_weekcustom
52	Can view week custom	13	view_weekcustom
53	Can add sub category	14	add_subcategory
54	Can change sub category	14	change_subcategory
55	Can delete sub category	14	delete_subcategory
56	Can view sub category	14	view_subcategory
57	Can add abn feature	15	add_abnfeature
58	Can change abn feature	15	change_abnfeature
59	Can delete abn feature	15	delete_abnfeature
60	Can view abn feature	15	view_abnfeature
61	Can add user game	16	add_usergame
62	Can change user game	16	change_usergame
63	Can delete user game	16	delete_usergame
64	Can view user game	16	view_usergame
65	Can add label	17	add_label
66	Can change label	17	change_label
67	Can delete label	17	delete_label
68	Can view label	17	view_label
69	Can add admin token	18	add_admintoken
70	Can change admin token	18	change_admintoken
71	Can delete admin token	18	delete_admintoken
72	Can view admin token	18	view_admintoken
73	Can add my files	19	add_myfiles
74	Can change my files	19	change_myfiles
75	Can delete my files	19	delete_myfiles
76	Can view my files	19	view_myfiles
77	Can add FCM device	20	add_fcmdevice
78	Can change FCM device	20	change_fcmdevice
79	Can delete FCM device	20	delete_fcmdevice
80	Can view FCM device	20	view_fcmdevice
81	Can add sub subjects	21	add_subsubjects
82	Can change sub subjects	21	change_subsubjects
83	Can delete sub subjects	21	delete_subsubjects
84	Can view sub subjects	21	view_subsubjects
85	Can add comment	22	add_comment
86	Can change comment	22	change_comment
87	Can delete comment	22	delete_comment
88	Can view comment	22	view_comment
89	Can add articles	23	add_articles
90	Can change articles	23	change_articles
91	Can delete articles	23	delete_articles
92	Can view articles	23	view_articles
93	Can add subject	24	add_subject
94	Can change subject	24	change_subject
95	Can delete subject	24	delete_subject
96	Can view subject	24	view_subject
97	Can add video art	25	add_videoart
98	Can change video art	25	change_videoart
99	Can delete video art	25	delete_videoart
100	Can view video art	25	view_videoart
101	Can add site	26	add_site
102	Can change site	26	change_site
103	Can delete site	26	delete_site
104	Can view site	26	view_site
105	Can add parrain	27	add_parrain
106	Can change parrain	27	change_parrain
107	Can delete parrain	27	delete_parrain
108	Can view parrain	27	view_parrain
109	Can add retrait	28	add_retrait
110	Can change retrait	28	change_retrait
111	Can delete retrait	28	delete_retrait
112	Can view retrait	28	view_retrait
\.


--
-- Data for Name: blog_articles; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_articles (id, title, subtitle, vues, rvues, html, created_at, slug, dem, dem_pk, main_img_id, video_id, whatsapp_title) FROM stdin;
1	2 min pour comprendre définitivement les avantages de l'achat avec Zawadi	2 min de lecture	58	157	<div class="text-lg space-y-10 text-gray-800">\r\n            <div class="">\r\n                Depuis son lancement, <a href="/" class="underline text-blue-500 font-medium" >Zawadi</a> a amélioré la manière dont plusieurs personnes font des achats. Etant un\r\n                nouveau système, beaucoup se posent encore des questions sur les avantages que pourrait leur offrir\r\n                Zawadi. Dans cet article nous allons vous présenter les avantages que présente l'utilisation de Zawadi\r\n                afin de vous montrer ce que vous ratez à ne pas l'utiliser.\r\n            </div>\r\n            <div >\r\n                <img src="/static/blog/img/first1.gif" class="w-full" />\r\n            </div>\r\n            <div class="space-y-2">\r\n                <div class="text-xl font-bold">\r\n                    Qu'est-ce que Zawadi ?\r\n                </div>\r\n                <div class="">\r\n                    Si vous ne savez pas encore ce qu'est <a href="/" class="underline text-blue-500 font-medium" >Zawadi</a>, il s'agit d'un assistant virtuel qui vous permet\r\n                    d'acheter facilement, sans tracas et sans effort tout comme un roi. Vous devez juste lui dire ce que\r\n                    vous désirez et il enverra vers vous les meilleurs vendeurs par whatsapp( appel ou email si vous\r\n                    n'en avez pas ) pour vous présenter leurs produits exactement comme un serviteur qui envoie les\r\n                    vendeurs vers son roi pour ses besoins.\r\n                </div>\r\n            </div>\r\n            <div >\r\n                <img src="/static/blog/img/second1.gif" class="w-full" />\r\n            </div>\r\n            <div class="space-y-2">\r\n                <div class="text-xl font-bold">\r\n                    Une exemple concret...\r\n                </div>\r\n                <div class="">\r\n                    Maintenant pour comprendre les avantages de <a href="/" class="underline text-blue-500 font-medium" >Zawadi</a>, nous allons prendre un exemple concret.\r\n                    Supposons deux étudiants Béninois Jacque et Serge qui décident d'acheter un nouveau téléphone dans la même\r\n                    journée un lundi matin, mais ils ont peu de temps libre. Jacque pense à prendre une matinée libre\r\n                    pour rechercher le téléphone à acheter tandis que Serge va sur la plateforme Zawadi et prends 30\r\n                    secondes pour envoyer une demande de téléphone.\r\n                </div>\r\n                <div>\r\n                    Dans la soirée trois vendeurs envoyés par Zawadi ont contacté Serge, ils ont discuté avec lui et lui\r\n                    ont présenté de beaux téléphones en fonction de ses goûts. Serge a pris son temps et a parcouru tous\r\n                    les produits que lui proposaient les vendeurs. Le mercredi Soir il fait son choix et s'entend avec\r\n                    le vendeur sur un prix. Le lendemain soir ça lui prend juste 30 min pour aller recuperer le téléphone et\r\n                    payer car Zawadi selectionne les vendeurs aussi en fonction des plus proches.\r\n                </div>\r\n\r\n                <div class="py-2" >\r\n                    <img src="/static/blog/img/third1.gif" class="w-full" />\r\n                </div>\r\n                <div>\r\n                    Deux semaines après Jacque quant à lui n'avait pas encore trouvé du temps pour prendre le\r\n                    téléphone. Il decide alors un samedi à la sortie des cours à midi d'aller à la recherche d'un\r\n                    téléphone qui lui plaira. Il se rend à Cotonou et parcourt 4 boutiques pendant 2 longues heures avant de\r\n                    trouver un téléphone à son goût mais il n'est toutefois pas très sûre de son choix. Fatigué et ne\r\n                    voulant plus rechercher d'autres boutiques, il finit par prendre le téléphone juste pour vite rentrer\r\n                    et se reposer.\r\n                </div>\r\n            </div>\r\n            <div class="space-y-2">\r\n                <div class="text-xl font-bold">\r\n                    Que pouvons-nous retenir ?\r\n                </div>\r\n                <div class="">\r\n                    Comme vous pouvez le voir dans notre exemple, Serge a acheté son téléphone plus vite sans se\r\n                    tracasser et a pris son temps pour faire un choix qu'il aime tandis que jacques a dépensé plus\r\n                    d'énergie et d'argent a la recherche des boutiques et n'est finalement pas très sure qu'il aime le\r\n                    téléphone acheté. Qui selon vous a le plus apprécié l'expérience ? Qui s'est le plus senti valorisé\r\n                    ? Il s'agit évidemment de Serge qui a choisi d'utiliser <a href="/" class="underline text-blue-500 font-medium" >Zawadi</a>.\r\n                </div>\r\n                <div>\r\n                    Voilà donc les avantages de Zawadi, vous êtes considérés et valorisés tout comme un roi. Ce sont les\r\n                    vendeurs qui viennent vers vous et non le contraire. Vous pouvez prendre tout votre temps pour faire\r\n                    le bon choix et ensuite vous entendre avec le vendeur sur un prix. Vous allez vous sentir\r\n                    privilégié. Et comme cela vous allez adorer l'expérience avec Zawadi.\r\n                </div>\r\n\r\n                <div >\r\n                    <img src="/static/blog/img/fourth1.gif" class="w-full" />\r\n                </div>\r\n                \r\n            </div>\r\n        </div>	2023-01-02 10:15:49.341304+00	2-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	Envie de tester ?	838	1	\N	Pourquoi vous allez absolument adorer acheter avec Zawadi?
\.


--
-- Data for Name: blog_articles_ssubject; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_articles_ssubject (id, articles_id, subsubjects_id) FROM stdin;
\.


--
-- Data for Name: blog_articles_subject; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_articles_subject (id, articles_id, subject_id) FROM stdin;
\.


--
-- Data for Name: blog_articles_subs; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_articles_subs (id, articles_id, subcategory_id) FROM stdin;
\.


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_comment (id, text, for_zawadi, point, created_at, is_published, article_id, user_id, date_seen) FROM stdin;
1	Zawadi est une nouvelle façon d'acheter mais j'aime beaucoup car tu te sens mis en valeur quand tu fais des achats	t	0	2023-01-03 19:03:44.907845+00	t	\N	121	2023-01-03 07:30:00+00
2	Les conversations avec les vendeurs sont très agréables et pour quelqu'un comme moi qui tient comme du comportement d'un vendeur c'est juste excelent.	t	1	2023-01-03 19:15:17.656032+00	t	\N	122	2022-12-22 18:04:00+00
3	J'aime beaucoup l'utiliser pour acheter car il donne la possibilité de discuter avec le vendeur et d'etre sure de la qualité du produit	t	2	2023-01-03 19:20:50.602273+00	t	\N	120	2022-12-28 15:40:04+00
4	Je voulais tetser, j'ai envoyé une demande de jeans et même pas 30 min un vendeur m'a contacté et m'a présenté ses jeans. J'etais vraiment étonné	t	0	2023-01-03 19:23:19.050863+00	t	\N	123	2023-01-02 20:45:30+00
5	Bonjour! je suis souvent occupé et pas le temps de prendre certaines choses mais grâce à Zawadi j'envoie des demandes rapidement et des vendeurs viennent vers moi.	t	0	2023-01-03 19:29:07.432719+00	t	\N	124	2022-12-22 13:32:12+00
6	J'adore la facilité. Tu enregistres ta demande en quelques secondes et des vendeurs te contacte tu choisis et tu négocie un prix avec le vendeur.	t	4	2023-01-04 03:30:32.691677+00	t	\N	125	2022-12-30 08:09:03+00
7	j'ai aussi essayé et j'ai aimé. Mais il faudra penser à ajouter la catégorie alimentation	f	0	2023-01-04 04:13:41.435887+00	t	1	132	2023-01-02 15:24:04+00
8	Zawadi c’est l’avenir je vous dis. Très satisfait j’en avais vraiment besoin 	f	0	2023-01-10 21:52:56.290672+00	f	1	75	\N
\.


--
-- Data for Name: blog_subject; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_subject (id, name, created_at) FROM stdin;
1	Mode et Beauté	2023-01-02 05:46:42.459+00
2	Téléphonie	2023-01-02 05:58:48.740225+00
3	Electronique	2023-01-02 05:59:18.239982+00
4	Maison et Ménage	2023-01-02 06:04:41.142796+00
\.


--
-- Data for Name: blog_subsubjects; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_subsubjects (id, name, created_at, box_id) FROM stdin;
1	Mode Masculine	2023-01-02 08:48:42.990427+00	1
2	Mode Féminine	2023-01-02 08:48:57.019361+00	1
3	Mode Africaine	2023-01-02 08:51:33.883306+00	1
4	Cosmétiques et Parfums	2023-01-02 08:55:36.611587+00	1
5	Accessoires de Mode	2023-01-02 09:01:28.081082+00	1
6	Téléphone & Smartphone	2023-01-02 09:02:14.598915+00	2
7	Tablette	2023-01-02 09:05:38.609289+00	2
8	Accessoires téléphonique	2023-01-02 09:06:21.579222+00	2
9	Ordinateur	2023-01-02 09:06:53.513294+00	3
10	Accessoires informatiques	2023-01-02 09:07:20.770474+00	3
11	Console de jeux	2023-01-02 09:08:06.054547+00	3
12	Accessoires de jeux	2023-01-02 09:10:15.430377+00	3
13	Jeux vidéos	2023-01-02 09:10:45.085613+00	3
15	Electroménagers	2023-01-02 09:11:25.840203+00	4
14	Meubles et Outils	2023-01-02 09:11:49.710436+00	4
\.


--
-- Data for Name: blog_videoart; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.blog_videoart (id, file_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-10 18:12:51.954297+00	2	buisness:speed	1	[{"added": {}}]	8	1
2	2022-11-10 18:13:34.395579+00	3	pro:speed	1	[{"added": {}}]	8	1
3	2022-11-10 18:14:02.338372+00	4	basique:speed	1	[{"added": {}}]	8	1
4	2022-11-10 18:14:23.915911+00	5	zawadi	1	[{"added": {}}]	8	1
5	2022-11-10 18:14:54.009016+00	6	buisness:max_urg	1	[{"added": {}}]	8	1
6	2022-11-10 18:15:10.142387+00	7	buisness:max	1	[{"added": {}}]	8	1
7	2022-11-10 18:15:59.808615+00	8	pro:max_urg	1	[{"added": {}}]	8	1
8	2022-11-10 18:16:12.62557+00	9	pro:max_urg	1	[{"added": {}}]	8	1
9	2022-11-10 18:16:45.789248+00	10	pro:max	1	[{"added": {}}]	8	1
10	2022-11-10 18:17:09.809216+00	11	basique:max_urg	1	[{"added": {}}]	8	1
11	2022-11-10 18:17:52.267853+00	12	basique:max	1	[{"added": {}}]	8	1
12	2022-11-10 18:20:03.664218+00	13	kkiapay_secret	1	[{"added": {}}]	8	1
13	2022-11-10 18:20:29.894838+00	14	kkiapay_private	1	[{"added": {}}]	8	1
14	2022-11-10 18:20:55.524149+00	15	kkiapay_public	1	[{"added": {}}]	8	1
15	2022-11-10 18:21:20.919771+00	16	kkiapay_public_sand	1	[{"added": {}}]	8	1
16	2022-11-10 18:21:44.752631+00	17	default:shop:picture:url	1	[{"added": {}}]	8	1
17	2022-11-10 18:22:13.325913+00	18	contact:home	1	[{"added": {}}]	8	1
18	2022-11-10 18:52:34.643188+00	1	Vêtements	1	[{"added": {}}]	10	1
19	2022-11-10 18:52:49.017383+00	2	Chaussures	1	[{"added": {}}]	10	1
20	2022-11-10 18:53:08.667352+00	3	Bijoux et montres	1	[{"added": {}}]	10	1
21	2022-11-11 11:03:04.368631+00	1	Client1	3		12	1
22	2022-11-11 11:05:03.657055+00	140	Montre	1	[{"added": {}}]	14	1
23	2022-11-11 11:06:15.541319+00	140	Montre	2	[{"changed": {"fields": ["Box"]}}]	14	1
24	2022-11-11 11:06:35.61493+00	3	Bijoux et montres	3		10	1
25	2022-11-11 11:06:35.618216+00	2	Chaussures	3		10	1
26	2022-11-11 11:06:35.620397+00	1	Vêtements	3		10	1
27	2022-11-11 14:38:29.903856+00	19	site:link	1	[{"added": {}}]	8	1
28	2022-11-11 15:09:13.64365+00	1	Luxurious Mall	1	[{"added": {}}]	7	1
29	2022-11-11 15:21:23.153263+00	1	Luxurious Mall	2	[{"changed": {"fields": ["User"]}}]	7	1
30	2022-11-11 15:27:47.856303+00	1	Luxurious Mall	2	[{"changed": {"fields": ["Text"]}}]	7	1
31	2022-11-11 15:31:23.589313+00	2	SHOP LABS	1	[{"added": {}}]	7	1
32	2022-11-11 15:35:24.346324+00	2	SHOP LABS	2	[{"changed": {"fields": ["Text"]}}]	7	1
33	2022-11-11 15:52:46.276403+00	3	Golden Clothe	1	[{"added": {}}]	7	1
34	2022-11-11 15:53:25.858644+00	4	Golden Clothe	1	[{"added": {}}]	7	1
35	2022-11-11 16:01:17.747886+00	4	Will Shop	2	[{"changed": {"fields": ["User", "Seller", "Picture", "Text"]}}]	7	1
36	2022-11-11 16:03:14.615809+00	4	Will Shop	2	[{"changed": {"fields": ["Rank"]}}]	7	1
37	2022-11-12 11:34:19.846517+00	21	free:speed	1	[{"added": {}}]	8	1
38	2022-11-12 11:34:43.745265+00	22	free:max	1	[{"added": {}}]	8	1
39	2022-11-12 11:35:07.646036+00	23	free:max_urg	1	[{"added": {}}]	8	1
40	2022-11-12 11:40:19.256901+00	1	geodasrisfas@gmail.com	2	[{"changed": {"fields": ["Username", "Towns"]}}]	6	1
41	2022-11-12 11:40:58.290114+00	4	Client4	3		12	1
42	2022-11-12 12:09:32.662973+00	1	FCMDevice for geodasrisfas@gmail.com	2	[{"changed": {"fields": ["Type"]}}]	17	1
43	2022-11-12 12:09:55.028543+00	1	FCMDevice for geodasrisfas@gmail.com	2	[{"changed": {"fields": ["Type"]}}]	17	1
44	2022-11-12 12:11:05.104211+00	1	somename	2	[{"changed": {"fields": ["Name"]}}]	17	1
45	2022-11-12 14:45:59.755771+00	1	somename	3		17	1
46	2022-11-12 20:11:14.077636+00	18	contact:home	2	[{"changed": {"fields": ["Value"]}}]	8	1
47	2022-11-12 20:24:14.603598+00	7	Bijoux,sacs et accessoires	2	[]	10	1
48	2022-11-12 20:24:46.538165+00	16	Parfums et Cosmétique	1	[{"added": {}}]	10	1
49	2022-11-12 20:26:12.525445+00	141	Parfums	1	[{"added": {}}]	14	1
50	2022-11-12 20:26:32.31559+00	142	Eau de toilette	1	[{"added": {}}]	14	1
51	2022-11-12 20:26:59.463593+00	143	Maquillage	1	[{"added": {}}]	14	1
52	2022-11-12 20:27:39.174409+00	144	Savon	1	[{"added": {}}]	14	1
53	2022-11-12 20:27:56.342831+00	145	Déodorant	1	[{"added": {}}]	14	1
54	2022-11-12 20:28:37.36353+00	146	Produit pour cheveux	1	[{"added": {}}]	14	1
55	2022-11-12 20:28:58.759047+00	147	Crème	1	[{"added": {}}]	14	1
56	2022-11-12 20:30:07.35316+00	148	Dentrifice	1	[{"added": {}}]	14	1
57	2022-11-12 20:32:14.4226+00	149	Produit pour la peau	1	[{"added": {}}]	14	1
58	2022-11-12 20:33:46.257236+00	17	Pagne et Tissus	1	[{"added": {}}]	10	1
59	2022-11-12 20:37:27.547036+00	17	Pagne et Tissus	3		10	1
60	2022-11-13 00:53:23.928563+00	7	Bijoux,sacs et pagnes	2	[{"changed": {"fields": ["Name"]}}]	10	1
61	2022-11-13 00:54:10.476261+00	150	Pagne	1	[{"added": {}}]	14	1
62	2022-11-13 00:57:30.175584+00	151	Foulard	1	[{"added": {}}]	14	1
63	2022-11-13 01:12:32.138134+00	18	Chaussure	1	[{"added": {}}]	10	1
64	2022-11-13 01:13:08.947071+00	152	Baskets	1	[{"added": {}}]	14	1
65	2022-11-13 01:13:42.751781+00	51	Chaussures	3		14	1
66	2022-11-13 01:13:53.552974+00	49	Bottes,	3		14	1
67	2022-11-13 01:14:24.298316+00	153	Bottine/Boots	1	[{"added": {}}]	14	1
68	2022-11-13 01:14:50.358727+00	154	Bottes	1	[{"added": {}}]	14	1
69	2022-11-13 01:15:31.44283+00	155	Pantoufles / Chausson	1	[{"added": {}}]	14	1
70	2022-11-13 01:15:54.310706+00	156	Escarpins	1	[{"added": {}}]	14	1
71	2022-11-13 01:16:17.186549+00	157	Sandales et Nu-pieds	1	[{"added": {}}]	14	1
72	2022-11-13 01:16:52.390759+00	158	Derbies &amp; Richelieu	1	[{"added": {}}]	14	1
73	2022-11-13 01:17:21.171988+00	159	Mules /Sabots	1	[{"added": {}}]	14	1
74	2022-11-13 01:17:40.389848+00	160	Mocassins	1	[{"added": {}}]	14	1
75	2022-11-13 01:18:15.811731+00	161	Chaussure de sport	1	[{"added": {}}]	14	1
76	2022-11-13 01:18:37.022022+00	162	Tongs	1	[{"added": {}}]	14	1
77	2022-11-13 07:36:26.612538+00	163	Extracteur de jus de fruit	1	[{"added": {}}]	14	1
78	2022-11-13 07:44:24.61547+00	164	Télévision	1	[{"added": {}}]	14	1
79	2022-11-13 08:04:08.748506+00	165	Matelas	1	[{"added": {}}]	14	1
80	2022-11-17 11:44:18.929571+00	2	Georis	2	[{"changed": {"fields": ["Is active"]}}]	17	1
81	2022-11-17 11:44:58.902661+00	2	Georis	3		17	1
82	2022-11-21 13:18:43.028677+00	7	Luxurious Mall :week:7	3		13	1
83	2022-11-21 13:18:43.033062+00	6	Luxurious Mall :week:6	3		13	1
84	2022-11-21 13:18:43.035658+00	5	Luxurious Mall :week:5	3		13	1
85	2022-11-24 18:38:09.385828+00	26	testors	2	[{"changed": {"fields": ["Value"]}}]	8	1
86	2022-11-27 17:43:04.272208+00	26	testors	2	[{"changed": {"fields": ["Value"]}}]	8	1
87	2022-12-04 09:19:32.540555+00	18	contact:home	2	[{"changed": {"fields": ["Value"]}}]	8	1
88	2022-12-05 04:14:10.198066+00	5	FCMDevice for georiseno@gmail.com	3		20	1
89	2022-12-05 12:42:51.845121+00	43	Client43	3		12	1
90	2022-12-05 12:42:51.847654+00	42	Client42	3		12	1
91	2022-12-05 12:42:51.849299+00	41	Client41	3		12	1
92	2022-12-05 12:42:51.851049+00	40	Client40	3		12	1
93	2022-12-05 12:42:51.852477+00	39	Client39	3		12	1
94	2022-12-05 12:42:51.854016+00	38	Client38	3		12	1
95	2022-12-05 12:42:51.855466+00	37	Client37	3		12	1
96	2022-12-05 12:42:51.856954+00	36	Client36	3		12	1
97	2022-12-05 12:42:51.858245+00	35	Client35	3		12	1
98	2022-12-05 12:42:51.859878+00	34	Client34	3		12	1
99	2022-12-05 12:42:51.861334+00	33	Client33	3		12	1
100	2022-12-05 12:42:51.862803+00	32	Client32	3		12	1
101	2022-12-05 12:42:51.864352+00	31	Client31	3		12	1
102	2022-12-05 12:42:51.86592+00	30	Client30	3		12	1
103	2022-12-05 12:42:51.86741+00	29	Client29	3		12	1
104	2022-12-05 12:42:51.86896+00	28	Client28	3		12	1
105	2022-12-05 12:42:51.870305+00	27	Client27	3		12	1
106	2022-12-05 12:42:51.871594+00	26	Client26	3		12	1
107	2022-12-05 13:07:40.946986+00	6	FCMDevice for georiseno@gmail.com	3		20	1
108	2022-12-06 08:30:02.961477+00	7	Shoppy	2	[{"changed": {"fields": ["Subs"]}}]	9	1
109	2022-12-06 11:19:49.858522+00	831	Minaudière	1	[{"added": {}}]	14	1
110	2022-12-07 04:32:32.237999+00	832	Sac en pagne	1	[{"added": {}}]	14	1
111	2022-12-07 04:32:44.280191+00	20	Yêyi Sacs et accessoires	2	[{"changed": {"fields": ["Name", "Subs"]}}]	9	1
112	2022-12-08 04:14:41.080492+00	12	Christi🥰shop	2	[{"changed": {"fields": ["Category", "Subs"]}}]	9	1
113	2022-12-08 04:17:48.59952+00	833	Produits pour moustiques	1	[{"added": {}}]	14	1
114	2022-12-08 04:19:48.616043+00	834	Produits pour moustiques	1	[{"added": {}}]	14	1
115	2022-12-08 04:25:42.346065+00	12	Christi🥰shop	2	[{"changed": {"fields": ["Category", "Subs"]}}]	9	1
116	2022-12-08 04:55:48.053663+00	835	Woofers	1	[{"added": {}}]	14	1
117	2022-12-08 04:57:04.314842+00	662	Ecouteur et Woofers	2	[{"changed": {"fields": ["Name"]}}]	14	1
118	2022-12-08 06:36:03.412255+00	836	Câbles et connectique	1	[{"added": {}}]	14	1
119	2022-12-08 07:52:40.2934+00	837	Câble Ecran-prdinateur	1	[{"added": {}}]	14	1
120	2022-12-08 07:54:44.708279+00	837	Câble Ecran-ordinateur	2	[{"changed": {"fields": ["Name"]}}]	14	1
121	2022-12-08 08:18:31.852145+00	21	Open Gold	3		9	1
122	2022-12-16 12:14:08.2102+00	48	Client48	3		12	1
123	2022-12-16 12:14:08.212621+00	47	Client47	3		12	1
124	2022-12-16 12:14:08.214167+00	46	Client46	3		12	1
125	2022-12-16 12:14:08.215974+00	45	Client45	3		12	1
126	2022-12-16 12:14:08.21781+00	44	Client44	3		12	1
127	2022-12-18 16:32:25.046245+00	49	Client49	3		12	1
128	2022-12-18 23:11:26.4127+00	50	Client50	3		12	1
129	2022-12-20 14:39:26.57811+00	54	Client54	3		12	1
130	2022-12-20 14:52:52.724499+00	57	Client57	3		12	1
131	2022-12-20 14:52:52.726511+00	56	Client56	3		12	1
132	2022-12-20 14:52:52.728122+00	55	Client55	3		12	1
133	2022-12-20 14:55:44.807305+00	58	Client58	3		12	1
134	2022-12-20 15:38:23.11928+00	8	FCMDevice for smalmichel@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	20	1
135	2022-12-21 07:34:45.702019+00	11	auresjojo@gmail.com	2	[{"changed": {"fields": ["Whatsapp", "Phone"]}}]	11	1
136	2022-12-21 14:24:06.908372+00	64	Client64	3		12	1
137	2022-12-22 18:23:59.147777+00	71	Client71	3		12	1
138	2022-12-22 18:32:07.081585+00	15	groupeelife@gmail.com	3		11	1
139	2022-12-23 09:54:04.837637+00	6	ambroisedas2003@gmail.com	2	[{"changed": {"fields": ["Whatsapp", "Phone"]}}]	11	1
140	2022-12-27 19:05:27.101309+00	77	Client77	3		12	1
141	2022-12-27 19:05:27.103803+00	76	Client76	3		12	1
142	2022-12-27 19:05:27.105665+00	75	Client75	3		12	1
143	2022-12-27 19:05:27.107484+00	74	Client74	3		12	1
144	2022-12-30 12:13:04.717941+00	96	BAGAM Shop:week:96	2	[{"changed": {"fields": ["Demandes"]}}]	13	1
145	2022-12-31 15:33:34.813058+00	26	First choice	2	[{"changed": {"fields": ["Name"]}}]	9	1
146	2022-12-31 15:34:09.618225+00	26	First choice	2	[{"changed": {"fields": ["Rest"]}}]	9	1
147	2023-01-01 19:02:38.331818+00	48	Adjademe fashion prêt à porter	2	[{"changed": {"fields": ["Name", "Subs"]}}]	9	1
148	2023-01-01 19:08:30.677583+00	45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	2	[{"changed": {"fields": ["Name", "Category", "Subs"]}}]	9	1
149	2023-01-02 05:46:42.461241+00	1	Mode et Beauté	1	[{"added": {}}]	24	1
150	2023-01-02 05:58:48.741783+00	2	Téléphonie	1	[{"added": {}}]	24	1
151	2023-01-02 05:59:18.2413+00	3	Electronique	1	[{"added": {}}]	24	1
152	2023-01-02 06:04:41.144346+00	4	Maison et Ménage	1	[{"added": {}}]	24	1
153	2023-01-02 06:15:24.390965+00	22	parfait.dohou@outlook.fr	2	[{"changed": {"fields": ["Whatsapp"]}}]	11	1
154	2023-01-02 06:17:41.491076+00	23	ambroisedas2003@gmail.com	2	[{"changed": {"fields": ["Whatsapp", "Phone"]}}]	11	1
155	2023-01-02 08:48:42.992353+00	1	Mode Masculine	1	[{"added": {}}]	21	1
156	2023-01-02 08:48:57.020207+00	2	Mode Féminine	1	[{"added": {}}]	21	1
157	2023-01-02 08:51:33.884361+00	3	Mode Africaine	1	[{"added": {}}]	21	1
158	2023-01-02 08:55:36.612518+00	4	Cosmétiques et Parfums	1	[{"added": {}}]	21	1
159	2023-01-02 09:01:28.082242+00	5	Accessoires de Mode	1	[{"added": {}}]	21	1
160	2023-01-02 09:02:14.600229+00	6	Téléphone & Smartphone	1	[{"added": {}}]	21	1
161	2023-01-02 09:05:38.610261+00	7	Tablette	1	[{"added": {}}]	21	1
162	2023-01-02 09:06:21.580157+00	8	Accessoires téléphonique	1	[{"added": {}}]	21	1
163	2023-01-02 09:06:53.514238+00	9	Ordinateur	1	[{"added": {}}]	21	1
164	2023-01-02 09:07:20.77149+00	10	Accessoires informatiques	1	[{"added": {}}]	21	1
165	2023-01-02 09:08:06.055562+00	11	Console de jeux	1	[{"added": {}}]	21	1
166	2023-01-02 09:10:15.431606+00	12	Accessoires de jeux	1	[{"added": {}}]	21	1
167	2023-01-02 09:10:45.086658+00	13	Jeux vidéos	1	[{"added": {}}]	21	1
168	2023-01-02 09:11:10.251321+00	14	Meubles et Outils	1	[{"added": {}}]	21	1
169	2023-01-02 09:11:25.841248+00	15	Electroménagers	1	[{"added": {}}]	21	1
170	2023-01-02 09:11:49.711893+00	14	Meubles et Outils	2	[{"changed": {"fields": ["Box"]}}]	21	1
171	2023-01-02 10:15:40.789978+00	1	blog_main	1	[{"added": {}}]	19	1
172	2023-01-02 10:15:49.349308+00	1	Articles object (1)	1	[{"added": {}}]	23	1
173	2023-01-02 10:43:50.736562+00	1	3-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Html"]}}]	23	1
174	2023-01-02 10:48:47.272257+00	1	3-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Html"]}}]	23	1
175	2023-01-02 10:57:42.71116+00	1	3-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Dem pk"]}}]	23	1
176	2023-01-02 14:30:57.786922+00	100	Client100	3		12	1
177	2023-01-03 08:31:56.805121+00	1	3-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Whatsapp title"]}}]	23	1
178	2023-01-03 08:34:24.662904+00	1	2-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Title", "Subtitle", "Slug"]}}]	23	1
179	2023-01-03 09:08:11.027804+00	1	blog_main	2	[{"changed": {"fields": ["File"]}}]	19	1
180	2023-01-03 09:08:20.563903+00	1	2-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[]	23	1
181	2023-01-03 13:57:27.241767+00	123	user:63	1	[{"added": {}}]	18	1
182	2023-01-03 19:03:44.909403+00	1	Comment object (1)	1	[{"added": {}}]	22	1
183	2023-01-03 19:15:17.657203+00	2	Comment object (2)	1	[{"added": {}}]	22	1
184	2023-01-03 19:20:50.603415+00	3	Comment object (3)	1	[{"added": {}}]	22	1
185	2023-01-03 19:21:02.824088+00	2	Comment object (2)	2	[{"changed": {"fields": ["Is published"]}}]	22	1
186	2023-01-03 19:23:19.051794+00	4	Comment object (4)	1	[{"added": {}}]	22	1
187	2023-01-03 19:29:07.436644+00	5	Comment object (5)	1	[{"added": {}}]	22	1
188	2023-01-04 03:30:32.692927+00	6	Comment object (6)	1	[{"added": {}}]	22	1
189	2023-01-04 03:38:20.888614+00	120	thierryjgodeme@gmail.com	2	[{"changed": {"fields": ["Username"]}}]	6	1
190	2023-01-04 03:51:08.400624+00	1	Comment object (1)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
191	2023-01-04 03:54:48.67457+00	2	Comment object (2)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
192	2023-01-04 03:55:50.502197+00	3	Comment object (3)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
193	2023-01-04 03:58:53.458897+00	4	Comment object (4)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
194	2023-01-04 03:59:05.043958+00	4	Comment object (4)	2	[{"changed": {"fields": ["Is published"]}}]	22	1
195	2023-01-04 03:59:42.482927+00	5	Comment object (5)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
196	2023-01-04 04:00:14.026355+00	6	Comment object (6)	2	[{"changed": {"fields": ["Date seen"]}}]	22	1
197	2023-01-04 04:00:32.294459+00	32	george.bluth@reqres.in	1	[{"added": {}}]	11	1
198	2023-01-04 04:00:39.665898+00	33	janet.weaver@reqres.in	1	[{"added": {}}]	11	1
199	2023-01-04 04:00:52.772927+00	34	thierryjgodeme@gmail.com	1	[{"added": {}}]	11	1
200	2023-01-04 04:01:03.562118+00	35	emma.wong@reqres.in	1	[{"added": {}}]	11	1
201	2023-01-04 04:01:09.861108+00	36	eve.holt@reqres.in	1	[{"added": {}}]	11	1
202	2023-01-04 04:01:16.787277+00	37	charles.morris@reqres.in	1	[{"added": {}}]	11	1
203	2023-01-04 04:01:33.09968+00	38	tracey.ramos@reqres.in	1	[{"added": {}}]	11	1
204	2023-01-04 04:01:43.462769+00	39	michael.lawson@reqres.in	1	[{"added": {}}]	11	1
205	2023-01-04 04:01:50.600535+00	40	lindsay.ferguson@reqres.in	1	[{"added": {}}]	11	1
206	2023-01-04 04:01:59.532981+00	41	tobias.funke@reqres.in	1	[{"added": {}}]	11	1
207	2023-01-04 04:02:26.489128+00	42	byron.fields@reqres.in	1	[{"added": {}}]	11	1
208	2023-01-04 04:02:34.65061+00	43	george.edwards@reqres.in	1	[{"added": {}}]	11	1
209	2023-01-04 04:02:42.990922+00	44	rachel.howell@reqres.in	1	[{"added": {}}]	11	1
210	2023-01-04 04:13:41.437319+00	7	Comment object (7)	1	[{"added": {}}]	22	1
211	2023-01-04 04:14:44.259803+00	7	Comment object (7)	2	[{"changed": {"fields": ["Date seen", "Is published"]}}]	22	1
212	2023-01-04 11:15:09.764154+00	33	blog_ready	1	[{"added": {}}]	8	1
213	2023-01-05 05:49:10.508413+00	34	whatsapp_link	1	[{"added": {}}]	8	1
214	2023-01-05 06:44:09.830407+00	1	2-min-pour-comprendre-definitivement-les-avantages-de-Zawadi	2	[{"changed": {"fields": ["Whatsapp title"]}}]	23	1
215	2023-01-05 07:48:37.215443+00	132	user:40	1	[{"added": {}}]	18	1
216	2023-01-07 18:46:03.681387+00	1	blog_main	2	[{"changed": {"fields": ["File"]}}]	19	1
217	2023-01-09 17:23:45.639579+00	13	Mode et Beauté	2	[{"changed": {"fields": ["Name"]}}]	17	1
218	2023-01-09 17:27:48.415295+00	804	Pour l'entretien et l'hygiène	2	[{"changed": {"fields": ["Name"]}}]	14	1
219	2023-01-09 17:30:42.147849+00	624	Savon	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
220	2023-01-09 17:33:03.98484+00	839	Feuille de Savon	1	[{"added": {}}]	14	1
221	2023-01-09 17:33:39.712435+00	839	Feuille de Savon	2	[{"changed": {"fields": ["Default price"]}}]	14	1
222	2023-01-09 17:35:05.939353+00	840	Pour un dressing(vêtements)	1	[{"added": {}}]	14	1
223	2023-01-09 17:35:46.141262+00	841	Cintre	1	[{"added": {}}]	14	1
224	2023-01-09 17:36:36.050818+00	842	Porte cintre	1	[{"added": {}}]	14	1
225	2023-01-09 17:37:53.739803+00	843	Armoire	1	[{"added": {}}]	14	1
226	2023-01-09 17:39:25.580971+00	844	Appareil soin visage	1	[{"added": {}}]	14	1
227	2023-01-09 17:41:36.27463+00	794	Essentiel pour la cuisine	2	[{"changed": {"fields": ["Name"]}}]	14	1
228	2023-01-09 17:45:31.598249+00	845	Fourchette	1	[{"added": {}}]	14	1
229	2023-01-09 17:47:11.437545+00	846	Bol	1	[{"added": {}}]	14	1
230	2023-01-09 17:48:13.210146+00	847	Passoire	1	[{"added": {}}]	14	1
231	2023-01-09 17:50:03.574006+00	848	Autre outil pour la cuisine	1	[{"added": {}}]	14	1
232	2023-01-09 17:50:33.578548+00	848	Autres outils pour la cuisine	2	[{"changed": {"fields": ["Name"]}}]	14	1
233	2023-01-09 17:51:23.544415+00	797	Outils de Patisserie	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
234	2023-01-09 17:52:16.154771+00	798	Friteuse	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
235	2023-01-09 17:52:35.616216+00	799	Lisseur	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
236	2023-01-09 17:52:58.231506+00	803	Poêles	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
237	2023-01-09 17:53:57.662855+00	849	Théière	1	[{"added": {}}]	14	1
238	2023-01-09 17:54:26.599424+00	850	Louches	1	[{"added": {}}]	14	1
239	2023-01-09 17:55:22.933449+00	851	Presse jus	1	[{"added": {}}]	14	1
240	2023-01-09 17:56:02.887112+00	852	Glacière	1	[{"added": {}}]	14	1
241	2023-01-09 17:56:56.276604+00	853	Pour la décoration	1	[{"added": {}}]	14	1
242	2023-01-09 17:58:30.746877+00	783	Montre murale	2	[{"changed": {"fields": ["Sub box"]}}]	14	1
243	2023-01-09 17:59:18.336781+00	793	Outil de Décoration	2	[{"changed": {"fields": ["Name", "Sub box"]}}]	14	1
244	2023-01-09 18:00:04.138636+00	854	Rideaux décoratifs	1	[{"added": {}}]	14	1
245	2023-01-09 18:00:59.416532+00	855	Accroches murale	1	[{"added": {}}]	14	1
246	2023-01-09 18:01:35.727514+00	856	Petales de rose	1	[{"added": {}}]	14	1
247	2023-01-09 18:04:14.286072+00	857	Masque	1	[{"added": {}}]	14	1
248	2023-01-09 18:08:31.142186+00	14	Téléphonie	2	[]	17	1
249	2023-01-09 18:08:38.37751+00	15	Electronique	2	[]	17	1
250	2023-01-09 18:08:42.729881+00	16	Maisons, Ménage	2	[]	17	1
251	2023-01-09 18:16:30.676307+00	55	Appareils Electroménagers	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
252	2023-01-09 18:16:44.380339+00	54	Meubles et Outils	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
253	2023-01-09 18:16:53.913497+00	53	Jeux	2	[{"changed": {"fields": ["Name", "Dprice"]}}]	10	1
254	2023-01-09 18:17:18.00415+00	52	Consoles de jeux et accessoires	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
255	2023-01-09 18:17:37.211767+00	51	Accessoirs Informatique	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
256	2023-01-09 18:17:46.541267+00	50	Ordinateur	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
257	2023-01-09 18:17:58.598657+00	49	Accessoires ( battérie, ecouteurs...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
258	2023-01-09 18:18:09.261366+00	48	Téléphone & Tablette	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
259	2023-01-09 18:19:17.820534+00	47	Produits Cosmétique et Parfums	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
260	2023-01-09 18:19:27.623725+00	46	Accessoire(chapeau, lunette,...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
261	2023-01-09 18:19:34.631531+00	45	Mode Africaine(pagnes,...)	2	[]	10	1
262	2023-01-09 18:19:43.89593+00	44	Mode Feminine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
263	2023-01-09 18:19:54.837402+00	43	Mode Masculine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
264	2023-01-10 21:06:05.749779+00	141	user:19	1	[{"added": {}}]	18	1
265	2023-01-18 10:52:13.994763+00	60	New way	3		9	1
266	2023-01-18 16:14:11.55317+00	36	MESSENGER_VERIFY_TOKEN	1	[{"added": {}}]	8	1
267	2023-01-19 18:01:52.331094+00	37	WHATSAPP_PERMANENT_TOKEN	1	[{"added": {}}]	8	1
268	2023-01-22 11:31:26.404969+00	38	whatsapp_logs	1	[{"added": {}}]	8	1
269	2023-01-22 11:32:06.249223+00	39	WHATSAPP_ACCESS_TOKEN	1	[{"added": {}}]	8	1
270	2023-01-22 11:32:32.236859+00	40	WHATSAPP_PHONE_NUMBER_ID	1	[{"added": {}}]	8	1
271	2023-01-22 15:02:56.432745+00	8	Ziyeux	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
272	2023-01-22 15:03:11.548167+00	63	Natacha Cosmétiques sarl	2	[{"changed": {"fields": ["Format number"]}}]	9	1
273	2023-01-22 15:03:37.421951+00	64	Pur Eden shop	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
274	2023-01-22 15:04:09.58559+00	62	Top Informatique	2	[{"changed": {"fields": ["Name", "Whatsapp", "Format number"]}}]	9	1
275	2023-01-22 15:04:51.963538+00	61	Établissements Sira & Fils	2	[{"changed": {"fields": ["Format number"]}}]	9	1
276	2023-01-22 15:05:45.143152+00	59	Esséname business	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
277	2023-01-22 15:06:13.86748+00	58	Luli	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
278	2023-01-22 15:07:06.383406+00	56	Adambadji	2	[{"changed": {"fields": ["Format number"]}}]	9	1
279	2023-01-22 15:07:29.033131+00	55	Olowookere frip	2	[{"changed": {"fields": ["Format number"]}}]	9	1
280	2023-01-22 15:07:47.319485+00	54	Ana	2	[{"changed": {"fields": ["Format number"]}}]	9	1
281	2023-01-22 15:08:06.402428+00	52	Noll GSM	2	[{"changed": {"fields": ["Format number"]}}]	9	1
282	2023-01-22 15:08:34.814798+00	51	Ordinateur-Teléphone shop	2	[{"changed": {"fields": ["Format number"]}}]	9	1
283	2023-01-22 15:09:40.071172+00	50	Black gold parfumery et lingerie🤤	2	[{"changed": {"fields": ["Format number"]}}]	9	1
284	2023-01-22 15:13:26.165693+00	49	CHRIST ALONE (CA)	2	[{"changed": {"fields": ["Format number"]}}]	9	1
285	2023-01-22 15:13:50.560088+00	48	Adjademe fashion prêt à porter	2	[{"changed": {"fields": ["Format number"]}}]	9	1
286	2023-01-22 15:14:06.946596+00	47	Kevin shop	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
287	2023-01-22 15:14:39.88432+00	45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	2	[{"changed": {"fields": ["Whatsapp", "Format number"]}}]	9	1
288	2023-01-22 15:15:25.601162+00	44	Tchéké Shop	2	[{"changed": {"fields": ["Format number"]}}]	9	1
289	2023-01-22 15:16:00.609587+00	43	Mahouna Services Ventes MSV	2	[{"changed": {"fields": ["Whatsapp", "Format number"]}}]	9	1
290	2023-01-22 15:17:48.752613+00	42	Sam modèle	2	[{"changed": {"fields": ["Format number"]}}]	9	1
291	2023-01-22 15:19:50.683161+00	41	ÉLECTRONIQUE ARTS	2	[{"changed": {"fields": ["Format number"]}}]	9	1
292	2023-01-22 15:20:14.304342+00	40	Shadé's Beads	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
293	2023-01-22 15:21:47.360791+00	36	Vignon Vigil Fashion	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
294	2023-01-22 15:22:56.105426+00	34	Data five	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
295	2023-01-22 15:23:13.737379+00	33	LOLA SHOP	2	[{"changed": {"fields": ["Format number"]}}]	9	1
296	2023-01-22 15:23:34.193355+00	32	LIHONOU Bénédite	2	[{"changed": {"fields": ["Format number"]}}]	9	1
297	2023-01-22 15:24:01.300746+00	31	ANDREZZY SHOP	2	[{"changed": {"fields": ["Format number"]}}]	9	1
298	2023-01-22 15:24:21.023269+00	30	Longrich	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
299	2023-01-22 15:24:52.574784+00	29	Mana's Shop	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
300	2023-01-22 15:25:09.425002+00	28	Ingrid shop	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
301	2023-01-22 15:29:13.07017+00	26	First choice	2	[{"changed": {"fields": ["Format number"]}}]	9	1
302	2023-01-22 15:29:36.367217+00	25	Joy	2	[{"changed": {"fields": ["Format number"]}}]	9	1
303	2023-01-22 15:31:30.274728+00	23	Beauty	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
304	2023-01-22 15:32:52.116573+00	16	ADk store	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
305	2023-01-22 15:33:15.31589+00	15	Beauté d'Or	2	[{"changed": {"fields": ["Format number"]}}]	9	1
306	2023-01-22 15:33:46.836811+00	14	Luthor informatique	2	[{"changed": {"fields": ["Name", "Format number"]}}]	9	1
307	2023-01-22 15:43:28.591138+00	12	Christi🥰shop	2	[{"changed": {"fields": ["Format number"]}}]	9	1
308	2023-01-22 15:47:48.666896+00	9	C-Divers	2	[{"changed": {"fields": ["Name", "Whatsapp", "Format number"]}}]	9	1
309	2023-01-23 13:00:30.554465+00	2	Politique_de_confidentialite	1	[{"added": {}}]	19	1
310	2023-01-23 13:04:36.277869+00	1	blog_main	2	[{"changed": {"fields": ["File"]}}]	19	1
311	2023-01-23 13:05:37.520583+00	1	blog_main	2	[{"changed": {"fields": ["File"]}}]	19	1
312	2023-01-23 13:06:13.549067+00	2	Politique_de_confidentialite	2	[{"changed": {"fields": ["File"]}}]	19	1
313	2023-01-23 15:42:49.027274+00	53	Geodasbax	2	[{"changed": {"fields": ["Format number"]}}]	9	1
314	2023-01-23 15:51:53.20709+00	53	Geodasbax	2	[{"changed": {"fields": ["Format number"]}}]	9	1
315	2023-01-23 16:14:26.459978+00	53	Geodasbax	2	[{"changed": {"fields": ["Format number"]}}]	9	1
316	2023-01-23 18:30:04.139968+00	55	Appareils Electroménagers	2	[]	10	1
317	2023-01-23 18:30:08.849803+00	54	Meubles et Outils	2	[]	10	1
318	2023-01-23 18:30:15.340526+00	53	Jeux	2	[]	10	1
319	2023-01-23 18:30:23.442813+00	52	Consoles de jeux et accessoires	2	[]	10	1
320	2023-01-23 18:30:29.428579+00	51	Accessoirs Informatique	2	[]	10	1
321	2023-01-23 18:30:35.728169+00	50	Ordinateur	2	[]	10	1
322	2023-01-23 18:30:41.80513+00	50	Ordinateur	2	[]	10	1
323	2023-01-23 18:30:46.740617+00	49	Accessoires ( battérie, ecouteurs...)	2	[]	10	1
324	2023-01-23 18:30:54.099455+00	48	Téléphone & Tablette	2	[]	10	1
325	2023-01-23 18:31:00.175917+00	47	Produits Cosmétique et Parfums	2	[]	10	1
326	2023-01-23 18:31:07.77575+00	45	Mode Africaine(pagnes,...)	2	[]	10	1
327	2023-01-23 18:31:13.919642+00	44	Mode Feminine	2	[]	10	1
328	2023-01-23 18:31:20.39578+00	43	Mode Masculine	2	[]	10	1
329	2023-01-23 18:32:05.565774+00	43	Mode Masculine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
330	2023-01-23 18:32:50.215309+00	46	Accessoire(chapeau, lunette,...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
331	2023-01-23 18:33:18.083506+00	47	Produits Cosmétique et Parfums	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
332	2023-01-23 18:33:37.208739+00	45	Mode Africaine(pagnes,...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
333	2023-01-23 18:33:54.154357+00	44	Mode Feminine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
334	2023-01-23 18:34:26.504606+00	46	Accessoire(chapeau, lunette,...)	2	[]	10	1
335	2023-01-23 18:34:38.804182+00	47	Produits Cosmétique et Parfums	2	[]	10	1
336	2023-01-23 18:35:20.660648+00	45	Mode Africaine(pagnes,...)	2	[]	10	1
337	2023-01-23 18:35:48.480286+00	46	Accessoire(chapeau, lunette,...)	2	[]	10	1
338	2023-01-23 18:36:03.695989+00	47	Produits Cosmétique et Parfums	2	[]	10	1
339	2023-01-23 18:36:22.025623+00	48	Téléphone & Tablette	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
340	2023-01-23 18:39:32.065345+00	63	Natacha Cosmétiques sarl	2	[{"changed": {"fields": ["Type of", "Dprice", "Damount", "Damount init"]}}]	9	1
341	2023-01-23 18:39:51.75589+00	63	Natacha Cosmétiques sarl	2	[{"changed": {"fields": ["Dm alert"]}}]	9	1
342	2023-01-23 18:40:00.400594+00	63	Natacha Cosmétiques sarl	2	[{"changed": {"fields": ["Dm alert"]}}]	9	1
343	2023-01-24 10:06:47.619914+00	65	Sacoches et bracelets	2	[{"changed": {"fields": ["Name", "Dprice", "Damount", "Damount init"]}}]	9	1
344	2023-01-24 10:09:23.358822+00	65	Sacoches et bracelets	2	[{"changed": {"fields": ["Type of"]}}]	9	1
345	2023-01-24 11:19:16.430557+00	65	Sacoches et bracelets	2	[{"changed": {"fields": ["User"]}}]	9	1
346	2023-01-24 12:02:44.288655+00	65	Sacoches et bracelets	2	[{"changed": {"fields": ["User", "Whatsapp"]}}]	9	1
347	2023-01-25 10:28:54.290251+00	122	Client122	3		12	1
348	2023-01-25 10:28:54.29384+00	121	Client121	3		12	1
349	2023-01-25 10:28:54.295937+00	120	Client120	3		12	1
380	2023-01-25 15:32:31.551057+00	61	Établissements Sira & Fils	2	[{"changed": {"fields": ["Damount", "Damount init"]}}]	9	1
381	2023-01-26 15:32:40.839478+00	71	Adinas bonheur	2	[{"changed": {"fields": ["Type of", "Damount", "Damount init"]}}]	9	1
382	2023-01-27 10:40:29.869664+00	129	Client129	3		12	1
383	2023-01-27 10:40:29.871892+00	128	Client128	3		12	1
384	2023-01-27 10:40:29.873241+00	127	Client127	3		12	1
385	2023-01-27 10:40:29.874564+00	126	Client126	3		12	1
386	2023-01-27 10:40:29.875932+00	125	Client125	3		12	1
387	2023-01-27 10:40:29.877541+00	124	Client124	3		12	1
388	2023-01-27 10:41:55.477082+00	66	Test shop for abn	2	[{"changed": {"fields": ["User"]}}]	9	1
389	2023-01-27 11:10:49.186313+00	433	AraShop:week:433	2	[{"changed": {"fields": ["Demandes"]}}]	13	1
390	2023-01-27 11:13:31.385659+00	438	Tony shop et cosmétiques :week:438	2	[{"changed": {"fields": ["Demandes"]}}]	13	1
391	2023-01-27 11:13:56.730284+00	430	Ulvisshop:week:430	2	[{"changed": {"fields": ["Demandes"]}}]	13	1
392	2023-01-27 11:20:03.502218+00	80	AraShop	2	[{"changed": {"fields": ["Dprice", "Damount", "Damount init"]}}]	9	1
393	2023-01-27 11:21:04.14178+00	80	AraShop	2	[{"changed": {"fields": ["Rest", "Type of"]}}]	9	1
394	2023-01-31 14:38:43.187107+00	13	Noël ZOHOUE	2	[{"changed": {"fields": ["Money", "Current"]}}]	27	1
395	2023-01-31 21:54:43.653687+00	72	GRADO Shop's	2	[{"changed": {"fields": ["Dm alert", "Format number"]}}]	9	1
396	2023-01-31 21:56:36.766398+00	72	GRADO Shop's	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
397	2023-02-01 06:18:32.277987+00	3	market1	1	[{"added": {}}]	19	1
398	2023-02-01 17:03:10.810333+00	43	Mode Masculine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
399	2023-02-01 17:03:29.619253+00	44	Mode Feminine	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
400	2023-02-01 17:03:39.175952+00	45	Mode Africaine(pagnes,...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
401	2023-02-01 17:03:51.210196+00	46	Accessoire(chapeau, lunette,...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
402	2023-02-01 17:04:28.410348+00	47	Produits Cosmétique et Parfums	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
403	2023-02-01 17:04:36.863588+00	48	Téléphone & Tablette	2	[]	10	1
404	2023-02-01 17:04:48.161721+00	49	Accessoires ( battérie, ecouteurs...)	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
405	2023-02-01 17:04:57.414338+00	50	Ordinateur	2	[]	10	1
406	2023-02-01 17:05:12.768006+00	51	Accessoirs Informatique	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
407	2023-02-01 17:05:32.534569+00	52	Consoles de jeux et accessoires	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
408	2023-02-01 17:05:40.404607+00	53	Jeux	2	[]	10	1
409	2023-02-01 17:05:49.24693+00	54	Meubles et Outils	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
410	2023-02-01 17:05:59.217011+00	55	Appareils Electroménagers	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
411	2023-02-01 17:06:06.251594+00	55	Appareils Electroménagers	2	[{"changed": {"fields": ["Dprice"]}}]	10	1
412	2023-02-01 17:06:22.384811+00	55	Appareils Electroménagers	2	[]	10	1
413	2023-02-01 17:06:28.141734+00	54	Meubles et Outils	2	[]	10	1
414	2023-02-01 17:06:32.590882+00	53	Jeux	2	[]	10	1
415	2023-02-01 17:06:37.153994+00	52	Consoles de jeux et accessoires	2	[]	10	1
416	2023-02-01 17:06:43.17494+00	51	Accessoirs Informatique	2	[]	10	1
417	2023-02-01 17:06:43.342366+00	51	Accessoirs Informatique	2	[]	10	1
418	2023-02-01 17:06:49.957931+00	50	Ordinateur	2	[]	10	1
419	2023-02-01 17:06:55.761608+00	49	Accessoires ( battérie, ecouteurs...)	2	[]	10	1
420	2023-02-01 17:07:02.574737+00	49	Accessoires ( battérie, ecouteurs...)	2	[]	10	1
421	2023-02-01 17:07:23.970746+00	48	Téléphone & Tablette	2	[]	10	1
422	2023-02-01 17:07:36.780945+00	47	Produits Cosmétique et Parfums	2	[]	10	1
423	2023-02-01 17:07:44.148428+00	46	Accessoire(chapeau, lunette,...)	2	[]	10	1
424	2023-02-01 17:07:51.231966+00	45	Mode Africaine(pagnes,...)	2	[]	10	1
425	2023-02-01 17:07:57.534504+00	44	Mode Feminine	2	[]	10	1
426	2023-02-01 17:08:02.159695+00	43	Mode Masculine	2	[]	10	1
427	2023-02-01 17:09:28.335182+00	43	Mode Masculine	2	[]	10	1
428	2023-02-01 17:09:34.147694+00	44	Mode Feminine	2	[]	10	1
429	2023-02-01 17:09:38.717151+00	45	Mode Africaine(pagnes,...)	2	[]	10	1
430	2023-02-01 17:09:43.398712+00	46	Accessoire(chapeau, lunette,...)	2	[]	10	1
431	2023-02-01 17:09:51.361729+00	47	Produits Cosmétique et Parfums	2	[]	10	1
432	2023-02-01 17:09:57.929653+00	47	Produits Cosmétique et Parfums	2	[]	10	1
433	2023-02-01 17:10:14.760652+00	48	Téléphone & Tablette	2	[]	10	1
434	2023-02-01 17:10:22.25646+00	49	Accessoires ( battérie, ecouteurs...)	2	[]	10	1
435	2023-02-01 17:10:29.971223+00	50	Ordinateur	2	[]	10	1
436	2023-02-01 17:10:37.533545+00	51	Accessoirs Informatique	2	[]	10	1
437	2023-02-01 17:10:43.017533+00	52	Consoles de jeux et accessoires	2	[]	10	1
438	2023-02-01 17:10:49.574952+00	53	Jeux	2	[]	10	1
439	2023-02-01 17:10:53.860134+00	54	Meubles et Outils	2	[]	10	1
440	2023-02-01 17:10:57.726954+00	55	Appareils Electroménagers	2	[]	10	1
441	2023-02-02 09:15:03.16642+00	141	user:19	2	[]	18	1
442	2023-02-02 10:03:28.929489+00	227	user:119	1	[{"added": {}}]	18	1
443	2023-02-02 10:50:36.941932+00	51	Ordinateur-Teléphone shop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
444	2023-02-02 17:11:02.045716+00	77	Ulvisshop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
445	2023-02-02 17:13:13.779523+00	72	GRADO Shop's	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
446	2023-02-02 17:13:30.38597+00	70	Vente de téléphonie et accessoires	2	[{"changed": {"fields": ["Name", "Rest", "Damount"]}}]	9	1
447	2023-02-02 17:13:51.482105+00	62	Top Informatique	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
448	2023-02-02 17:14:23.087712+00	55	Olowookere frip	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
449	2023-02-02 17:15:41.387095+00	9	C-Divers	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
450	2023-02-04 19:07:48.259183+00	82	Mawoussé	2	[{"changed": {"fields": ["Name", "Rest", "Damount"]}}]	9	1
451	2023-02-04 19:08:11.728363+00	77	Ulvisshop	2	[{"changed": {"fields": ["Damount"]}}]	9	1
452	2023-02-04 19:08:36.39454+00	77	Ulvisshop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
453	2023-02-05 05:39:40.397473+00	13	Noël ZOHOUE	2	[{"changed": {"fields": ["Ident"]}}]	27	1
454	2023-02-06 05:49:30.414129+00	33	LOLA SHOP	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
455	2023-02-06 15:42:21.194158+00	261	user:145	1	[{"added": {}}]	18	1
456	2023-02-06 16:11:36.220535+00	57	HAPPINESS MARKET	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
457	2023-02-06 16:12:15.407737+00	87	Ben shop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
458	2023-02-06 16:12:31.183205+00	82	Mawoussé	2	[{"changed": {"fields": ["Damount"]}}]	9	1
459	2023-02-06 16:13:11.714709+00	82	Mawoussé	2	[{"changed": {"fields": ["Rest"]}}]	9	1
460	2023-02-06 16:13:36.216822+00	72	GRADO Shop's	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
461	2023-02-06 16:13:59.680779+00	47	Kevin shop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
462	2023-02-06 16:14:19.356303+00	45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
463	2023-02-06 16:14:40.183079+00	33	LOLA SHOP	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
464	2023-02-06 16:15:02.052002+00	9	C-Divers	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
465	2023-02-06 16:15:18.89472+00	12	Christi🥰shop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
466	2023-02-07 05:17:08.729116+00	36	ADIKPONTO Valette	2	[{"changed": {"fields": ["Full name", "Act err"]}}]	27	1
467	2023-02-07 05:19:19.032917+00	41	chang_parrain	1	[{"added": {}}]	8	1
468	2023-02-07 05:22:33.86136+00	278	chang_parrain	1	[{"added": {}}]	18	1
469	2023-02-07 05:29:37.850339+00	36	ADIKPONTO Valette	2	[{"changed": {"fields": ["Act err"]}}]	27	1
470	2023-02-07 05:46:07.358287+00	77	Ulvisshop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
471	2023-02-07 05:46:07.418854+00	77	Ulvisshop	2	[]	9	1
472	2023-02-07 05:46:41.772536+00	47	Kevin shop	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
473	2023-02-07 05:47:04.37189+00	45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	2	[{"changed": {"fields": ["Damount"]}}]	9	1
474	2023-02-07 05:47:17.933007+00	45	Vente de vêtements pour femme et homme, collier, bracelet, montre, jean tapette pour hommes	2	[{"changed": {"fields": ["Rest"]}}]	9	1
475	2023-02-07 08:38:44.778634+00	195	christieshop@gmail.com	2	[{"changed": {"fields": ["Username", "Email", "First name", "Last name"]}}]	6	1
476	2023-02-07 12:42:51.916419+00	57	HAPPINESS MARKET	2	[{"changed": {"fields": ["Rest", "Damount"]}}]	9	1
477	2023-02-07 12:46:47.522202+00	77	christieshop@email.com	2	[{"changed": {"fields": ["Whatsapp"]}}]	11	1
478	2023-02-07 12:51:00.623941+00	75	MAHOUGNON SHOP	2	[{"changed": {"fields": ["Name", "Rest", "Damount"]}}]	9	1
479	2023-02-07 18:33:07.701788+00	78	christieshop@email.com	2	[{"changed": {"fields": ["Whatsapp"]}}]	11	1
480	2023-02-08 04:01:09.898296+00	36	ADIKPONTO Valette	2	[{"changed": {"fields": ["Act err"]}}]	27	1
481	2023-02-08 09:44:15.82227+00	25	DUROJAYE  Marie Michelle	2	[{"changed": {"fields": ["Whatsapp", "Full name", "Act err"]}}]	27	1
482	2023-02-08 09:44:56.503548+00	25	DUROJAYE  Marie Michelle	2	[{"changed": {"fields": ["Act err"]}}]	27	1
483	2023-02-08 15:29:17.626053+00	4	bonus+	1	[{"added": {}}]	19	1
484	2023-02-08 15:47:32.438669+00	4	bonus+	2	[{"changed": {"fields": ["File"]}}]	19	1
485	2023-02-09 08:47:34.331815+00	25	DUROJAYE  Marie Michelle	2	[{"changed": {"fields": ["Act err"]}}]	27	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	app	user
7	app	feedback
8	app	zawadidetail
9	app	selleraccount
10	app	category
11	app	client
12	app	clientdemand
13	app	weekcustom
14	app	subcategory
15	app	abnfeature
16	app	usergame
17	app	label
18	app	admintoken
19	app	myfiles
20	fcm_django	fcmdevice
21	blog	subsubjects
22	blog	comment
23	blog	articles
24	blog	subject
25	blog	videoart
26	sites	site
27	app	parrain
28	app	retrait
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-03 19:59:59.191595+00
2	contenttypes	0002_remove_content_type_name	2022-12-03 19:59:59.211088+00
3	auth	0001_initial	2022-12-03 19:59:59.252682+00
4	auth	0002_alter_permission_name_max_length	2022-12-03 19:59:59.258552+00
5	auth	0003_alter_user_email_max_length	2022-12-03 19:59:59.265235+00
6	auth	0004_alter_user_username_opts	2022-12-03 19:59:59.271831+00
7	auth	0005_alter_user_last_login_null	2022-12-03 19:59:59.27828+00
8	auth	0006_require_contenttypes_0002	2022-12-03 19:59:59.281397+00
9	auth	0007_alter_validators_add_error_messages	2022-12-03 19:59:59.289268+00
10	auth	0008_alter_user_username_max_length	2022-12-03 19:59:59.295562+00
11	auth	0009_alter_user_last_name_max_length	2022-12-03 19:59:59.301928+00
12	auth	0010_alter_group_name_max_length	2022-12-03 19:59:59.310196+00
13	auth	0011_update_proxy_permissions	2022-12-03 19:59:59.316419+00
14	auth	0012_alter_user_first_name_max_length	2022-12-03 19:59:59.323366+00
15	app	0001_initial	2022-12-03 19:59:59.370078+00
16	admin	0001_initial	2022-12-03 19:59:59.391387+00
17	admin	0002_logentry_remove_auto_add	2022-12-03 19:59:59.399141+00
18	admin	0003_logentry_add_action_flag_choices	2022-12-03 19:59:59.408551+00
19	app	0002_auto_20221104_0634	2022-12-03 19:59:59.428768+00
20	app	0003_feedback_zawadidetail	2022-12-03 19:59:59.44551+00
21	app	0004_selleraccount	2022-12-03 19:59:59.463766+00
22	app	0005_auto_20221104_1125	2022-12-03 19:59:59.636932+00
23	app	0006_selleraccount_picture	2022-12-03 19:59:59.651717+00
24	app	0007_auto_20221105_2031	2022-12-03 19:59:59.675344+00
25	app	0008_auto_20221106_0633	2022-12-03 19:59:59.709779+00
26	app	0009_weekcustom_max_weekcustom_max_urg_abnfeature	2022-12-03 19:59:59.750999+00
27	app	0010_selleraccount_type_of_alter_selleraccount_status	2022-12-03 19:59:59.776805+00
28	app	0011_clientdemand_is_out	2022-12-03 19:59:59.788513+00
29	app	0012_abnfeature_rest_abnfeature_status_clientdemand_date_and_more	2022-12-03 19:59:59.884545+00
30	app	0013_remove_abnfeature_expired_remove_abnfeature_status_and_more	2022-12-03 19:59:59.952578+00
31	app	0014_remove_abnfeature_rest	2022-12-03 19:59:59.963549+00
32	app	0015_alter_clientdemand_is_out	2022-12-03 19:59:59.97759+00
33	app	0016_alter_weekcustom_demandes	2022-12-03 19:59:59.992202+00
34	app	0017_auto_20221108_1152	2022-12-03 20:00:00.014129+00
35	app	0018_auto_20221111_0336	2022-12-03 20:00:00.041237+00
36	app	0019_admintoken	2022-12-03 20:00:00.051085+00
37	app	0020_auto_20221112_0827	2022-12-03 20:00:00.076953+00
38	app	0021_auto_20221117_0505	2022-12-03 20:00:00.135568+00
39	app	0022_auto_20221119_1318	2022-12-03 20:00:00.158267+00
40	app	0023_auto_20221120_1604	2022-12-03 20:00:00.201572+00
41	app	0024_clientdemand_num_vend	2022-12-03 20:00:00.216044+00
42	app	0025_auto_20221126_1655	2022-12-03 20:00:00.255244+00
43	app	0026_subcategory_sub_box	2022-12-03 20:00:00.276885+00
44	app	0027_clientdemand_state	2022-12-03 20:00:00.290312+00
45	fcm_django	0001_initial	2022-12-03 20:00:00.324806+00
46	fcm_django	0002_auto_20160808_1645	2022-12-03 20:00:00.345036+00
47	fcm_django	0003_auto_20170313_1314	2022-12-03 20:00:00.359851+00
48	fcm_django	0004_auto_20181128_1642	2022-12-03 20:00:00.37496+00
49	fcm_django	0005_auto_20170808_1145	2022-12-03 20:00:00.392426+00
50	fcm_django	0006_auto_20210802_1140	2022-12-03 20:00:00.405728+00
51	fcm_django	0007_auto_20211001_1440	2022-12-03 20:00:00.430726+00
52	fcm_django	0008_auto_20211224_1205	2022-12-03 20:00:00.463847+00
53	fcm_django	0009_alter_fcmdevice_user	2022-12-03 20:00:00.487044+00
54	sessions	0001_initial	2022-12-03 20:00:00.503128+00
55	app	0028_selleraccount_whatsapp	2022-12-12 08:07:31.04922+00
56	blog	0001_initial	2022-12-27 07:57:45.662909+00
57	sites	0001_initial	2023-01-01 14:50:24.707777+00
58	sites	0002_alter_domain_unique	2023-01-01 14:50:24.720994+00
59	app	0029_auto_20230103_0234	2023-01-03 04:10:40.116515+00
60	blog	0002_articles_whatsapp_title	2023-01-03 04:10:40.133355+00
61	blog	0003_comment_date_seen	2023-01-04 03:46:24.009571+00
62	app	0030_category_dprice	2023-01-09 09:17:30.677588+00
63	app	0031_auto_20230109_0013	2023-01-09 09:17:30.757311+00
64	app	0032_selleraccount_dm_alert	2023-01-12 12:21:36.161573+00
65	app	0033_selleraccount_format_number	2023-01-22 11:49:12.614107+00
66	app	0034_auto_20230128_2300	2023-01-30 00:55:05.549516+00
67	app	0035_alter_parrain_veracity	2023-01-30 00:55:05.558473+00
68	app	0036_clientdemand_sold	2023-01-30 00:55:05.583884+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ud3da3jxgz1w20xkkkc1uysk3hv7kliv	.eJxVjMsOwiAURP-FtSEglIdL9_0GcrlcpWogKe3K-O9C0oXuJnPOzJsF2Lcc9kZrWBK7MMlOv10EfFIZID2g3CvHWrZ1iXwo_KCNzzXR63q4fwcZWu5r650nr6Ixtx60AOXQGTl5idYhCQKpAZG0m6QxSqNQHbshnAUZyz5fxl02oQ:1otC9D:6fShGMBbl4vjzK_cIBkisbIBQNMEV1hQQt0aqjssWAQ	2022-11-24 18:19:31.701844+00
mojfsrxce28unwkbay9p9ereuw34dydu	e30:1otRY1:R8-IF1xVvihNIJxlCn2epdal-8bgFUWPvcb80deUxSQ	2022-11-25 10:46:09.155714+00
98dhx5hw6r8amjffeblmib3bogzl78pv	.eJxVjMsOwiAQRf-FtSFAebp07zcQZgakaiAp7cr479qkC93ec859sZi2tcZt5CXOxM5MsdPvBgkfue2A7qndOsfe1mUGviv8oINfO-Xn5XD_Dmoa9VsXQgPgMzk3FaVMRiQnjAQDkzChBJFtCFobL61M6GxyqngtdSFwMgB7fwD3cTfl:1otRn0:oAA9n_KlJEjAT_G2wkgQftw5VSJ2JCg9xDdixZt8U5Y	2022-11-25 11:01:38.52167+00
qp0fbdeh5kjsrdl0bbwmx97wwbkjv85s	.eJxVjMsOwiAURP-FtSEglIdL9_0GcrlcpWogKe3K-O9C0oXuJnPOzJsF2Lcc9kZrWBK7MMlOv10EfFIZID2g3CvHWrZ1iXwo_KCNzzXR63q4fwcZWu5r650nr6Ixtx60AOXQGTl5idYhCQKpAZG0m6QxSqNQHbshnAUZyz5fxl02oQ:1otpIy:_SO-I7Gik-6Z5TkMvUOfS1_QSx-BpRuur1aEXY54-lI	2022-11-26 12:08:12.7295+00
n373f2ixsa5opywfudr7ja4xbsrv4o8q	.eJxVjMsOwiAURP-FtSEglIdL9_0GcrlcpWogKe3K-O9C0oXuJnPOzJsF2Lcc9kZrWBK7MMlOv10EfFIZID2g3CvHWrZ1iXwo_KCNzzXR63q4fwcZWu5r650nr6Ixtx60AOXQGTl5idYhCQKpAZG0m6QxSqNQHbshnAUZyz5fxl02oQ:1otqYu:WpxExetpg8e8nnO3cOvxX7PfoVWEvrELoWADgzi54EQ	2022-11-26 13:28:44.774915+00
ywx2flmwxxfvjumoh6smhqmbxgcszvui	.eJxVjDsOwyAQBe9CHSE-BpaU6X0GtLAQnERYMnYV5e6xJRdJ-2bmvVnAba1h63kJE7Er0-zyu0VMz9wOQA9s95mnua3LFPmh8JN2Ps6UX7fT_Tuo2OteR52ENVqAcgUiWekBczQKnXMDeofgPe6SBltAGmWtpkxDSSSylWDY5wvSoDeN:1otrpm:M1uQXU2ErKTaTaF2h4AgYucv6Q_40epLzPLf1FNZqLk	2022-11-26 14:50:14.889416+00
s9fuzmj5qbheaq10y88h0ip6d27umq68	.eJxVjDkOwjAURO_iGlnxloWSnjNY338MDiBbipMKcXdiKQV0ozdv5i08bWvyW42LnyHOworTLwvEz5hbgQfle5Fc8rrMQTZFHm2V14L4uhzu30GimtqaNLGBGZksaUcOHUfSMAZQE5RiSzfTaXYTgqMdoO9t4D0M4wAjPl8UujjG:1ovmxN:kAB2GsdSQkRg0DD5UEJom9-2KCFhE-vDap01IX_XN74	2022-12-01 22:02:01.129272+00
n6a7h6a96apjg08ghuj8n4gwgl4g941l	.eJxVjDsOwjAQBe_iGln-rZWlpOcM1q4_OIBsKU4qxN0hUgpo38y8lwi0rTVsIy9hTuIsQJx-N6b4yG0H6U7t1mXsbV1mlrsiDzrktaf8vBzu30GlUb_15KwBEx0woypuUkhWYdFMyUPRUUd2AOxBARbKSFgAEQob77z1Wrw_z_03UQ:1ovxd7:clho8pMRg5GndbsJRu8Q19EeDhTJVLGDryboMTwykCc	2022-12-02 09:25:49.503457+00
n6eba8ojwbi65iy3kwb0j5f7awx8cv36	.eJxVjEEOwiAQRe_C2pABLBSX7j0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERVpx-N8L4THUH_MB6bzK2uswTyV2RB-3y1ji9rof7d1Cwl61WmpCHMxC6zDBm64mNHjUwUFTgBjDekUf0QNYbb23KW-Ji0kmrCOLzBefMN-8:1ow0Us:KGwv5R1Zu5I3PR-J0nZh_CvmwjLk2P04iziUe0HemdY	2022-12-02 12:29:30.341138+00
efft18qw58filotflwdbwhpf2e1s7qy5	.eJxVjDsOwjAQBe_iGlnr2LETSnrOEO3m2TiAbCmfCnF3iJQC2jcz76UG3tY8bEuchwnqrII6_W7C4yOWHeDO5Vb1WMs6T6J3RR900deK-Lwc7t9B5iV_a5JAEBNND7bUwvpRfHIgJxE9E7xt2djONR7R2MQIlLoE6kkaA6_eH_d-OEg:1ow77J:kEY74sOuhcDu5nOwFwLgG26-NsQuTzQJNjziZ2Rqz48	2022-12-02 19:33:37.137396+00
145s8f6ghyuozm6v49gabzirhf0yvl6d	.eJxVjE0OwiAYBe_C2hCgfKW4dO8ZyONPqgaS0q6Md9cmXej2zcx7MYdtLW7raXFzZGcmLTv9jh7hkepO4h311nhodV1mz3eFH7Tza4vpeTncv4OCXr41jAeGGFQmn31KgYwBySmT0FpMgFR2sFFLhTBqCxBJnzVFI0YySrH3BzDoOCg:1p2Fte:vbFeqqUZTHTnvjK9fT9sRwXxZGLr7nEDzV22sWhJOAI	2022-12-19 18:08:54.380504+00
1szi7gs9jlthdhiwsq6kp6xub5vvpwna	.eJxVjDsOwjAQRO_iGlnr79qU9JzB8mfBAWRLcVIh7k4ipYBqpHlv5s1CXJca1kFzmAo7M-PY6bdMMT-p7aQ8Yrt3nntb5inxXeEHHfzaC70uh_t3UOOo2zoBaePtFlA0eenREwA5YRDJI0nI0SmCjBmlvBVMIKRRQhtLlJRlny_7eDeB:1p4hor:-8pnpNgTzZNL5LOimyJ6zjtNEdscYe_RAwn7dfq666Y	2022-12-26 12:22:05.503704+00
sjkglrgsu83n4qxpknwlvr8rg3wmfuwy	.eJxVjEEOwiAQRe_C2hCGtgy4dO8ZyJQZpGpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uzcr06_Y4jpYfUnfCd6m3Waa7rMo16V_RBm77OLM_L4f4dFGrlWyMYzsEYkwabkV0YELwVGjABIDjjIYeQPIvtBAxKtuAZeqAe_Zg79f4A4fU3HQ:1p7tOP:M8eKIpiIdbrmDX2PSJbgRjWW4J1-1BgAeCH5LenB1u8	2023-01-04 07:19:57.757176+00
ne0a9vezo6tgt4vnvef34mrklm09m5eb	.eJxVjEEOwiAQRe_C2hBgigwu3fcMZAaoVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hTuIitAZx-l2Z4iPXHaU71VuTsdV1mVnuijxol2NL-Xk93L-DQr18a8tsvMkOlPOI1qhzxAwa2Fk7Tcn4BANRUmgymGi9ggg4aPYKFWsi8f4ACPg3bA:1pCIiF:q_25zVdKY53LbTPcqwcrrQ8lcneG3k2ZcQH1zJjGxt8	2023-01-16 11:10:39.445457+00
iljh6r4esyc5em0fmrglvr5d37ww49k4	.eJxVjMsOwiAQRf-FtSFQGDq4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOwoI4_Y5M8ZHbTtKd2m2WcW7rMrHcFXnQLq9zys_L4f4dVOr1W7NHgxDBciRXNAGDLaNNpIsCMKhMsgkHJs_GK-fygBEZVfYOLI5avD8HxjeK:1p3Dwg:s_u9KZ3HimCFJtr3lGaUtrNvYts1qT_GzMexL5xDJ1E	2022-12-22 10:16:02.800494+00
5s1ol4kb9hz02ej4n1n9w0cduxdhy41s	.eJxVjDsOwjAQBe_iGlle4y8lfc5grdcbHECOFCcV4u4QKQW0b2beSyTc1pq2zkuairiIsxen3zEjPbjtpNyx3WZJc1uXKctdkQftcpgLP6-H-3dQsddvTYSQVY6GioshWtLO-WDIqAB2DME5AOIA7D0Upwswk8IRbYwxe43i_QEDZjfv:1p3IP4:6KrVH2VuaQ5UpcvNi0br1gxiqol4pbIEshRhSv5ymeE	2022-12-22 15:01:38.035891+00
iatvnfjf470jtlkvbuugpl4zppsf8cch	.eJxVjDsOwjAQBe_iGlle4y8lfc5grdcbHECOFCcV4u4QKQW0b2beSyTc1pq2zkuairiIsxen3zEjPbjtpNyx3WZJc1uXKctdkQftcpgLP6-H-3dQsddvTYSQVY6GioshWtLO-WDIqAB2DME5AOIA7D0Upwswk8IRbYwxe43i_QEDZjfv:1p3IP5:ADtQoZ2NlUtggytNdoMlqWJzMcc4N24BgDSrMUmjhlQ	2022-12-22 15:01:39.716068+00
z9m6hrxgt1puahdtg7hp64h0eklsnicz	.eJxVjDsOwjAQBe_iGlleR_6Ekp4zWOvdNQkgW8qnirg7iZQC2pl5b1MJ12VI6yxTGlldVRfV5RdmpJfUw_AT66NpanWZxqyPRJ921vfG8r6d7d_BgPOwryNwMOShj4Zy4MBsC3VowJVOIMdsrc-EKOKl7CxCD855hl5EyFj1-QId2DjE:1p8mRU:AXWVm9Pns-KmBFcBnCV5aDEvnldgweMmongBw2DNMoU	2023-01-06 18:06:48.318957+00
fcz6p4muui4f2x9h146uxusc634fnca1	.eJxVjEsOwiAUAO_C2pBX_rh07xkI8B5SNTQp7cp4dyXpQrczk3mxEPethr3TGmZkZ-bY6ZelmB_UhsB7bLeF56Vt65z4SPhhO78uSM_L0f4Naux1bI1FsJQAPKCetAAri8LifLbWiMmANUTGFfXVBAqxSFlMFlI5L7Nm7w_ARTb9:1p1l3K:oF9pwpT1DOaK6DwiaWQQRnTVSXG94GGqxOFxF6TWDXY	2022-12-18 09:12:50.104591+00
dgxypwaokc3i5358a4xqfe67dvx1rk2a	.eJxVjMsOwiAUBf-FtSFAHxSX7v0Gcl9I1UBS2pXx37VJF7o9M3NeKsK25rg1WeLM6qysOv1uCPSQsgO-Q7lVTbWsy4x6V_RBm75WluflcP8OMrT8rRHQiUXXp45hwt5YQ9QxEpkuhREQB0kenKAbYfKDIe-YEEKCJDagen8AH2c5vA:1p1l6W:-2r1uXlH1lRJU6uH2C2wMQcK6CgDZbqtLcFuSlWiUmw	2022-12-18 09:16:08.506863+00
d88uqkbo1kqxy5godpc6092wg8ninfrg	.eJxVjMsOwiAQRf-FtSE8C7h07zeQGQakaiAp7cr479qkC93ec859sQjbWuM28hJnYmcmBTv9jgjpkdtO6A7t1nnqbV1m5LvCDzr4tVN-Xg7376DCqN8ajTYOjAxaJKO1VKoASTeR9dYXra01wgtEgc4RoMrgzUTFWpAqQED2_gDavjdg:1p22mt:hOsVXB4oV4hK8lQkBkAb6xrMQE3rJAcf7TDMM22cZmo	2022-12-19 04:09:03.507908+00
uv00uq6j6h3n16e09k87e9vadg30xk70	.eJxVjEEOgjAQRe_StWmYUgbGpXvP0Mx0WkFNSSisjHdXEha6_e-9_zKBt3UMW01LmNScDThz-h2F4yOVneidy222cS7rMondFXvQaq-zpuflcP8ORq7jt24lt-QkEgNw9oq9IHlKnrRj7HMjiI5co5E59y4CQpYWIA25G1DJvD8SmDhA:1p2Acu:_VpfloJ83arb50GueXC3ZtoMAdYyra-i6JIjRLwDMdc	2022-12-19 12:31:16.932421+00
fon597u0x88zqfvmodv0lbk8gj5ddqdb	.eJxVjEEOwiAQRe_C2hAYpBSX7j0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnER2ojT70gYn6nuhB9Y703GVpd5Irkr8qBd3hqn1_Vw_w4K9rLVwN7SqEzMyg0IjDTkbLXyCbU3kc7WRcMEygJsngdnFEPGkQ1ZZi0-XwpdOBw:1p2AxN:7AA28QGaICMjC21ghhEVHm2Nx9tPjyRFS3aMLV-Y7vc	2022-12-19 12:52:25.359257+00
m0v53ldhr7osaukwqpvl40kajeb2e4k3	.eJxVjDsOwyAQBe9CHSFgzS9lep8BLbAOTiKQjF1FuXuE5CJp38y8Nwt47CUcnbawZnZl0rDL7xgxPakOkh9Y742nVvdtjXwo_KSdzy3T63a6fwcFexm11uRoyUJCmvKC3pEGHUkoAc57UJGUUYaUlBOCAZ_IZEE-WQEWrGGfLwsUN38:1p2E3Q:DkY3IdqneE8lS2nUqLe2g6BLqRjkLSUomN4jknK2v7g	2022-12-19 16:10:52.158398+00
z4a5xk9iq08yq6875ovw6bptqttm63fh	.eJxVjMsOwiAQRf-FtSG8B1y69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJYKffMWF-lL4TumO_zTzPfV2mxHeFH3Tw60zleTncv4OGo31r5UV21jnlMloASNrYREpC8LkWIQ2C18YFC9UkXUtWhNpJ4WshqhjY-wPnFDfr:1p2EXQ:OZg2BiqbQbGYiW1DE7jFLlyoZbi8HMkVsP9KiQMAgoU	2022-12-19 16:41:52.754316+00
85l2xn2c6qur75h4cie0gau1rat516hr	.eJxVjEEOwiAQRe_C2hBoKQMu3fcMzQwzStVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlmdlQ3q9DsSpoeUnfAdy63qVMu6zKR3RR-06bGyPC-H-3eQseVvDSw9CjGSN9FaZ7CPCSINkoQgBgtGEhjfAbnBw9WRuBQ6luiRMYB6fwAkTjin:1p2Fix:SYVbCCounfu1adKbark-P-X5Eacc0iXUotNzw5Xi3pk	2022-12-19 17:57:51.688343+00
aw9a9nfv7zaoicsozki0l3eetqi3xtas	.eJxVjDsOwyAQRO9CHSHCJ0DK9D4DWnYhOIlAMnYV5e62JRexNNW8N_NlAZa5hKWnKYzE7kxLdvkvI-A71Z3QC-qzcWx1nsbId4UftPOhUfo8Dvd0UKCXbS2QskUA751RUric0V4RJWkZwXgvEFQEMjrfXJIJHAgi7bZYg14h-60txzj9:1p3CAU:oetu9wQ1Ze6fd8c3VGKM0l62QJynzm4c5AVsWSG6dSk	2022-12-22 08:22:10.507241+00
vhq4mjzshc0kkf38rf3i1fz84bpbln4z	.eJxVjDsOwjAQBe_iGlne9Sc2JT1nsPxbHEC2FCcV4u4QKQW0b2bei_mwrdVvoyx-zuzMENjpd4whPUrbSb6Hdus89bYuc-S7wg86-LXn8rwc7t9BDaN-a6UmCClnaSiTLuSEVSaASQa1RZtAoJREIIASoozRaOeUnnTRFEVE9v4AAH03nw:1p2Mgi:uDbRGHLb10XLqWWhAUNLM751-Jwh1WBE8ctOnm0JCJ0	2022-12-20 01:24:00.711868+00
lmdoiere4bfmvuuytu1b9bxp6ptjvv2s	.eJxVjMEOwiAQRP-FsyFlu2uLR-9-A1lgkaqBpLQn47_bJj3obTLvzbyV43XJbm0yuymqiwJQp9_Sc3hK2Ul8cLlXHWpZ5snrXdEHbfpWo7yuh_t3kLnlbd2jeOsTBhoYeqIOghgIPFoi4i0JBuz9ELkDwMRozslYE0ebiMSy-nwBBZg3-g:1p2Ski:M3e51Mfl1C-xD6Uzag0KgCb5nUGhgKIH3tsUOyDQ26I	2022-12-20 07:52:32.8312+00
q7b5z4i0a6w993je89av1qdromfnm4r4	.eJxVjDEOwjAMAP-SGUV2nDaFkb1viBy7kAJKpKadEH9HlTrAene6t4m8rTlubVrirOZivDenX5hYnlPZjT643KuVWtZlTnZP7GGbHatOr-vR_g0yt7x_ncekjDcCGZBo6FKfUnDehwEQHLlAAqAiBIhOztB3EgILeqWe1Xy-2Lg25A:1p3DUm:yLDI4Lvy9PVch-6CCQHQJKf7E4M2UdRPav2QjCINzNE	2022-12-22 09:47:12.58537+00
9uj1mwgrv3dh4rvid4966nenmbewqnf6	.eJxVjMsOwiAQRf-FtSEDtAy4dO83NAMzSNXQpI-V8d-1SRe6veec-1IDbWsdtkXmYWR1Vs6o0--YKD-k7YTv1G6TzlNb5zHpXdEHXfR1YnleDvfvoNJSv3XsA4ZMFhNYkt5iNohBOnS2FGN6B5zIE0LpInkBB52JDDl68Mjs1PsD6uU3Qg:1p4j7c:SQZwan2tOqAuuZ6Qtw__X74WwTZ2WhR5Rl8byK_hqiI	2022-12-26 13:45:32.133185+00
siawkq06u6awsza5ooknaa6iu8vgvlqv	.eJxVjEEOgjAQRe_StWnoDNTWpXvO0MzQGYsaSCisjHdXEha6_e-9_zKJtrWkrcqSxmwuBtCcfkem4SHTTvKdpttsh3lal5HtrtiDVtvPWZ7Xw_07KFTLt1ZF3ypJhBAdI6sTze1ZoAvZZ4UBA0aljqOnxrXKHgHFuYaDB2Yw7w8k1zhn:1p2WTF:xeSR59EyL0_DY2VjF4bNumPneU3plQUjvJIjTA3Al1w	2022-12-20 11:50:45.137305+00
1rktl1tbwuccp4xxoq8u0pf8sc1qsgug	.eJxVjEEOgjAURO_StWla2tJ-l-45A_ntfAU1kFBYGe-uJCx0O--9eamet3XotypLP0KdVUPq9DtmLg-ZdoI7T7dZl3lalzHrXdEHrbqbIc_L4f4dDFyHb22pjcnJtfWMUGJOsFJgszPwIGFBkGibAm8pWoJBcgjBBybnoiH1_gAe1jgb:1p3Elw:u0uHlqvCTbsY2a994INSYgb4P72vq4XHUWg4nrYawLs	2022-12-22 11:09:00.98667+00
nx9qlw23duqswoxlman1guxbpefe03ao	.eJxVjEEOwiAQRe_C2hApTAGX7j0DGQZGqgaS0q6MdzckXej2v_f-WwTctxL2ntewJHERxorT7xiRnrkOkh5Y701Sq9u6RDkUedAuby3l1_Vw_w4K9jJqlRNEcAgZIjtkC0Yr7xWAJzaTiu7sZ455ZtbO-YnIG0bFRFaTYfH5Ah1uOL4:1p3M8R:fV2Y-tj4VEm3ZVey34ooN1TPU8u0Cvet2JiD7Kz28DM	2022-12-22 19:00:43.830278+00
sl82bwc6mqur88msk3r73gzcrlc80ez0	.eJxVjMsOwiAQRf-FtSF2yqO4dN9vIDMMSNVAUtqV8d-VpAtd3ntOzkt43Lfs9xZXv7C4iGEUp9-TMDxi6YTvWG5Vhlq2dSHZFXnQJufK8Xk93L9AxpZ713BAlwwbmyAyGdIBv3PkCSARwIQqaGU1OuuAMMVzsEwwOKuioiTeHzakOS8:1pAtLe:zyczYj3mXMOUo2HKwmTggwIcUVU_q4QhZAT1QX77XnY	2023-01-12 13:53:30.547053+00
lvtio4299hv1f03mr9opahinse1qbduz	.eJxVjEEOwiAQRe_C2hCGwkBduvcMZBhAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hSuIswIrT7xiJH7ntJN2p3WbJc1uXKcpdkQft8jqn_Lwc7t9BpV6_tbfFaC7WI6ZoI6MGBG9TQe8VaecIIjCMnPXgEAc9EnqjMIFRBADi_QHxIjbh:1p2ZDb:M6cDQ8aVXhDRnodiMqogCHVwLmMihNMUqg6Yp4gOGOE	2022-12-20 14:46:47.688845+00
4pygx8jzxbd4vhhkj1aqlegl61cjko7m	.eJxVjMsOwiAQRf-FtSEM5enSvd9ABgakaiAp7cr479qkC93ec859sYDbWsM28hJmYmemgJ1-x4jpkdtO6I7t1nnqbV3myHeFH3Twa6f8vBzu30HFUb81gPHRqxINFKFTElMih0UKh8rJbKU3GshJV6LPWVmI6JGMNnoiIGnZ-wMAhTff:1pCcsQ:1EMnUjzTXgvrNIBvM6iifLcQi4TPA7YhP_7hSlIc88k	2023-01-17 08:42:30.75593+00
2e2ory2wssj9ufgqbootbf6xnm1rnf85	.eJxVjDsOwyAQRO9CHSGM-aZM7zOgXRaCkwgkY1dR7h5bcpFMOe_NvFmAbS1h62kJM7Erk5pdfkuE-Ez1IPSAem88trouM_JD4SftfGqUXrfT_Tso0Mu-VhEInVcyKgFGo0SM1gklvCK7R2XQBky2Q7bjYEadHFmS2ZORJByyzxcG2Tfn:1p2bRa:kyAvaCnstkaLnqcBeTCHfl8j8CYfltlHApC3CCc8HNw	2022-12-20 17:09:22.076046+00
2m6gz0ktawpvkblwiq7e8hrp1s3xy38j	.eJxVjMsOwiAQRf-FtSEgjwGX7vsNZBhAqgaS0q6M_65NutDtPefcFwu4rTVsIy9hTuzCHDv9bhHpkdsO0h3brXPqbV3myHeFH3Twqaf8vB7u30HFUb-1iioXedYlqmQAAUmQMQ40eSkoOgsiWotZYAIyxbuSPGldjJKgfQb2_gD0PzgY:1p5vfU:0HK0I0DIxlZR6gAyOWxrKsHG9vg9Y1rlXjv1P-l6iq0	2022-12-29 21:21:28.333377+00
ogjtmzlaqcvtfysu6jtshygnfm4rua14	.eJxVjEEOwiAQRe_C2hAYCgWX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEW4MTpdyRMj9x2wndst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3VuyIQWuCAh6NHZMeSgiUB43WFmONdwjKQCFWiKM2AdCqZBT5RJ7F-wP_Vzfl:1p2dlg:JVhNJLLazaJa1DYXGLW5Zer6xFG4OlmguC5379rJN5E	2022-12-20 19:38:16.179565+00
evz1w807a8vnd4f985plfzfx8jeaiznk	.eJxVjEEOwiAQRe_C2hCGQgsu3XsGAsOMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hzuIsYBCn3zFFfFDdSb7HemsSW12XOcldkQft8toyPS-H-3dQYi_f2poBPXrtVBoQkmWPyuvkJz0yGXDEQCZjytqZES1BjsCOlaaJowMn3h8JWDhx:1p2emv:CQ5kX1dsuZjNU94EkM9WCzvehzmw51RWRBBHmj6_1f4	2022-12-20 20:43:37.297516+00
un2lu1jp83mptstwg0rjeyr8sb79cn28	.eJxVjDsOwjAQBe_iGln2-rdLSZ8zWP6BA8iW4qRC3B0ipYD2zcx7MR-2tfptlMXPmZ2Z1Oz0O8aQHqXtJN9Du3WeeluXOfJd4QcdfOq5PC-H-3dQw6jf2lEiExBllCJrCIqgEDhCBGUt6oJaCnJCCVPQCbIiAqAyNl-jBa3Y-wPBqTXh:1p2f7L:V-0QSZaD_v1Ih9odCzYyurDKpCudEh6gSvTyCxAEEHs	2022-12-20 21:04:43.740714+00
2zm4squf128q0ns2pn6dr441cgixc43g	.eJxVjEEOwiAQRe_C2pAZEIou3XsGMgODVA1NSrsy3l2bdKHb_977LxVpXWpcu8xxzOqsTFCH35EpPaRtJN-p3SadprbMI-tN0Tvt-jpleV529--gUq_fGsGmAgJOAp_Y0xDAGiPoQFxwxQNkxCIegj0yAyVAdJ6IbLIeB1HvD_MLN3w:1p2fB7:QAH5WDgxuLgmueMhnH-sygoCiXtPCANxJ-h-2C75hqc	2022-12-20 21:08:37.803385+00
hkzts9toqhaibbtwg07h0l45r3zkrvi3	.eJxVjEEOwiAQRe_C2pBOYQZw6d4zkIGhtmpKUtqV8e7apAvd_vfef6nI2zrGrZUlTqLOypA6_Y6J86PMO5E7z7eqc53XZUp6V_RBm75WKc_L4f4djNzGbw2Yg0GPJGR7EujQWkByNrFQ6Yz30NmQ-iEAEWdXvHeArk_IMBTn1fsDyHs2nQ:1p4Qqc:nSoNAETCCug0xKKoL_FJyidwHgibBCQuPEuxGIxhRio	2022-12-25 18:14:46.978095+00
2nxmixayhsfm96ch6jnhqgfn6ljbeqo5	.eJxVjEEOwiAUBe_C2hA_VP24dO8ZyIMPUjUlKe3KeHcl6UK3M5N5KY91KX5tafajqLMiUrtfGBAfaepG7phuVcc6LfMYdE_0Zpu-VknPy9b-DQpa6d_BxsgHcLJgAC4FEpAYdinDRZeZ-Vs4spn2zmTCQEcx2QQ-QaDeHyo1OPg:1p2n5i:f2gBqluQ31dRCmkum2xS6Rs6W6ULNxFb77z6BCCOyKE	2022-12-21 05:35:34.919607+00
mlq4scp7phf64rtorpsnykiyjl4x6map	.eJxVjEEOwiAQRe_C2pChMAFcuvcMZBimUjU0Ke3KeHdt0oVu_3vvv1Siba1p67KkqaizQq9Ov2MmfkjbSblTu82a57YuU9a7og_a9XUu8rwc7t9BpV6_dTA--CAWCxqxDBwZYgSLhEAOiMeQzRAAnRSDZCS66H0sI3MGN1j1_gDtOTd7:1p4eD9:zOblPS8FIj6dQCwpHttA29Kes72sdEZulNFVx4zv0CI	2022-12-26 08:30:55.148628+00
2z7wm1qp6ej8e2kh07qedmkuv93t2onb	.eJxVjEEOwiAQRe_C2hAoFIJL956BDDODVA0kpV013t026UK3773_NxFhXUpcO89xInEVRonLL0yAL66HoSfUR5PY6jJPSR6JPG2X90b8vp3t30GBXva1UxqHgJm084xGaWUNqjAqg0DZ6zyCS95AZiTQFIz1g9XWOWIPOxOfLwTqOH4:1p2nXb:Ili4NwsJ-8PiyseqajjikTOexSzcMHazOX5NW1ls4WQ	2022-12-21 06:04:23.679765+00
78c0ierslte25pizrrk5k3hj9t4eegx2	.eJxVjDsOwjAQBe_iGln-4Q8lfc5g7XptHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swrdjpd0RIj9x2Qndot85Tb-syI98VftDBp075eT3cv4MKo35r6YyzOisBpjjrwYEKiAAUnETUNqUQgKSFQMVracy55ESehJYCnMzs_QEKZDhh:1p2rnu:EpZiSGteWvRu6zRgX3K4MphRL2u8FzWS0SLhEbRq41M	2022-12-21 10:37:30.076273+00
3nfq2ccmp7h6onulh7zglbckazhwu4i6	.eJxVjDsOwjAQBe_iGlm24y8lPWewdr1rHECJFCcV4u4QKQW0b2beS2TY1pa3zkseSZzFYMXpd0QoD552QneYbrMs87QuI8pdkQft8joTPy-H-3fQoLdvDQZNZULrUXtmcOS4puCVBhsi-WIxECrHWNMAQ9SQvFPaRIXRYq3i_QEytzjE:1p2s3W:Wodr0ereFsq4Til0GyzOzQ40pCJR6AHFCQ5TS9INZkk	2022-12-21 10:53:38.427591+00
d4vq0pacs3vj4a6wpfbvo90jc1gsm9l7	.eJxVjEEOwiAQRe_C2pAZqNC6dN8zNDPASNVAUtqV8e7apAvd_vfef6mJtjVPW0vLNEd1Udar0-_IFB6p7CTeqdyqDrWsy8x6V_RBmx5rTM_r4f4dZGr5W4MjGBwaK8Fjz8IdOGOEBcCdE1lnIHIERGIjvSFM6MQO0VvB5KVT7w_5mDfp:1p2upN:a_FXnfBaCuS-fvOOORZE6a7NHUsz5sBOK8dKkoHFMf8	2022-12-21 13:51:13.183884+00
jpyr5wwoh6olroc15fot6tm5n5w10fu1	.eJxVjMsOwiAQRf-FtSFTOuXh0r3fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxJnoVCcfsdA8cF1J-lO9dZkbHVd5iB3RR60y2tL_Lwc7t9BoV6-NTjFrDE5M1kakay2GQYLMYAhzIDaBMyORqcpWwXOjDkhxyFo5olBvD_zKjfn:1p2w7a:7wtgPRyvdDmg5RtUC6h3S_MtTGdIRMAIVtbaHBDJIXU	2022-12-21 15:14:06.20152+00
1stoubw4xj5j7fsa2xmzp2n4kh5rkcr7	.eJxVjEEOwiAQRe_C2hBhgOm4dN8zNAwMUjVtUtqV8e7apAvd_vfef6khbmsdtibLMGZ1UUDq9DtyTA-ZdpLvcbrNOs3Tuoysd0UftOl-zvK8Hu7fQY2tfmuDZ_SpM2RLIPDFZnTkgMVgCQ4DBO7YFOspGGEG5EKdAFJI0YN16v0B3Wg3Eg:1p2xqy:zZbSgwvvNudViLmGVsHSS6qlzuTNWLe8z06iPU6M7bs	2022-12-21 17:05:04.056478+00
jnpyjrig8cggewgfihvm7a9kd7znadiz	.eJxVjMsOwiAQRf-FtSEDUyjj0n2_gfAYpWogKe3K-O_apAvd3nPOfQkftrX4rfPi5yzOAlGcfscY0oPrTvI91FuTqdV1maPcFXnQLqeW-Xk53L-DEnr51qRgiIqCIUcOwZlMdkgpjjpmxTwikLGar4wJNDiHhpNBhcFiBk1OvD_hFDby:1pD9g9:SKTAxmuzTN9Da_V-VWfxxb0wD5UZrRqwxrW3kaPSs14	2023-01-18 19:44:01.934389+00
2yxd2hsozqda6y5y1k0mtcgmar2hfnt5	.eJxVjDsOwjAQBe_iGlm217-lpOcMlj8bHEC2FCcV4u4QKQW0b2bei4W4rTVsg5YwF3Zm1rPT75hiflDbSbnHdus897Yuc-K7wg86-LUXel4O9--gxlG_tchOK4vZGoxZezFBsYYUIIEQzktBWhc1gTLSCELUKNGRixqTzxKAvT_dUTaf:1p8RdY:a5g3LtLsyAVZs5yNdlaApyYLgaF7P3csq4z1yHb_v0A	2023-01-05 19:53:52.84654+00
5e5871m2a83oshnzdd8434j059kn5g8v	.eJxVjMsOwiAQRf-FtSFAeUxcuvcbyDADUjWQlHZl_Hdt0oVu7znnvkTEba1xG3mJM4uzsEqcfseE9MhtJ3zHduuSeluXOcldkQcd8to5Py-H-3dQcdRvPRGHHJwDZ1LyzImcV6XAlC1ZsIaIwedAGgh0AHRWmaKN14WKdajE-wMY7jg9:1p2zeA:2SbIpimPiSMsSoFYVLpl1ytU0JNWPRLOintCRlG6txo	2022-12-21 18:59:58.932464+00
l2oshfi9quix3m8p7zt9jh6tgj7h0of9	.eJxVjEEOwiAQRe_C2hCGCR1w6d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAgjq9Lsmzo_SdiR3brdZ57mty5T0ruiDdn2dpTwvh_t3ULnXb83WOBeAEqeMniwmBB4YiLIZRs8OySAjuCzghUZvxQpQIQ8SghP1_gAUqzem:1pCPWW:XIaL0bPLdNBjda4zmwRFUkQEucmFmN1JTs4kTKKb4Sk	2023-01-16 18:27:00.019135+00
f75kxzv7734thgu1spk17xo4cc05oot2	.eJxVjMsOwiAQRf-FtSFTGAZw6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2Zmtjpdww-PnLbSbr7dus89rYuc-C7wg86-LWn_Lwc7t9B9aN-a1DSFKEEYrFWBkFKEtgCRUWhdYIkMEUCIwwGjVNQgGSDIfQSDFlk7w_KKzY1:1p8uEo:9Jjap2y8Z68ZNHFZi3bwfuFGjIbF5tFqfNfqHPtHL1c	2023-01-07 02:26:14.396445+00
74u5io7z4aabkqdr3x0db9ji4rkdgqrq	.eJxVjDsOwjAQRO_iGlmLvXgNJT1nsNafxQHkSHFSIe5OIqWAbjTvzbxV4GWuYellCkNWF4VWHX7LyOlZ2kbyg9t91Gls8zREvSl6p13fxlxe1939O6jc67oW7ymziDEYT-DEgiNYMzI45_CcISYrSEwIvoA5iifyjEgmsY1Gfb7zyjdC:1p3D0P:5NACeVjlWj2YVz_NqcEzg_ZHfCX01Sp6KxAKond6qag	2022-12-22 09:15:49.292304+00
89qdtfs6owiuncsikhr7xeg2oz3aut4k	.eJxVjEEOwiAQRe_C2hA6MLS4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EW6MTpdwwUH1x3ku5Ub03GVtdlDnJX5EG7vLbEz8vh_h0U6uVbTy5PCFEzcLKGAR1owESDRsxsw5gHR2gyOKsdKBsIdVbRKINRj5bF-wP4hTdc:1p5WAu:ar_Ell48nVokmscxnnkA-HYPv00izC_Dkimeo6Wm07k	2022-12-28 18:08:12.654697+00
xzucgv1lyghsbw0vvxmq2n1pfvt0kotd	.eJxVjEEOwiAQRe_C2hAYWhhcuu8ZyACjVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3EWoMTpd4yUHlx3ku9Ub02mVtdljnJX5EG7nFrm5-Vw_w4K9fKtrSFtEcibhCkSWAXWptEl9BQdD4aRRuAcNXgcrgCYnTZKDWgcERvx_gDzmTdv:1p3Dhe:fGOx9lA_uttAxGXwOTpTL-dZUAdeqIPw_1kOEJ3A1uM	2022-12-22 10:00:30.721304+00
tm5cecn4t51q6aplux26hznmzocfbi9e	.eJxVjDsOwjAQBe_iGln-Y1PScwZrd73gALKlOKkQd4dIKaB9M_NeIsO61LwOnvNUxEk4Iw6_IwI9uG2k3KHduqTelnlCuSlyp0NeeuHneXf_DiqM-q3JJlYcvGEOrCFoAohXbwMVZRjBG7QplOgSIwbn4YiWOCrjqVijQbw_JeE4tg:1p97aO:tMF6cCR_b2iayUYhNI5NdNuHxuzO_IxvNljoHmRoIho	2023-01-07 16:41:24.606362+00
au4pxjw6n798lwbndd94owbw66ygysmj	.eJxVjDsOwyAQBe9CHSEwLOCU6X0GtMsnOIlAMnYV5e6xJRdJOzPvvZnHbS1-62nxc2RXpjW7_ELC8Ez1MPGB9d54aHVdZuJHwk_b-dRiet3O9u-gYC_7OutkQACiDThQlohkjKFslAtjGF2EpOUAhDsQWQNmC1YkUM4FBZLY5wsjHTg8:1pFAQh:ieid0YbFe_J6IGlsfoQqAPIogYINUOkVCzUl_jjTAEE	2023-01-24 08:56:23.165706+00
xebuayvivb0rsfy2l5zzgeva1ncaveye	.eJxVjDsOwyAQRO9CHSE-9gIp0_sMCJYlOIlAMnYV5e6xJRdJNdK8N_NmPmxr8Vunxc-JXdkA7PJbxoBPqgdJj1DvjWOr6zJHfij8pJ1PLdHrdrp_ByX0sq8d6DyqjFmhBJAKSDkrXByAHOyZkbQhCWgtCZFEUFIHbVCrJEcyhn2--AM3gg:1p3GBq:3cFv9_iyDzQRmtEv2gbsv1pJz20aNvILYosMXfb2jI8	2022-12-22 12:39:50.15078+00
6ywcuxt53rowogpetu3cms6gag2k02hk	.eJxVjDsOwyAQBe9CHSE-ZlmnTO8zIFggOIlAMnYV5e6xJRdJ-2bmvZnz21rc1tPi5siuzEp2-R2Dp2eqB4kPX--NU6vrMgd-KPyknU8tptftdP8Oiu9lrwFtRIEoo8lq1FqKoA1ZDQYNxGAlkBqG7A0q2j3II5ARlIKSkDBI9vkC1J02_A:1pA8jK:b-P0kMybO_d_TeDoUiVWxgaCedZJjT7Fp45rtDU9tPc	2023-01-10 12:06:50.659956+00
ikb655yvzvmupv079p4fngorkrcquodx	.eJxVjMsOwiAQAP-FsyG7vPXo3W8gW1ikamhS2pPx3w1JD3qdmcxbRNq3GvfOa5yzuAivxekXTpSe3IbJD2r3Raalbes8yZHIw3Z5WzK_rkf7N6jU6_hmXyxS9haT0uTSmawBpsAFyGkkExQoVBqcAyyMjMGnHAom0AZIfL4AXzeF:1pAaHw:qWdD25hXd1dMQDBA07g2FwotrWuKMCH7Vw4T9JlyEYU	2023-01-11 17:32:24.176993+00
fgusxu5u6ejktl8uab23ky0ly6u4qkts	.eJxVjMsOwiAQRf-FtSHAAFNduvcbyPAYqRqalHZl_HfbpAvdnnPufYtA61LD2sscxiwuwqA4_cJI6VnabvKD2n2SaWrLPEa5J_KwXd6mXF7Xo_07qNTrtnZaocfBMTCYgZQhb6ONEVArIHWG7MBzAu3KxpKxmL11yAicCzsrPl_b7jdI:1p3jwc:5yi9-b3noU4GzyMZS5Dht6QvKt5yMUKCjE3xzQxigb0	2022-12-23 20:26:06.150714+00
nf895y5wv9fyoph8dvd5vjjzu0j93dm9	.eJxVjDEOAiEQRe9CbciCwIClvWcgzAzIqmGTZbcy3t2QbKHFb_57eW8R077VuPe8xpnFRRgvTr8nJnrmNgg_Ursvkpa2rTPKociDdnlbOL-uh_sXqKnX0QVjJmAwoegxJNBEhRAKQQioiDwZx0Erl8_WWIXoU3aTD5bJW_H5AgyvOCw:1p6uKg:S0Aqv5460mnXPGhYKkYOmEx6x3QHwdWks3F5LnN68qw	2023-01-01 14:08:02.723657+00
9doxzzsa8gko86be0tr8ix4sejpuc067	.eJxVjMEOwiAQRP-FsyEUWth69N5vINtlkaqBpLQn479Lkx50jm_ezFt43Lfk98qrX4K4CqvE5RfOSE_ORxMemO9FUsnbuszyUOTZVjmVwK_b6f4dJKyprWG0wEGz0jxoQNURD9FEi8aACWPfa3JAZFzEFqMcYIOKO9IBLaD4fAEGNzgz:1p6zGi:9ql1PIrKTg6tamH7kU991IxB5Pq2v0FPALnx3nYogaM	2023-01-01 19:24:16.520747+00
ktoh0xpbekvmk01ox7oqiiein2eapnwi	.eJxVjDsOwjAQBe_iGln-Zh1Kes5grXdtHECOFCcV4u4QKQW0b2beS0Tc1hq3npc4sTgLb8Xpd0xIj9x2wndst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3DmATsQePKukyOgZMahycKQENB1Oczq4Ey8qRVg4IAAFGP2gVyBgS7w8EFjd8:1p45oQ:7Sq0_JWW6jik6TdPHkySvVeel3Abwe-sL6MOU4yADss	2022-12-24 19:47:06.053129+00
oknmk1czf9jp51hybdu2tlh1tlnrp12e	.eJxVjDsOwjAQBe_iGlmOvzElPWew1t5dHECOFCcV4u4QKQW0b2beSyTY1pq2TkuaUJyFjeL0O2YoD2o7wTu02yzL3NZlynJX5EG7vM5Iz8vh_h1U6PVbx8KsgyIT2HIBE7yJmpgDDtkZGyyDZ-cGxUpldCPYQtrDiApt1J7E-wMgljh4:1p48s0:eXhiSywivGJbp1wHwfE2ExhexxZyf6nbFadvcb4Is44	2022-12-24 23:03:00.282861+00
teany4au8dbg0fk8fbfqp8hwp8hd8htz	.eJxVjDsOwjAQRO_iGln-bexQ0nMGa71ecADZUpxUiLuTSCmgmWLem3mLiOtS4tp5jlMWZwFOnH7LhPTkupP8wHpvklpd5inJXZEH7fLaMr8uh_t3ULCXbW0NGQvKK0qDS9oDADt3M4SeaUsMevCcdQBWmSwmoHFEIKJg0UAWny8DGziE:1p4Ij9:CN6_DmzED4K1r2SoZyMJoG3VLjHAE-UPW_h9uAPDMpA	2022-12-25 09:34:31.626057+00
gsddcewzywpr12xjogrmm88g4c4m24dm	.eJxVjEEOwiAQRe_C2pCBQgGX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEW1orT70iYHrnthO_YbrNMc1uXieSuyIN2eZ05Py-H-3dQsddvDUEBogZgowYHSVviMRApj2CdIuZSdPHeGFNoLCko54ZEnsg77Y0W7w_6IDfN:1p4K6z:9-F6A8-ynsPQfaYdID7HxL304RJbSkp5iTF82pnLY9Q	2022-12-25 11:03:13.583175+00
xu9kldojrltuep6osw7o51y2e45qnbgg	.eJxVjEEOwiAQRe_C2pCOHSh16b5nIDMwSNVAUtqV8e7apAvd_vfefylP25r91mTxc1QX1ffq9DsyhYeUncQ7lVvVoZZ1mVnvij5o01ON8rwe7t9Bppa_NcM4nh1aZDQ2gZAB6Qx1iJKYB7AGrRhCiDgYJ4mSY-5JXGAiEKfeH_vNOJI:1p7Inz:IviPa4Ai04FNcLLPp67xYeTV4whmIrmk38Bwu2uG_ec	2023-01-02 16:15:55.045637+00
e4gc3jkji2ofzvqwm26gnig12hf4sa1e	.eJxVjDsOwjAQRO_iGll2_KekzxmsXXuNA8iR4qRC3J1ESgHVSPPezJtF2NYat05LnDK7MivZ5bdESE9qB8kPaPeZp7mty4T8UPhJOx_nTK_b6f4dVOh1XxNkLVyyVgYjQEpnJSZvskdVtBvEHmagEDA5qaCQU0QIXhQE1Aoc-3wBBnI4iw:1p7ddf:sJePOL5mz0R29my08ycNImsLVCG811z2tf27vCiCnPM	2023-01-03 14:30:39.27825+00
wbe3soie1ozqklenl3l9658crcb5d4km	.eJxVjDsOwjAQRO_iGll2_KekzxmsXXuNA8iR4qRC3J1ESgHVSPPezJtF2NYat05LnDK7MivZ5bdESE9qB8kPaPeZp7mty4T8UPhJOx_nTK_b6f4dVOh1XxNkLVyyVgYjQEpnJSZvskdVtBvEHmagEDA5qaCQU0QIXhQE1Aoc-3wBBnI4iw:1p7dft:ELG_fKVsPj-c55wits-MgCWVJUkYh_FnVweyqLhfO0s	2023-01-03 14:32:57.877902+00
t9w5s3xsj4repxi94zyng2ir3t37d35v	.eJxVjDkOwjAUBe_iGlnxGoeSnjNEfzMJIFuKkwpxd4iUAto3M--lRtjWadyaLOPM6qyCVaffEYEeUnbCdyi3qqmWdZlR74o-aNPXyvK8HO7fwQRt-taGeosYIQ3E2WbyBhi7lDy6yOx7F8SF3lmJNol4k0wmy50fkCD6PKj3Bx2qOGs:1p7dlH:HKxob-1fcl89LOR0Md5e1Ln1KoiB8WSPfHJuO5WS-R8	2023-01-03 14:38:31.440663+00
eupetnf5w5bodlmhd4s80yyltjlzaj13	.eJxVjEEOwiAQRe_C2hCgMDQu3XsGMjCDVA0kpV013t026UK3773_NxFwXUpYO89hInEVWonLL4yYXlwPQ0-sjyZTq8s8RXkk8rRd3hvx-3a2fwcFe9nXnsBGVmPKHjUCsrMAIw7JcjZWE9AAdgce0NCgiJVxbLSOZHICZ8XnCxINOCQ:1p7drv:ZEK2Qln4AtN3mxyaMlfUdgLzuhzXXZhEAASPk1JBWeM	2023-01-03 14:45:23.064533+00
c8hpht2yqi5nnw0i3e6vcus717ps2s25	.eJxVjMsOwiAQRf-FtSHDMIPg0n2_gfCKVA0kpV0Z_12bdKHbe865L-HDtla_jbL4OYuLUIrE6XeNIT1K21G-h3brMvW2LnOUuyIPOuTUc3leD_fvoIZRv7XVAGiVJmcoQzKsi1HFWTRsKaLJBMwM0RouoAMGhjOmmLV1yIQk3h_ZijYg:1pCIuB:Jr8dsju3azzerhNRGPPAYjSRJQ9iNIRCekniBDAeNCA	2023-01-16 11:22:59.36597+00
so3p51rp3f6pq3fja718qux6sbhvkurn	.eJxVjEEOwiAQRe_C2hCmgIBL956hGWZGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uTgpjU4XfNSA-pG-I71lvT1OoyT1lvit5p15fG8jzv7t9BwV6-tTl6Tz6AxTQIBA6BwXLK1gZvbDbokL3lCF7MYNJVSAjERXIAAZjU-wMRCjfO:1pNKPx:ez440eJk5fb-aC_gDJV4BMNqn9x3Z6qb7FkxvdC1pF8	2023-02-15 21:13:21.981487+00
uvy8p38sznks6vg3rkzgcmc7gkcqxwuu	.eJxVjDsOwyAQBe9CHSG-BlKm9xnQwi7BSYQlY1dR7h4huUjaNzPvzSIce41Hpy0uyK5MBscuv2uC_KQ2ED6g3Vee17ZvS-JD4SftfF6RXrfT_Tuo0OuodUJTCpkirfPGeQDwOshMFo3TwpICZQMJp0TSqDKUTJCsmiaSkjz7fAFIVjjK:1pP57v:OaCfSyQEqMFYMnL2yhQcOQXw_MZa6SHo3fnXH65qDJI	2023-02-20 17:17:59.166489+00
8j4b3kf871psw8o3h5xnvx70mi2uzzi1	.eJxVjjsOgzAQRO_iOrKwWf9SpucMlr27xCSRkTBUUe4ekCiSdt6b0bxFTNta4tZ4iROJq-ituPyGOeGT60Hokep9ljjXdZmyPBR50iaHmfh1O92_gZJa2ds-gwM2ITsmk5VyMBpwHWqFQMr3KmiLgRGs6TkAWqfdaKxJPlBH-6vPF_DBNzY:1pDA59:bR0iHV_sHiXe2VVsVWeQhir-MPL49ff4-1oCaAtejWw	2023-01-18 20:09:51.905012+00
bfq74vufxprcvvgjz57m9h4elybp8zjk	.eJxVjDsOwjAQBe_iGlnLxl9Kes5grXcNDiBHipMKcXeIlALaNzPvpRKtS01rL3MaRZ0UAqjD75qJH6VtSO7UbpPmqS3zmPWm6J12fZmkPM-7-3dQqddvDRYoOLAM6Io3zpUM6HFAw97HY2AkFgkGmS1FM4gNeWAbrwEkGkPq_QH89Tdy:1pP7IY:lIkOUrXyVrA5Z3yfk2YGEocmr0BETDFY-ytG0U3Ayek	2023-02-20 19:37:06.869163+00
ag7yoflczh0heoaczgqq597nrnvkk8wf	.eJxVjDsOwjAQRO_iGlm2d-MPJX3OYHn9wQHkSHFSIe5OIqWAcua9mTfzYVur33pe_JTYlUlgl9-SQnzmdpD0CO0-8zi3dZmIHwo_aefjnPLrdrp_BzX0uq9JBZWxGARHoDRplQZKKiGIMoDLQIgCrUO5h2IiaiuNk8JqYUS0in2-8Ek2ug:1pAuOX:TE1v3Kn1UCwHmmESuu73CaRaBgwwpn5885OlPB53lB8	2023-01-12 15:00:33.983603+00
dmgupix6ci4yrujyg0yhrvshcla4ouqv	.eJxVjMsOwiAQRf-FtSFMGWjr0r3fQGZgkKopSR8r478rSRe6veec-1KB9q2EfZUlTEmdFXRGnX5XpviQuaF0p_lWdazztkysm6IPuuprTfK8HO7fQaG1fOs4eBCxBhgzWOcwI3TesffSMxPB4Aw6RMsmuzSOnJs7YtdTQvCi3h8RfzeT:1pCPvE:UBl7NeYAjVrXpiKbIjF8bXLwO7wPRoA1IXMeHIBpkFU	2023-01-16 18:52:32.407573+00
n2uxv4wlhtsip59jc0o5l5vatldh92qa	.eJxVjMEOwiAQRP-FsyEUKCUevfsNZNldpGogKe2p8d8tSQ-auc28ebsIsK05bI2XMJO4Cm3F5beMgC8ufaEnlEeVWMu6zFF2RJ5rk_dK_L6d7J8gQ8vdi5gIYbQTOOeATTKOwZvoUY1xACantfYerVFHIOnoLU1DtMdNsRGfLymCOK0:1pNKSB:OcXsYpPGjrUYJDU9V6xDYy9mFSoYZVsC7CxtJI5ClV8	2023-02-15 21:15:39.872142+00
7vt3htytsavicn02qzl9n7x92vfnbyax	.eJxVjDsOwjAQBe_iGlleR_5R0nMGa-1d4wBypDipIu5OIqWA9s3M20TEdalx7TzHkcRVAIC4_K4J84vbgeiJ7THJPLVlHpM8FHnSLu8T8ft2un8HFXvd6wzJKfZsldOUNPIAJbANQYMzOxlQKaSsOAPqQOSLQTAYvKaiiiXx-QIx9Di3:1pBfsQ:8uKaEWjJMoyNYpAZUq8YSiJyi_2K8yDS9hZG6HhFMBQ	2023-01-14 17:42:34.5241+00
nmbkhhxhbunxqr62p9h0in4uux3lfwdi	.eJxVjE0OwiAYRO_C2hCghYJL9z1D8_1FqgaS0q6Md7dNutDNLOa9mbeaYFvztDVZppnVVdluUJffFoGeUg7EDyj3qqmWdZlRH4o-adNjZXndTvfvIEPL-9pDiAG4FyPeWQbqwQeQ3hMPJu0RUnQGExr0iQxhRylisDIEJsdRfb5BODjN:1pE8aN:PoszObfTZcGeVzrJos3vLXpbj84IYPUy9u6BAVW54s0	2023-01-21 12:46:07.234667+00
encrsmchg8ic4tmtsbt83h2my6l87lsb	.eJxVjEEOgjAQRe_StWnKTFtGl-45QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcVcTERz-h0zy0OnnZQ7T7fZyjyty5jtrtiDVtvNRZ_Xw_07GLgO35qaAALxXLQgZczSU_DEfRAfIRK2TQaHqNizkhYC9S5DaFmgdR6CeX8AAyU3qA:1pFZIU:piYmaFgqnbVpqisThARPp3pTpzicZC2FTCJBCaBxJsk	2023-01-25 11:29:34.91578+00
cirnz539rc6oh5stf4odtdwikc50rvoi	.eJxVjMsOwiAQRf-FtSFAh5dL934DYRiQqoGktCvjv2uTLnR7zzn3xULc1hq2kZcwEzszLdjpd8SYHrnthO6x3TpPva3LjHxX-EEHv3bKz8vh_h3UOOq3lrnYCTRM6L2zpoDWSRTjkjeQyGZZHBWMStgofbLKAGUCq5GgoNSKvT__HDgh:1pFwZO:ftNbGb4fLNWMr8NK5-ZDFOBdoe21uXqbQjKYoDX4TZs	2023-01-26 12:20:34.809362+00
1apnvg9ax261g6tsuqx3kcfa14pybrlj	.eJxVjEsOAiEQBe_C2hAYoAGX7j0D6abBGTWQzGdlvLtOMgvdvqp6L5FwW8e0LWVOE4uz0CaI0-9KmB-l7Yjv2G5d5t7WeSK5K_Kgi7x2Ls_L4f4djLiM3zpnH8FkFwNXBM-oUFWrbSXSSkVTs0fjNYPW5ACicWAtDwRqKBQsi_cHNSI4BQ:1pE8ge:QawvNa6jRRilqxhLo57ZNpkpKwx9VXMvuHYt1w5OuCk	2023-01-21 12:52:36.317797+00
yjfvzg7d39cpastyam5kgq0txc5du3ke	.eJxVjEEOgjAQRe_StWlaZlpal-45QzPMFEFNSSisjHcXEha6_e-9_1aJtnVMW81LmkRdlfWgLr9rT_zM5UDyoHKfNc9lXaZeH4o-adXdLPl1O92_g5HquNemaZC86we2LjBiNt7EEKwTgegRYgB03gLz7oFrEQci0wpbbiM0UX2-_AQ27A:1pNZq1:RM638bvz41B0uOslKm9pZVsWyjqUDepFLeiPRJ6tP0A	2023-02-16 13:41:17.219257+00
lm21ggsgjjdi0knb70e5tctum4gtq6er	.eJxVjMsOwiAQRf-FtSEMDIW6dO83NAPMSNWUpI-V8d-1SRe6veec-1IDbWsdtoXnYSzqrDCq0--YKD942km503RrOrdpncekd0UfdNHXVvh5Ody_g0pL_dYWxTBCDMF1nDFJJEceoRMyJiYfEJyIZaCQxHYMHkoPgtgbn2MM6v0B_EM3fw:1pHYk7:EsfA7G_pE7hhPGwPiX-9W9VtsH0FM85A26kZwyN5iyc	2023-01-30 23:18:19.687608+00
8cdrrng3er5rdwtyecxxhg6sftxea87f	.eJxVjEEOwiAQRe_C2pBCK8O4dO8ZyACDVA0kpV0Z7y5NutDte-__t3C0rdltjRc3R3ERSpx-mafw5LKL-KByrzLUsi6zl3siD9vkrUZ-XY_27yBTy309eGTUAzJZYFbAiRCAEVBZ0mOiKY7hjNEAmmQno_wYsEPjdfc2is8X6V03_w:1pIB2S:17iJtC2rVbcUGZkj-Zy1sJJMVmymsvlEvLoG_bADSfs	2023-02-01 16:11:48.127956+00
yxt3a2pye9t862g20oyl3rc9d6s0ge6p	.eJxVjMsOgjAQRf-la9O0U1qKS_d-AxnmIaihCYWV8d-VhIVu7znnvkyP2zr2W5Wln9icDThz-h0HpIfMO-E7zrdiqczrMg12V-xBq70WluflcP8ORqzjt9YcXaLON0G8tlEDtagEDI2IMiFkTUARUsiSXHReETrMyFGH5CmZ9wcWsDiV:1pP7Lj:9aB3VALOtjrqnP0U-koYJEYArZoytQ0mPT0ZoCRS4Ig	2023-02-20 19:40:23.365236+00
89sarw1v6tygh5kd8irjs81ktxe9f32p	.eJxVjEEOgjAQRe_StWlaZlpal-45QzPMFEFNSSisjHcXEha6_e-9_1aJtnVMW81LmkRdlfWgLr9rT_zM5UDyoHKfNc9lXaZeH4o-adXdLPl1O92_g5HquNemaZC86we2LjBiNt7EEKwTgegRYgB03gLz7oFrEQci0wpbbiM0UX2-_AQ27A:1pNZq3:9_EN4WyWUyO2fedv_EwQWbLg3YdTYKIBmvlgFXy1MdE	2023-02-16 13:41:19.081712+00
iuf425r6wxj7i24ikcjoyq8leg6zec3s	.eJxVjEEOwiAQRe_C2hAoDK0u3XsGMjMwUjU0Ke3KeHfbpAvdvvf-f6uI61Li2vIcx6Quyg5GnX4pIT9z3VV6YL1Pmqe6zCPpPdGHbfo2pfy6Hu3fQcFWtjUidGiCyCBkHXXAjggE2DP0wTA7pDM78Ul6sey9zxk3DIEoBGvV5wtcgTlu:1pOANZ:4iaYTPskTkGn-iK-bx4hHf_kmL_ewDaKv8Q7VPIEYOM	2023-02-18 04:42:21.949535+00
s8cy6z0ko4n023uz58gs3cygsa7ekp2i	.eJxVjMEOwiAQRP-FsyFQUBaP3vsNZFkWqRpISnsy_rtt0oMe5jLvzbxFwHUpYe08hymJq9DOitNvG5GeXHeUHljvTVKryzxFuSvyoF2OLfHrdrh_BwV72dYZNWdlFQN5dGgJDIAncEQefE6azkMy4DLyluECSI4jGqNQG6Oz-HwBUJA5Cw:1pKxYE:ij55rzxhqLzshsKdYePGjnhfm6rEBq8yXMDyzPfGrRc	2023-02-09 08:24:06.498343+00
wl0rnhxdx4ad8r06y1vw27rkj3r4vhfy	.eJxVjEEOwiAQRe_C2hCYQgsu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EW2htx-l0J44PrjtId663J2Oq6zCR3RR60y2tL_Lwc7t9BwV6-9YTgOMKgCbJTmcACj85pY_3gCQFHzdEwM0TLGUFrM1H0KjEZpZDF-wMyAzi3:1pOeuh:JQptm5UANlW855rPcABLzh3UV2rh8OUZ3NnoatJVkX4	2023-02-19 13:18:35.909566+00
cnbg9x43tmqqxr3z14p6k1lhp11u643f	.eJxVjDsOwjAQBe_iGlk4_iRLSZ8zRLtrLw4gW4qTCnF3iJQC2jcz76Um3NY8bS0t0xzVRZm-U6fflZAfqewo3rHcquZa1mUmvSv6oE2PNabn9XD_DjK2_K0DAIiTYIE7y1asZwRwfWIIw5mEUAA5AuLgjZAl700UTxQcRWSv3h9B4Tl0:1pOlRy:yUUgVezOnDtCo6TQLgeGXSGfNDo5opPhlw-5NDvndlg	2023-02-19 20:17:22.608389+00
cwci7hds61d7natf3zy4wbbh7esegh0k	.eJxVjEEOwiAQRe_C2hCgyIBL956BMDMgVUOT0q6Md7dNutDte-__t4hpXWpce57jyOIidHDi9Esx0TO3XfEjtfskaWrLPKLcE3nYLm8T59f1aP8Oaup1W1sE5qAKBGJvC-hM3qFLylJIxmwcLSvHoM6U0TsYisNSsoGBrDZBfL5KKzi7:1pOyyB:cA_X5Jep1IOuJZLFesYQwUjndgzEu0VnT1hthE0G4xE	2023-02-20 10:43:31.851966+00
24buhvi2xwnozmam1khbe6s1ymc5jtoj	.eJxVjMEOwiAQRP-FsyG0CwIevfsNhN0FqRpISnsy_rtt0oPeJvPezFuEuC4lrD3NYWJxEUaJ02-JkZ6p7oQfsd6bpFaXeUK5K_KgXd4ap9f1cP8OSuxlWw9IyGQyKOvMlpWK2o_GsUawmBjB-AGyPVs9ZmByThNb8sZB0o68-HwBGxE4Rw:1p7duU:tIYDdIzGxN9KLL744Qtim8fbnyxWoWVR6x8vDOD_3iY	2023-01-03 14:48:02.702915+00
j5ee3br2qwo5mo9yryps52y89fg5cez0	.eJxVjMEOwiAQRP-FsyG0CwIevfsNhN0FqRpISnsy_rtt0oPeJvPezFuEuC4lrD3NYWJxEUaJ02-JkZ6p7oQfsd6bpFaXeUK5K_KgXd4ap9f1cP8OSuxlWw9IyGQyKOvMlpWK2o_GsUawmBjB-AGyPVs9ZmByThNb8sZB0o68-HwBGxE4Rw:1p7e0e:tf7GsJADa4UJse7D_23vFJmUzs_nxGv8-AWPm5VQRTk	2023-01-03 14:54:24.800901+00
3i81w4koiw2ml5fjw7v99pw6pg3bt3up	.eJxVjMEOwiAQRP-FsyHUFhY8evcbyC4LUjWQlPZk_Hdp0oPeJm_ezFt43NbstxYXP7O4iPEsTr-QMDxj2Rt-YLlXGWpZl5nkrsijbfJWOb6uh_t3kLHlvlYD6hBGh0jUg2LLQCkpQzAo4AgMCZTW6FixMxNPJsYOwmggOGvF5wswUDih:1p827w:yqFHl0TEjYft8dzdy9uiNp8rI-NY33CwOoGvXEsh82k	2023-01-04 16:39:32.546678+00
7wxob91j4ae0b7d7os9xcmbd9vcowqxh	.eJxVjEEOgjAQRe_StWlAOp2pS_ecgUxnWosaSCisjHdXEha6_e-9_zIDb2sZtpqWYVRzMW0L5vS7RpZHmnakd55us5V5Wpcx2l2xB622nzU9r4f7d1C4lm8NgDkkyF4oCFCn6ewbzRIJHaoKNwEixCZkZEBynrJ0jIjJETlR8_4APMU4oA:1pCJJT:JqjgJnHmDzFnPksCYPdjAvdzAApv3I7h47lv6gRowTk	2023-01-16 11:49:07.461793+00
xs2i742x0vbemnncog8loz22ghs5db5c	.eJxVjEEOwiAQRe_C2hAGYQCX7nsGwsAgVdMmpV0Z765NutDtf-_9l4hpW1vcOi9xLOIiAFCcfldK-cHTjso9TbdZ5nlal5HkrsiDdjnMhZ_Xw_07aKm3b625YrZKZXKIoVJAcMzKaCAFaDwbT9mA9wpUtVVDBW0z2zM6ChSKeH8AGpI3qg:1pCJKR:lixYqmuFt1m_Q_IVn1n2nnjMsobor2oCoKz1I32apHQ	2023-01-16 11:50:07.071848+00
vj8p4j0dcl0xwahi5z63wxfx1dmgb9q5	.eJxVjDsOwjAQRO_iGllO_A0lPWewdtdrHECOFCcV4u5gKQV0o3lv5iUi7FuJe-M1zkmchTfi9Fsi0INrJ-kO9bZIWuq2zii7Ig_a5HVJ_Lwc7t9BgVb6eiRWegSjDaP3OlidQ2YgHwZ2PgNrB9ZaxIBeQQbkaSJNytHwDUm8PyLEOQQ:1pAax3:fqCEIs6bWTroq_KR6_eywiJxKvuOr2SkmNiWaUhsXVI	2023-01-11 18:14:53.377385+00
kvas6g7b0nma8qef69i6hvi4ww3c0olh	.eJxVjMsOwiAURP-FtSG8Hy7d9xvIhUulaiAp7cr475akC13NZM7JvEmAfSth73kNC5Ir4VKRy-8aIT1zHQgfUO-Npla3dYl0KPSknU4N8-t2un8HBXoZx5jdzHQSzirJxZHec50ckxJAeZTOyORNZtYIF7VymuHRDZsZgrWefL7-KTbL:1pDAzq:eFR7Ox-InWffk2op0onKPWm4A4K4-sDQnXmKtkqOjkU	2023-01-18 21:08:26.981475+00
e2yq1osqsjxvn5ssktprq394jdot1b84	.eJxVjEEOwiAQRe_C2hAGChSX7j0DYZipVA0kpV0Z765NutDtf-_9l4hpW0vcOi9xJnEWoMTpd8SUH1x3QvdUb03mVtdlRrkr8qBdXhvx83K4fwcl9fKtp8FY8DASGkY2gdFmzd7oKTirjYcQ1IhuQAU5ARhyREhKa-fAJuXF-wP3Ujdi:1pLM15:xXBmrVNAPKwrsfOrlYiMhfb4Djf5kws6pxFplDsDNtY	2023-02-10 10:31:31.110585+00
qxrgvpp4cr9utj60db7d9et45vmclo5d	.eJxVjEEOwiAQRe_C2hAm0wLj0r1nIMNApWogKe3KeHdt0oVu_3vvv1TgbS1h63kJc1Jn5Yw6_Y6R5ZHrTtKd661paXVd5qh3RR-062tL-Xk53L-Dwr18a2BDaEAMeiZDLGwtCUc7MNkRXLKIRBitTIbc4JFg8pQBPIw4RFbvD-TCNu8:1p8z2W:RswCugU-OaY-nRJRyrvdFY9xYcqB42mcJALPEK3-aHI	2023-01-07 07:33:52.598421+00
2x339u4zy61zfhdxgz1jxicp5tiy7wj0	.eJxVjE0OwiAYBe_C2hAo5c-le89APnggVUOT0q6Md9cmXej2zcx7sUDbWsPW8xImsDMzjp1-x0jpkdtOcKd2m3ma27pMke8KP2jn1xn5eTncv4NKvX7rsWihyQujCyyGTApRgJCRYKOzdpRmSMLAKKXgVInwysDDylKylez9ASmQONk:1p9lit:qnWx7SjpsV2nchY33Yp0HCf1XZ5CNLD1p2FX2Fg9_8E	2023-01-09 11:32:51.724586+00
tj239xwiwmq8tg0sj5ww7esh0291406v	.eJxVjEEOwiAQRe_C2hAGyiAu3fcMZBhAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hSuIiQHlx-l0j8SO3HaU7tdsseW7rMkW5K_KgXY5zys_r4f4dVOr1W5sBEcEy6mzBqFJIq3Q2DCoyOaOYGYnRuAHBWBszcdHe6QKDA09FvD8XJDfz:1pBFzQ:IGDWMaFaSMuuUq6jHeU8LEgdOReSi2_hwoCOXA6qmDE	2023-01-13 14:04:04.696747+00
o6fjivdql30azjipl6l4px125hgv98vz	.eJxVjEEOwiAQRe_C2hCmAh1cuu8ZyDAMUjVtUtqV8e7apAvd_vfef6lI21rj1mSJY1YXZY06_Y6J-CHTTvKdptuseZ7WZUx6V_RBmx7mLM_r4f4dVGr1W0MR5D6RxWBdEIYSLAEnLh6EBcw5gDe560Mx0IXknCB6tMX5gsSo3h8XETgi:1pDL2g:FvaufveOJXwKNVggxxxfVugq_60grfMDS-kiukbqNpw	2023-01-19 07:52:02.975426+00
1sqpei3kex1hkpqmfteilsykt3w4udgk	.eJxVjEEOwiAQRe_C2hBhBhhduu8ZyMCArZo2Ke3KeHfbpAvd_vfef6vI69LHtZU5DqKuCkidfsfE-VnGnciDx_uk8zQu85D0ruiDNt1NUl63w_076Ln1Wx1CcFB9BSYxgFnM1lK2aCVAQofVIXnvkQCNOOvDhTmdLQEIocnq8wX0wTci:1pFG5Y:X0knTqzUF0YKpn-eMYblrpwkZicDKaewRkFFi51_Tgc	2023-01-24 14:58:56.097337+00
lu9apov0n8g0x0pqcl453dpjyqfoca4b	.eJxVjDsOwjAQRO_iGlkb_01JnzNYzq6NA8iW4qRC3J1ESgHlzHszbxbitpaw9bSEmdiVSc0uv-UU8ZnqQegR671xbHVd5okfCj9p52Oj9Lqd7t9Bib3sa5tAKBTgtMKs0EdPVihnaM_osiIjgazRWkKW0lvIGocICawbDFhiny_v7jcg:1pLR2D:XyxS-WOeS9IjEfA3UE6XmVKUJW3rOuzDgkKPT2aqKjg	2023-02-10 15:53:01.012188+00
15hrsurmlh4k51hvgacstbuny6c5lqh6	.eJxVjDkOwjAUBe_iGll4-ziU9DlD9LeQALKlLBXi7iRSCmjfzLy36XBdhm6ddepGMVfjvTn9joT81LITeWC5V8u1LNNIdlfsQWfbVtHX7XD_Dgach60GyomVUmhiwujlkjxgwxxJnbI7C_agok3IyC4ogjiCfqtcBoVM5vMFIyk4-w:1pC5Hj:B0TaFmDRqNEcKHGXbrYVhrbAi9PwH8J442k5yFvY8mE	2023-01-15 20:50:23.636422+00
6blvv9q4ko2i82paup49174h16b7q8qk	.eJxVjDsOwjAQBe_iGln-rWNT0nMGa9cfHEC2FCcV4u4QKQW0b2beiwXc1hq2kZcwJ3Zm0gh2-l0J4yO3HaU7tlvnsbd1mYnvCj_o4Nee8vNyuH8HFUf91pQQQBUDoI0qxYGRenLRRsokkik2WrQePEmrcyRZBCjlyGr0k9GK2PsDLCU4Bg:1pEqRV:VZF47Z_Kt6lvq2eg3c_8Cc3oCExRisP-qqQ-8yLu_SU	2023-01-23 11:35:53.797494+00
iqo4twipci9rxhkfap2k8ozqpu49u2dz	.eJxVjMsOwiAQRf-FtSEFeRSX7vsNZIYZpGogKe3K-O_apAvd3nPOfYkI21ri1nmJM4mLsGdx-h0R0oPrTugO9dZkanVdZpS7Ig_a5dSIn9fD_Tso0Mu3DqgZkYbk_ei9A-8GnUElzYTZZu2UNWicSzYoVEZTyMaNrEkxKwgk3h8X2jht:1pFcWZ:Xynesl3ChrAmeoXWnkx-_vLR5Ar1nZiKO_ZuSu1-s8Y	2023-01-25 14:56:19.074877+00
queyvikt5xxwnzg95nsrc563ftec0ig1	.eJxVjDEOwjAMRe-SGUVuSE3CyM4ZIteOSQGlUtNOiLtDpQ6w_vfef5lE61LS2vKcRjFn04XOHH7XgfiR64bkTvU2WZ7qMo-D3RS702avk-TnZXf_Dgq18q0hQo_iHLtjDE5AMhAHUccRswqAKpCP7JExIzhWQeg9ezqpF2Xz_gAx1Tjy:1pMTb4:QA_Bnm5v2oRLyAEhkHAfUgf18upnFeaFa569Ejs1kSM	2023-02-13 12:49:18.934696+00
ttuoupmk4bbkpb5ydjj7pzxnkg5eul3s	.eJxVjEsOAiEQBe_C2pBGoAGX7ucMBLpBRs2QzGdlvLtOMgvdvqp6LxHTtra4LWWOI4uLsChOv2NO9CjTTviepluX1Kd1HrPcFXnQRQ6dy_N6uH8HLS3tW5NWNTtiZDBZAZRqWaNVGb0BlQOCc56MTR65YnUUtAMNrEI4U0En3h8EnzeD:1pFx0g:6pGf07bL9HotnhWpSbiGdkz41ETMjKG_45JMN618US8	2023-01-26 12:48:46.431874+00
a82oj83bvup1zo898lg9izdai93qoqba	.eJxVjEEOwiAQRe_C2hAGYagu3XsGwjCDVA1NSrsy3l2bdKHb_977LxXTutS4dpnjyOqs0KvD70gpP6RthO-p3Sadp7bMI-lN0Tvt-jqxPC-7-3dQU6_fGqxgAgILOEjIvjBjYXdyBowQGOs9H50lCL6gMwgOwQZ2xWYYyCT1_gDy4zcp:1pHoW5:9SIpvZxEEfwwL4GIVgB4DmIqBSGcnMA-MzhnC5D_oTk	2023-01-31 16:08:53.747262+00
yow0yd3p6qsryugh8njyv60lg6d0aqgt	.eJxVjEEOgjAQRe_StWnamVLQpXvOQKYzU0FNSSisjHdXEha6_e-9_zIDbes4bFWXYRJzMd6cfrdE_NCyA7lTuc2W57IuU7K7Yg9abT-LPq-H-3cwUh2_tcYkjjJoxI7OqL5rpeVGGocKkCMgewYHOUnIwbGPCBiyOvLYQZPM-wPsrze0:1pQ2XD:zHNlMqvwWXED8jKuCl4LasrxDjKvPrafv6Ybnmt3hiI	2023-02-23 08:44:03.728165+00
85jl8s8i6rl4rx41b9rp3tqlc9ilsvl6	.eJxVjL0OwyAQg9-FuUIJEH46ds8zoDsOStoKpJBMVd-9RMrQerM_22_mYd-y31tc_ULsyqRll98QITxjOQg9oNwrD7Vs64L8qPCTNj5Xiq_b2f07yNByXw8kydKEzjhjJI4YISgVk1JmcNJ2aatDtwoEkU5iMqNABBGUljEk9vkCBkA4IQ:1pQDiF:c9_-c3SdkudqQZeB4GCmW5zeo48AV2XpXpFOARRFRDo	2023-02-23 20:40:11.096777+00
h2g7efh6aeflzs6ctbsg02r2x2e3ap7b	.eJxVjM0OwiAQhN-FsyEgPwWP3n0GsrC7tmpKUtqT8d2lSQ96m3zzzbxFgm0d09ZoSROKi9AuitMvzVCeNO8VPmC-V1nqvC5Tlrsij7bJW0V6XQ_372CENva144GsU4oDx4waMBY2wTuNZDSdA3lvYqFo0IJVg2fqiK3S1LMCFp8vP_04vA:1pKelB:W1xpG82gFkSNuZoAUWZnDzMlkDI1IHFeias2558UMAU	2023-02-08 12:20:13.41521+00
o7v7cflaxhm44lccwrz23omnddip3bmr	.eJxVjMEOgjAQRP-lZ9N0WbpVj975hmbb3QpqIKFwMv67kHDQ48x7M28TeV36uFad4yDmaoCCOf22ifNTxx3Jg8f7ZPM0LvOQ7K7Yg1bbTaKv2-H-HfRc-22dvKhAg2eQkgKSMOYGgNFj45ELtpesugVwpW29y5mYgBwFZq_izOcLMlA4Fw:1pKoMC:497H3esYn05TAGmWdIqZP5w15Y1pWwom4xoDjYldzsM	2023-02-08 22:35:04.067725+00
kbx3ifxg73q4w9rymnyhfqrfgpfyzwdm	.eJxVjDkOwjAQRe_iGlle8EZJnzNY4xkPCSBbylIh7g6RUkD733v_JTJs65i3pc55InEROjhx-l0L4KO2HdEd2q1L7G2dpyJ3RR50kUOn-rwe7t_BCMv4rZmV9UZ5AKSoKUEs7DRbe47JFUVeec0cMJWgCHRRUI1LxiMaZAIr3h8-hzjs:1pKyKT:3j6Hcn0QO_zAPHvukY8zmG88X5sLwFZFwg4barZock8	2023-02-09 09:13:57.553156+00
jslp8fn5lkkw77im45c9ab9gloq1x079	.eJxVjDsOwjAQBe_iGlmxk-zalPQ5Q7TetXEA2VI-FeLuJFIKaN_Mm7caaVvzuC1xHidRV2V6dfkdA_EzloPIg8q9aq5lnaegD0WfdNFDlfi6ne5fINOS97dtrIcExpBtIHrXikO2_R5IQNShCDpi9III6FtmbzqXoJfArQkQ1ecL-co4Hg:1pD0yZ:0RJ4W1-7NIn0MyXRcfI2YngE5cA9QAP0Ihlie_y2Jsk	2023-01-18 10:26:27.625608+00
o771ozybebfn1q9tsrdngqc0w72wtndl	.eJxVjMsOwiAUBf-FtSFQuKW4dO83NNwHtmogKe3K-O_apAvdnpk5LzWmbZ3GrckyzqzOynqrTr8rJnpI2RHfU7lVTbWsy4x6V_RBm75WluflcP8OptSmbw2E3gmTQ4NZBuIMkINhE3vICUEkkw8Y0A-uIwRmM3QhEvS2i8Y69f4AZ2M49w:1pF2oW:zJbHF-hfNxEx23wYRPYfphTegDbj2Ixi2_f_Rx07cj8	2023-01-24 00:48:28.616206+00
qr6ztf3f84woz1hz43e49ysgdk6ajnyc	.eJxVjEEOwiAQRe_C2pAORQZcuvcMZAYGqZo2Ke3KeHfbpAvd_vfef6tI61Lj2mSOQ1YXBYDq9LsypaeMO8oPGu-TTtO4zAPrXdEHbfo2ZXldD_fvoFKrWy0FzgGQgDB3HmwoLN4419tU2GfkzrKg9ynBpgS0xmbTB0QmMchOfb4rmTga:1pCJU7:NJPOa2j0x_26HzhpcXodZbpQCSBUng1pjdRhMpx2jcc	2023-01-16 12:00:07.343404+00
zhll226d8unc9diuinn8g1to2caosiig	.eJxVjEEOwiAQRe_C2hDKAEWX7nsGMjMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJY1YX5YM6_Y6E_JBpJ_mO023WPE_rMpLeFX3Qpoc5y_N6uH8HFVv91jb6fC6RsqWenaEeg5XOhAJQHHYRADIBBrLohdliEWMMFAjOsLBT7w8Uqzh4:1pAbsX:rM9nOM7Juu2lnd6dUUBj2ltwBsgs6pey0PUznTwigKs	2023-01-11 19:14:17.240654+00
kyzb5ghnrzy7q7djb3xbq58y4gva5guy	.eJxVjMsOwiAQAP-FsyHyWKAevfsNZLsLUjWQlPZk_HdD0oNeZybzFhH3rcS9pzUuLC5CgRGnXzojPVMdih9Y701Sq9u6zHIk8rBd3hqn1_Vo_wYFexnjyfuUwQF565AVY_YaLDlDAZTTTGAMZKtYoTpbIvAeJsg6seEQkvh8AR2CN-o:1pIyaf:fF8Sy4iqV31URYTi-ZTl-rXlCHlYWSNPMAgHrQoFfuE	2023-02-03 21:06:25.015084+00
v0p6mifng28j5bl8q621azao0sjfjby5	.eJxVjDsOwjAQBe_iGllZ_3Ao6TmDtWuvcQDZUpxUiLuTSCmgfTPz3iLgupSwdp7DlMRFKCNOvyNhfHLdSXpgvTcZW13mieSuyIN2eWuJX9fD_Tso2MtWZ3LAOvOYtoaVHiw40qySBxgGYuWZVNJnMt6OLjvrAIENkDIxYjbi8wUikjh-:1pDBnw:752G_q5pU9Ou8EKmi9Q1x14geXaNqQT2t0rCDOlcibY	2023-01-18 22:00:12.839014+00
5jfoo125f16sfp8aqsphjg7kky62fp9e	.eJxVjDsOwjAQBe_iGlkbe_2jpM8ZrPUPB5AjxUmFuDuJlALaNzPvzTxta_Vbz4ufEruyAQW7_K6B4jO3A6UHtfvM49zWZQr8UPhJOx_nlF-30_07qNTrXmuSTiUjdXLOiOiAilAIUSIoSYMggwFKsATa5uyUIija2L3AKIpF9vkCDQE3gQ:1pFKW9:vApkVyIczhTWDSQoA26yWRfoEFVj7EBhY0QJ8rcPDwQ	2023-01-24 19:42:41.825304+00
v07m9w00zzuzxxladxug1y9rt5wkwvya	.eJxVjEEOwiAQRe_C2hCEzgAu3fcMDQyDVA0kpV0Z765NutDtf-_9l5jCtpZp67xMcxIXcQZx-h1joAfXnaR7qLcmqdV1maPcFXnQLseW-Hk93L-DEnr51pA9KnRBeztY5wbU5EmBBvLgY1ZM1gEHAG0wsmbnSScAA9FgToji_QHePDdD:1pL48P:PYPirWIpz-0QgATkGJ840BecGOKweAL1x-0F17O2i_4	2023-02-09 15:25:53.435434+00
by9u25037f66zall5es56wi2cauh49jv	.eJxVjDsOwjAQBe_iGlm78QeHkj5nsNa7Ng6gRIqTCnF3iJQC2jcz76UibWuNW8tLHEVdFPZGnX7XRPzI047kTtNt1jxP6zImvSv6oE0Ps-Tn9XD_Diq1-q2TC0WCZOszIlhCljNQYe5DtgaYnEcOXXIl-eANAHZGpABapM6BU-8PQ9U4HA:1pP5Xy:XylZpnYU1daAjjx79GVP2L5tB-n5PA9zeJVBXEcqLuI	2023-02-20 17:44:54.801972+00
cse7ruq4t6x9hw3a2qfbunapa7dgg5oq	.eJxVjEEOwiAQRe_C2pACU9px6d4zkBmYStVAUtqV8e7apAvd_vfef6lA25rD1mQJc1JnZcCp0-_KFB9SdpTuVG5Vx1rWZWa9K_qgTV9rkuflcP8OMrX8rSc_RhRA6ASMt2Ji8gPbRIk8AhuECB4FjbG9G3EAdn0Hjh2R44lBvT8ivDfc:1pFf5b:AxnXH3eObHicy2DO6k32tzmV--GiDhwMwn5SD9bMX0k	2023-01-25 17:40:39.794065+00
sa3017snnr2i0m6la2e6koktjm5reszy	.eJxVjEsOwjAMBe-SNYqIkyYOS_Y9Q2U7Di2gVupnhbg7VOoCtm9m3st0tK19ty06d0MxF-MSmtPvyiQPHXdU7jTeJivTuM4D212xB11sOxV9Xg_376Cnpf_WnjAE1hRzTOckjpWiRG0iAmbnfWXVwgWyNJIDANaKTAoZGkHw1bw_NAA4jQ:1pLM83:SS_Jb4bkLVT_v-APnrgYsib2txINi-wFOf90dLZ0bPA	2023-02-10 10:38:43.344153+00
vizxql6v89cnqnjzap6apoal5fqbmb9z	.eJxVjDsOwjAQRO_iGlmJP2ubkj5nsHa9GxxAiZRPhbg7iZQCutG8N_NWGbe15m2ROQ-srqqFpC6_LWF5ynggfuB4n3SZxnUeSB-KPumiu4nldTvdv4OKS93XhRGMOHENOCTbWrZ98qWBHrgn76nxEhjDnkmSjT5wjEzkIYkxhtTnC1AWOQg:1pNWTP:b5HIyvbKKnl9HIjGQobE2XUrlXi3PdxRnfBINg6WWwQ	2023-02-16 10:05:43.956888+00
j87261a1l84so5rukqcl2uqle408r1sa	.eJxVjEEOwiAQRe_C2pChA6W6dO8ZyMAMUjU0Ke3KeHfbpAvd_vfef6tA61LC2mQOI6uLMur0u0VKT6k74AfV-6TTVJd5jHpX9EGbvk0sr-vh_h0UamWr0YJLjC5G6h0KIJ876DOiZHIue2PBGyecPXfGQ7aD3SCJBcQByKrPF9GfNyw:1pCv63:9hlujgQq3DKBYvUjhEIXJPtIpEt9ai7HqOZASjQBAAo	2023-01-18 04:09:47.841481+00
xyg6u0ztlm1rsiwkrbftx0x2bpheqsbc	.eJxVjDsOwjAQBe_iGln-rI2hpOcM1np3gwPIkeKkQtwdIqWA9s3Me6mM61Lz2mXOI6uzcsaqw-9akB7SNsR3bLdJ09SWeSx6U_ROu75OLM_L7v4dVOz1W4eUEgggRStMTIP3llkIvAG2FsIQQnTkYzwFh0SAMR7FJFcKg3Oi3h80szhb:1pP7Vg:SyBb3i_eYkIhPVEMLDxJP68BGNnhEZKDYr-wBouZnaM	2023-02-20 19:50:40.871832+00
aljy0ow6wq06ueyt97bhlb4xkcx2ummx	.eJxVjMsOwiAQRf-FtSE8Cu24dO83kBkGpGogKe3K-O_apAvd3nPOfYmA21rC1tMSZhZnoQcnTr8rYXykuiO-Y701GVtdl5nkrsiDdnltnJ6Xw_07KNjLt46Kx8yktIk2EUwOvdUIE3oi7y059jFromzGFBHIAFs3ACsH1iIo8f4AT1Q4xQ:1pGebU:2eaf6f1SfldEZnQxoAHvE8JCAcDq3t-cj_rTBi_LfDs	2023-01-28 11:21:40.482772+00
pbymv5yiri6et0gbsxnc89oed0122cul	.eJxVjEEOwiAQRe_C2hAGCgWX7j0DmQFGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIswDpx-l0J06O0HeU7ttss09zWZSK5K_KgXV7nXJ6Xw_07qNjrt0bjWOk0QmIEALKGPSuVrUbUXnkLXPToTAiGwA5aFTIueBhIew6A4v0BHVg3aA:1pKIG1:J7BJR6MoHXBA-eaHJ2167e6WweGibO41axpGcrGGU_U	2023-02-07 12:18:33.196946+00
fuodhkiczhcgonwju3fnfjv23ganeqp1	.eJxVjDsOwyAQBe9CHSF-Cyhl-pwBAbsEJxFIxq6s3D225CJp38y8jYW4LjWsg-YwIbsyCZJdftcU84vagfAZ26Pz3NsyT4kfCj_p4PeO9L6d7t9BjaPuNYFH5azzKNGK5LSXGWISIAvmkjMYn4SRDsgCaKWsMMVpS6KkXUbHPl8guDfZ:1pM5Jq:SWGEW2CjqXUz3lJxFa8Q_YD3oHKm80AwFjruyMBBgws	2023-02-12 10:53:54.622409+00
yuxop9apd8oq6xwrovzweh2m1pv1m6ic	.eJxVjEEOwiAQAP_C2RAXuqV49N43NLuwSNVAUtqT8e_apAe9zkzmpSba1jxtTZZpjuqiwIE6_VKm8JCyq3incqs61LIuM-s90YdteqxRntej_Rtkankfpw6xSxyR0XggSz06cj4ZHtCIHQKgAEMcABOfDXowVr5B7B1A79X7Ax8_N30:1pOChl:S5y-bVjBKwIba8OVJ9AvkUlTGi18Y171QNNYaq67NlA	2023-02-18 07:11:21.605533+00
9tqdzj8tfvm6ut943jlk6h7akjl5qpx2	.eJxVjMEOwiAQBf-FsyEBygIevfsNZGFBqgaS0p4a_92S9KDXmXlvZx63tfitp8XPxK5MWMUuvzRgfKU6FD2xPhqPra7LHPhI-Gk7vzdK79vZ_h0U7GUcA01oKKpIGgSCScFBMtlNEhUErWOOBMJaR06rfLBspMNJAgAeG_b5Aj_cOIo:1pMm0I:CPYOKJsBNEFcm0rwbDbinOHKfcg8dbXuGpv6oYWx5gw	2023-02-14 08:28:34.340866+00
tv8zm4e7va3vqwhr5rrkmb7bdushu6fr	.eJxVjEEOgjAQRe_StWlKHaaMS_ecgcx0WkFNSSisjHdXEha6_e-9_zIDb-s4bDUtw6TmYlpvTr-jcHykshO9c7nNNs5lXSaxu2IPWm0_a3peD_fvYOQ6fusQnXDoVAMiOIfUEGAGYsySnHhBRAqh6UCp1Sb7M7YgmhkkU0xg3h_2rzfz:1pMq0J:qwIdaPFUguhSu8e6mHJJoavCFppDh2mHqHGcgsE3Le4	2023-02-14 12:44:51.253044+00
e8sldwpzf8tene89301eex8fdvrd7hd4	.eJxVjEEOwiAQRe_C2hCKdECX7nsGMsMMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6ur8md1-h0J01PqTviB9T7pNNVlHknvij5o08PE8rod7t9BwVa2GqFnYENdZkYf2Nrge6LkOoBAEkx2Dq33iIacACODzxcxIVt0W6w-XycGOMk:1pMyBy:OE97rEW8WaMY4VlUUhz2tEVPPNnC8VDCiCdhLzYjHVo	2023-02-14 21:29:26.289151+00
l3tldt46rycusqph6xt1v50rzs02m09r	.eJxVjMsOwiAQRf-FtSE8BAaX7vsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3ZhUgI7_a4R04PajvId263z1Nu6zJHvCj_o4FPP9Lwe7t9BxVG_tTpHKLkAJotaG3AugdPGZZUgFQBjo_KCjEUjpCSvHZLUEbQQZF307P0BKTc3wQ:1pCKdr:1nPqgK2aBni8uoWTTjjT90vrGFt7MBqPl8JT5gJmOJY	2023-01-16 13:14:15.864125+00
c9b718qurutn306y7m7666766ngawia7	.eJxVjMsOwiAQRf-FtSG8yoBL934DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiZ2Ztez0O0ZMj9x2Qndst85Tb-syR74r_KCDXzvl5-Vw_w4qjvqtI2oy4JB0BPC5RAQUKYLzaSKQFp2fFIhEKJwp6EDJ4pWRGkrxtiT2_gAoYziE:1p8FAJ:tu8SoUx4veoPblgwjNdWZJsqhpwZZpR1yXPiUKOH2cU	2023-01-05 06:34:51.297144+00
w2kau71fyd0oohzjw5okfa9idy56ewl5	.eJxVjEEOwiAQRe_C2hBgoKUu3fcMzTDMSNW0SWlXxrsbki50-997_60mPPYyHZW3ac7qqrpBXX7HhPTkpZH8wOW-alqXfZuTboo-adXjmvl1O92_g4K1tBpctD6iDZ6QghNxMITAHsD63lEwZAQkAXQ9sQNATMxiJUov2Rj1-QL50Dgs:1p8Ovz:uY9-QgxlYVup6nHhu2IUctSTo6LvCqjlyd62EilagEI	2023-01-05 17:00:43.911642+00
8ew3xtugqe4chk0ve6s3bgc3uwnf8504	.eJxVjEEOwiAQRe_C2hAog4BL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbgIHbw4_a4J84PbjuiO7TbLPLd1mZLcFXnQLseZ-Hk93L-Dir1-68KFVDDeYbI6uQCsKRtleQAAW4hdUFAweWuB4KwHX0ibbBCBi0so3h9BvzjU:1pP6i5:z88NX_pCsBNl4zEwWlOTS7BiKQ7Sz1286SxnNWgPXNU	2023-02-20 18:59:25.2314+00
j5zhxu7ri0lxdgz11iy8y9ay8xfu3fra	.eJxVjEEOwiAQRe_C2pCxhYG6dO8ZyDBDpWogKe3KeHfbpAvdvvf-f6tA65LD2tIcJlEXhVadfmEkfqayG3lQuVfNtSzzFPWe6MM2fauSXtej_TvI1PK27jx4IE80AiIRM3TRA3o59w6TdWgEPLNsxLjBcYpszGDQOgHoR6s-XwHtN7E:1p8fCF:ljEsjTpwcA2tfKxkWkmbWXiiSAopi6wHkEZwyJv_iuM	2023-01-06 10:22:35.660254+00
0b9h3nhzusmbdlbchd32n79n1ypuboim	.eJxVjDsOwjAQBe_iGlnr4C8lfc5grXdtHECOFCcV4u4QKQW0b2beS0Tc1hq3npc4sbgIHcTpd0xIj9x2wndst1nS3NZlSnJX5EG7HGfOz-vh_h1U7PVbDzkbT9o4MMwE4BRo0E5jUewH5VUBLOSYs_bkU0gQwKBJzPZswXrx_gAAIjfT:1pCNvI:8Gh_6x0-hNff3Xj0NMIj0Z8YYW88SO6uG0j5zjj4Hv0	2023-01-16 16:44:28.263202+00
zix9p5y2tpb95rcf30ecfvmmkodbqjcf	.eJxVjEEOwiAQRe_C2pCxhYG6dO8ZyDBDpWogKe3KeHfbpAvdvvf-f6tA65LD2tIcJlEXhVadfmEkfqayG3lQuVfNtSzzFPWe6MM2fauSXtej_TvI1PK27jx4IE80AiIRM3TRA3o59w6TdWgEPLNsxLjBcYpszGDQOgHoR6s-XwHtN7E:1p8fCH:Xuc3chBjiFv3SPXEzc0gml_1ucDSv-A4eB6UFU-pIaU	2023-01-06 10:22:37.240892+00
r739ujipeno34mdyfwl1498egjtkkta3	.eJxVjDsOwjAQBe_iGlnexF9Kes5grddrHECOFCcV4u4QKQW0b2beS0Tc1hq3zkucsjgLCOL0OyakB7ed5Du22yxpbusyJbkr8qBdXufMz8vh_h1U7PVbF5UMjKCDCsaTZgCytqBj5dBpolA8Ww8QEEglNyQuOgxjMQYyeOvF-wP22DeE:1pFLtJ:YEzclWUmRC_9jHb0_P_iFlIcWaCI0hA-BEsczLbBlBo	2023-01-24 21:10:41.859609+00
6vdn126azhgti6f3e0uklg6p20pweydy	.eJxVjDsOwjAQBe_iGllZ_5eSPmewvFmHBJAtxUmFuDuJlALaNzPvLWLa1iluLS9xZnEVAJ24_K6UhmcuB-JHKvcqh1rWZSZ5KPKkTfaV8-t2un8HU2rTXmud7GhQeedYa8LslQ3KIBEgs2WvgjeDtdpDJnRoAnoYO1K7SABafL4BCjb_:1pBLoa:6sIK2xaad8nX42Sc0M01JmV9M1gb0vAcXqBIlFL6cBk	2023-01-13 20:17:16.012359+00
2a4txz9bv0mip9pcnkljtzu3boabjqb3	.eJxVjEEOwiAQRe_C2hBgSse6dO8ZyAwDUjUlKe3KeHdD0oVu_3vvv1WgfSthb2kNs6iLsgjq9LsyxWdaOpIHLfeqY122dWbdFX3Qpm9V0ut6uH8HhVrptcWc8ezYDs4BgBMCBGcsmjwiAxsy2cuIJk7kneCQoo-TSZBYorfq8wUQnjfx:1pLMIg:vFz3KiI6S5bzp9KeYUmtzs8IflTUmB4lLPr426rOGFA	2023-02-10 10:49:42.115415+00
8312lnhj3xrj92k7od4lpbqc898zv0xb	.eJxVjDkOwjAUBe_iGllesIMp6TmD9TfjAHKkOKkQd4dIKaB9M_NeKsO61Lx2mfPI6qy8VYffEYEe0jbCd2i3SdPUlnlEvSl6p11fJ5bnZXf_Dir0-q2FIHhGLyENBQ1G45GTY1-OxEhIIbFLCDGerB0CmSIFYwEH6JOIUe8PQFk5qg:1pKFt2:aOjX7Y0YcHwOv5isTLLPQEkCCd7lYfN-73sPuSdUjJE	2023-02-07 09:46:40.969278+00
3zof6vko3g706bdf34lihgeaawgd52uw	.eJxVjMsOwiAQRf-FtSHAyMule7-BwDBI1UBS2pXx322TLnR7zrn3zUJclxrWQXOYMrswqS07_dIU8UltV_kR271z7G2Zp8T3hB928FvP9Loe7d9BjaNu65IMGQVeofegDcLZYEFZpI4iyQ0D5UJCRQfGSgHWFWWSt6SydWCBfb4pwDe8:1pKOYj:F_8jWBhE7ZoDLc6k5DB7Az7tyiFSF38wGbI3eaZTbMw	2023-02-07 19:02:17.959907+00
blst9b0yo2pkm89sd4q9c29xgxybli7n	.eJxVjLsOQiEQRP-F2hBYeWlp7zeQZRfkqoHkPirjvyvJLbSZYs6ZeYmI21rjtuQ5TizOQjstDr9tQnrkNhDfsd26pN7WeUpyKHKni7x2zs_L7v4dVFzqdx2UZ0-kgrcBkIE0UvHg0Hg3wuisFcGRqAROEFJxtoCxCrHkE4N4fwAqlTiR:1pNWoK:kv52d-f5FiwwLBEszKxkojGioKiv5f0paTlkJWEoUZA	2023-02-16 10:27:20.156055+00
cfgp4a1nq7c1y64bph1jbjuzpyjo3414	.eJxVjDsOwyAQBe9CHSGWj8Ep0_sMaIElOIlAMnYV5e6xJRdJ-2bmvZnHbS1-67T4ObEr05ZdfseA8Un1IOmB9d54bHVd5sAPhZ-086klet1O9--gYC97jVqbUVuTQ3LGJcCMFmIMEvQgHFggVKSEswaCkDGPxljaiRRCIQyOfb76ijcP:1pHSDG:AT7t3u3ZxlbwuJVbSiR7qRCsNLCtm332Qj0S5kGjx50	2023-01-30 16:19:58.135522+00
f8tj11t55fpuf16lvw0aatcf586085in	.eJxVjMsOwiAQRf-FtSGUMjxcuvcbyNAZpGogKe3K-O_apAvd3nPOfYmI21ri1nmJM4mzGIwXp9814fTguiO6Y701ObW6LnOSuyIP2uW1ET8vh_t3ULCXb51BeQpIVnlmxZCTC8pSJkJKxkHwzgxejQQTOwYXdMgJLWnQEGB04v0BSVs4ZQ:1pHtOa:pUizLMIaaZWb4F_wJHQ38VzlrJ8HAA3PPBzv_IIvfA4	2023-01-31 21:21:28.210026+00
ww2nx8syziqxsrqueunz4q4dofp5h1qf	.eJxVjEEOwiAQRe_C2pAyUGBcuvcMZBhAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hSuIslHHi9LtG4kduO0p3ardZ8tzWZYpyV-RBu7zOKT8vh_t3UKnXbz14B1icdmMBGLJmZNKxaG_Jphw9INDovAKMxRSDymNBraxjpZnBivcHGKk3mg:1pKiM3:S4LdBLe9jBofk9mHw_e-gDoEmtSHk1qGI87a6_57OAM	2023-02-08 16:10:31.195429+00
xyk1abw6bkinwai6z1pza34l3rlasqcq	.eJxVjMsOwiAQRf-FtSFAmaG4dO83kCkzSNXQpI-V8d-1SRe6veec-1KJtrWmbZE5jazOyoJTp991oPyQtiO-U7tNOk9tncdB74o-6KKvE8vzcrh_B5WW-q0FPYdcAB0AuWipRwgmivPBY-ekY1tiB2QCBmfEYrRDKeh7ZhLIrN4fCQM3uw:1pMnp0:5lVfxljr15TGRRkJcmOUIQXrTKU-N1yvcas_sgfyFGk	2023-02-14 10:25:02.755232+00
2c3ewi6w64uv7umihj0mcxi29xijm389	.eJxVjLsOQiEQRP-F2hBYeWlp7zeQZRfkqoHkPirjvyvJLbSZYs6ZeYmI21rjtuQ5TizOQjstDr9tQnrkNhDfsd26pN7WeUpyKHKni7x2zs_L7v4dVFzqdx2UZ0-kgrcBkIE0UvHg0Hg3wuisFcGRqAROEFJxtoCxCrHkE4N4fwAqlTiR:1pNWoK:kv52d-f5FiwwLBEszKxkojGioKiv5f0paTlkJWEoUZA	2023-02-16 10:27:20.378713+00
v0f3vod3t97urahaz2v0t29abbpsl8sl	.eJxVjDsOwjAQBe_iGlmbJQ42JT1nsPZj4wBypDipEHeHSCmgfTPzXibSupS4tjTHUc3ZuM4cfkcmeaS6Eb1TvU1WprrMI9tNsTtt9jppel529--gUCvfGlNPkE-B8QhOxREREARhURwQfFZEYVXnOvHEAhp61OxTHiirz-b9ASxgOZ0:1pMr9w:8a8RiZsyEqGwTxiJd_bxk7xN8GgZopAxMCAR-3gHBRY	2023-02-14 13:58:52.519609+00
xeqb0yzwvcr2au7sksca620dde3jupzf	.eJxVjDsOwjAQBe_iGln4sytMSc8ZLK93jQPIluKkQtwdIqWA9s3Me6mY1qXGdcgcJ1ZnBV4dfkdK-SFtI3xP7dZ17m2ZJ9Kbonc69LWzPC-7-3dQ06jfujhPIEWYGIIc2VhE6zI5EvQOgjmRRSBn0TABonjrQwFjOQUXiqj3BxkcOBA:1pMyV9:WdWCsFcVxp0jqkDLv_lOaRvdfLCWu4pId-UpcPd65l4	2023-02-14 21:49:15.70923+00
3613dz75ropzrywwkolg7zq4mqka9ppq	.eJxVjEEOwiAQRe_C2pDAAAMu3XsGAswgVUOT0q6Md9cmXej2v_f-S8S0rS1ug5c4kTgLZb04_a45lQf3HdE99dssy9zXZcpyV-RBh7zOxM_L4f4dtDTat0anctAuowmWiVUhDzqQrViMZotgbK5I2TEEg95xquCLp6qCASYQ7w8sozhs:1pNaoO:ooquy7MoovAnimuA2hoI9kgByEpu0iqjzOS1dOe1ee4	2023-02-16 14:43:40.610635+00
nc0raqb9sj744quts2xg2xuwz0m0xhfz	.eJxVjEEOwiAQRe_C2hBghIJL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEROhhx-l0J0yO3HfEd222WaW7rMpHcFXnQLseZ8_N6uH8HFXv91ipYLCZg8QoIUgk2mIJckoIzW2U8gfOUWWsaYABnkb1JxjtQ2XlF4v0BM-g4Cg:1pONO5:PvpkZNBwUlxEEWzT7g4rR0VW_YQWA3kTF-6FcW3JasQ	2023-02-18 18:35:45.529846+00
pinc2q1832bo012ytn2n2j9xqkye9k82	.eJxVjM0OwiAQhN-FsyEgP1s9eu8zkIVdpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUwkrsIYcfotI6Yn153QA-u9ydTqMk9R7oo8aJdjI37dDvfvoGAv2zqTI01GWaCLp4EVuOwtOM8cc2KD9myzyqiJtBvAbgFgMboMAMqx-HwBHbU4eQ:1pQ4nB:mhrQNLpKiU88iC0ea_y7w7juNksYMvskozft5w_0DFQ	2023-02-23 11:08:41.139833+00
5mf9lntc0n81f3ynct6tuzg8sbif6ud4	.eJxVjDEOwjAMRe-SGUVJrDQxIztniJzapgXUSk07Ie4OlTrA-t97_2UKbetQtiZLGdmcje-COf2ulfqHTDviO0232fbztC5jtbtiD9rsdWZ5Xg7372CgNnzrjBExK5CTGgNS7Dn6BIyQ1ImAVsUQvOcEwNlV7nJSEgqoTn3szPsDKU44Ug:1pQVA8:MF_eb5AxPVzemzKvKLKEMDSkRO4wrBOONfZaga5wlTA	2023-02-24 15:18:08.010388+00
n2iop2tj3ooywmtdc83ctd5y6ta5h4xt	.eJxVjEEOwiAQRe_C2hAGmNK6dN8zkBkGpWpoUtqV8e7apAvd_vfef6lI21ri1vISJ1FnBejV6XdlSo9cdyR3qrdZp7muy8R6V_RBmx5nyc_L4f4dFGrlW9OVrXBGEPTeOTZDZwL7zoGQoEMrPfLQ-8CGERKLBMsEIRg2CcSr9wczEjhI:1pRHRJ:liGvraXfsM4u_5QiLaH1Njl9rVkLgKxrjM_xBnbj9mo	2023-02-26 18:51:05.299518+00
tvodh2xsf7kja1ue2jk86i2xfplh0ddz	.eJxVjMEOwiAQRP-FsyGAwIpH7_0GssuCVA1NSnsy_rtt0oPeJvPezFtEXJca157nOLK4Cm_E6bckTM_cdsIPbPdJpqkt80hyV-RBuxwmzq_b4f4dVOx1WwdWoDlc2EOxAMqV85adKaloQIMhee1QBySiXNiSskEhZRucIdAgPl8JuzhC:1p7khA:20g95pJ3JHl-JAkrFVkg1Ymh55D1isry9Qb0Xg7UQrY	2023-01-03 22:02:44.997526+00
w040apq5th9xtxq7m7pxb31trh3ly3ep	.eJxVjDsOwjAQBe_iGln-xR9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszGQI7_a4J8JHbjugO7dY59rYuc-K7wg86-LVTfl4O9--gwqjfGhOBsF6TQ-HRawnBFiuMIwmuFJ0UZtAo0kSklHGGwIJ15CShmWRh7w9MyTjz:1pP6o8:OIze9ccAyg8lEnvzpTNNHkAJsntQUs_GZ39OCHftWmo	2023-02-20 19:05:40.421607+00
9rqxr6oe4w5sxp0724ju18dndizybr8c	.eJxVjMsOwiAQRf-FtSHQwgy4dO83kBkYpGrapI-V8d-1SRe6veec-1KJtrWlbZE5DUWdFaA6_Y5M-SHjTsqdxtuk8zSu88B6V_RBF32dijwvh_t30Ghp3zp7E6T2vkDoOo4IgSwARVdNsSE7idUz9MRGXIeW0RusFtmxj2LBqvcH_g43iA:1p8HOA:FJAIXdyn7L2i_VJeCw6EcfMZxf4xp9LV4DyRJnNIvJc	2023-01-05 08:57:18.144632+00
6tuezzxjj2mzmr87qrbl9rw32j1y3qgj	.eJxVjMsOwiAQRf-FtSEVGBhcuu83EJiZ2qqBpI-V8d-1SRe6veec-1Ipb-uYtkXmNLG6qGDU6XcsmR5Sd8L3XG9NU6vrPBW9K_qgi-4by_N6uH8HY17Gb-1cpC4wCYN3HkNkBuvJdjhAAC4g0SKYwbks5M2ZMTocmAyiFZBOvT__ljfV:1pAZlX:NuLcgAC--3C5FjNwd8b0jdP7ypSUZxPS7NAGVRwH__Y	2023-01-11 16:58:55.412111+00
ssqpazq5th7p56x9hh30vi2krta0oati	.eJxVjEEOgjAQRe_StWk6Q9sBl-49A5lOB4saSCisjHdXEha6_e-9_zI9b2vpt6pLP2ZzNgHN6XdMLA-ddpLvPN1mK_O0LmOyu2IPWu11zvq8HO7fQeFavjUAgVKTB4lELIgaXYq-I45daANIYPVOEsIg6qEldIOLyNoQNgho3h_2ATc1:1p8Q4S:9eEJPItXJs34Yd1XObkm2fePrujrLCPkqV8eR2MpnJ0	2023-01-05 18:13:32.149191+00
6ayfduties2sn5wx4nbufcis0wuxwe4m	.eJxVjDEOwjAMRe-SGUUkDolhZO8Zqji2SQG1UtNOiLtDpQ6w_vfef5k-r0vt1yZzP7C5GDSH341yeci4Ab7n8TbZMo3LPJDdFLvTZruJ5Xnd3b-Dmlv91imkmAgzq0dAOimQR8dyRgeYgqpkLeK8VwAIASQ6YUWixIAuHs37A-buN-4:1pCLJQ:QmcNJ0teeTNP76iOAL3VUyq8KYX0VM31LNtKRdaimxc	2023-01-16 13:57:12.323111+00
trkvwc28qsbolxvfd73zvnszwwmz6ub8	.eJxVjDsOwjAQBe_iGllm_Ysp6XMGa-1d4wBypDipEHeHSCmgfTPzXiLitta4dV7iROIitBOn3zFhfnDbCd2x3WaZ57YuU5K7Ig_a5TgTP6-H-3dQsddvrSyBzqAMJ3UGLgmyCoxoIITBm0yag_NoPRoaHPiioUA2OqiiChUr3h8EJzgG:1p8frr:2Uf84FoMfAavhrNqUTaWGIdOu09zfmNTPWBSAlyOqTU	2023-01-06 11:05:35.956853+00
g66574wvvgo161hz6j3ttobavf061wno	.eJxVjEEOwiAQRe_C2hBCoVNcuvcMZGYYpGogKe3KeHdt0oVu_3vvv1TEbS1x67LEOamzAq9OvyMhP6TuJN2x3prmVtdlJr0r-qBdX1uS5-Vw_w4K9vKtUZzzmJ0HcgOBN4hsgpXBkpUJyEK2GTymMVAOxo0QOBmcODCJGKveHxdKOJw:1pAcfj:NaTmeg-AHDCrDZSyXbSsV-7QZrHERufGbECVWZAkLrs	2023-01-11 20:05:07.991855+00
m2kvpc924b0od39niljza1y1tw195o51	.eJxVjMEOwiAQRP-FsyFLYUE8evcbCLtsbdXQpLQn47_bJj3oHOe9mbdKeV2GtDaZ01jURRlEdfptKfNT6o7KI9f7pHmqyzyS3hV90KZvU5HX9XD_Dobchm3N4Lt8tmApQMBA2FmLpiuBJQARl-g5BkfAIs47dlsAs2Afbc9g1OcLEg03yw:1pIzYX:-4MJu4I7Rm_kquY2ZJmWpoOnUKX62dfuG2BNi3XhauA	2023-02-03 22:08:17.415214+00
lz0xqesy05kk64vhwlnj6bahqja447ue	.eJxVjMsOwiAQRf-FtSEwvF269xsIMINUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMQJ2Zk5w06_Y07lQX0neE_9NvMy93WZMt8VftDBrzPS83K4fwctjfatyUkHFS2QpeJJl5CztaIEb2wOILR0ilRVCAXACyGdDlADogzWaCXZ-wMEJTcs:1pFMYC:RX2sTM0MQ6wpElWX1AN4WNLIvmYEwuy1X1JJs0JdFSk	2023-01-24 21:52:56.295018+00
eikscmowbc48iut6cuoml4ud6mgr0gx5	.eJxVjEEOwiAQRe_C2hAsMAwu3XsGAswgVUOT0q6Md7dNutDte-__twhxXWpYO89hJHERFsXpF6aYn9x2Q4_Y7pPMU1vmMck9kYft8jYRv65H-3dQY6_bmi0rdFohgBocEPlSECE5X6LRnMBHrcAaw44x6w0mcHBONGTlc1bi8wX73zf3:1pDXbD:VDjLYlTNBuE2YE2-teEtY5uPOXSa7-zGxR8s5q4e7XY	2023-01-19 21:16:31.970822+00
g1jlrhh32nddq2nto6ciyfn3vs8kbgdr	.eJxVjDsOwjAQBe_iGlnJfhxDSZ8zRBt7jQPIlvKpEHeHSCmgfTPzXmaQbc3Dtug8TNFcDJI5_Y6jhIeWncS7lFu1oZZ1nka7K_agi-1r1Of1cP8Osiz5W0NQEUcAlJxvUSJ6DKyxdalBAlQF4EjaYAJ05PncqHBihq4lCZ15fwD8Qjdo:1pC1Fp:Wh3APJYQmqN-LRAcs-UGlrZjkusAgd7Xk4l3soo8Mf8	2023-01-15 16:32:09.517536+00
ui7jbfs5tawld8rawwiodzrj1f6kaph2	.eJxVjDsOwjAQBe_iGlnxrmOvKek5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmzUE6cfsfA8ZHbTtKd222WcW7rMgW5K_KgXV7nlJ-Xw_07qNzrt0bCYKzWaGCwWlHMjolGTIRYjE7FAo-oFEQLGIDcEBQBFiiGES2I9wfKejZe:1pNVt9:vVoW_h0pRKkENYVGbqQC3j7uYBTLkqjwr64epHm4ui8	2023-02-16 09:28:15.455891+00
icaiv9xfqk646a3yb4wslcavv3aalkom	.eJxVjMsOwiAQRf-FtSEMjwIu3fsNZJihUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSJhZnAcaJ0--akR6l7Yjv2G6zpLmty5TlrsiDdnmduTwvh_t3ULHXbz1AoWydBwsccdCBwTEprYzJUTkYIRpCcmS9yYELBh8ZVI4EFPRoxfsDGto3-w:1pE5hT:PafcAYAa5txNLjMaBymJrnJz9P39D_Q5F8VvuwjJGZ4	2023-01-21 09:41:15.434409+00
fovu32fmll1o1ivwjiln4l5cg7fayzyx	.eJxVjMEOwiAQRP-FsyHFQnfx6N1vILsLSNXQpLQn47_bJj1o5jbvzbxVoHUpYW1pDmNUF-WMOv2WTPJMdSfxQfU-aZnqMo-sd0UftOnbFNPrerh_B4Va2daCvTEeHXcARnLkjogR2dsuWwsoGdHwIJ7Am-wGQJAt8QxD30cP6vMF_v03oA:1pG4Vc:VbtOmUP6QzditeNCOsg-agGtCCAKIQlLeGV5ZMHxDEs	2023-01-26 20:49:12.308238+00
cgs5r29tvjw173kik3ya4u091rl37vbc	.eJxVjEEOwiAQRe_C2pACgRlcuvcMZAZGqRqalHbVeHdt0oVu_3vvbyrRutS0dpnTWNRZGRfV6Xdlyk9pOyoPavdJ56kt88h6V_RBu75ORV6Xw_07qNTrt0bAHI2gQwjIliGCdS4MNERygOgYis1gfCESQeNjxpsnE2wWKMDq_QEHwDfP:1pESrU:M2tvi0tvet9K4rXVzqZxgidks-UwAh3dVSGhNTSo2qg	2023-01-22 10:25:08.983082+00
bxskbnfzqn9l5if6i75osgnz9e30bjun	.eJxVjDsOwjAQBe_iGln2-k9JzxmitXeNA8iR8qkQd4dIKaB9M_NeYsBtbcO28DyMJM5CWy9Ov2vG8uC-I7pjv02yTH2dxyx3RR50kdeJ-Hk53L-Dhkv71grAx6hCDKQIgw9gnCXWJZhUOaSsrPYVwQB5q1MFy8ZpjcgWIiQn3h_7Sjbw:1pHYQw:onAYJDzG4-Q4KIV1t-pDtqwsfuUlCa1ld_vQTiJQmwo	2023-01-30 22:58:30.436504+00
ziu2lbxh01fjgs27vmb8bwcdue6buuuo	.eJxVjDEOwjAMRe-SGUV2lDo1IztnqJzEIQXUSk07Ie4OlTrA-t97_2UG2dY6bE2XYczmbNCzOf2uUdJDpx3lu0y32aZ5Wpcx2l2xB232Omd9Xg7376BKq9_aq1KHBZUDQY4FMCVk9krIoROXqSQPLD70JQMDETsXelQSwKCdeX8AJ0g3kg:1pI5eJ:eULlqM1c-_YxkrePhSqsIobiChnubPxZvzRCDC0E-vE	2023-02-01 10:26:31.773903+00
wcttzzx04kp77u561mqr7gaeuq0662zb	.eJxVjDsOwjAQBe_iGlk2_i4lPWewvN4FB5AtxUmFuDtESgHtm5n3EimvS03r4DlNJE5Ci8Pvhrk8uG2A7rnduiy9LfOEclPkToe8dOLneXf_Dmoe9Vsrh8Uoy5kAODhVNCEHQA905AgWLF2jUZE9W9RsnQcGZ0kXw84HJd4f6yY3wg:1pLnXi:LHTfxrzVEpn-1953nD0LvtIkb50gmVD3ThvcwUSedFM	2023-02-11 15:55:02.706292+00
a3dvtqwa710wzjn976132edrpbyrrp5x	.eJxVjEEOwiAQRe_C2hAKCB2X7nsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERVonT74gxPbjuhO6x3ppMra7LjHJX5EG7nBrx83q4fwcl9vKt-WzYEWe2o6esNLhBkWODmB0ZG_OAo06QwVsmRLDAkSwqpRnAcxbvDzG2OUA:1pIRKF:VjhQ2U7jZnnntWv-YNcyZvCnLj3xRY_2Z7U9l_9mg_4	2023-02-02 09:35:15.796366+00
oblvxnhvdseg26avv50jchash17z9dal	.eJxVjEEOwiAQRe_C2pBBhlJcuu8ZyMBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uLMiao0--aKD-k7ojvVG-zznNdlynpXdEHbXqYWZ7Xw_07KNTKt3bE2DmLNngYM6Ege2tCH4KAG533Z-7FQk7AiNkIJQRxwD5hQtOhen8AG4432Q:1pNbh0:PWeCif1P3S0ZlBLeorbov33rN3Z-XbsA3brfVeJPFRM	2023-02-16 15:40:06.101566+00
45sf75ozufh9p9toygc83ufgm35vfpfh	.eJxVjEEOwiAURO_C2hAo8Cku3XsG8oGPVA0kpV0Z764kXehy5r2ZF_O4b8XvnVa_JHZm0gI7_bYB44PqQOmO9dZ4bHVbl8CHwg_a-bUlel4O9--gYC_ftZEYxWwnFaNLNgQhlQlWKQU0UsqgNQI5gDSDBqFtNoTCTWQgoxbs_QEkGjfe:1pOG4T:J1klF6kcY5St8TSlyTTu07AGWXhSiS_9JbW6jHAXEdg	2023-02-18 10:47:01.317354+00
c04zpcleo4abb24w55ttb804e6m8tnl8	.eJxVjDsOwjAQBe_iGll24s-Gkp4zWOvdNQkgW8qnQtwdIqWA9s3Me6mE2zqmbZE5TazOyganTr9rRnpI3RHfsd6aplbXecp6V_RBF31tLM_L4f4djLiM39qQCd5bIIq2I2tcR8AMnS85AjIKA_tQeucGCaZwHyKJ0EAeJAyQ1fsDLHs4sg:1pKiR5:0VWGRDTxU4n_QpAU3fkXiBz4TnDKIwFSJ2GxAdWQwrY	2023-02-08 16:15:43.918042+00
dqetl1j595sw45eszx1oohzbhtjgfhqu	.eJxVjMEOwiAQRP-FsyHQwoIevfsNhGUXqRqalPZk_Hdp0oPOYQ7zZuYtQtzWErbGS5hIXIR2Spx-U4zpyXVH9Ij1Pss013WZUO4VedAmbzPx63p0_w5KbKWv0UHOibSzOYNmxQ5IeT_CgMqAZ3sec0T01IXGJjN0d9ozKAbDWny-ROg4qA:1pKwvw:WUC539h5qL7gOobyP8W-YHjfaZidnGU3EMRk_ReVwRk	2023-02-09 07:44:32.047852+00
pd6czhiwdt75gb9wp0q0zpwupyi4n4vu	.eJxVjDsOwjAQBe_iGlle_01Jzxms9dpLAiiR4qRC3B0ipYD2zcx7iYzbOuSttyWPVZwFRCtOv2tBerRpR_WO022WNE_rMha5K_KgXV7n2p6Xw_07GLAP31rHYkLUCAyOdEhQfUJrFBOjiUzNGQBCl6zmmLwB9iEpUJWqcdGxeH8AHCQ3tw:1pMoWQ:VI8QQu1hJ1LbvzowLKVHgvYmIFuMdzShSiUqY896JZU	2023-02-14 11:09:54.944382+00
g6xpr9v3f9r8ou544n1igdjn2g3itpqh	.eJxVjEEOwiAQRe_C2pBCoQMu3XsGMsCMVA0kpV0Z765NutDtf-_9lwi4rSVsnZYwZ3EWyllx-l0jpgfVHeU71luTqdV1maPcFXnQLq8t0_NyuH8HBXv51sA4QMxIhqxT2oDiRFojW-AJyEayTKQdKDWy8pPBIZIbM3jPiaMV7w9ORTkU:1pMrPt:WKVw_IbDY2e_JcUV2A8XnSHbMA1Ry_p6GAosU12zOyg	2023-02-14 14:15:21.174213+00
z8wdgcjnqk3lppvgwgetfkhzm8sp03xu	.eJxVjMsOwiAURP-FtSHhecGle7-BXLggVQNJaVeN_641Xehy5pyZjQVclxrWkecwETszoRQ7_bYR0yO3HdEd263z1NsyT5HvCj_o4NdO-Xk53L-DiqN-1sUQUIpe5uJNcgrEN2QLmHwyBaQCdNY4SZqKBUBhpUfninaaMrDXG0qzOJ8:1pD4w1:xcc1NUc5qP4FnC7FtTQ-o5RReBrzxtyzka90BYpoIb4	2023-01-18 14:40:05.517809+00
yb3wth8ky93xx3b4xqycp8wzg316im4g	.eJxVjEEOwiAQAP_C2RCWxVI8evcNZGFBqgaS0p6MfzckPeh1ZjJv4Wnfit97Wv3C4iLQidMvDBSfqQ7DD6r3JmOr27oEORJ52C5vjdPrerR_g0K9jC8SE5DR6MBYzOccgBFUyCZmPU_MHCdrAeak0WgbLGuXkoJMxrqoxOcLCRc3_Q:1pP6om:7m1X-wS-gtZUh1qbl0sdBAgTCNgCCcPhfOUVUqWxTU8	2023-02-20 19:06:20.874077+00
d7baj5rsq6rz063jsy3c5k5fk38rnvzq	.eJxVjEEOwiAQRe_C2hCGCR1w6d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAgjq9Lsmzo_SdiR3brdZ57mty5T0ruiDdn2dpTwvh_t3ULnXb83WOBeAEqeMniwmBB4YiLIZRs8OySAjuCzghUZvxQpQIQ8SghP1_gAUqzem:1pCOmj:ui4NmYykAkhbVQm2U4G9wdJ2B7w0zfd854Wt4enFzyU	2023-01-16 17:39:41.376691+00
dny0c4his79c7h8ro88cm0g016p95qfb	.eJxVjM0OwiAQhN-FsyHIT6EevfsMZNldpGogKe3J-O62SQ96m8z3zbxFhHUpce08x4nERZzF6bdLgE-uO6AH1HuT2OoyT0nuijxol7dG_Loe7t9BgV62dSLmETAPyhpP7MloHZwCNE451AHy6BlzBm-CSxayD9ayTWrYkiYSny8GOzih:1p8kr6:BOV83Jq6aMVP0q4psb_qe0_-K8zISFX1dVXDZI2c5Xw	2023-01-06 16:25:08.043886+00
m4i0khpm3s5h4hoe6pc9natog3amhqzf	.eJxVjDsOwyAQBe9CHSHAfLwp0_sMaGEhOIlAMnYV5e6xJRdJ-2bevJnHbS1-62nxM7ErG0Z2-R0DxmeqB6EH1nvjsdV1mQM_FH7SzqdG6XU73b9AwV72t0BnrAygBbikIQUpHaWsRqVxAKdhT7loVRAoKUdjlAZSQJYoG6eRfb78BDgW:1pCnJo:x9jzvxKS_kWVv7cRNE_-0pa_Ru8zN4AIHaeYmIcIcHY	2023-01-17 19:51:28.870775+00
c5qd8gnnvqsr69wv3fbgth36hgtpbd5z	.eJxVjEEOwiAQRe_C2hDageng0r1nIAMMUjVtUtqV8e7apAvd_vfef6nA21rD1mQJY1ZnBV6dfsfI6SHTTvKdp9us0zytyxj1ruiDNn2dszwvh_t3ULnVb10IsUi2HSUCdCSWwFgwBIzgOvQDYOx9EnYDS7GD7TwVlD5yTMZl9f4A6pI3lw:1pFwLH:luFA-h5dKRxWxS0ZJIAmgD5KH_K3ECIrOC9t3z1KxD8	2023-01-26 12:05:59.444031+00
rh5imr10vih5ujm1e2ejiv2g0f28keey	.eJxVjDEOwjAMRe-SGUW164iakZ0zRE6ckAJKpaadKu4OlTrA-t97fzNe1qX4taXZj2ouph_M6XcMEp-p7kQfUu-TjVNd5jHYXbEHbfY2aXpdD_fvoEgr3xq6yBI60oFdImQlcEyIyqpnzBlyyEIR1HHmFCEzCmqvCQMiE5j3BxFqOG4:1pKQhU:rO_jssKgsDv8nM_QZeRDUvJFX8Ypqs1hCjs0KC076Ks	2023-02-07 21:19:28.93163+00
sikdli2m9noffusk2v2sqjfogvbmtnlk	.eJxVjEEOwiAQRe_C2hCHQodx6b5nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIiAJQ4_a7Bx0eqO-K7r7cmY6vrMge5K_KgXU6N0_N6uH8HxffyrbVhAmbWWdlhSGNAzTiyCXDOFjPGAIM2KaFCMFpRppiZAciwJUIr3h8ryjgC:1pCIdG:S_Y44_olL_5sg4itvums4VJFr9fCWLw6PI1D8oooo4Y	2023-01-16 11:05:30.194368+00
ldgqobdr4oy38k10mkpl41b9tbs7uidn	.eJxVjDEOwjAMRe-SGUW164iakZ0zRE6ckAJKpaadKu4OlTrA-t97fzNe1qX4taXZj2ouph_M6XcMEp-p7kQfUu-TjVNd5jHYXbEHbfY2aXpdD_fvoEgr3xq6yBI60oFdImQlcEyIyqpnzBlyyEIR1HHmFCEzCmqvCQMiE5j3BxFqOG4:1pKQhV:uWS8pBw-ltAFVEhkQeLfNRR3zo0AKpcnQltfNrNO6L0	2023-02-07 21:19:29.478885+00
fxoigbenno2jckhk82jhajyygsn6o3xa	.eJxVjDsOgzAQBe_iOrK8i9eflOk5g7X-BZIIJAxVlLsHJIqkfTPz3iLwtg5ha2UJYxZXAVpcfsfI6Vmmg-QHT_dZpnlalzHKQ5EnbbKfc3ndTvfvYOA27PVuemcMkbGoEVIG8KSBOwJbIXadcxmTJbS5EjulPST0ERSjIVVZfL7ZXTba:1pDgot:eeIVAmZJi8bEGLfKUTrdWDj7PPmN-d0TXB4Y-0iErLc	2023-01-20 07:07:15.826619+00
87ye40y1jpuqmmwgw2yhxangfa1q87jq	.eJxVjEEOwiAQRe_C2pAyUwRduvcMZIYBqRpISrsy3l2bdKHb_977LxVoXUpYe5rDJOqsjAd1-F2Z4iPVDcmd6q3p2OoyT6w3Re-062uT9Lzs7t9BoV6-NSJZ4kg8AAGSAYDorB9GSGxYPGdipOTEcs5eDB6TsWydjOhO5EC9P0gpONU:1pMlRW:zAtLn2IB5vkrx5w14UWKbuAmwb-UhXh95zDnf0Lo1Gs	2023-02-14 07:52:38.322524+00
dzdimp1n6jpwclpgc3t5rmbji0nv81k1	.eJxVjDEOwjAMRe-SGUXBDnXKyM4ZKjt2SQG1UtNOiLtDpQ6w_vfef7mO16V0a7W5G9Sd3REbd_hdhfPDxg3pncfb5PM0LvMgflP8Tqu_TmrPy-7-HRSu5VsTNL1yTI31hopMQjEAJtAYGENmSgYgCUhOGaK0zKRZkJgNRVv3_gA3IDjr:1pE7iw:wOkUvvllWLTr_sfHFUacNsGQZMPkKEo3gIpaMJcWGXI	2023-01-21 11:50:54.685006+00
8ny4n08pkmyplbl1w2g037kdqjnj3mst	.eJxVjEEOwiAQRe_C2hCmHRBcuvcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXER4JQ4_a6B4pPrjtKD6r3J2OoyT0Huijxol7eW-HU93L-DQr1s9ch2NEZriyHZiApHhYA6D5wRE0Vw7qwUIAOY5LQNwRlrKeet0DSw-HwBAcc3XA:1pNfR6:bfZwwevcP29Dq7X32_6QAujEM31QhkoeIs7Ul4s_cb0	2023-02-16 19:39:56.175331+00
j1nvy6v4e56adgnz3e2lu0x3a14i7z7l	.eJxVjDsOwyAQBe9CHSEWWAMp0_sMaPkFJxGWjF1FuXuE5CJp38y8N_N07NUfPW9-SezKAAW7_K6B4jO3gdKD2n3lcW37tgQ-FH7Szuc15dftdP8OKvU66gxBlUAuTdbkglFMpImsA1BGFolCa3RgDQHGABpKpCSlQqWE08Kxzxc1ZDeW:1pI5tK:GVZMbSLgt4ESkn1bB9UN1XZpJdkRB3vhzgB6X445Cjo	2023-02-01 10:42:02.144908+00
fvl71gboolrev5wdg6pzqac4qy9mbt1y	.eJxVjDsOwjAQBe_iGlnsxvGHkj5nsLzrNQ6gRIqTCnF3iJQC2jcz76Vi2tYatyZLHLO6KLC9Ov2ulPgh047yPU23WfM8rctIelf0QZse5izP6-H-HdTU6rcO1gNAV9ABCYaUAaFzRD5gJmcZ-Sw9ejDeMCOSgJNgC0LKXJiNen8AEYU4Lw:1pKk5r:ltQuo_SnMmCffxC0p5hSG_aummcHoikstKtHqs29EXY	2023-02-08 18:01:55.651504+00
9h210kzw67rz50vs8106mv9ftas6vf33	.eJxVjDsOwjAQBe_iGlnxyl9Kes5g7a43OIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8FXVWJoA6_a6E_JC2o3LHdps1z21dJtK7og_a9XUu8rwc7t9BxV6_NTtAN4xDsGRtdM4HMMLsSGKy4CN4jwVppJLQRAtkJGESAAQPgVi9PyAVODU:1pKx5E:_KjchTdx2pTjgFR1MV1wiKmSXZ2S0FrV0pnUedVnUFc	2023-02-09 07:54:08.143679+00
txhqm40g6qzuqe6839vtqdhxwkrz2pwa	.eJxVjEEOwiAQRe_C2hBwYKa4dN8zNDNApGogKe3KeHdt0oVu_3vvv9TE21qmredlmpO6KDugOv2uwvGR647Sneut6djqusyid0UftOuxpfy8Hu7fQeFevnXOlII3BBmBLHgKgIkA0Ikz5IMMZ4hsLUeCaHxCHwy7KEjGCzCq9wcC-jcg:1pO6x3:fYPLc7wcg_V3QgUtjfaJfn0zXF097aBphFmYzapuiIE	2023-02-18 01:02:45.968059+00
dvbfrgk0o9fyzw5p6d8i81tcaknra46d	.eJxVjEEOwiAURO_C2hAo8Cku3XsG8oGPVA0kpV0Z764kXehy5r2ZF_O4b8XvnVa_JHZm0gI7_bYB44PqQOmO9dZ4bHVbl8CHwg_a-bUlel4O9--gYC_ftZEYxWwnFaNLNgQhlQlWKQU0UsqgNQI5gDSDBqFtNoTCTWQgoxbs_QEkGjfe:1pOG4U:ZlGRYjTN_jhTc1IZtR1gxF3hSwri4qmsC6cuHAU3nUU	2023-02-18 10:47:02.377259+00
ovoguppulr9ap16dnbpmqavn9e9yp2a7	.eJxVjDsOwjAQRO_iGln-4Q8lPWew1t41DiBHipMKcXccKQV0ozdv5s0ibGuNW6clTsguTDrHTr80QX5S2yt8QLvPPM9tXabEd4Ufbee3Gel1Pdy_gwq9jrUOpCxJn89KIoJOgowNQhhdPGhdsrGmeC0IBxnBqGRlIARwNuSc2OcLJxk4bw:1pKzng:4MuE-_3nyK0k7NS5uKo6q-u5emKjFEWeveVZ4iHdg90	2023-02-09 10:48:12.599901+00
c6oabykxn2lwvl18ktmz9b4jmg6ddbgj	.eJxVjMsOwiAQRf-FtSEwPAZduu83kBmgUjU0Ke3K-O_apAvd3nPOfYlI21rj1ssSpywuQnslTr8rU3qUtqN8p3abZZrbukwsd0UetMthzuV5Pdy_g0q9fmtQlkdHaA1YDVAKGkUJrRsRz5CMCckFhR6Mg-Aza6UwZGJkbUCTFu8P-ao2zg:1pONhH:v5PwjoTqfZfDBi_jj4lLFOoZ1DWFm2uGgt9Qt6d2vjM	2023-02-18 18:55:35.647703+00
bpq1pndkamxwg5oyft2c7vnjypyegih4	.eJxVjDsOgzAQRO_iOrL8wXhJmZ4zWLteE5NEtoShinL3gESRSFPNezNvEXBbc9haWsLM4iq0uPx2hPGZygH4geVeZaxlXWaShyJP2uRYOb1up_t3kLHlfT0RGGLlXacQYlQcgcnvmZQG49FYh8kaT0ypJzN4PXQARNBbB4pIfL77uzgt:1pOuMH:TWR7O5zq45WE6U5DP-1OlhBen3W0uFEYYuBqdhXmcBU	2023-02-20 05:48:05.126928+00
nkecl42hijlx23g3fmzli3ix56462rxv	.eJxVjEEOwiAQRe_C2hCmpQVcuvcMZIYZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzAgB1-l0J00PqjviO9TbrNNd1mUjvij5o09eZ5Xk53L-Dgq18a3SM3nbOeLZBnM_96N0AhHY04iwAh55pgABEIWdvkgFPFjuAJImten8AF1k4Ag:1pP7fz:Vj0tG-LDYTzrvj3y6kqFkwGwNdPD7B9liyjJak3S7pY	2023-02-20 20:01:19.409712+00
byjislm6lzn7wngtdi4o9u46rk91zvc6	.eJxVjEEOwiAQRe_C2hAodACX7nuGZhgGqRqalHZlvLtt0oVu_3vvv8WI21rGrfEyTklchQYvLr9rRHpyPVB6YL3Pkua6LlOUhyJP2uQwJ37dTvfvoGArex0AAgJo64hMZtsrVlFDZ1TIPidIninq3rFjT9SxQbDZKBN2E3unxOcLJyQ36w:1pP8Kk:qrOxR3Iosiu9ZpjngyKiDu_YJ2zZBLZQ98W-TRMVtsE	2023-02-20 20:43:26.406657+00
ayahow0qqq3kz9ruiiq4fxmd4vta607p	.eJxVjEEOgjAQRe_StWnKMK3g0j1naGY6U4saSCisjHdXEha6_e-9_zKRtrXEreoSRzEXAw7M6XdlSg-ddiR3mm6zTfO0LiPbXbEHrXaYRZ_Xw_07KFTLt3bYOejQZWTfg6AwCDX5nMSjNKHPSt4pJ1H0giFL21HDfWJ10kIA8_4AMf845Q:1pP8N0:-dbksvegKighecQtXqTw39aSYjeeniWeyizDSaPJLys	2023-02-20 20:45:46.925863+00
ye6kerrvnpxicyjdzq387ioahukfixc2	.eJxVjDsOgzAQRO_iOrLAH2ynTM8ZrN31OiaJjIShinL3gESRaLp5b-YtImxriVvjJU5JXIXqtLj8tgj05Hqg9IB6nyXNdV0mlIciT9rkOCd-3U7376BAK_sa2PWaMioM2pM3aF1m5a0esM_GqsF3jlQwBEED5eCQbdhj2BNRsOLzBTDVOFo:1pPHaa:z6yGZ4A-RRtyYxOexuu45puOG8vvKyao2SqfuaJCcp8	2023-02-21 06:36:24.759126+00
ilnjf80g5w28c5gg3y1ijodgc1u34f78	.eJxVjMsOgjAQAP-lZ9NsKX3g0Tvf0Gx3F4saSCicjP9umnDQ68xk3irhsZd0VNnSzOqqOujV5ZdmpKcsTfEDl_uqaV32bc66Jfq0VY8ry-t2tn-DgrW08QAoAYdorAcJPXMktMGJUI7oDOAEPhNM3AXnhHDwjsVYsECOCNXnCzjGOOI:1pPIxx:5XNV01G157xj7SDSSS9nu6CtNmI9LHvGYpkrX-kNL3U	2023-02-21 08:04:37.978757+00
ufj7xrizzaqsl9ongsfncj1nwtckyx1o	.eJxVjDsOwyAQBe9CHSE-5uOU6X0GtLBLcBKBZOwqyt0jJBdJ-2bmvVmAYy_h6LSFFdmVGcsuv2OE9KQ6CD6g3htPre7bGvlQ-Ek7XxrS63a6fwcFehk1pOiUcehNMlIK9FlJB7POMgrKKWVhSBFNGYUmJ7QGbwTqPEk_W4vs8wUiJDhk:1pPJDl:Q7AKCgPs6a00pCJkClBaaVT5AqhDSHaaA-lukVHlHlc	2023-02-21 08:20:57.393171+00
l6e373ndzohtxwfx8wrg89n0p9o55giq	.eJxVjMsOwiAQRf-FtSE8ioBL9_2GZoYZpGogKe3K-O_apAvd3nPOfYkJtrVMW-dlmklchFFOnH5XhPTguiO6Q701mVpdlxnlrsiDdjk24uf1cP8OCvTyrYM2isOAOqh8dujIKY9J5ww55ZiAFXGINLALFix6cAoiWwId0BvP4v0BQsQ5Jw:1pPJcq:-nU28PnIJiLAfkYHGQHdfo4fpfrRAHtlN41lnTKScN4	2023-02-21 08:46:52.932766+00
pj8lgmbi6tm1tigqivzxsd8nf5bku36u	.eJxVjMsOwiAQRf-FtSG8oS7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MxkCOz0uybID2o7wju0W-e5t3WZE98VftDBrx3peTncv4MKo37rKU8WnRFQPOlghVZSUTAGhLFBYZEahbcqk3YyQXHGJ1vQyqxdkWSQvT8UzDfc:1pPKZN:MdTWv02iEoFaqvMFxMMtnjtccToOGtNcFJcEgcFzNAY	2023-02-21 09:47:21.408263+00
62qca7bild5bxewyl809z1he8ayy4pmr	.eJxVjEEOwiAQAP_C2RCkLIJH731Ds91lpWogKe3J-HdD0oNeZybzVhPuW572ltZpYXVVQZ1-2Yz0TKULfmC5V021bOsy657owzY9Vk6v29H-DTK23LdgCYABvQSKEMGIWPSOvHWRwmDIeb6AAXTWMAsxCJ_DQCjkOBj1-QLcNzgS:1pPKhv:v2Ysvu5JUy5Q66XGfdq63jwV5AaM0aSJFbeybcWYdtE	2023-02-21 09:56:11.779743+00
ysebxwcmltpcncrvtnwa40if9njhu5m4	.eJxVjDsOwjAQRO_iGln-sP5Q0nMGa-21cQDZUpxUiLuTSCmgmGbem3mzgOtSwzryHCZiFyadZaffNmJ65rYjemC7d556W-Yp8l3hBx381im_rof7d1Bx1G3tyfsiwIBI2UsUBImcA1T5rB1uUSiNsxGULtJqBwWtUUAxlWhLEuzzBSE1OB8:1pPLzd:DNR2OVgS06TuFl_LXQB2cNCqBnimrxoHdzXpr6fhh-8	2023-02-21 11:18:33.76427+00
lg0xllbuor0d0ys4unvs9af2wkf6psoy	.eJxVjEEOgjAQRe_StWnoDLXFpXvOQKYzjKCmTSisjHdXEha6_e-9_zIDbes0bHVchlnMxbjWm9PvmogfY96R3CnfiuWS12VOdlfsQavti4zP6-H-HUxUp2-NDhofNYE6Dg1AQBe4RcHWd0hBziisMSWH3DF4UvBBY0MqGhWjmvcHD-w4Ow:1pPNXn:sjgTl4UCFPH35qm5OpUvkDWFi-Z9SAx49w6mSXWFvyQ	2023-02-21 12:57:55.51309+00
5b5j7h3p3z86nvx1lo3l67vi0dqshipg	.eJxVjEEOwiAQRe_C2hAGkEGX7nsGMgxUqgaS0q6Md7dNutDtf-_9twi0LiWsPc9hSuIqwDlx-l0j8TPXHaUH1XuT3OoyT1Huijxol0NL-XU73L-DQr1sdaSzYm8zmIjGckbnlBnRkvZMCRkAEJNVo9YadcZNhOTUBSOTMd6IzxcjJzea:1pPNOp:2exMY8Oqof-XAuRYrMRq2DVDwC_cunl8yTehBKe_lZE	2023-02-21 12:48:39.909281+00
ztyti1mqe2jl7nmq0ohunu6jq6v05abg	.eJxVjDsOwjAQRO_iGln-bGKHkp4zWLvZNQkgW4qTCnF3iJQCqpHmvZmXSritU9qaLGlmdVYA6vRbEo4PKTvhO5Zb1WMt6zKT3hV90KavleV5Ody_gwnbtK9BQrT2G94a6LgnH7NAZhJ0LuBgMjrTx4hsA5PFIdPYgfMBYmeCqPcHFHo4Mw:1pPNtY:lhf7v9kk-KLDi06gm0aIYyRA8eGzDyc9CboZiUqnDio	2023-02-21 13:20:24.541356+00
m9lkcjcn9q6wa5ie8fvqigm1wig5cpto	.eJxVjEsOAiEQBe_C2hCg-bp0P2eYNNDIqIFkPivj3Q3JLHT7quq92YzHXudjo3VeMrsyaSy7_K4R05PaQPmB7d556m1fl8iHwk-68alnet1O9--g4lZHbQwSWgAlHJJIzkuSSTv0IRBQyoDaRwVSgFHFqZDBFhu0LFGHiJ59vi0hOA8:1pPPkm:SKkcP4Gd_BdYI7T8bzv9lG-5jCkacTkA3mWBMyNyYV4	2023-02-21 15:19:28.071346+00
5w3epfhjxmdd1gtrlgb9bfaf5s4rkg5z	.eJxVjEEOwiAQRe_C2hAoI1CX7j0DGWZAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERoMTpd4xIz1R3wg-s9yap1WWeotwVedAub43T63q4fwcFe9lqlciMxpKn6LLWmMlp9gykoovI4CibQSd1dnYAoE21oBzA6NHbbFh8vhZNN9s:1pPSg0:UdV2d4wHRbp6p1K3dSbgUgpaRr-SC5pJwBSlAhjJdhU	2023-02-21 18:26:44.190548+00
rucvt71xlof5jlr3slpzh6t9esamucxz	.eJxVjMEOwiAQBf-FsyFQygIevfcbCLCLVA0kpT0Z_9026UGvM_Pem_mwrcVvnRY_I7syBezyC2NIT6qHwUeo98ZTq-syR34k_LSdTw3pdTvbv4MSetnXmfTgMlqNMAAIKxwpNNplESUJCWCk3VEWZAmUITsaDCkaFDjmqCz7fAH81jf9:1pQ93r:lPtnA5occC0BTLKDphlt6Pxm-IcNxxAtmsTUmJTA3Pk	2023-02-23 15:42:11.937012+00
aefwhhzg2wqg9q6sdp7e75ri1e2u08cl	.eJxVjEEOwiAQRe_C2hCwDFNcuu8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIitNPi9LsG4keqO4p3qrcmudV1mYPcFXnQLqcW0_N6uH8HhXr51pgS5zhC1IbRKSAEAwhqcNnkEYfgNGeF7Mhae84YVCBwJgAmBoMo3h8uATgB:1pQZTS:oKAHXOC3odD5LWtlY_xeeq8R8S8IuH-wO5b5xOS0MaI	2023-02-24 19:54:22.561243+00
22s01vcdif1uudfq8cqb6wknvh3pfgfy	.eJxVjDEOwjAMRe-SGUXEJW7MyM4ZothOSAG1UtNOiLtDpQ6w_vfef5mY1qXGteU5DmrOxpnD78ZJHnncgN7TeJusTOMyD2w3xe602euk-XnZ3b-Dmlr91uDFAwU8ARxLT54ZOvboVJAQsqB2yBS4l1RK8KqKVAhVuQOh4sz7A85rOCM:1pRHAt:uMS7n1B4Xc1qxddmJ_MpOMUY2srDBALJs7PAyu5gREU	2023-02-26 18:34:07.196335+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: fcm_django_fcmdevice; Type: TABLE DATA; Schema: public; Owner: pwwoiqfkebqgtp
--

COPY public.fcm_django_fcmdevice (id, name, active, date_created, device_id, registration_id, type, user_id) FROM stdin;
7	\N	t	2022-12-05 15:16:13.610762+00	\N	cZ07144da8RIueA3tN-Esr:APA91bHthNgzrb5lnReLZghAyfpqosD9Xq4OQGYJtnWbx6a8phdUSEu1OyVVoJS8XwyeZWxkeeYtLokRaNPCb5GfGxiXhm5xfknTbbiaw4GNgSZq-L1A99sB3ScF2uND-DBmtooIiobe	web	14
9	\N	t	2022-12-06 08:12:02.823035+00	\N	dOXYNLFyXdS6eHhR_aXOVF:APA91bHH8p7P7ANz7JZJkA5KOPONP1OFNPZuKIHO7FBIRtADci8D7JMBxRrcwOuo7WSThi9GMBSsi7Oc2rR_1LXT0jy30SBJuevSVx0LrdnFGrXtsVbc7JTArWhR-PsyUESQqfXw1G7M	web	19
10	\N	t	2022-12-06 15:03:47.739654+00	\N	csG6tSCy0PNEYK9H85_rEE:APA91bEybfooIGVyZYViI2nKthyN-zYzyL00Ra0zYEnAFABAlkOY6Rb0-KA7Kc4YdIHOavSIJQx960IJw1iRCNZ7Ib6eb61kaWl2cZZ5K8nDS1hkJD4-hWQT0CZgx36lDbSEsymZfQdr	web	15
11	\N	t	2022-12-06 17:17:28.591933+00	\N	dNypscz691u4hxcPq3F2eS:APA91bHTajWOjjfR9zrvKtIcj4JR4s5vn8wUu2D4zzzvTGUrl8e-3JH-FFh03gkQ8pdJw4ruHwT5CdmJuwXV6D4nrIr6U08SB_p5Fo-ugVGSjm-fXntORhs87c2mNjk0dMPVVu1CpdJa	web	25
12	\N	t	2022-12-07 08:51:31.779481+00	\N	ders1SmGqqlMRZCnVAQ7O8:APA91bHGMt_0-oXg61MhUq1ATwkW-AeaPjmT-xNKVinAGM2CJadKbDnlekaIZhA3kSEIzo_WY_g7Z4SAyg1_Hs_Jv297WZHW-SZ01ev78PGj884laqrDosql92GvYk4FbwGaCih6S7MB	web	31
13	\N	t	2022-12-07 10:42:03.516601+00	\N	fMDDemojLUJ_68BdaEjebU:APA91bFHSxgnjLH7mwhJoA0n7exPc5XDZbPmRFKPS4fBc2-pD_je7Q2GrWTWxEFJ5hJiREzJX2uP4MWTd3_FKknrrZcLnvP4-DqJLuBKfa5r4FGNMvzdMDtbBSnrXFiiCY3KlAjlMyjA	web	32
14	\N	t	2022-12-07 11:03:38.35675+00	\N	dD7_lamVPwfhecrIHHVwK_:APA91bHD-Y5zFh2BOKB-Ot6WXdDa4ErU3-GOvVYQuuYa9uQh71ULvE91butBHWAwpdCAWuoBc4SXDZkprBEyURG6nF0dFR8JyR19PwZf-tPW71_6qdER2gAJFd3nHgshQqEPTfwW3xMh	web	33
15	\N	t	2022-12-07 13:59:01.586507+00	\N	cyXpNiJyO9646adnj2GQu_:APA91bFaKMR50orafOAmgxKxWAB06Eso00DI66REC3dHVwjwrEkiP5_m2sWfSYqfIg0X7d28-MHa0bnlHogAqkhS4-aQfLX7l0Dls8Pv1XyDf-jxFrG7dMCBESIicf07f6RBtGlkHXI8	web	37
16	\N	t	2022-12-07 14:28:37.549173+00	\N	etQ_JmdidzypZN_90G7PI_:APA91bGPHyHYpowG-hbgbJwKCtfAOOih8yQVwEDIj56fZwZ59ZbRPd2WJZwgdRDnce8AXENDl0vZp2cyNgj7jphNeiCfoMz5K6ZBVvZbMxWkAeO6WKxGGp4u8PQcqGrdnv-aGsSWhpSv	web	36
18	\N	t	2022-12-08 07:08:38.73567+00	\N	cISL0bBTcNqP1m_uZMarmX:APA91bEIYS-6OLPi3ZsGSZUis0eT1kvlp8AgAKK5EdlRiXC-Ud4LKMd6AV6wOELB1eTDUGD-MvM40MHBCjtkEw8qpf2O0D3bk5J7ViEI0r5yvlDMEIe1luA5ohNbageIWlu0yDu1Udgx	web	41
21	\N	t	2022-12-10 09:16:07.470867+00	\N	coLVlK18wdMYtRuksc6pBr:APA91bHlw2CdS_GJ3uvc-7wO0-qftWEAEshkWFJDKcpc3LRomdBXC-cYM7khFFQcNitphaMsbHD3GzYs7Z-siiWh8mMgFBENxGBJdM0O-aRjMUzhCJuFpTX5agFyzPhbM23dwk-Eiw3V	web	51
22	\N	t	2022-12-10 12:21:57.333227+00	\N	c36We0x3dctouUZRfcqjMA:APA91bHftEvvTDcNxu5FIONwfGlB9Cd5raydzTQ7XeDbcDWg56fvQ-9W6vQw8bXKG3bjEbflGXhFpA_1CO0poZ1prC4Hmun0w5-xMDGx5WQZv6RWBLSlkGU5G0edt4hdy004kRgrbmVg	web	52
23	\N	t	2022-12-14 18:13:05.078167+00	\N	ctioXq_xd0GICo6O07Ptno:APA91bGXzwdq9_e4Wi8FprmYnc1CcrXOMW5zJ-kDK8Svqb7X8qv-wfrVnbB1kuWEmRGmxmTPlDRwNp-ltMSbt1ch46dMbb3s1AgsHmZIRNsKXdejH2MoqeceVKazDG7miOz1SWjGuW2b	web	59
20	\N	f	2022-12-10 01:10:40.75188+00	\N	eCjIniGpBWxKB8NcKxy8lU:APA91bEkqh3Tj2XE71VEBPyqLtuWN1aMjoUn9pC_T1kRLLe4gWaA5VFzppfDweLPvJr-GEMOW_ZzVn6qgnO_X38msM8OK-MQDVVWfs9iLrd7Hv4CFijqbImYI8ffzBhjxSI9HtqAIz1j	web	50
17	\N	f	2022-12-07 17:11:59.660176+00	\N	ccbU-fIV0m46RY8KQ-N8NG:APA91bEpMO6GQXX6cL7QfaEYSjN11Vao-36iXOtBnadxpdRaNr7gbXlY-xx6sz-xU1-tyAVN6dFZwov7Wr1C7bm5-hD-DCDqplTKGOOEmfyYDxG2xiNf_-ES65ivxpUAuam1LGBHb66v	web	39
26	\N	t	2022-12-30 12:40:32.902939+00	\N	c4r_t8PJg6bt9r_sEBd5BP:APA91bGWMXMx4Kl0UM5c2A4afwlB6y3tYlbdZueIGRztFzWRuaXIDYvlXVo5SIazigfatiTebd5zg8iSpykY3eHlYJPMdWq4SC6xM65ngTiaNJYHIgyJHCHGVRlKE3cFkRo1kLfQy66b	web	35
19	\N	f	2022-12-08 21:15:53.559167+00	\N	cZcesJwmZ7exAkzXbvAlKC:APA91bGpxYnEcPE37HhOja92k99M-B3sV6fjVt-sPzg2G7ljOZ8ZO0hFuQK9s89lPwzmH3N2Yb7NzRwV5XcXX8Rlq-eoz6L1or8CJiRQNmEY7D-_7kqnE4P1ocps9bacUiY56D9TfyI4	web	48
28	\N	t	2023-01-03 19:50:38.373112+00	\N	epo2rx84tomtrqakSKLF6b:APA91bF_UgnLdkPQc9cgQ172O3IY48vUfShCw3jHSZq6MbFssCopPgCIdRXQgLblTJE_s_cvtcda1-hGJgEken0PObwaryh0x9Zdll6RP2zq0T69C3KlWRtG1MtymxXR3flfqGodc18S	web	24
29	\N	t	2023-01-16 23:13:34.21038+00	\N	fEXgAWlXBDAi6YiXVGj-2J:APA91bHijyCWCUY1IWApQj5ksM5KVjiZbKHks1y8xT22M0nxVjQB4673g0ldebiXFYE6uu6RkpwwyGt2yPphpa7xHxCWBjtk1ORFg8KLbiUmmGwewSp4tlTujbl6oU66ovQqHEQjrsmM	web	147
24	\N	t	2022-12-22 18:38:27.133053+00	\N	ceg5EEMQBYCiT1uAZlg7e1:APA91bE5iYor4yWYSh-_8KrgjejzsKQq8qRuHw3dyeAvRZsOwAQsSjAHwJvF0bZilpso9zIqSZvEb8L2uEe5FvmmYARGsnzRx_F5gCM7lDt19ar1-8poPecsUxFDLGXmrypYF0qQZNX1	web	56
25	\N	t	2022-12-22 19:56:25.861768+00	\N	d1RYvwzN3JMTB-CvNaLTMt:APA91bF4m-1QIwH63ACDpjWgvEf5W-JyEVarAtTfNs3JT8MnHVN2mFqh_rLPi2mESpq66993xq9XFlbShW6UFLQoLkrW9lruuSovhex9p_iYRVqijQ8-ou-xl_EwA5MfjdUWVqUTb1Km	web	68
30	\N	t	2023-01-17 16:14:17.223412+00	\N	eCH1H9btiCmfRuh_ncp7Ra:APA91bHdt4JtRB-jAtBmBGyYOrYJLAr-mv9ZVUfgceJ6ECa9HP1ZkVmaGZpB-IQ-mvJD2v7pfPJ3XQhMxkOkfEmIK4qDSZIPTtp0dcBrQ6zRSBlS8yESVLVE9PUvLnB_lL9vGZwlj1jq	web	65
31	\N	t	2023-01-18 22:57:22.822268+00	\N	f2RUBbSYzVZFKNaqMBG001:APA91bF9jo8UR_Nk8VmjfXIiwDvAfTIh-6dL3IgbucWh56dpff5aV7MeOWrAOs3RX7FFBC0t505cj66wpbZFh09Ro6-VfUWk6QalIlgg7iBJkO1lX-hAXkLcO97VGEElZZfPq_VV-Kns	web	151
32	\N	t	2023-01-20 12:43:28.575484+00	\N	eOy2YcISvnxwYV-0fuhhb5:APA91bEFJObX_8PbHgeO8VHPd71f8lFs15bwaXjVejNFCiqC6oicHdlgfa7KB1vf3G9JwB8SD4W_oGS04WDYVMp2G0_csCQzjQLE-Wp_w_poaDfNP-80j3h5g6qXhokiVjUwJUv1ZLGk	web	20
8	\N	f	2022-12-06 07:55:05.020757+00	\N	dQk6CMO_XSg87SGC1-Gkan:APA91bGItHk4HRpUxt6eaelDabVrHPr99u0nD8VpN_CMoxlCXidpowt6_dGVFTfkR1STHpwZ3becrh97BVzxyPqrRoeJoDhbgMjZCKdJh-nfiK7M3ImY8dd_vuObv6QcziMh9Gl9je92	web	22
27	\N	t	2023-01-02 15:58:54.504323+00	\N	coPRKYhelEhIlZqUXHzdfG:APA91bFOrjD2CWMcAs-8VcxO8BB9NQU9JuTMZ07GinymlW44K5ae8YncS5pVlgKtZjMIDSgmFSmqQm1h1Af0snksccKuj1JKk0Tl_QppVoDBqDpjhunXSUQh2Zuizwn6B5QB_hFdLEoT	web	53
33	\N	t	2023-01-20 21:22:04.476975+00	\N	f5_ibaqo_486zG6gAGSXgK:APA91bE3uDJVnqmETZK3yVPRycVAgJbwu5Lzu2Dulnz3d9nsICmGKm9iTeT_Zl4L10_vvSBr6qxOwNv0aUiPxpCGI6Lc2FL-PU5bWP2vkIm8HJJkfMeEuV1HN2rBHtCKQ_y8U7y8rZhH	web	154
\.


--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_abnfeature_id_seq', 93, true);


--
-- Name: app_admintoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_admintoken_id_seq', 299, true);


--
-- Name: app_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_category_id_seq', 55, true);


--
-- Name: app_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_client_id_seq', 78, true);


--
-- Name: app_clientdemand_clicked_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_clientdemand_clicked_id_seq', 115, true);


--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_clientdemand_files_id_seq', 1, false);


--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_clientdemand_id_seq', 185, true);


--
-- Name: app_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_feedback_id_seq', 5, true);


--
-- Name: app_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_label_id_seq', 16, true);


--
-- Name: app_myfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_myfiles_id_seq', 4, true);


--
-- Name: app_parrain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_parrain_id_seq', 48, true);


--
-- Name: app_retrait_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_retrait_id_seq', 1, true);


--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_selleraccount_category_id_seq', 990, true);


--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_selleraccount_id_seq', 90, true);


--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_selleraccount_subs_id_seq', 1011, true);


--
-- Name: app_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_subcategory_id_seq', 857, true);


--
-- Name: app_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_user_groups_id_seq', 1, false);


--
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_user_id_seq', 206, true);


--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_user_user_permissions_id_seq', 1, false);


--
-- Name: app_usergame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_usergame_id_seq', 1, false);


--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_weekcustom_demandes_id_seq', 330, true);


--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_weekcustom_id_seq', 443, true);


--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.app_zawadidetail_id_seq', 42, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: blog_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_articles_id_seq', 1, true);


--
-- Name: blog_articles_ssubject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_articles_ssubject_id_seq', 1, false);


--
-- Name: blog_articles_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_articles_subject_id_seq', 1, false);


--
-- Name: blog_articles_subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_articles_subs_id_seq', 1, false);


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_comment_id_seq', 8, true);


--
-- Name: blog_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_subject_id_seq', 4, true);


--
-- Name: blog_subsubjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_subsubjects_id_seq', 15, true);


--
-- Name: blog_videoart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.blog_videoart_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 485, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 68, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pwwoiqfkebqgtp
--

SELECT pg_catalog.setval('public.fcm_django_fcmdevice_id_seq', 33, true);


--
-- Name: app_abnfeature app_abnfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_abnfeature
    ADD CONSTRAINT app_abnfeature_pkey PRIMARY KEY (id);


--
-- Name: app_admintoken app_admintoken_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_admintoken
    ADD CONSTRAINT app_admintoken_pkey PRIMARY KEY (id);


--
-- Name: app_category app_category_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_pkey PRIMARY KEY (id);


--
-- Name: app_client app_client_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_pkey PRIMARY KEY (id);


--
-- Name: app_clientdemand_clicked app_clientdemand_clicked_clientdemand_id_sellerac_ea0b5ac2_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_clicked
    ADD CONSTRAINT app_clientdemand_clicked_clientdemand_id_sellerac_ea0b5ac2_uniq UNIQUE (clientdemand_id, selleraccount_id);


--
-- Name: app_clientdemand_clicked app_clientdemand_clicked_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_clicked
    ADD CONSTRAINT app_clientdemand_clicked_pkey PRIMARY KEY (id);


--
-- Name: app_clientdemand_files app_clientdemand_files_clientdemand_id_myfiles_id_e4b06f6f_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_clientdemand_id_myfiles_id_e4b06f6f_uniq UNIQUE (clientdemand_id, myfiles_id);


--
-- Name: app_clientdemand_files app_clientdemand_files_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_pkey PRIMARY KEY (id);


--
-- Name: app_clientdemand app_clientdemand_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_pkey PRIMARY KEY (id);


--
-- Name: app_feedback app_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_feedback
    ADD CONSTRAINT app_feedback_pkey PRIMARY KEY (id);


--
-- Name: app_label app_label_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_label
    ADD CONSTRAINT app_label_pkey PRIMARY KEY (id);


--
-- Name: app_myfiles app_myfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_myfiles
    ADD CONSTRAINT app_myfiles_pkey PRIMARY KEY (id);


--
-- Name: app_parrain app_parrain_ident_key; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_parrain
    ADD CONSTRAINT app_parrain_ident_key UNIQUE (ident);


--
-- Name: app_parrain app_parrain_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_parrain
    ADD CONSTRAINT app_parrain_pkey PRIMARY KEY (id);


--
-- Name: app_retrait app_retrait_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_retrait
    ADD CONSTRAINT app_retrait_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_category app_selleraccount_catego_selleraccount_id_categor_640c84ff_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_catego_selleraccount_id_categor_640c84ff_uniq UNIQUE (selleraccount_id, category_id);


--
-- Name: app_selleraccount_category app_selleraccount_category_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_category_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount app_selleraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount
    ADD CONSTRAINT app_selleraccount_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_subs app_selleraccount_subs_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_subs_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_subs app_selleraccount_subs_selleraccount_id_subcate_10e4021e_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_subs_selleraccount_id_subcate_10e4021e_uniq UNIQUE (selleraccount_id, subcategory_id);


--
-- Name: app_subcategory app_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- Name: app_user_groups app_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_user_id_group_id_73b8e940_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_group_id_73b8e940_uniq UNIQUE (user_id, group_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_permission_id_7c8316ce_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_permission_id_7c8316ce_uniq UNIQUE (user_id, permission_id);


--
-- Name: app_usergame app_usergame_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_usergame
    ADD CONSTRAINT app_usergame_pkey PRIMARY KEY (id);


--
-- Name: app_weekcustom_demandes app_weekcustom_demandes_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_demandes_pkey PRIMARY KEY (id);


--
-- Name: app_weekcustom_demandes app_weekcustom_demandes_weekcustom_id_clientdema_b96f7b0e_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_demandes_weekcustom_id_clientdema_b96f7b0e_uniq UNIQUE (weekcustom_id, clientdemand_id);


--
-- Name: app_weekcustom app_weekcustom_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom
    ADD CONSTRAINT app_weekcustom_pkey PRIMARY KEY (id);


--
-- Name: app_zawadidetail app_zawadidetail_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_zawadidetail
    ADD CONSTRAINT app_zawadidetail_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_articles blog_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles
    ADD CONSTRAINT blog_articles_pkey PRIMARY KEY (id);


--
-- Name: blog_articles_ssubject blog_articles_ssubject_articles_id_subsubjects_id_1549f039_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_ssubject
    ADD CONSTRAINT blog_articles_ssubject_articles_id_subsubjects_id_1549f039_uniq UNIQUE (articles_id, subsubjects_id);


--
-- Name: blog_articles_ssubject blog_articles_ssubject_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_ssubject
    ADD CONSTRAINT blog_articles_ssubject_pkey PRIMARY KEY (id);


--
-- Name: blog_articles_subject blog_articles_subject_articles_id_subject_id_bc1b9495_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subject
    ADD CONSTRAINT blog_articles_subject_articles_id_subject_id_bc1b9495_uniq UNIQUE (articles_id, subject_id);


--
-- Name: blog_articles_subject blog_articles_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subject
    ADD CONSTRAINT blog_articles_subject_pkey PRIMARY KEY (id);


--
-- Name: blog_articles_subs blog_articles_subs_articles_id_subcategory_id_8bed24b5_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subs
    ADD CONSTRAINT blog_articles_subs_articles_id_subcategory_id_8bed24b5_uniq UNIQUE (articles_id, subcategory_id);


--
-- Name: blog_articles_subs blog_articles_subs_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subs
    ADD CONSTRAINT blog_articles_subs_pkey PRIMARY KEY (id);


--
-- Name: blog_articles blog_articles_video_id_key; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles
    ADD CONSTRAINT blog_articles_video_id_key UNIQUE (video_id);


--
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_subject blog_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_subject
    ADD CONSTRAINT blog_subject_pkey PRIMARY KEY (id);


--
-- Name: blog_subsubjects blog_subsubjects_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_subsubjects
    ADD CONSTRAINT blog_subsubjects_pkey PRIMARY KEY (id);


--
-- Name: blog_videoart blog_videoart_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_videoart
    ADD CONSTRAINT blog_videoart_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_pkey PRIMARY KEY (id);


--
-- Name: app_abnfeature_seller_id_79deb34f; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_abnfeature_seller_id_79deb34f ON public.app_abnfeature USING btree (seller_id);


--
-- Name: app_category_label_id_47609f05; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_category_label_id_47609f05 ON public.app_category USING btree (label_id);


--
-- Name: app_client_user_id_df70f6f4; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_client_user_id_df70f6f4 ON public.app_client USING btree (user_id);


--
-- Name: app_clientdemand_category_id_7f48e7f7; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_category_id_7f48e7f7 ON public.app_clientdemand USING btree (category_id);


--
-- Name: app_clientdemand_clicked_clientdemand_id_d7ebc09f; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_clicked_clientdemand_id_d7ebc09f ON public.app_clientdemand_clicked USING btree (clientdemand_id);


--
-- Name: app_clientdemand_clicked_selleraccount_id_1b35bf8a; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_clicked_selleraccount_id_1b35bf8a ON public.app_clientdemand_clicked USING btree (selleraccount_id);


--
-- Name: app_clientdemand_client_id_806f7d7a; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_client_id_806f7d7a ON public.app_clientdemand USING btree (client_id);


--
-- Name: app_clientdemand_files_clientdemand_id_fe63ff5e; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_files_clientdemand_id_fe63ff5e ON public.app_clientdemand_files USING btree (clientdemand_id);


--
-- Name: app_clientdemand_files_myfiles_id_73fb8933; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_files_myfiles_id_73fb8933 ON public.app_clientdemand_files USING btree (myfiles_id);


--
-- Name: app_clientdemand_parrain_id_f5a2a713; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_parrain_id_f5a2a713 ON public.app_clientdemand USING btree (parrain_id);


--
-- Name: app_clientdemand_subs_id_f5b539c3; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_clientdemand_subs_id_f5b539c3 ON public.app_clientdemand USING btree (subs_id);


--
-- Name: app_parrain_ident_48003486_like; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_parrain_ident_48003486_like ON public.app_parrain USING btree (ident varchar_pattern_ops);


--
-- Name: app_retrait_parrain_id_5bc4049e; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_retrait_parrain_id_5bc4049e ON public.app_retrait USING btree (parrain_id);


--
-- Name: app_selleraccount_category_category_id_fbf88a54; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_selleraccount_category_category_id_fbf88a54 ON public.app_selleraccount_category USING btree (category_id);


--
-- Name: app_selleraccount_category_selleraccount_id_53d24c30; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_selleraccount_category_selleraccount_id_53d24c30 ON public.app_selleraccount_category USING btree (selleraccount_id);


--
-- Name: app_selleraccount_subs_selleraccount_id_46ab9637; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_selleraccount_subs_selleraccount_id_46ab9637 ON public.app_selleraccount_subs USING btree (selleraccount_id);


--
-- Name: app_selleraccount_subs_subcategory_id_c9d01565; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_selleraccount_subs_subcategory_id_c9d01565 ON public.app_selleraccount_subs USING btree (subcategory_id);


--
-- Name: app_selleraccount_user_id_7c71cadb; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_selleraccount_user_id_7c71cadb ON public.app_selleraccount USING btree (user_id);


--
-- Name: app_subcategory_box_id_75f75013; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_subcategory_box_id_75f75013 ON public.app_subcategory USING btree (box_id);


--
-- Name: app_subcategory_sub_box_id_5c9be328; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_subcategory_sub_box_id_5c9be328 ON public.app_subcategory USING btree (sub_box_id);


--
-- Name: app_user_email_efde8896_like; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_user_email_efde8896_like ON public.app_user USING btree (email varchar_pattern_ops);


--
-- Name: app_user_groups_group_id_e774d92c; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_user_groups_group_id_e774d92c ON public.app_user_groups USING btree (group_id);


--
-- Name: app_user_groups_user_id_e6f878f6; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_user_groups_user_id_e6f878f6 ON public.app_user_groups USING btree (user_id);


--
-- Name: app_user_user_permissions_permission_id_4ef8e133; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_user_user_permissions_permission_id_4ef8e133 ON public.app_user_user_permissions USING btree (permission_id);


--
-- Name: app_user_user_permissions_user_id_24780b52; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_user_user_permissions_user_id_24780b52 ON public.app_user_user_permissions USING btree (user_id);


--
-- Name: app_usergame_user_id_9886c3a8; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_usergame_user_id_9886c3a8 ON public.app_usergame USING btree (user_id);


--
-- Name: app_weekcustom_demandes_clientdemand_id_c9f4fa8c; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_weekcustom_demandes_clientdemand_id_c9f4fa8c ON public.app_weekcustom_demandes USING btree (clientdemand_id);


--
-- Name: app_weekcustom_demandes_weekcustom_id_19656cf5; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_weekcustom_demandes_weekcustom_id_19656cf5 ON public.app_weekcustom_demandes USING btree (weekcustom_id);


--
-- Name: app_weekcustom_seller_id_e2426215; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX app_weekcustom_seller_id_e2426215 ON public.app_weekcustom USING btree (seller_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_articles_main_img_id_bd11c688; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_main_img_id_bd11c688 ON public.blog_articles USING btree (main_img_id);


--
-- Name: blog_articles_ssubject_articles_id_ac544102; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_ssubject_articles_id_ac544102 ON public.blog_articles_ssubject USING btree (articles_id);


--
-- Name: blog_articles_ssubject_subsubjects_id_98983bb6; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_ssubject_subsubjects_id_98983bb6 ON public.blog_articles_ssubject USING btree (subsubjects_id);


--
-- Name: blog_articles_subject_articles_id_6754ce1b; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_subject_articles_id_6754ce1b ON public.blog_articles_subject USING btree (articles_id);


--
-- Name: blog_articles_subject_subject_id_e258aae4; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_subject_subject_id_e258aae4 ON public.blog_articles_subject USING btree (subject_id);


--
-- Name: blog_articles_subs_articles_id_703c58f4; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_subs_articles_id_703c58f4 ON public.blog_articles_subs USING btree (articles_id);


--
-- Name: blog_articles_subs_subcategory_id_cace9258; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_articles_subs_subcategory_id_cace9258 ON public.blog_articles_subs USING btree (subcategory_id);


--
-- Name: blog_comment_article_id_3d58bca6; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_comment_article_id_3d58bca6 ON public.blog_comment USING btree (article_id);


--
-- Name: blog_comment_user_id_59a54155; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_comment_user_id_59a54155 ON public.blog_comment USING btree (user_id);


--
-- Name: blog_subsubjects_box_id_7b8ae306; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_subsubjects_box_id_7b8ae306 ON public.blog_subsubjects USING btree (box_id);


--
-- Name: blog_videoart_file_id_cdc74dde; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX blog_videoart_file_id_cdc74dde ON public.blog_videoart USING btree (file_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: fcm_django_fcmdevice_device_id_a9406c36; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX fcm_django_fcmdevice_device_id_a9406c36 ON public.fcm_django_fcmdevice USING btree (device_id);


--
-- Name: fcm_django_fcmdevice_user_id_6cdfc0a2; Type: INDEX; Schema: public; Owner: pwwoiqfkebqgtp
--

CREATE INDEX fcm_django_fcmdevice_user_id_6cdfc0a2 ON public.fcm_django_fcmdevice USING btree (user_id);


--
-- Name: app_abnfeature app_abnfeature_seller_id_79deb34f_fk_app_selleraccount_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_abnfeature
    ADD CONSTRAINT app_abnfeature_seller_id_79deb34f_fk_app_selleraccount_id FOREIGN KEY (seller_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_category app_category_label_id_47609f05_fk_app_label_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_label_id_47609f05_fk_app_label_id FOREIGN KEY (label_id) REFERENCES public.app_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_client app_client_user_id_df70f6f4_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_user_id_df70f6f4_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_category_id_7f48e7f7_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_category_id_7f48e7f7_fk_app_category_id FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_clicked app_clientdemand_cli_clientdemand_id_d7ebc09f_fk_app_clien; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_clicked
    ADD CONSTRAINT app_clientdemand_cli_clientdemand_id_d7ebc09f_fk_app_clien FOREIGN KEY (clientdemand_id) REFERENCES public.app_clientdemand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_clicked app_clientdemand_cli_selleraccount_id_1b35bf8a_fk_app_selle; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_clicked
    ADD CONSTRAINT app_clientdemand_cli_selleraccount_id_1b35bf8a_fk_app_selle FOREIGN KEY (selleraccount_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_client_id_806f7d7a_fk_app_client_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_client_id_806f7d7a_fk_app_client_id FOREIGN KEY (client_id) REFERENCES public.app_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_files app_clientdemand_fil_clientdemand_id_fe63ff5e_fk_app_clien; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_fil_clientdemand_id_fe63ff5e_fk_app_clien FOREIGN KEY (clientdemand_id) REFERENCES public.app_clientdemand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_files app_clientdemand_files_myfiles_id_73fb8933_fk_app_myfiles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_myfiles_id_73fb8933_fk_app_myfiles_id FOREIGN KEY (myfiles_id) REFERENCES public.app_myfiles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_parrain_id_f5a2a713_fk_app_parrain_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_parrain_id_f5a2a713_fk_app_parrain_id FOREIGN KEY (parrain_id) REFERENCES public.app_parrain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_subs_id_f5b539c3_fk_app_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_subs_id_f5b539c3_fk_app_subcategory_id FOREIGN KEY (subs_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_retrait app_retrait_parrain_id_5bc4049e_fk_app_parrain_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_retrait
    ADD CONSTRAINT app_retrait_parrain_id_5bc4049e_fk_app_parrain_id FOREIGN KEY (parrain_id) REFERENCES public.app_parrain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_category app_selleraccount_ca_category_id_fbf88a54_fk_app_categ; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_ca_category_id_fbf88a54_fk_app_categ FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_category app_selleraccount_ca_selleraccount_id_53d24c30_fk_app_selle; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_ca_selleraccount_id_53d24c30_fk_app_selle FOREIGN KEY (selleraccount_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_subs app_selleraccount_su_selleraccount_id_46ab9637_fk_app_selle; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_su_selleraccount_id_46ab9637_fk_app_selle FOREIGN KEY (selleraccount_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_subs app_selleraccount_su_subcategory_id_c9d01565_fk_app_subca; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_su_subcategory_id_c9d01565_fk_app_subca FOREIGN KEY (subcategory_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount app_selleraccount_user_id_7c71cadb_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_selleraccount
    ADD CONSTRAINT app_selleraccount_user_id_7c71cadb_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_subcategory app_subcategory_box_id_75f75013_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_box_id_75f75013_fk_app_category_id FOREIGN KEY (box_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_subcategory app_subcategory_sub_box_id_5c9be328_fk_app_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_sub_box_id_5c9be328_fk_app_subcategory_id FOREIGN KEY (sub_box_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_group_id_e774d92c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_group_id_e774d92c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_user_id_e6f878f6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_e6f878f6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permis_permission_id_4ef8e133_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permis_permission_id_4ef8e133_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_24780b52_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_24780b52_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usergame app_usergame_user_id_9886c3a8_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_usergame
    ADD CONSTRAINT app_usergame_user_id_9886c3a8_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom_demandes app_weekcustom_deman_clientdemand_id_c9f4fa8c_fk_app_clien; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_deman_clientdemand_id_c9f4fa8c_fk_app_clien FOREIGN KEY (clientdemand_id) REFERENCES public.app_clientdemand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom_demandes app_weekcustom_deman_weekcustom_id_19656cf5_fk_app_weekc; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_deman_weekcustom_id_19656cf5_fk_app_weekc FOREIGN KEY (weekcustom_id) REFERENCES public.app_weekcustom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom app_weekcustom_seller_id_e2426215_fk_app_selleraccount_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.app_weekcustom
    ADD CONSTRAINT app_weekcustom_seller_id_e2426215_fk_app_selleraccount_id FOREIGN KEY (seller_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles blog_articles_main_img_id_bd11c688_fk_app_myfiles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles
    ADD CONSTRAINT blog_articles_main_img_id_bd11c688_fk_app_myfiles_id FOREIGN KEY (main_img_id) REFERENCES public.app_myfiles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_ssubject blog_articles_ssubje_subsubjects_id_98983bb6_fk_blog_subs; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_ssubject
    ADD CONSTRAINT blog_articles_ssubje_subsubjects_id_98983bb6_fk_blog_subs FOREIGN KEY (subsubjects_id) REFERENCES public.blog_subsubjects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_ssubject blog_articles_ssubject_articles_id_ac544102_fk_blog_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_ssubject
    ADD CONSTRAINT blog_articles_ssubject_articles_id_ac544102_fk_blog_articles_id FOREIGN KEY (articles_id) REFERENCES public.blog_articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_subject blog_articles_subject_articles_id_6754ce1b_fk_blog_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subject
    ADD CONSTRAINT blog_articles_subject_articles_id_6754ce1b_fk_blog_articles_id FOREIGN KEY (articles_id) REFERENCES public.blog_articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_subject blog_articles_subject_subject_id_e258aae4_fk_blog_subject_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subject
    ADD CONSTRAINT blog_articles_subject_subject_id_e258aae4_fk_blog_subject_id FOREIGN KEY (subject_id) REFERENCES public.blog_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_subs blog_articles_subs_articles_id_703c58f4_fk_blog_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subs
    ADD CONSTRAINT blog_articles_subs_articles_id_703c58f4_fk_blog_articles_id FOREIGN KEY (articles_id) REFERENCES public.blog_articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles_subs blog_articles_subs_subcategory_id_cace9258_fk_app_subca; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles_subs
    ADD CONSTRAINT blog_articles_subs_subcategory_id_cace9258_fk_app_subca FOREIGN KEY (subcategory_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_articles blog_articles_video_id_6dc7e01f_fk_blog_videoart_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_articles
    ADD CONSTRAINT blog_articles_video_id_6dc7e01f_fk_blog_videoart_id FOREIGN KEY (video_id) REFERENCES public.blog_videoart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_article_id_3d58bca6_fk_blog_articles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_article_id_3d58bca6_fk_blog_articles_id FOREIGN KEY (article_id) REFERENCES public.blog_articles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_user_id_59a54155_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_user_id_59a54155_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_subsubjects blog_subsubjects_box_id_7b8ae306_fk_blog_subject_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_subsubjects
    ADD CONSTRAINT blog_subsubjects_box_id_7b8ae306_fk_blog_subject_id FOREIGN KEY (box_id) REFERENCES public.blog_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_videoart blog_videoart_file_id_cdc74dde_fk_app_myfiles_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.blog_videoart
    ADD CONSTRAINT blog_videoart_file_id_cdc74dde_fk_app_myfiles_id FOREIGN KEY (file_id) REFERENCES public.app_myfiles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_user_id_6cdfc0a2_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pwwoiqfkebqgtp
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_user_id_6cdfc0a2_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u89ucbqd2f5cc7
--

GRANT USAGE ON SCHEMA heroku_ext TO pwwoiqfkebqgtp;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pwwoiqfkebqgtp
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO pwwoiqfkebqgtp;


--
-- PostgreSQL database dump complete
--


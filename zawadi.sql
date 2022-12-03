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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_abnfeature; Type: TABLE; Schema: public; Owner: db
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


ALTER TABLE public.app_abnfeature OWNER TO db;

--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_abnfeature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_abnfeature_id_seq OWNER TO db;

--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_abnfeature_id_seq OWNED BY public.app_abnfeature.id;


--
-- Name: app_admintoken; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_admintoken (
    id bigint NOT NULL,
    name character varying(150),
    token text,
    is_checked boolean NOT NULL
);


ALTER TABLE public.app_admintoken OWNER TO db;

--
-- Name: app_admintoken_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_admintoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_admintoken_id_seq OWNER TO db;

--
-- Name: app_admintoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_admintoken_id_seq OWNED BY public.app_admintoken.id;


--
-- Name: app_category; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_category (
    id bigint NOT NULL,
    name character varying(250),
    is_visible boolean NOT NULL,
    label_id bigint
);


ALTER TABLE public.app_category OWNER TO db;

--
-- Name: app_category_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_category_id_seq OWNER TO db;

--
-- Name: app_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_category_id_seq OWNED BY public.app_category.id;


--
-- Name: app_client; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_client (
    id bigint NOT NULL,
    point integer NOT NULL,
    user_id bigint,
    phone character varying(200),
    whatsapp character varying(200)
);


ALTER TABLE public.app_client OWNER TO db;

--
-- Name: app_client_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_client_id_seq OWNER TO db;

--
-- Name: app_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_client_id_seq OWNED BY public.app_client.id;


--
-- Name: app_clientdemand; Type: TABLE; Schema: public; Owner: db
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
    state character varying(100)
);


ALTER TABLE public.app_clientdemand OWNER TO db;

--
-- Name: app_clientdemand_files; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_clientdemand_files (
    id bigint NOT NULL,
    clientdemand_id bigint NOT NULL,
    myfiles_id bigint NOT NULL
);


ALTER TABLE public.app_clientdemand_files OWNER TO db;

--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_clientdemand_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_clientdemand_files_id_seq OWNER TO db;

--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_clientdemand_files_id_seq OWNED BY public.app_clientdemand_files.id;


--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_clientdemand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_clientdemand_id_seq OWNER TO db;

--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_clientdemand_id_seq OWNED BY public.app_clientdemand.id;


--
-- Name: app_feedback; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_feedback (
    id bigint NOT NULL,
    "user" character varying(250),
    seller character varying(250),
    picture character varying(100),
    text text,
    rank integer NOT NULL
);


ALTER TABLE public.app_feedback OWNER TO db;

--
-- Name: app_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_feedback_id_seq OWNER TO db;

--
-- Name: app_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_feedback_id_seq OWNED BY public.app_feedback.id;


--
-- Name: app_label; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_label (
    id bigint NOT NULL,
    name character varying(150),
    is_on boolean NOT NULL
);


ALTER TABLE public.app_label OWNER TO db;

--
-- Name: app_label_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_label_id_seq OWNER TO db;

--
-- Name: app_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_label_id_seq OWNED BY public.app_label.id;


--
-- Name: app_myfiles; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_myfiles (
    id bigint NOT NULL,
    name character varying(150),
    file character varying(100),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.app_myfiles OWNER TO db;

--
-- Name: app_myfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_myfiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_myfiles_id_seq OWNER TO db;

--
-- Name: app_myfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_myfiles_id_seq OWNED BY public.app_myfiles.id;


--
-- Name: app_selleraccount; Type: TABLE; Schema: public; Owner: db
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
    has_freed boolean NOT NULL
);


ALTER TABLE public.app_selleraccount OWNER TO db;

--
-- Name: app_selleraccount_category; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_selleraccount_category (
    id bigint NOT NULL,
    selleraccount_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.app_selleraccount_category OWNER TO db;

--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_selleraccount_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_category_id_seq OWNER TO db;

--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_selleraccount_category_id_seq OWNED BY public.app_selleraccount_category.id;


--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_selleraccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_id_seq OWNER TO db;

--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_selleraccount_id_seq OWNED BY public.app_selleraccount.id;


--
-- Name: app_selleraccount_subs; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_selleraccount_subs (
    id bigint NOT NULL,
    selleraccount_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


ALTER TABLE public.app_selleraccount_subs OWNER TO db;

--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_selleraccount_subs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_selleraccount_subs_id_seq OWNER TO db;

--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_selleraccount_subs_id_seq OWNED BY public.app_selleraccount_subs.id;


--
-- Name: app_subcategory; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_subcategory (
    id bigint NOT NULL,
    name character varying(250),
    is_visible boolean NOT NULL,
    box_id bigint,
    default_price integer,
    sub_box_id bigint
);


ALTER TABLE public.app_subcategory OWNER TO db;

--
-- Name: app_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_subcategory_id_seq OWNER TO db;

--
-- Name: app_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_subcategory_id_seq OWNED BY public.app_subcategory.id;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: db
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


ALTER TABLE public.app_user OWNER TO db;

--
-- Name: app_user_groups; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_user_groups OWNER TO db;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_groups_id_seq OWNER TO db;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_user_groups_id_seq OWNED BY public.app_user_groups.id;


--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO db;

--
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- Name: app_user_user_permissions; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_user_user_permissions OWNER TO db;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_permissions_id_seq OWNER TO db;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_user_user_permissions_id_seq OWNED BY public.app_user_user_permissions.id;


--
-- Name: app_usergame; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_usergame (
    id bigint NOT NULL,
    value1 character varying(150),
    value2 character varying(150),
    day date NOT NULL,
    user_id bigint
);


ALTER TABLE public.app_usergame OWNER TO db;

--
-- Name: app_usergame_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_usergame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usergame_id_seq OWNER TO db;

--
-- Name: app_usergame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_usergame_id_seq OWNED BY public.app_usergame.id;


--
-- Name: app_weekcustom; Type: TABLE; Schema: public; Owner: db
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


ALTER TABLE public.app_weekcustom OWNER TO db;

--
-- Name: app_weekcustom_demandes; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_weekcustom_demandes (
    id bigint NOT NULL,
    weekcustom_id bigint NOT NULL,
    clientdemand_id bigint NOT NULL
);


ALTER TABLE public.app_weekcustom_demandes OWNER TO db;

--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_weekcustom_demandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_weekcustom_demandes_id_seq OWNER TO db;

--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_weekcustom_demandes_id_seq OWNED BY public.app_weekcustom_demandes.id;


--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_weekcustom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_weekcustom_id_seq OWNER TO db;

--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_weekcustom_id_seq OWNED BY public.app_weekcustom.id;


--
-- Name: app_zawadidetail; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.app_zawadidetail (
    id bigint NOT NULL,
    key character varying(250),
    value text
);


ALTER TABLE public.app_zawadidetail OWNER TO db;

--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.app_zawadidetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_zawadidetail_id_seq OWNER TO db;

--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.app_zawadidetail_id_seq OWNED BY public.app_zawadidetail.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO db;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO db;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO db;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO db;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO db;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO db;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: db
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
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag &gt;= 0))
);


ALTER TABLE public.django_admin_log OWNER TO db;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO db;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO db;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO db;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO db;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO db;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO db;

--
-- Name: fcm_django_fcmdevice; Type: TABLE; Schema: public; Owner: db
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


ALTER TABLE public.fcm_django_fcmdevice OWNER TO db;

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: db
--

CREATE SEQUENCE public.fcm_django_fcmdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fcm_django_fcmdevice_id_seq OWNER TO db;

--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: db
--

ALTER SEQUENCE public.fcm_django_fcmdevice_id_seq OWNED BY public.fcm_django_fcmdevice.id;


--
-- Name: app_abnfeature id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_abnfeature ALTER COLUMN id SET DEFAULT nextval('public.app_abnfeature_id_seq'::regclass);


--
-- Name: app_admintoken id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_admintoken ALTER COLUMN id SET DEFAULT nextval('public.app_admintoken_id_seq'::regclass);


--
-- Name: app_category id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_category ALTER COLUMN id SET DEFAULT nextval('public.app_category_id_seq'::regclass);


--
-- Name: app_client id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_client ALTER COLUMN id SET DEFAULT nextval('public.app_client_id_seq'::regclass);


--
-- Name: app_clientdemand id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand ALTER COLUMN id SET DEFAULT nextval('public.app_clientdemand_id_seq'::regclass);


--
-- Name: app_clientdemand_files id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand_files ALTER COLUMN id SET DEFAULT nextval('public.app_clientdemand_files_id_seq'::regclass);


--
-- Name: app_feedback id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_feedback ALTER COLUMN id SET DEFAULT nextval('public.app_feedback_id_seq'::regclass);


--
-- Name: app_label id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_label ALTER COLUMN id SET DEFAULT nextval('public.app_label_id_seq'::regclass);


--
-- Name: app_myfiles id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_myfiles ALTER COLUMN id SET DEFAULT nextval('public.app_myfiles_id_seq'::regclass);


--
-- Name: app_selleraccount id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_id_seq'::regclass);


--
-- Name: app_selleraccount_category id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_category ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_category_id_seq'::regclass);


--
-- Name: app_selleraccount_subs id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_subs ALTER COLUMN id SET DEFAULT nextval('public.app_selleraccount_subs_id_seq'::regclass);


--
-- Name: app_subcategory id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_subcategory ALTER COLUMN id SET DEFAULT nextval('public.app_subcategory_id_seq'::regclass);


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- Name: app_user_groups id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_groups ALTER COLUMN id SET DEFAULT nextval('public.app_user_groups_id_seq'::regclass);


--
-- Name: app_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_permissions_id_seq'::regclass);


--
-- Name: app_usergame id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_usergame ALTER COLUMN id SET DEFAULT nextval('public.app_usergame_id_seq'::regclass);


--
-- Name: app_weekcustom id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom ALTER COLUMN id SET DEFAULT nextval('public.app_weekcustom_id_seq'::regclass);


--
-- Name: app_weekcustom_demandes id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom_demandes ALTER COLUMN id SET DEFAULT nextval('public.app_weekcustom_demandes_id_seq'::regclass);


--
-- Name: app_zawadidetail id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_zawadidetail ALTER COLUMN id SET DEFAULT nextval('public.app_zawadidetail_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: fcm_django_fcmdevice id; Type: DEFAULT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.fcm_django_fcmdevice ALTER COLUMN id SET DEFAULT nextval('public.fcm_django_fcmdevice_id_seq'::regclass);


--
-- Data for Name: app_abnfeature; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_abnfeature (id, type_of, total, total_urg, created_at, transaction_id, seller_id, count, expired_date, is_freed) FROM stdin;
1	free	0	0	2022-11-12	...	1	0	2022-12-12	t
2	free	0	0	2022-11-17	...	2	0	2022-12-17	t
3	free	0	0	2022-11-18	...	3	0	2022-12-18	t
4	free	0	0	2022-11-18	...	4	0	2022-12-18	t
\.


--
-- Data for Name: app_admintoken; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_admintoken (id, name, token, is_checked) FROM stdin;
\.


--
-- Data for Name: app_category; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_category (id, name, is_visible, label_id) FROM stdin;
4	Vêtements Homme	t	1
5	Vêtements Femme 	t	1
6	Lingerie Feminine	t	1
8	Téléphone	t	2
9	Tablettes 	t	2
10	Accessoires ( battérie, chargeurs...)	t	2
11	Ordinateur	t	3
12	Accessoirs Informatique	t	3
13	Meubles et Décoration	t	4
14	Outils de Cuisines	t	4
15	Electroménagers	t	4
16	Parfums et Cosmétique	t	1
7	Bijoux,sacs et pagnes	t	1
18	Chaussure	t	1
\.


--
-- Data for Name: app_client; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_client (id, point, user_id, phone, whatsapp) FROM stdin;
1	0	2	+22961555705	+22961555705
2	0	3	+22961555705	+22961555705
\.


--
-- Data for Name: app_clientdemand; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_clientdemand (id, created_at, category_id, client_id, subs_id, emergency, point, is_out, date, budget, detail, num, num_vend, quart, slug, state) FROM stdin;
23	2022-11-17 20:39:44.644548+00	7	1	45	Urgent	0	f	2022-11-17	\N	\N	\N	5	\N	\N	\N
16	2022-11-15 11:53:15.515576+00	8	1	53	Urgent	0	f	2022-11-15	\N	\N	\N	5	\N	\N	\N
6	2022-11-12 14:50:14.879111+00	7	2	140	Urgent	0	f	2022-11-12	\N	\N	\N	5	\N	\N	\N
17	2022-11-15 11:53:15.524185+00	8	1	64	Urgent	0	f	2022-11-15	\N	\N	\N	5	\N	\N	\N
20	2022-11-15 18:39:59.198596+00	14	1	112	Urgent	0	f	2022-11-15	\N	\N	\N	7	\N	\N	\N
24	2022-11-17 20:39:44.669463+00	7	1	46	Urgent	0	f	2022-11-17	\N	\N	\N	5	\N	\N	\N
8	2022-11-12 14:51:25.169199+00	7	2	140	Urgent	0	f	2022-11-12	\N	\N	\N	5	\N	\N	\N
7	2022-11-12 14:51:25.15718+00	7	2	41	Urgent	0	f	2022-11-12	\N	\N	\N	5	\N	\N	\N
9	2022-11-12 14:52:29.488967+00	7	2	140	Urgent	0	f	2022-11-12	\N	\N	\N	5	\N	\N	\N
19	2022-11-15 18:39:59.175496+00	14	1	111	Urgent	0	f	2022-11-15	\N	\N	\N	5	\N	\N	\N
\.


--
-- Data for Name: app_clientdemand_files; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_clientdemand_files (id, clientdemand_id, myfiles_id) FROM stdin;
\.


--
-- Data for Name: app_feedback; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_feedback (id, "user", seller, picture, text, rank) FROM stdin;
1	Thomas t. Atade	Luxurious Mall	media/feedback/jeans_l4sdi2_xkp0cc	J'avoue que j'avais un doute au début. Mais après avoir découvert la plateforme Zawadi pour les clients où des acheteurs enregistrent des demandes plus ou moins urgentes et avoir reçu les premiers clients je suis vraiment satisfait de la platefor👍👍	100
2	Roland Migan	SHOP LABS	media/feedback/liviu-c-ti3P_Bm2zio-unsplash_buguio	Au début les clients venaient lentement mais après un moment ça a commencé a aller plus vite et les clients que je contactais étaient prêts a acheter mes produits.	108
3	Aristide	Golden Clothe	media/feedback/gold-gradient-background_d2xisf	J'écris cet avis parce que je pense que cette plateforme mérite réellement. \r\nMême si tous les clients n'achète pas c'est un excellent moyen de garder contact et de présenter d'autres produits car les clients sont vraiment accueillant.	1
4	William	Will Shop	media/feedback/MacBook_pro_hgbp4y_fydi36	Il faudra peut être penser à ajouter le budget du client sinon moi ça m'aide beaucoup parce que c'est comme un canal de secours pour avoir plus de clients.	10
5	da Silva  Elfried 	Amir Shop		Nous tenons là sûrement la révolution en matière d'achat vente. J'ai essayé et j'ai beaucoup apprécié le concept. 	1
\.


--
-- Data for Name: app_label; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_label (id, name, is_on) FROM stdin;
1	Mode	t
2	Téléphonie	t
3	Electronique	t
4	Maisons, Ménage	t
\.


--
-- Data for Name: app_myfiles; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_myfiles (id, name, file, created_at) FROM stdin;
\.


--
-- Data for Name: app_selleraccount; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_selleraccount (id, name, user_id, count, created_at, last_abn, picture, type_of, speed, abn_count, rest, expired_date, has_freed) FROM stdin;
1	Luxurious Mall 	1	4	2022-11-12	2022-11-12 00:00:00+00		free	3	0	1	2022-12-12	t
2	Kevin Fashion	4	0	2022-11-17	2022-11-17 00:00:00+00		free	3	0	1	2022-12-17	t
3	Amir Shop	6	0	2022-11-18	2022-11-18 00:00:00+00		free	3	0	1	2022-12-18	t
4	Théo's fashion 	7	0	2022-11-18	2022-11-18 00:00:00+00	media/accounts/IMG-20220906-WA0033_rfvo3i	free	3	0	1	2022-12-18	t
\.


--
-- Data for Name: app_selleraccount_category; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_selleraccount_category (id, selleraccount_id, category_id) FROM stdin;
1	1	18
4	1	7
15	2	4
21	3	4
24	4	4
\.


--
-- Data for Name: app_selleraccount_subs; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_selleraccount_subs (id, selleraccount_id, subcategory_id) FROM stdin;
6	1	156
7	1	155
8	1	154
9	1	42
10	1	43
11	1	44
12	1	45
13	1	140
20	2	2
21	2	3
22	2	4
23	2	8
24	2	9
25	2	10
26	3	2
27	3	3
28	3	4
29	4	13
\.


--
-- Data for Name: app_subcategory; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_subcategory (id, name, is_visible, box_id, default_price, sub_box_id) FROM stdin;
1	T-shirt, Polos	t	4	2500	\N
2	Chemises	t	4	2500	\N
3	Jeans	t	4	2500	\N
4	Pantalons	t	4	2500	\N
5	Shorts, bermudas	t	4	2500	\N
6	Vêtements de Sport	t	4	2500	\N
7	Jogggings	t	4	2500	\N
8	Costumes	t	4	2500	\N
9	Cravate	t	4	2500	\N
10	Vestes	t	4	2500	\N
11	Manteaux	t	4	2500	\N
12	chaussetes	t	4	2500	\N
13	Sous-vetements	t	4	2500	\N
14	Maillot de bain	t	4	2500	\N
15	Pulls et sweats	t	4	2500	\N
16	Pyjamas	t	4	2500	\N
17	Robes	t	5	2500	\N
18	Combinaisons	t	5	2500	\N
19	T-shirts, tops	t	5	2500	\N
20	Gilets	t	5	2500	\N
21	Jeans	t	5	2500	\N
22	Jupes	t	5	2500	\N
23	Vestes	t	5	2500	\N
24	Shorts	t	5	2500	\N
25	Pantalons	t	5	2500	\N
26	Leggings	t	5	2500	\N
27	Manteaux	t	5	2500	\N
28	Pulls	t	5	2500	\N
29	Robes pulls	t	5	2500	\N
30	Sweat-shirt	t	5	2500	\N
31	Chemisiers, blouses	t	5	2500	\N
32	Trenchs	t	5	2500	\N
33	Soutiens-gorges	t	6	2500	\N
34	Cullottes, strings	t	6	2500	\N
35	Bodys	t	6	2500	\N
36	Bas, collants	t	6	2500	\N
37	Chaussetes	t	6	2500	\N
38	Pyjama	t	6	2500	\N
39	Maillots de bain	t	6	2500	\N
40	Boucles d'orreilles	t	7	2500	\N
41	Colliers	t	7	2500	\N
42	Bagues	t	7	2500	\N
43	Bracelets	t	7	2500	\N
44	Chaînes	t	7	2500	\N
45	Chapeau	t	7	2500	\N
46	Ceinture	t	7	2500	\N
47	Foulard	t	7	2500	\N
48	Lunnettes	t	7	2500	\N
50	Chaussettes,	t	7	2500	\N
52	Samsung	t	8	2500	\N
53	Huawei	t	8	2500	\N
54	Xiaomi	t	8	2500	\N
55	Oppo	t	8	2500	\N
56	OnePlus	t	8	2500	\N
57	Honor	t	8	2500	\N
58	Google Pixel	t	8	2500	\N
59	Wiko	t	8	2500	\N
60	htc	t	8	2500	\N
61	Alcatel	t	8	2500	\N
62	Nokia	t	8	2500	\N
63	Tecno	t	8	2500	\N
64	Itel	t	8	2500	\N
65	Iphone	t	8	2500	\N
66	Infinix	t	8	2500	\N
67	Tous les téléphones	t	8	2500	\N
68	iPad	t	9	2500	\N
69	Galaxy Tab(Samsung)	t	9	2500	\N
70	Tablette TECNO	t	9	2500	\N
71	Liseues	t	9	2500	\N
72	toutes les tablettes	t	9	2500	\N
73	Battérie(externes)	t	10	2500	\N
74	Chargeurs et cables	t	10	2500	\N
75	Coques, Etuis	t	10	2500	\N
76	Protections d'ecrans	t	10	2500	\N
77	Gants	t	10	2500	\N
78	Accessoire photo	t	10	2500	\N
79	Carte memoires	t	10	2500	\N
80	Accessoires Iphone	t	10	2500	\N
81	Accessoires sansung	t	10	2500	\N
82	Accessoires Huawei	t	10	2500	\N
83	Accessoires huawei	t	10	2500	\N
84	Apple Mac	t	11	2500	\N
85	Dell	t	11	2500	\N
86	HP	t	11	2500	\N
87	Sony	t	11	2500	\N
88	Lenovo	t	11	2500	\N
89	Ordinateurs de Bureau	t	11	2500	\N
90	Tous les pc	t	11	2500	\N
91	Unité Centrale	t	12	2500	\N
92	Imprimantes 	t	12	2500	\N
93	souris	t	12	2500	\N
94	Clavier	t	12	2500	\N
95	Disques durs	t	12	2500	\N
96	Ecrans	t	12	2500	\N
97	Projecteurs	t	12	2500	\N
98	Régulateur	t	12	2500	\N
99	Routeur et Moderm Wi-fi	t	12	2500	\N
100	Chaises	t	13	2500	\N
101	Fauteuils	t	13	2500	\N
102	Meubles Tv	t	13	2500	\N
103	Décoration	t	13	2500	\N
104	Miroir	t	13	2500	\N
105	Tables,Guéridon	t	13	2500	\N
106	Lits 	t	13	2500	\N
107	Draps	t	13	2500	\N
108	Lampes,luminaires	t	13	2500	\N
109	Tapis	t	13	2500	\N
110	Balaie	t	13	2500	\N
111	Casseroles	t	14	2500	\N
112	Couteaux	t	14	2500	\N
113	Poêles	t	14	2500	\N
114	Balance	t	14	2500	\N
115	Outils de Patisserie	t	14	2500	\N
116	Friteuses	t	14	2500	\N
117	Lisseur	t	14	2500	\N
118	Couvert	t	14	2500	\N
119	Cuilleres	t	14	2500	\N
120	Assiètes	t	14	2500	\N
121	Congelateur	t	15	2500	\N
122	Réfrigerateur	t	15	2500	\N
123	Réfrigérateur-Congelateurs	t	15	2500	\N
124	Frigo	t	15	2500	\N
125	Four	t	15	2500	\N
126	Gaz	t	15	2500	\N
127	Micro-ondes	t	15	2500	\N
128	Lave-vaisselle	t	15	2500	\N
129	Sèche-linge	t	15	2500	\N
130	Aspirateur	t	15	2500	\N
131	Nettoyeur	t	15	2500	\N
132	Table à repasser	t	15	2500	\N
133	Fer à repasser	t	15	2500	\N
134	Accessoires de Cuisine	t	15	2500	\N
135	Machine à Cafe	t	15	2500	\N
136	Cuisinières 	t	15	2500	\N
137	Moulinex	t	15	2500	\N
138	Mixeur	t	15	2500	\N
139	Autocuiseurs - Boulloire	t	15	2500	\N
140	Montre	t	7	2500	\N
141	Parfums	t	16	2500	\N
142	Eau de toilette	t	16	2500	\N
143	Maquillage	t	16	2500	\N
144	Savon	t	16	2500	\N
145	Déodorant	t	16	2500	\N
146	Produit pour cheveux	t	16	2500	\N
147	Crème	t	16	2500	\N
148	Dentrifice	t	16	2500	\N
149	Produit pour la peau	t	16	2500	\N
150	Pagne	t	7	2500	\N
151	Foulard	t	7	2500	\N
152	Baskets	t	18	2500	\N
153	Bottine/Boots	t	18	2500	\N
154	Bottes	t	18	2500	\N
155	Pantoufles / Chausson	t	18	2500	\N
156	Escarpins	t	18	2500	\N
157	Sandales et Nu-pieds	t	18	2500	\N
158	Derbies &amp; Richelieu	t	18	2500	\N
159	Mules /Sabots	t	18	2500	\N
160	Mocassins	t	18	2500	\N
161	Chaussure de sport	t	18	2500	\N
162	Tongs	t	18	2500	\N
163	Extracteur de jus de fruit	t	15	2500	\N
164	Télévision	t	15	2500	\N
165	Matelas	t	13	2500	\N
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_user (id, password, last_login, is_superuser, username, email, is_staff, is_active, date_joined, first_name, last_name, country, towns, quart) FROM stdin;
2	pbkdf2_sha256$260000$TkrzLPY52ZlI0TfJjR4nkZ$uyqqkqxFfyQIuTqvN+YR0cqTVEY6n9CKSUjPiD/B2wo=	2022-11-11 11:01:38.482392+00	f	\N	georiseno@gmail.com	f	t	2022-11-11 10:46:08.960096+00	ENOUHERAN	Georis	bj	Cotonou:Porto-Novo:Abomey-Calavi	\N
3	pbkdf2_sha256$260000$Mi6y3ldxnVAYQ3hdZ6hce4$dYqIX0eZfdcgMbe4bqISWrbB6rP5+mMqfAny0aXqiyw=	2022-11-12 14:50:14.858635+00	f	\N	georisenou@gmail.com	f	t	2022-11-12 14:50:14.674043+00	Georis	ENOUHERAN	bj	Porto-Novo:Abomey-Calavi	\N
5	pbkdf2_sha256$260000$0WoK5nJv8M0ylL0e9cJNKo$GB+HWRkQ8IeEBYWowwRiDZUBvGDCe2pOfbQkSOkH9Ys=	2022-11-18 09:25:49.488183+00	f	\N	adovmann@gmail.com	f	t	2022-11-18 09:25:49.275664+00	ADOVOEKPE	Freemann	BJ	Cotonou:Porto-Novo:Parakou:Abomey:Djougou:Bohicon:Kandi:Natitingou:Ouidah:Lokossa:Abomey-Calavi	\N
4	pbkdf2_sha256$260000$9vJ5FB1TiNivYQA9d30139$b55lVqv5GRDZLO2EH4+rKDgCx6k8MXvOIsycn6mAF2o=	2022-11-17 22:02:01.106538+00	f	\N	gbaguidike@gmail.com	f	t	2022-11-17 21:57:48.963122+00	GBAGUIDI	Kevin	BJ	Cotonou:Porto-Novo:Abomey-Calavi	\N
6	pbkdf2_sha256$260000$OL192wrKZPaE2zYEGuXu8r$7hqmsV8Xu2iSGzpFfEXrs1pIrWU3zegwKMT0C8xsio8=	2022-11-18 12:29:30.318313+00	f	\N	elfrieddasilva@gmail.com	f	t	2022-11-18 12:29:30.103918+00	da Silva 	Elfried 	BJ	Cotonou	\N
7	pbkdf2_sha256$260000$FOWFOzkVDtGsvNdxYLqok6$1SWH2HVhNYYfkivBGM+LHUjNTCE2NoTzyGYUcuRooRc=	2022-11-18 19:33:37.119087+00	f	\N	atlotheophile673@gmail.com	f	t	2022-11-18 19:33:36.953635+00	ATOLO 	Théophile 	BJ	Cotonou	\N
1	pbkdf2_sha256$260000$3cIxJ1cnyElx4PBjfckPnr$sM0+dr8McHOSdJnmi9b73AKerjMDbS3412dGSjzrxSQ=	2022-11-27 17:40:18.396866+00	t	Georis	geodasrisfas@gmail.com	t	t	2022-11-10 13:33:02+00	None	None	\N	Cotonou	\N
\.


--
-- Data for Name: app_user_groups; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: app_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: app_usergame; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_usergame (id, value1, value2, day, user_id) FROM stdin;
\.


--
-- Data for Name: app_weekcustom; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_weekcustom (id, begun, "end", is_on, seller_id, next, prev, max, max_urg) FROM stdin;
2	2022-11-17	2022-11-24	t	2	0	0	60	30
3	2022-11-18	2022-11-25	t	3	0	0	60	30
4	2022-11-18	2022-11-25	t	4	0	0	60	30
8	\N	\N	f	1	0	0	0	0
9	\N	\N	f	1	0	0	0	0
10	\N	\N	f	1	0	0	0	0
11	\N	\N	f	1	0	0	0	0
12	\N	\N	f	1	0	0	0	0
13	\N	\N	f	1	0	0	0	0
1	2022-11-12	2022-11-19	f	1	0	0	60	30
14	\N	\N	t	1	0	0	0	0
\.


--
-- Data for Name: app_weekcustom_demandes; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_weekcustom_demandes (id, weekcustom_id, clientdemand_id) FROM stdin;
4	1	23
\.


--
-- Data for Name: app_zawadidetail; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.app_zawadidetail (id, key, value) FROM stdin;
24	georiseno@gmail.com - sold	["Samsung", "Maillot de bain", "Sous-vetements", "Vestes", "Costumes", "Montre", "Montre", "Jeans", "Iphone", "Lunnettes"]
20	facebook	87
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
1	website	265
25	georiseno@gmail.com - delete	["Bottes", "T-shirt, Polos", "Bottes"]
18	contact:home	https://wa.me/+22954912297
21	free:speed	3
22	free:max	60
23	free:max_urg	30
19	site:link	https://vendeur.zawadi.site
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: db
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
65	Can add FCM device	17	add_fcmdevice
66	Can change FCM device	17	change_fcmdevice
67	Can delete FCM device	17	delete_fcmdevice
68	Can view FCM device	17	view_fcmdevice
69	Can add label	18	add_label
70	Can change label	18	change_label
71	Can delete label	18	delete_label
72	Can view label	18	view_label
73	Can add admin token	19	add_admintoken
74	Can change admin token	19	change_admintoken
75	Can delete admin token	19	delete_admintoken
76	Can view admin token	19	view_admintoken
77	Can add my files	20	add_myfiles
78	Can change my files	20	change_myfiles
79	Can delete my files	20	delete_myfiles
80	Can view my files	20	view_myfiles
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: db
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
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: db
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
17	fcm_django	fcmdevice
18	app	label
19	app	admintoken
20	app	myfiles
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-10 13:30:28.029086+00
2	contenttypes	0002_remove_content_type_name	2022-11-10 13:30:28.078444+00
3	auth	0001_initial	2022-11-10 13:30:28.179771+00
4	auth	0002_alter_permission_name_max_length	2022-11-10 13:30:28.192338+00
5	auth	0003_alter_user_email_max_length	2022-11-10 13:30:28.207557+00
6	auth	0004_alter_user_username_opts	2022-11-10 13:30:28.22111+00
7	auth	0005_alter_user_last_login_null	2022-11-10 13:30:28.232113+00
8	auth	0006_require_contenttypes_0002	2022-11-10 13:30:28.239121+00
9	auth	0007_alter_validators_add_error_messages	2022-11-10 13:30:28.250089+00
10	auth	0008_alter_user_username_max_length	2022-11-10 13:30:28.260687+00
11	auth	0009_alter_user_last_name_max_length	2022-11-10 13:30:28.2724+00
12	auth	0010_alter_group_name_max_length	2022-11-10 13:30:28.292598+00
13	auth	0011_update_proxy_permissions	2022-11-10 13:30:28.330564+00
14	auth	0012_alter_user_first_name_max_length	2022-11-10 13:30:28.344939+00
15	app	0001_initial	2022-11-10 13:30:28.452942+00
16	admin	0001_initial	2022-11-10 13:30:28.515186+00
17	admin	0002_logentry_remove_auto_add	2022-11-10 13:30:28.531759+00
18	admin	0003_logentry_add_action_flag_choices	2022-11-10 13:30:28.546865+00
19	app	0002_auto_20221104_0634	2022-11-10 13:30:28.580759+00
20	app	0003_feedback_zawadidetail	2022-11-10 13:30:28.619044+00
21	app	0004_selleraccount	2022-11-10 13:30:28.662759+00
22	app	0005_auto_20221104_1125	2022-11-10 13:30:28.989403+00
23	app	0006_selleraccount_picture	2022-11-10 13:30:29.017799+00
24	app	0007_auto_20221105_2031	2022-11-10 13:30:29.055654+00
25	app	0008_auto_20221106_0633	2022-11-10 13:30:29.125032+00
26	app	0009_weekcustom_max_weekcustom_max_urg_abnfeature	2022-11-10 13:30:29.207163+00
27	app	0010_selleraccount_type_of_alter_selleraccount_status	2022-11-10 13:30:29.23971+00
28	app	0011_clientdemand_is_out	2022-11-10 13:30:29.260562+00
29	app	0012_abnfeature_rest_abnfeature_status_clientdemand_date_and_more	2022-11-10 13:30:29.37637+00
30	app	0013_remove_abnfeature_expired_remove_abnfeature_status_and_more	2022-11-10 13:30:29.563338+00
31	app	0014_remove_abnfeature_rest	2022-11-10 13:30:29.584287+00
32	app	0015_alter_clientdemand_is_out	2022-11-10 13:30:29.60862+00
33	app	0016_alter_weekcustom_demandes	2022-11-10 13:30:29.630793+00
34	app	0017_auto_20221108_1152	2022-11-10 13:30:29.66474+00
35	fcm_django	0001_initial	2022-11-10 13:30:29.714028+00
36	fcm_django	0002_auto_20160808_1645	2022-11-10 13:30:29.74666+00
37	fcm_django	0003_auto_20170313_1314	2022-11-10 13:30:29.768916+00
38	fcm_django	0004_auto_20181128_1642	2022-11-10 13:30:29.786571+00
39	fcm_django	0005_auto_20170808_1145	2022-11-10 13:30:29.810312+00
40	fcm_django	0006_auto_20210802_1140	2022-11-10 13:30:29.831321+00
41	fcm_django	0007_auto_20211001_1440	2022-11-10 13:30:29.876319+00
42	fcm_django	0008_auto_20211224_1205	2022-11-10 13:30:29.926301+00
43	fcm_django	0009_alter_fcmdevice_user	2022-11-10 13:30:29.954716+00
44	sessions	0001_initial	2022-11-10 13:30:29.984343+00
45	app	0018_auto_20221111_0336	2022-11-11 05:11:51.164158+00
46	app	0019_admintoken	2022-11-12 11:20:52.415828+00
47	app	0020_auto_20221112_0827	2022-11-12 11:20:52.455+00
48	app	0021_auto_20221117_0505	2022-11-17 11:35:59.703515+00
49	app	0022_auto_20221119_1318	2022-11-21 08:53:51.739429+00
50	app	0023_auto_20221120_1604	2022-11-21 08:53:51.822878+00
51	app	0024_clientdemand_num_vend	2022-11-21 08:53:51.845228+00
52	app	0025_auto_20221126_1655	2022-11-27 11:33:01.973249+00
53	app	0026_subcategory_sub_box	2022-12-03 14:56:31.140775+00
54	app	0027_clientdemand_state	2022-12-03 14:56:31.166165+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: db
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
wqf6ef0s2qyab9c74merryz7t2irjlls	.eJxVjMsOwiAURP-FtSEglIdL9_0GcrlcpWogKe3K-O9C0oXuJnPOzJsF2Lcc9kZrWBK7MMlOv10EfFIZID2g3CvHWrZ1iXwo_KCNzzXR63q4fwcZWu5r650nr6Ixtx60AOXQGTl5idYhCQKpAZG0m6QxSqNQHbshnAUZyz5fxl02oQ:1ozLda:zznFuP1SQxlGejRQf0R0jmy2XazzFEZ9ENL2au5Xpic	2022-12-11 17:40:18.417518+00
\.


--
-- Data for Name: fcm_django_fcmdevice; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public.fcm_django_fcmdevice (id, name, active, date_created, device_id, registration_id, type, user_id) FROM stdin;
3	Georis	t	2022-11-17 11:46:07.199995+00	\N	dN6dMSA8pdbm4ufxGQwtn7:APA91bGf2Sb33eZXGswvzuVsN5-NECGfk_xRwEMd2L4ms4v9mmR1C-j6xj3hyef5lOiRqlUofrI9Ybxb50MSUVJ-JyTOVX0qbrDkkPxWhqwVrddPnXRHKSo9GJ761gzy6qRgh5qrWPRS	web	1
4	\N	t	2022-11-18 18:15:30.546832+00	\N	dpu3_W89XyYJbXyZkcPNLE:APA91bEemF1glpfbo-WSfJGfzSSTLKNrEMjLj9wOAO7WmqaCgtitOq0n17WaBrlkeO_YYoyM1HggfHG8QBtUWVcv10HIRrS566OR20Ps0BSoY8_Iz0iqk3QD5NdJicrA6aK-zQyH0jDq	web	6
\.


--
-- Name: app_abnfeature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_abnfeature_id_seq', 4, true);


--
-- Name: app_admintoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_admintoken_id_seq', 1, false);


--
-- Name: app_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_category_id_seq', 18, true);


--
-- Name: app_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_client_id_seq', 2, true);


--
-- Name: app_clientdemand_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_clientdemand_files_id_seq', 1, false);


--
-- Name: app_clientdemand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_clientdemand_id_seq', 25, true);


--
-- Name: app_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_feedback_id_seq', 5, true);


--
-- Name: app_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_label_id_seq', 4, true);


--
-- Name: app_myfiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_myfiles_id_seq', 1, false);


--
-- Name: app_selleraccount_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_selleraccount_category_id_seq', 24, true);


--
-- Name: app_selleraccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_selleraccount_id_seq', 4, true);


--
-- Name: app_selleraccount_subs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_selleraccount_subs_id_seq', 29, true);


--
-- Name: app_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_subcategory_id_seq', 165, true);


--
-- Name: app_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_user_groups_id_seq', 1, false);


--
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_user_id_seq', 7, true);


--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_user_user_permissions_id_seq', 1, false);


--
-- Name: app_usergame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_usergame_id_seq', 1, false);


--
-- Name: app_weekcustom_demandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_weekcustom_demandes_id_seq', 4, true);


--
-- Name: app_weekcustom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_weekcustom_id_seq', 14, true);


--
-- Name: app_zawadidetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.app_zawadidetail_id_seq', 26, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 86, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);


--
-- Name: fcm_django_fcmdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: db
--

SELECT pg_catalog.setval('public.fcm_django_fcmdevice_id_seq', 4, true);


--
-- Name: app_abnfeature app_abnfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_abnfeature
    ADD CONSTRAINT app_abnfeature_pkey PRIMARY KEY (id);


--
-- Name: app_admintoken app_admintoken_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_admintoken
    ADD CONSTRAINT app_admintoken_pkey PRIMARY KEY (id);


--
-- Name: app_category app_category_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_pkey PRIMARY KEY (id);


--
-- Name: app_client app_client_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_pkey PRIMARY KEY (id);


--
-- Name: app_clientdemand_files app_clientdemand_files_clientdemand_id_myfiles_id_e4b06f6f_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_clientdemand_id_myfiles_id_e4b06f6f_uniq UNIQUE (clientdemand_id, myfiles_id);


--
-- Name: app_clientdemand_files app_clientdemand_files_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_pkey PRIMARY KEY (id);


--
-- Name: app_clientdemand app_clientdemand_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_pkey PRIMARY KEY (id);


--
-- Name: app_feedback app_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_feedback
    ADD CONSTRAINT app_feedback_pkey PRIMARY KEY (id);


--
-- Name: app_label app_label_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_label
    ADD CONSTRAINT app_label_pkey PRIMARY KEY (id);


--
-- Name: app_myfiles app_myfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_myfiles
    ADD CONSTRAINT app_myfiles_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_category app_selleraccount_catego_selleraccount_id_categor_640c84ff_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_catego_selleraccount_id_categor_640c84ff_uniq UNIQUE (selleraccount_id, category_id);


--
-- Name: app_selleraccount_category app_selleraccount_category_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_category_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount app_selleraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount
    ADD CONSTRAINT app_selleraccount_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_subs app_selleraccount_subs_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_subs_pkey PRIMARY KEY (id);


--
-- Name: app_selleraccount_subs app_selleraccount_subs_selleraccount_id_subcate_10e4021e_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_subs_selleraccount_id_subcate_10e4021e_uniq UNIQUE (selleraccount_id, subcategory_id);


--
-- Name: app_subcategory app_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- Name: app_user_groups app_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_user_id_group_id_73b8e940_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_group_id_73b8e940_uniq UNIQUE (user_id, group_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_permission_id_7c8316ce_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_permission_id_7c8316ce_uniq UNIQUE (user_id, permission_id);


--
-- Name: app_usergame app_usergame_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_usergame
    ADD CONSTRAINT app_usergame_pkey PRIMARY KEY (id);


--
-- Name: app_weekcustom_demandes app_weekcustom_demandes_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_demandes_pkey PRIMARY KEY (id);


--
-- Name: app_weekcustom_demandes app_weekcustom_demandes_weekcustom_id_clientdema_b96f7b0e_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_demandes_weekcustom_id_clientdema_b96f7b0e_uniq UNIQUE (weekcustom_id, clientdemand_id);


--
-- Name: app_weekcustom app_weekcustom_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom
    ADD CONSTRAINT app_weekcustom_pkey PRIMARY KEY (id);


--
-- Name: app_zawadidetail app_zawadidetail_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_zawadidetail
    ADD CONSTRAINT app_zawadidetail_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_pkey PRIMARY KEY (id);


--
-- Name: app_abnfeature_seller_id_79deb34f; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_abnfeature_seller_id_79deb34f ON public.app_abnfeature USING btree (seller_id);


--
-- Name: app_category_label_id_47609f05; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_category_label_id_47609f05 ON public.app_category USING btree (label_id);


--
-- Name: app_client_user_id_df70f6f4; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_client_user_id_df70f6f4 ON public.app_client USING btree (user_id);


--
-- Name: app_clientdemand_category_id_7f48e7f7; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_clientdemand_category_id_7f48e7f7 ON public.app_clientdemand USING btree (category_id);


--
-- Name: app_clientdemand_client_id_806f7d7a; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_clientdemand_client_id_806f7d7a ON public.app_clientdemand USING btree (client_id);


--
-- Name: app_clientdemand_files_clientdemand_id_fe63ff5e; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_clientdemand_files_clientdemand_id_fe63ff5e ON public.app_clientdemand_files USING btree (clientdemand_id);


--
-- Name: app_clientdemand_files_myfiles_id_73fb8933; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_clientdemand_files_myfiles_id_73fb8933 ON public.app_clientdemand_files USING btree (myfiles_id);


--
-- Name: app_clientdemand_subs_id_f5b539c3; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_clientdemand_subs_id_f5b539c3 ON public.app_clientdemand USING btree (subs_id);


--
-- Name: app_selleraccount_category_category_id_fbf88a54; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_selleraccount_category_category_id_fbf88a54 ON public.app_selleraccount_category USING btree (category_id);


--
-- Name: app_selleraccount_category_selleraccount_id_53d24c30; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_selleraccount_category_selleraccount_id_53d24c30 ON public.app_selleraccount_category USING btree (selleraccount_id);


--
-- Name: app_selleraccount_subs_selleraccount_id_46ab9637; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_selleraccount_subs_selleraccount_id_46ab9637 ON public.app_selleraccount_subs USING btree (selleraccount_id);


--
-- Name: app_selleraccount_subs_subcategory_id_c9d01565; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_selleraccount_subs_subcategory_id_c9d01565 ON public.app_selleraccount_subs USING btree (subcategory_id);


--
-- Name: app_selleraccount_user_id_7c71cadb; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_selleraccount_user_id_7c71cadb ON public.app_selleraccount USING btree (user_id);


--
-- Name: app_subcategory_box_id_75f75013; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_subcategory_box_id_75f75013 ON public.app_subcategory USING btree (box_id);


--
-- Name: app_subcategory_sub_box_id_5c9be328; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_subcategory_sub_box_id_5c9be328 ON public.app_subcategory USING btree (sub_box_id);


--
-- Name: app_user_email_efde8896_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_user_email_efde8896_like ON public.app_user USING btree (email varchar_pattern_ops);


--
-- Name: app_user_groups_group_id_e774d92c; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_user_groups_group_id_e774d92c ON public.app_user_groups USING btree (group_id);


--
-- Name: app_user_groups_user_id_e6f878f6; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_user_groups_user_id_e6f878f6 ON public.app_user_groups USING btree (user_id);


--
-- Name: app_user_user_permissions_permission_id_4ef8e133; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_user_user_permissions_permission_id_4ef8e133 ON public.app_user_user_permissions USING btree (permission_id);


--
-- Name: app_user_user_permissions_user_id_24780b52; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_user_user_permissions_user_id_24780b52 ON public.app_user_user_permissions USING btree (user_id);


--
-- Name: app_usergame_user_id_9886c3a8; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_usergame_user_id_9886c3a8 ON public.app_usergame USING btree (user_id);


--
-- Name: app_weekcustom_demandes_clientdemand_id_c9f4fa8c; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_weekcustom_demandes_clientdemand_id_c9f4fa8c ON public.app_weekcustom_demandes USING btree (clientdemand_id);


--
-- Name: app_weekcustom_demandes_weekcustom_id_19656cf5; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_weekcustom_demandes_weekcustom_id_19656cf5 ON public.app_weekcustom_demandes USING btree (weekcustom_id);


--
-- Name: app_weekcustom_seller_id_e2426215; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX app_weekcustom_seller_id_e2426215 ON public.app_weekcustom USING btree (seller_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fcm_django_fcmdevice_device_id_a9406c36; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX fcm_django_fcmdevice_device_id_a9406c36 ON public.fcm_django_fcmdevice USING btree (device_id);


--
-- Name: fcm_django_fcmdevice_user_id_6cdfc0a2; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX fcm_django_fcmdevice_user_id_6cdfc0a2 ON public.fcm_django_fcmdevice USING btree (user_id);


--
-- Name: app_abnfeature app_abnfeature_seller_id_79deb34f_fk_app_selleraccount_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_abnfeature
    ADD CONSTRAINT app_abnfeature_seller_id_79deb34f_fk_app_selleraccount_id FOREIGN KEY (seller_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_category app_category_label_id_47609f05_fk_app_label_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_label_id_47609f05_fk_app_label_id FOREIGN KEY (label_id) REFERENCES public.app_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_client app_client_user_id_df70f6f4_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_client
    ADD CONSTRAINT app_client_user_id_df70f6f4_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_category_id_7f48e7f7_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_category_id_7f48e7f7_fk_app_category_id FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_client_id_806f7d7a_fk_app_client_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_client_id_806f7d7a_fk_app_client_id FOREIGN KEY (client_id) REFERENCES public.app_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_files app_clientdemand_fil_clientdemand_id_fe63ff5e_fk_app_clien; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_fil_clientdemand_id_fe63ff5e_fk_app_clien FOREIGN KEY (clientdemand_id) REFERENCES public.app_clientdemand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand_files app_clientdemand_files_myfiles_id_73fb8933_fk_app_myfiles_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand_files
    ADD CONSTRAINT app_clientdemand_files_myfiles_id_73fb8933_fk_app_myfiles_id FOREIGN KEY (myfiles_id) REFERENCES public.app_myfiles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_clientdemand app_clientdemand_subs_id_f5b539c3_fk_app_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_clientdemand
    ADD CONSTRAINT app_clientdemand_subs_id_f5b539c3_fk_app_subcategory_id FOREIGN KEY (subs_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_category app_selleraccount_ca_category_id_fbf88a54_fk_app_categ; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_ca_category_id_fbf88a54_fk_app_categ FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_category app_selleraccount_ca_selleraccount_id_53d24c30_fk_app_selle; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_category
    ADD CONSTRAINT app_selleraccount_ca_selleraccount_id_53d24c30_fk_app_selle FOREIGN KEY (selleraccount_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_subs app_selleraccount_su_selleraccount_id_46ab9637_fk_app_selle; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_su_selleraccount_id_46ab9637_fk_app_selle FOREIGN KEY (selleraccount_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount_subs app_selleraccount_su_subcategory_id_c9d01565_fk_app_subca; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount_subs
    ADD CONSTRAINT app_selleraccount_su_subcategory_id_c9d01565_fk_app_subca FOREIGN KEY (subcategory_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_selleraccount app_selleraccount_user_id_7c71cadb_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_selleraccount
    ADD CONSTRAINT app_selleraccount_user_id_7c71cadb_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_subcategory app_subcategory_box_id_75f75013_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_box_id_75f75013_fk_app_category_id FOREIGN KEY (box_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_subcategory app_subcategory_sub_box_id_5c9be328_fk_app_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_subcategory
    ADD CONSTRAINT app_subcategory_sub_box_id_5c9be328_fk_app_subcategory_id FOREIGN KEY (sub_box_id) REFERENCES public.app_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_group_id_e774d92c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_group_id_e774d92c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_user_id_e6f878f6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_e6f878f6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permis_permission_id_4ef8e133_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permis_permission_id_4ef8e133_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_24780b52_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_24780b52_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usergame app_usergame_user_id_9886c3a8_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_usergame
    ADD CONSTRAINT app_usergame_user_id_9886c3a8_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom_demandes app_weekcustom_deman_clientdemand_id_c9f4fa8c_fk_app_clien; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_deman_clientdemand_id_c9f4fa8c_fk_app_clien FOREIGN KEY (clientdemand_id) REFERENCES public.app_clientdemand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom_demandes app_weekcustom_deman_weekcustom_id_19656cf5_fk_app_weekc; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom_demandes
    ADD CONSTRAINT app_weekcustom_deman_weekcustom_id_19656cf5_fk_app_weekc FOREIGN KEY (weekcustom_id) REFERENCES public.app_weekcustom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_weekcustom app_weekcustom_seller_id_e2426215_fk_app_selleraccount_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.app_weekcustom
    ADD CONSTRAINT app_weekcustom_seller_id_e2426215_fk_app_selleraccount_id FOREIGN KEY (seller_id) REFERENCES public.app_selleraccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fcm_django_fcmdevice fcm_django_fcmdevice_user_id_6cdfc0a2_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public.fcm_django_fcmdevice
    ADD CONSTRAINT fcm_django_fcmdevice_user_id_6cdfc0a2_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

</body></html>

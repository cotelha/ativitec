--
-- PostgreSQL database dump
--

-- Started on 2010-06-01 22:57:22 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1526 (class 1259 OID 16420)
-- Dependencies: 3
-- Name: atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE atividades (
    id integer NOT NULL,
    nm_atividade character varying(255),
    tp_atividade character varying(255),
    exibe_projeto boolean,
    icone_atividade character varying(255),
    nr_ordem integer,
    exibe_prev_termino boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.atividades OWNER TO postgres;

--
-- TOC entry 1525 (class 1259 OID 16418)
-- Dependencies: 1526 3
-- Name: atividades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.atividades_id_seq OWNER TO postgres;

--
-- TOC entry 1851 (class 0 OID 0)
-- Dependencies: 1525
-- Name: atividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atividades_id_seq OWNED BY atividades.id;


--
-- TOC entry 1852 (class 0 OID 0)
-- Dependencies: 1525
-- Name: atividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atividades_id_seq', 3, true);


--
-- TOC entry 1532 (class 1259 OID 16451)
-- Dependencies: 3
-- Name: atividades_motivo_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE atividades_motivo_atividades (
    atividade_id integer,
    motivo_atividade_id integer
);


ALTER TABLE public.atividades_motivo_atividades OWNER TO postgres;

--
-- TOC entry 1534 (class 1259 OID 16528)
-- Dependencies: 3
-- Name: backups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE backups (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.backups OWNER TO postgres;

--
-- TOC entry 1533 (class 1259 OID 16526)
-- Dependencies: 1534 3
-- Name: backups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE backups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.backups_id_seq OWNER TO postgres;

--
-- TOC entry 1853 (class 0 OID 0)
-- Dependencies: 1533
-- Name: backups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE backups_id_seq OWNED BY backups.id;


--
-- TOC entry 1854 (class 0 OID 0)
-- Dependencies: 1533
-- Name: backups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('backups_id_seq', 5, true);


--
-- TOC entry 1522 (class 1259 OID 16401)
-- Dependencies: 3
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    nm_cliente character varying(50) NOT NULL,
    endereco character varying(150),
    fone character varying(15),
    cidade character varying(100),
    estado character varying(100),
    cep character varying(15),
    cnpj character varying(20) NOT NULL,
    email character varying(150) NOT NULL,
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 1521 (class 1259 OID 16399)
-- Dependencies: 3 1522
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 1855 (class 0 OID 0)
-- Dependencies: 1521
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- TOC entry 1856 (class 0 OID 0)
-- Dependencies: 1521
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientes_id_seq', 1, true);


--
-- TOC entry 1528 (class 1259 OID 16431)
-- Dependencies: 3
-- Name: motivo_atividades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE motivo_atividades (
    id integer NOT NULL,
    nm_motivo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.motivo_atividades OWNER TO postgres;

--
-- TOC entry 1527 (class 1259 OID 16429)
-- Dependencies: 3 1528
-- Name: motivo_atividades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motivo_atividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.motivo_atividades_id_seq OWNER TO postgres;

--
-- TOC entry 1857 (class 0 OID 0)
-- Dependencies: 1527
-- Name: motivo_atividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motivo_atividades_id_seq OWNED BY motivo_atividades.id;


--
-- TOC entry 1858 (class 0 OID 0)
-- Dependencies: 1527
-- Name: motivo_atividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motivo_atividades_id_seq', 3, true);


--
-- TOC entry 1530 (class 1259 OID 16439)
-- Dependencies: 3
-- Name: orden_servicos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orden_servicos (
    id integer NOT NULL,
    dt_inicio timestamp without time zone,
    dt_termino timestamp without time zone,
    cliente_id integer,
    user_id integer,
    atividade_id integer,
    txt_descricao text,
    txt_descricao_tecnica text,
    ind_cancelado character varying(255),
    nro_prioridade smallint,
    hrs_previsao_termino numeric(5,2),
    nm_contato character varying(255),
    ind_status character varying(255),
    motivo_atividade_id integer,
    projeto_id integer
);


ALTER TABLE public.orden_servicos OWNER TO postgres;

--
-- TOC entry 1529 (class 1259 OID 16437)
-- Dependencies: 3 1530
-- Name: orden_servicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orden_servicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.orden_servicos_id_seq OWNER TO postgres;

--
-- TOC entry 1859 (class 0 OID 0)
-- Dependencies: 1529
-- Name: orden_servicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orden_servicos_id_seq OWNED BY orden_servicos.id;


--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 1529
-- Name: orden_servicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orden_servicos_id_seq', 3, true);


--
-- TOC entry 1531 (class 1259 OID 16448)
-- Dependencies: 3
-- Name: os_historicos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE os_historicos (
    orden_servico_id integer,
    dt_inicio timestamp without time zone,
    dt_termino timestamp without time zone,
    atividade_id integer,
    user_id integer
);


ALTER TABLE public.os_historicos OWNER TO postgres;

--
-- TOC entry 1524 (class 1259 OID 16412)
-- Dependencies: 3
-- Name: projetos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE projetos (
    id integer NOT NULL,
    nm_projeto character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.projetos OWNER TO postgres;

--
-- TOC entry 1523 (class 1259 OID 16410)
-- Dependencies: 1524 3
-- Name: projetos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projetos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.projetos_id_seq OWNER TO postgres;

--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 1523
-- Name: projetos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE projetos_id_seq OWNED BY projetos.id;


--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 1523
-- Name: projetos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projetos_id_seq', 3, true);


--
-- TOC entry 1518 (class 1259 OID 16385)
-- Dependencies: 3
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 1520 (class 1259 OID 16391)
-- Dependencies: 1813 3
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying(40),
    name character varying(100) DEFAULT ''::character varying,
    email character varying(100),
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(40),
    remember_token_expires_at timestamp without time zone,
    tp_user character varying(1)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 1519 (class 1259 OID 16389)
-- Dependencies: 3 1520
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 1519
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1864 (class 0 OID 0)
-- Dependencies: 1519
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- TOC entry 1816 (class 2604 OID 16423)
-- Dependencies: 1525 1526 1526
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE atividades ALTER COLUMN id SET DEFAULT nextval('atividades_id_seq'::regclass);


--
-- TOC entry 1819 (class 2604 OID 16531)
-- Dependencies: 1533 1534 1534
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE backups ALTER COLUMN id SET DEFAULT nextval('backups_id_seq'::regclass);


--
-- TOC entry 1814 (class 2604 OID 16404)
-- Dependencies: 1522 1521 1522
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- TOC entry 1817 (class 2604 OID 16434)
-- Dependencies: 1528 1527 1528
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE motivo_atividades ALTER COLUMN id SET DEFAULT nextval('motivo_atividades_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 16442)
-- Dependencies: 1529 1530 1530
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE orden_servicos ALTER COLUMN id SET DEFAULT nextval('orden_servicos_id_seq'::regclass);


--
-- TOC entry 1815 (class 2604 OID 16415)
-- Dependencies: 1524 1523 1524
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE projetos ALTER COLUMN id SET DEFAULT nextval('projetos_id_seq'::regclass);


--
-- TOC entry 1812 (class 2604 OID 16394)
-- Dependencies: 1519 1520 1520
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1840 (class 0 OID 16420)
-- Dependencies: 1526
-- Data for Name: atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atividades (id, nm_atividade, tp_atividade, exibe_projeto, icone_atividade, nr_ordem, exibe_prev_termino, created_at, updated_at) FROM stdin;
1	Programação	I	t		0	t	2010-05-30 22:34:08.472918	2010-05-30 22:34:08.472918
2	Suporte	I	t		0	t	2010-05-30 22:34:57.747207	2010-05-30 22:34:57.747207
3	Atividade Externa	E	t		1	f	2010-05-30 22:41:10.824968	2010-05-30 22:41:10.824968
\.


--
-- TOC entry 1844 (class 0 OID 16451)
-- Dependencies: 1532
-- Data for Name: atividades_motivo_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atividades_motivo_atividades (atividade_id, motivo_atividade_id) FROM stdin;
1	1
2	1
1	2
2	2
1	3
2	3
\.


--
-- TOC entry 1845 (class 0 OID 16528)
-- Dependencies: 1534
-- Data for Name: backups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY backups (id, created_at, updated_at) FROM stdin;
1	2010-06-02 01:49:53.534985	2010-06-02 01:49:53.534985
2	2010-06-02 01:51:31.222327	2010-06-02 01:51:31.222327
3	2010-06-02 01:52:50.348146	2010-06-02 01:52:50.348146
4	2010-06-02 01:53:31.159455	2010-06-02 01:53:31.159455
5	2010-06-02 01:54:27.522938	2010-06-02 01:54:27.522938
\.


--
-- TOC entry 1838 (class 0 OID 16401)
-- Dependencies: 1522
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes (id, nm_cliente, endereco, fone, cidade, estado, cep, cnpj, email, status, created_at, updated_at) FROM stdin;
1	raidbr							raidbr@raidbr.com.br	t	2010-05-30 22:31:51.422345	2010-05-30 22:31:51.422345
\.


--
-- TOC entry 1841 (class 0 OID 16431)
-- Dependencies: 1528
-- Data for Name: motivo_atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY motivo_atividades (id, nm_motivo, created_at, updated_at) FROM stdin;
1	Análise	2010-05-30 22:41:34.746852	2010-05-30 22:41:34.746852
2	Correção	2010-05-30 22:41:43.696315	2010-05-30 22:41:43.696315
3	Melhoria	2010-05-30 22:41:52.995244	2010-05-30 22:41:52.995244
\.


--
-- TOC entry 1842 (class 0 OID 16439)
-- Dependencies: 1530
-- Data for Name: orden_servicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orden_servicos (id, dt_inicio, dt_termino, cliente_id, user_id, atividade_id, txt_descricao, txt_descricao_tecnica, ind_cancelado, nro_prioridade, hrs_previsao_termino, nm_contato, ind_status, motivo_atividade_id, projeto_id) FROM stdin;
2	2010-05-29 08:00:00	2010-05-29 12:00:00	1	1	3	teste_atividade_externa	\N	\N	\N	10.00	graziela	C	3	2
3	2010-05-30 22:21:45	2010-05-31 21:34:27	1	1	2	teste_ descricao 	\N	\N	\N	\N	canidia	C	1	1
1	2010-05-30 19:42:45	2010-05-31 21:34:37	1	1	1	Descrição	\N	\N	\N	5.00	Rafael	C	2	1
\.


--
-- TOC entry 1843 (class 0 OID 16448)
-- Dependencies: 1531
-- Data for Name: os_historicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY os_historicos (orden_servico_id, dt_inicio, dt_termino, atividade_id, user_id) FROM stdin;
1	2010-05-30 19:42:55	2010-05-30 19:51:41	\N	1
2	2010-05-29 08:00:00	2010-05-29 12:00:00	\N	1
1	2010-05-30 19:56:34	2010-05-30 20:51:30	\N	1
1	2010-05-30 21:12:58	2010-05-30 21:18:52	\N	1
1	2010-05-30 21:20:58	2010-05-30 21:27:31	\N	1
1	2010-05-30 21:36:53	2010-05-30 22:00:47	\N	1
3	2010-05-30 22:21:48	2010-05-30 22:28:50	\N	1
1	2010-05-31 21:34:10	2010-05-31 21:34:17	\N	1
3	2010-05-31 21:34:24	2010-05-31 21:34:27	\N	1
1	2010-05-31 21:34:33	2010-05-31 21:34:37	\N	1
1	2010-05-31 21:34:33	2010-05-31 21:34:37	\N	1
\.


--
-- TOC entry 1839 (class 0 OID 16412)
-- Dependencies: 1524
-- Data for Name: projetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projetos (id, nm_projeto, created_at, updated_at) FROM stdin;
1	Observi 7	2010-05-30 22:32:27.433583	2010-05-30 22:32:27.433583
2	Observi 2008	2010-05-30 22:32:34.359863	2010-05-30 22:32:34.359863
3	Nova interface	2010-05-30 22:32:45.745973	2010-05-30 22:32:45.745973
\.


--
-- TOC entry 1836 (class 0 OID 16385)
-- Dependencies: 1518
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20100323224741
20100324231410
20100505225152
20100506232700
20100507003935
20100507012527
20100511005122
20100523200534
20100525175522
20100602012849
\.


--
-- TOC entry 1837 (class 0 OID 16391)
-- Dependencies: 1520
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, login, name, email, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at, tp_user) FROM stdin;
1	rafael	rafael	rafael.cote@gmail.com	636c50b97f6cf278a0779f0cf48f2fd076534463	8a1284fc603d8cf14b51465aa408e37e9a317b49	\N	\N	\N	\N	A
\.


--
-- TOC entry 1829 (class 2606 OID 16428)
-- Dependencies: 1526 1526
-- Name: atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY (id);


--
-- TOC entry 1835 (class 2606 OID 16533)
-- Dependencies: 1534 1534
-- Name: backups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY backups
    ADD CONSTRAINT backups_pkey PRIMARY KEY (id);


--
-- TOC entry 1825 (class 2606 OID 16409)
-- Dependencies: 1522 1522
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 1831 (class 2606 OID 16436)
-- Dependencies: 1528 1528
-- Name: motivo_atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY motivo_atividades
    ADD CONSTRAINT motivo_atividades_pkey PRIMARY KEY (id);


--
-- TOC entry 1833 (class 2606 OID 16447)
-- Dependencies: 1530 1530
-- Name: orden_servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orden_servicos
    ADD CONSTRAINT orden_servicos_pkey PRIMARY KEY (id);


--
-- TOC entry 1827 (class 2606 OID 16417)
-- Dependencies: 1524 1524
-- Name: projetos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY projetos
    ADD CONSTRAINT projetos_pkey PRIMARY KEY (id);


--
-- TOC entry 1823 (class 2606 OID 16397)
-- Dependencies: 1520 1520
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1821 (class 1259 OID 16398)
-- Dependencies: 1520
-- Name: index_users_on_login; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_login ON users USING btree (login);


--
-- TOC entry 1820 (class 1259 OID 16388)
-- Dependencies: 1518
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- TOC entry 1850 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-06-01 22:57:22 BRT

--
-- PostgreSQL database dump complete
--


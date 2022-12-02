--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-02 13:13:45

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
-- TOC entry 215 (class 1259 OID 16526)
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    username text NOT NULL,
    authority text NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16531)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    categoria text NOT NULL,
    status text
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16536)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 214 (class 1259 OID 16517)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16537)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    produto text NOT NULL,
    img text NOT NULL,
    categoria bigint NOT NULL,
    status text NOT NULL,
    situacao text
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16542)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 219
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 225 (class 1259 OID 16621)
-- Name: reserva_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva_produto (
    id bigint NOT NULL,
    reserva bigint,
    produto bigint,
    status character varying(255)
);


ALTER TABLE public.reserva_produto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16615)
-- Name: reserva_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserva_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reserva_produto_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 224
-- Name: reserva_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reserva_produto_id_seq OWNED BY public.reserva_produto.id;


--
-- TOC entry 220 (class 1259 OID 16543)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id bigint NOT NULL,
    usuario bigint NOT NULL,
    data_reserva date NOT NULL,
    data_retirada date NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16548)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE public.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 221
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- TOC entry 222 (class 1259 OID 16555)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    enabled boolean,
    nome character varying(255),
    password character varying(255),
    roles character varying(255),
    status character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16560)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- TOC entry 3367 (class 0 OID 16526)
-- Dependencies: 215
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (username, authority) FROM stdin;
gui	ROLE_ADM
\.


--
-- TOC entry 3368 (class 0 OID 16531)
-- Dependencies: 216
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, categoria, status) FROM stdin;
2	Tecnologia	ATIVO
1	Roupa	INATIVO
\.


--
-- TOC entry 3366 (class 0 OID 16517)
-- Dependencies: 214
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	01	criarTabela	SQL	V01__criarTabela.sql	-54232558	postgres	2022-12-02 08:42:20.619306	58	t
\.


--
-- TOC entry 3370 (class 0 OID 16537)
-- Dependencies: 218
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, produto, img, categoria, status, situacao) FROM stdin;
1	Notebook	https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/notebooks/latitude-notebooks/14-3420/media-gallery/peripherals_laptop_latitude_3420nt_gallery_3.psd?fmt=pjpg&pscan=auto&scl=1&hei=402&wid=573&qlt=100,1&resMode=sharp2&size=573,402&chrss=full	2	ATIVO	RESERVADO
2	Notebook dell	https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/notebooks/latitude-notebooks/14-3420/media-gallery/peripherals_laptop_latitude_3420nt_gallery_3.psd?fmt=pjpg&pscan=auto&scl=1&hei=402&wid=573&qlt=100,1&resMode=sharp2&size=573,402&chrss=full	2	ATIVO	DISPONIVEL
3	Teclado	https://m.media-amazon.com/images/I/51321mjdahL._AC_SY450_.jpg	2	ATIVO	DISPONIVEL
\.


--
-- TOC entry 3377 (class 0 OID 16621)
-- Dependencies: 225
-- Data for Name: reserva_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva_produto (id, reserva, produto, status) FROM stdin;
9	52	2	ATIVO
10	53	2	ATIVO
\.


--
-- TOC entry 3372 (class 0 OID 16543)
-- Dependencies: 220
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, usuario, data_reserva, data_retirada, status) FROM stdin;
15	1	2022-12-02	2022-12-29	ATIVO
16	1	2022-12-02	2022-12-23	ATIVO
17	1	2022-12-02	2022-12-23	ATIVO
18	1	2022-12-02	2022-12-21	ATIVO
19	1	2022-12-02	2022-12-22	ATIVO
20	1	2022-12-02	2022-12-22	ATIVO
21	1	2022-12-02	2022-12-22	ATIVO
22	1	2022-12-02	2022-12-30	ATIVO
23	1	2022-12-02	2022-12-22	ATIVO
24	1	2022-12-02	2022-12-23	ATIVO
25	1	2022-12-02	2022-12-22	ATIVO
26	1	2022-12-02	2022-12-23	ATIVO
27	1	2022-12-02	2022-12-15	ATIVO
28	1	2022-12-02	2022-12-15	ATIVO
29	1	2022-12-02	2022-12-21	ATIVO
30	1	2022-12-02	2022-12-14	ATIVO
31	1	2022-12-02	2022-12-22	ATIVO
32	1	2022-12-02	2022-12-22	ATIVO
33	1	2022-12-02	2022-12-22	ATIVO
34	1	2022-12-02	2022-12-22	ATIVO
35	1	2022-12-02	2022-12-14	ATIVO
36	1	2022-12-02	2022-12-14	ATIVO
37	1	2022-12-02	2022-12-22	ATIVO
38	1	2022-12-02	2022-12-14	ATIVO
39	1	2022-12-02	2022-12-22	ATIVO
40	1	2022-12-02	2022-12-14	ATIVO
41	1	2022-12-02	2022-12-13	ATIVO
42	1	2022-12-02	2022-12-14	ATIVO
43	1	2022-12-02	2022-12-14	ATIVO
44	1	2022-12-02	2022-12-13	ATIVO
45	1	2022-12-02	2022-12-21	ATIVO
46	1	2022-12-02	2022-12-14	ATIVO
47	1	2022-12-02	2022-12-15	ATIVO
48	1	2022-12-02	2022-12-15	ATIVO
49	1	2022-12-02	2022-12-13	ATIVO
50	1	2022-12-02	2022-12-14	ATIVO
51	1	2022-12-02	2022-12-22	ATIVO
52	1	2022-12-02	2022-12-08	ATIVO
53	1	2022-12-02	2022-12-23	ATIVO
54	1	2022-12-02	2022-12-15	ATIVO
55	1	2022-12-02	2022-12-21	ATIVO
56	1	2022-12-02	2022-12-15	ATIVO
57	1	2022-12-02	2022-12-15	ATIVO
58	1	2022-12-02	2022-12-22	ATIVO
\.


--
-- TOC entry 3374 (class 0 OID 16555)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, enabled, nome, password, roles, status, username) FROM stdin;
1	t	Guilherme	$2a$12$EELDigk5bvxpMcZsNKyQgeurSNYad1Hp0siEUblFBVvIR1l67HBMa	ROLE_ADM	ATIVO	gui
\.


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 2, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 3, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 224
-- Name: reserva_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_produto_id_seq', 10, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 221
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 58, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3206 (class 2606 OID 16562)
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (username);


--
-- TOC entry 3208 (class 2606 OID 16564)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 16524)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3210 (class 2606 OID 16566)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16625)
-- Name: reserva_produto reserva_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva_produto
    ADD CONSTRAINT reserva_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16568)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16572)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16574)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3204 (class 1259 OID 16525)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 3219 (class 2606 OID 16575)
-- Name: authorities authorities_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) NOT VALID;


--
-- TOC entry 3220 (class 2606 OID 16580)
-- Name: produtos produtos_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categorias(id) NOT VALID;


--
-- TOC entry 3222 (class 2606 OID 16631)
-- Name: reserva_produto reserva_produto_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva_produto
    ADD CONSTRAINT reserva_produto_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id);


--
-- TOC entry 3223 (class 2606 OID 16626)
-- Name: reserva_produto reserva_produto_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva_produto
    ADD CONSTRAINT reserva_produto_reserva_fkey FOREIGN KEY (reserva) REFERENCES public.reservas(id);


--
-- TOC entry 3221 (class 2606 OID 16590)
-- Name: reservas reservas_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_usuario_fkey FOREIGN KEY (usuario) REFERENCES public.users(id) NOT VALID;


-- Completed on 2022-12-02 13:13:45

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-12-02 00:13:53 UTC

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
-- TOC entry 209 (class 1259 OID 17067)
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    username text NOT NULL,
    authority text NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17072)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    categoria text NOT NULL,
    status text
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17077)
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
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 211
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 212 (class 1259 OID 17078)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    produto text NOT NULL,
    img text NOT NULL,
    categoria bigint NOT NULL,
    status text NOT NULL,
    situacao bigint
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17083)
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
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 213
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 214 (class 1259 OID 17084)
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
-- TOC entry 215 (class 1259 OID 17089)
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
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 215
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- TOC entry 216 (class 1259 OID 17090)
-- Name: situacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situacoes (
    id integer NOT NULL,
    tipo text NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.situacoes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17095)
-- Name: situacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.situacoes_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 217
-- Name: situacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.situacoes_id_seq OWNED BY public.situacoes.id;


--
-- TOC entry 218 (class 1259 OID 17096)
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
-- TOC entry 219 (class 1259 OID 17101)
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
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- TOC entry 3348 (class 0 OID 17067)
-- Dependencies: 209
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (username, authority) FROM stdin;
gui	ROLE_ADM
\.


--
-- TOC entry 3349 (class 0 OID 17072)
-- Dependencies: 210
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, categoria, status) FROM stdin;
2	Tecnologia	ATIVO
1	Roupa	INATIVO
\.


--
-- TOC entry 3351 (class 0 OID 17078)
-- Dependencies: 212
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, produto, img, categoria, status, situacao) FROM stdin;
2	Notebook dell	https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/notebooks/latitude-notebooks/14-3420/media-gallery/peripherals_laptop_latitude_3420nt_gallery_3.psd?fmt=pjpg&pscan=auto&scl=1&hei=402&wid=573&qlt=100,1&resMode=sharp2&size=573,402&chrss=full	2	ATIVO	\N
1	Notebook	https://i.dell.com/is/image/DellContent//content/dam/ss2/product-images/dell-client-products/notebooks/latitude-notebooks/14-3420/media-gallery/peripherals_laptop_latitude_3420nt_gallery_3.psd?fmt=pjpg&pscan=auto&scl=1&hei=402&wid=573&qlt=100,1&resMode=sharp2&size=573,402&chrss=full	2	INATIVO	\N
\.


--
-- TOC entry 3353 (class 0 OID 17084)
-- Dependencies: 214
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, usuario, data_reserva, data_retirada, status) FROM stdin;
\.


--
-- TOC entry 3355 (class 0 OID 17090)
-- Dependencies: 216
-- Data for Name: situacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situacoes (id, tipo, status) FROM stdin;
1	Reservado	ATIVO
2	Disponível	ATIVO
\.


--
-- TOC entry 3357 (class 0 OID 17096)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, enabled, nome, password, roles, status, username) FROM stdin;
1	t	Guilherme	$2a$12$EELDigk5bvxpMcZsNKyQgeurSNYad1Hp0siEUblFBVvIR1l67HBMa	ROLE_ADM	ATIVO	gui
\.


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 211
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 2, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 213
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 2, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 215
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 1, false);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 217
-- Name: situacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situacoes_id_seq', 1, false);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3192 (class 2606 OID 17135)
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (username);


--
-- TOC entry 3194 (class 2606 OID 17142)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 17168)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 17127)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 17149)
-- Name: situacoes situacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacoes
    ADD CONSTRAINT situacoes_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 17131)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 17133)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3205 (class 2606 OID 17136)
-- Name: authorities authorities_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) NOT VALID;


--
-- TOC entry 3206 (class 2606 OID 17169)
-- Name: produtos produtos_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categorias(id) NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 17174)
-- Name: produtos produtos_situacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_situacao_fkey FOREIGN KEY (situacao) REFERENCES public.situacoes(id) NOT VALID;


--
-- TOC entry 3208 (class 2606 OID 17150)
-- Name: reservas reservas_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_usuario_fkey FOREIGN KEY (usuario) REFERENCES public.users(id) NOT VALID;


-- Completed on 2022-12-02 00:13:53 UTC

--
-- PostgreSQL database dump complete
--

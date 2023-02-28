--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)

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
-- Name: admin; Type: TABLE; Schema: public; Owner: etienne
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    email character varying(50),
    mdp character varying(100)
);


ALTER TABLE public.admin OWNER TO etienne;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: etienne
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO etienne;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etienne
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: auteur; Type: TABLE; Schema: public; Owner: etienne
--

CREATE TABLE public.auteur (
    id integer NOT NULL,
    pseudo character varying(30),
    email character varying(50),
    mdp character varying(100)
);


ALTER TABLE public.auteur OWNER TO etienne;

--
-- Name: auteur_id_seq; Type: SEQUENCE; Schema: public; Owner: etienne
--

CREATE SEQUENCE public.auteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auteur_id_seq OWNER TO etienne;

--
-- Name: auteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etienne
--

ALTER SEQUENCE public.auteur_id_seq OWNED BY public.auteur.id;


--
-- Name: element; Type: TABLE; Schema: public; Owner: etienne
--

CREATE TABLE public.element (
    id integer NOT NULL,
    titre character varying(50),
    photo character varying,
    description text,
    date_debut date,
    date_fin date,
    type character varying(20),
    statut integer DEFAULT 0,
    id_auteur integer,
    date_creation date DEFAULT now(),
    date_publication date
);


ALTER TABLE public.element OWNER TO etienne;

--
-- Name: element_id_seq; Type: SEQUENCE; Schema: public; Owner: etienne
--

CREATE SEQUENCE public.element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_id_seq OWNER TO etienne;

--
-- Name: element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etienne
--

ALTER SEQUENCE public.element_id_seq OWNED BY public.element.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: etienne
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO etienne;

--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: auteur id; Type: DEFAULT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.auteur ALTER COLUMN id SET DEFAULT nextval('public.auteur_id_seq'::regclass);


--
-- Name: element id; Type: DEFAULT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.element ALTER COLUMN id SET DEFAULT nextval('public.element_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: etienne
--

COPY public.admin (id, email, mdp) FROM stdin;
1	admin@gmail.com	1234
\.


--
-- Data for Name: auteur; Type: TABLE DATA; Schema: public; Owner: etienne
--

COPY public.auteur (id, pseudo, email, mdp) FROM stdin;
1	SEBXR	etienne.itu@gmail.com	1234
2	ChickFrenzy	anna.tagmedia@gmail.com	1234
\.


--
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: etienne
--

COPY public.element (id, titre, photo, description, date_debut, date_fin, type, statut, id_auteur, date_creation, date_publication) FROM stdin;
8	Xavi officiellement nommé nouvel entraîneur !	https://img.20mn.fr/wxtr3CQ8QcC9RNkNyHZ3ASk/310x190_xavi-officiellement-intronise-tete-barca-8-novembre-2021	Le FC Barcelone tient son nouvel entraîneur. Et sans surprise, il s'agit de son ancien milieu et légende du club, Xavi Hernández.	2021-11-06	2021-11-06	article	1	2	2023-02-06	2023-02-06
9	Barcelone champion de la Supercoupe 2023 !	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrGj6LeQCPlpG7lOVvsVfe97N1D__9bki6hg&usqp=CAU	Après s'être imposé facilement 3-1 face au Real Madrid , les Blaugrana on su l'emporté face à son plus grand rival.	2023-01-15	2023-01-15	article	1	1	2023-02-06	2023-02-06
1	Coupe du monde 2022	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdZEAW7vKDxMkgsKosTvH2K1pzU3w-h65znQ&usqp=CAU	Au Quatar , vivez la 22 ème edition de la competition.	2022-11-20	2022-12-18	evenement	1	1	2023-02-06	2023-02-06
2	UEFA EURO 2020	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1BidrdS3wVIEJsQSlq3q-ztq0RqufLUO8ZA&usqp=CAU	Partout en Europe , vivez la 16 ème edition de la competion.	2021-06-11	2021-07-11	evenement	1	1	2023-02-06	2023-02-06
3	Argentine championne du monde !	https://images.lecho.be/view?iid=Elvis:7n9kI641a0wBcwXFIbfQC5&context=ONLINE&ratio=16/9&width=640	Avec un doublé , Lionel Messi s'offre enfin une coupe du monde . Avec ce trophée , l'Albiceleste aura une 3è étoile sur son maillot.	2022-12-18	2022-12-18	article	1	2	2023-02-06	2023-02-06
4	Italie championne d'Europe !	https://mobile-img.lpcdn.ca/lpca/924x/r3996/d8cab1ae948b36c0bebc6d34a4b5b15e.jpeg	Dimanche à Wembley, l'Italie a remporté le deuxième titre européen de son histoire, en venant à bout de l'Angleterre aux tirs au but (1-1, 3 tab à 2). Cette conclusion vient récompenser un mois exemplaire et une renaissance italienne, opérée après un énorme gadin et une Coupe du monde ratée. Question d'ADN et d'habitude.	2021-07-11	2021-07-11	article	1	2	2023-02-06	2023-02-06
5	CAN 2019	https://www.challenge.ma/wp-content/uploads/2019/07/tut-can.jpg	La Coupe d'Afrique des nations de football Total 2019 est la 32ᵉ édition de la Coupe d'Afrique des nations.	2019-06-21	2019-07-19	evenement	1	1	2023-02-06	2023-02-06
6	Madagascar fini premier de son groupe !	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpnc49NMv25RrGN9ANCHJkFr3HmVYpQugd0w&usqp=CAU	Pour leur première participation , Madagascar a fini 1er de son groupe de phase de poules en s'imposant notamment 2-0 face au Nigéria.	2019-06-30	2019-06-30	article	1	1	2023-02-06	2023-02-06
7	Lionel Messi gagnant du Ballon d'or 2021 !	https://sf.sports.fr/wp-content/uploads/2021/10/M8-1-1.jpg	Après une saison stratosphérique comme à son habitude , Lionel Messi rajoute un 7è Ballon d'Or à sa collection déjà bien remplie.	2021-11-19	2021-11-19	article	0	2	2023-02-06	2023-02-06
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etienne
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- Name: auteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etienne
--

SELECT pg_catalog.setval('public.auteur_id_seq', 3, false);


--
-- Name: element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etienne
--

SELECT pg_catalog.setval('public.element_id_seq', 9, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: etienne
--

SELECT pg_catalog.setval('public.hibernate_sequence', 9, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: auteur auteur_pkey; Type: CONSTRAINT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pkey PRIMARY KEY (id);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (id);


--
-- Name: element element_fk; Type: FK CONSTRAINT; Schema: public; Owner: etienne
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_fk FOREIGN KEY (id_auteur) REFERENCES public.auteur(id);


--
-- PostgreSQL database dump complete
--


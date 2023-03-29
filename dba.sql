--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-0+deb11u1)
-- Dumped by pg_dump version 13.9 (Debian 13.9-0+deb11u1)

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
-- Name: agendatype; Type: TYPE; Schema: public; Owner: ando
--

CREATE TYPE public.agendatype AS (
	idscene integer,
	idplateau integer,
	plateau character varying(255),
	duree real,
	jour integer
);


ALTER TYPE public.agendatype OWNER TO ando;

--
-- Name: agendascene(integer); Type: FUNCTION; Schema: public; Owner: ando
--

CREATE FUNCTION public.agendascene(idfilm integer) RETURNS SETOF public.agendatype
    LANGUAGE plpgsql
    AS $$
DECLARE
    dureeTravaille INT := 480;
    dureeTotal INT := 0;
    jour INT := 0; 
    row RECORD;
BEGIN
    FOR row IN SELECT Sceneid , plateau, duree , PlateauID , datePlanification FROM listeScene where filmID = IDFilm order by PlateauID LOOP
        IF row.datePlanification IS NULL THEN
            dureeTotal := dureeTotal + row.duree;
            IF dureeTotal > dureeTravaille THEN
                jour := jour + 1;
                dureeTotal := row.duree;
            END IF;
            RETURN NEXT (row.Sceneid , row.PlateauID ,row.plateau, row.duree, (jour) :: INT);
        END IF;
    END LOOP;
END;
$$;


ALTER FUNCTION public.agendascene(idfilm integer) OWNER TO ando;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acteur; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.acteur (
    id integer NOT NULL,
    nom character varying(255),
    prenom character varying(255),
    datenaissance date,
    sexe character varying(255) NOT NULL
);


ALTER TABLE public.acteur OWNER TO ando;

--
-- Name: acteur_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.acteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acteur_id_seq OWNER TO ando;

--
-- Name: acteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.acteur_id_seq OWNED BY public.acteur.id;


--
-- Name: auteur; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.auteur (
    id integer NOT NULL,
    nom character varying(255)
);


ALTER TABLE public.auteur OWNER TO ando;

--
-- Name: auteur_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.auteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auteur_id_seq OWNER TO ando;

--
-- Name: auteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.auteur_id_seq OWNED BY public.auteur.id;


--
-- Name: detailsscene; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.detailsscene (
    id integer NOT NULL,
    action character varying(255),
    texte text,
    debut real,
    fin real,
    sceneid integer NOT NULL,
    expressionid integer NOT NULL,
    personnageid integer NOT NULL
);


ALTER TABLE public.detailsscene OWNER TO ando;

--
-- Name: detailsscene_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.detailsscene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detailsscene_id_seq OWNER TO ando;

--
-- Name: detailsscene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.detailsscene_id_seq OWNED BY public.detailsscene.id;


--
-- Name: expression; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.expression (
    id integer NOT NULL,
    expression character varying(255) NOT NULL
);


ALTER TABLE public.expression OWNER TO ando;

--
-- Name: expression_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.expression_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expression_id_seq OWNER TO ando;

--
-- Name: expression_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.expression_id_seq OWNED BY public.expression.id;


--
-- Name: film; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.film (
    id integer NOT NULL,
    nom character varying(255)
);


ALTER TABLE public.film OWNER TO ando;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_id_seq OWNER TO ando;

--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;


--
-- Name: indisponibiliteacteur; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.indisponibiliteacteur (
    id integer NOT NULL,
    acteurid integer,
    date date
);


ALTER TABLE public.indisponibiliteacteur OWNER TO ando;

--
-- Name: indisponibiliteacteur_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.indisponibiliteacteur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indisponibiliteacteur_id_seq OWNER TO ando;

--
-- Name: indisponibiliteacteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.indisponibiliteacteur_id_seq OWNED BY public.indisponibiliteacteur.id;


--
-- Name: indisponibiliteplateau; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.indisponibiliteplateau (
    id integer NOT NULL,
    plateauid integer,
    date date
);


ALTER TABLE public.indisponibiliteplateau OWNER TO ando;

--
-- Name: indisponibiliteplateau_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.indisponibiliteplateau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indisponibiliteplateau_id_seq OWNER TO ando;

--
-- Name: indisponibiliteplateau_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.indisponibiliteplateau_id_seq OWNED BY public.indisponibiliteplateau.id;


--
-- Name: listescene; Type: VIEW; Schema: public; Owner: ando
--

CREATE VIEW public.listescene AS
SELECT
    NULL::integer AS filmid,
    NULL::integer AS plateauid,
    NULL::character varying(255) AS plateau,
    NULL::integer AS sceneid,
    NULL::real AS duree,
    NULL::date AS dateplanification;


ALTER TABLE public.listescene OWNER TO ando;

--
-- Name: personnage; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.personnage (
    id integer NOT NULL,
    pseudo character varying(255),
    filmid integer NOT NULL,
    acteurid integer NOT NULL
);


ALTER TABLE public.personnage OWNER TO ando;

--
-- Name: personnage_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.personnage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnage_id_seq OWNER TO ando;

--
-- Name: personnage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.personnage_id_seq OWNED BY public.personnage.id;


--
-- Name: plateau; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.plateau (
    id integer NOT NULL,
    nom character varying(255)
);


ALTER TABLE public.plateau OWNER TO ando;

--
-- Name: plateau_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.plateau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plateau_id_seq OWNER TO ando;

--
-- Name: plateau_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.plateau_id_seq OWNED BY public.plateau.id;


--
-- Name: scene; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.scene (
    id integer NOT NULL,
    nom character varying(255),
    duree real,
    plateauid integer NOT NULL,
    filmid integer NOT NULL,
    auteurid integer,
    ordre integer,
    dateplanification date,
    status integer DEFAULT 0
);


ALTER TABLE public.scene OWNER TO ando;

--
-- Name: scene_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.scene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scene_id_seq OWNER TO ando;

--
-- Name: scene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.scene_id_seq OWNED BY public.scene.id;


--
-- Name: tournage; Type: TABLE; Schema: public; Owner: ando
--

CREATE TABLE public.tournage (
    id integer NOT NULL,
    acteurid integer,
    datetournage date,
    plateauid integer
);


ALTER TABLE public.tournage OWNER TO ando;

--
-- Name: tournage_id_seq; Type: SEQUENCE; Schema: public; Owner: ando
--

CREATE SEQUENCE public.tournage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tournage_id_seq OWNER TO ando;

--
-- Name: tournage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ando
--

ALTER SEQUENCE public.tournage_id_seq OWNED BY public.tournage.id;


--
-- Name: v_acteur_indispo_now; Type: VIEW; Schema: public; Owner: ando
--

CREATE VIEW public.v_acteur_indispo_now AS
 SELECT i.id,
    i.acteurid,
    i.date
   FROM public.indisponibiliteacteur i
  WHERE (i.date = date(now()));


ALTER TABLE public.v_acteur_indispo_now OWNER TO ando;

--
-- Name: v_plateau_indispo_now; Type: VIEW; Schema: public; Owner: ando
--

CREATE VIEW public.v_plateau_indispo_now AS
 SELECT i.id,
    i.plateauid,
    i.date
   FROM public.indisponibiliteplateau i
  WHERE (i.date = date(now()));


ALTER TABLE public.v_plateau_indispo_now OWNER TO ando;

--
-- Name: acteur id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.acteur ALTER COLUMN id SET DEFAULT nextval('public.acteur_id_seq'::regclass);


--
-- Name: auteur id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.auteur ALTER COLUMN id SET DEFAULT nextval('public.auteur_id_seq'::regclass);


--
-- Name: detailsscene id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.detailsscene ALTER COLUMN id SET DEFAULT nextval('public.detailsscene_id_seq'::regclass);


--
-- Name: expression id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.expression ALTER COLUMN id SET DEFAULT nextval('public.expression_id_seq'::regclass);


--
-- Name: film id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- Name: indisponibiliteacteur id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteacteur ALTER COLUMN id SET DEFAULT nextval('public.indisponibiliteacteur_id_seq'::regclass);


--
-- Name: indisponibiliteplateau id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteplateau ALTER COLUMN id SET DEFAULT nextval('public.indisponibiliteplateau_id_seq'::regclass);


--
-- Name: personnage id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.personnage ALTER COLUMN id SET DEFAULT nextval('public.personnage_id_seq'::regclass);


--
-- Name: plateau id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.plateau ALTER COLUMN id SET DEFAULT nextval('public.plateau_id_seq'::regclass);


--
-- Name: scene id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.scene ALTER COLUMN id SET DEFAULT nextval('public.scene_id_seq'::regclass);


--
-- Name: tournage id; Type: DEFAULT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.tournage ALTER COLUMN id SET DEFAULT nextval('public.tournage_id_seq'::regclass);


--
-- Data for Name: acteur; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.acteur (id, nom, prenom, datenaissance, sexe) FROM stdin;
1	Smith	Will	1968-09-25	M
2	Roberts	Julia	1967-10-28	F
3	DiCaprio	Leonardo	1974-11-11	M
4	Jolie	Angelina	1975-06-04	F
5	Damon	Matt	1970-10-08	M
6	Kidman	Nicole	1967-06-20	F
7	Hanks	Tom	1956-07-09	M
8	Streep	Meryl	1949-06-22	F
9	Depp	Johnny	1963-06-09	M
10	Lawrence	Jennifer	1990-08-15	F
\.


--
-- Data for Name: auteur; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.auteur (id, nom) FROM stdin;
1	Camus
2	Hemingway
3	Orwell
4	Dostoevsky
5	Tolstoy
6	Poe
7	Garcia Marquez
8	Borges
9	Nabokov
10	Kafka
11	Ando Mickaell
\.


--
-- Data for Name: detailsscene; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.detailsscene (id, action, texte, debut, fin, sceneid, expressionid, personnageid) FROM stdin;
1	sortir une arme	\N	0	2	1	9	8
2	regarder son adversaire	vien ici si tu ose	3	10	1	8	8
3	repondre a la provocation	j arrive	11	18	1	2	6
4	regarder le combat	arreter s il vous plait	19	25	4	3	4
5	coupe une main	tien	26	30	7	3	6
6	se coupe une main	argh	30	35	1	3	8
7	se precipite 	noonnnn	35	40	7	10	4
8	poser une question	pas encore reveiller	41	50	6	1	1
9	repondre a la question	comme tu le vois	51	60	6	2	2
10	poser une question	ou il est?	60	70	4	1	1
11	repondre a la question	je ne peut pas te le dire	71	80	4	4	2
\.


--
-- Data for Name: expression; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.expression (id, expression) FROM stdin;
1	Sourire
2	Rire
3	Grincer des dents
4	Froncer les sourcils
5	Cligner des yeux
6	Hausser les sourcils
7	Siffler
8	Tirer la langue
9	Faire un clin d oeil
10	Pleurer
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.film (id, nom) FROM stdin;
1	Le Parrain
2	Inception
3	Forrest Gump
4	La La Land
5	Le Seigneur des Anneaux
6	Fight Club
7	Le Silence des Agneaux
8	Interstellar
9	Les Evades
10	Titanic
\.


--
-- Data for Name: indisponibiliteacteur; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.indisponibiliteacteur (id, acteurid, date) FROM stdin;
1	1	2023-03-22
2	8	2023-03-01
3	1	2023-03-07
\.


--
-- Data for Name: indisponibiliteplateau; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.indisponibiliteplateau (id, plateauid, date) FROM stdin;
2	1	2022-05-05
3	1	2023-03-08
4	1	2023-04-02
1	1	2023-03-29
\.


--
-- Data for Name: personnage; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.personnage (id, pseudo, filmid, acteurid) FROM stdin;
1	Vito Corleone	1	1
2	Dom Cobb	2	1
3	Forrest Gump	3	1
4	Mia Dolan	4	2
5	Frodon Sacquet	5	3
6	Tyler Durden	6	4
7	Hannibal Lecter	7	4
8	Cooper	8	5
9	Andy Dufresne	9	6
10	Jack Dawson	10	7
\.


--
-- Data for Name: plateau; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.plateau (id, nom) FROM stdin;
1	Stage 24
2	Pinewood Studios
3	Cinecittà
4	Universal Studios Hollywood
5	Warner Bros. Studios
6	Shepperton Studios
7	Babelsberg Studio
8	Fox Studios Australia
9	Ealing Studios
10	The Burbank Studios
\.


--
-- Data for Name: scene; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.scene (id, nom, duree, plateauid, filmid, auteurid, ordre, dateplanification, status) FROM stdin;
1	course	15	8	8	1	\N	\N	\N
2	poursuite	30	5	8	1	\N	\N	\N
3	suspense	10	4	8	1	\N	\N	\N
7	trsitesse	10	4	8	1	\N	\N	\N
8	drame	15	8	1	1	\N	\N	\N
9	tragedie	30	5	1	1	\N	\N	\N
10	suspense	10	4	1	1	\N	\N	\N
11	trahison	5	9	1	1	\N	\N	\N
12	retrouvaille	20	3	1	1	\N	\N	\N
13	trsitesse	10	4	1	1	\N	\N	\N
14	course	150	8	2	1	\N	\N	\N
15	suspense	460	4	2	1	\N	\N	\N
16	mort	21	1	2	1	\N	\N	\N
6	combat	30	1	8	1	\N	2022-03-05	\N
5	retrouvaille	400	3	8	1	\N	2022-03-06	\N
4	trahison	25	9	8	1	\N	2022-03-05	\N
\.


--
-- Data for Name: tournage; Type: TABLE DATA; Schema: public; Owner: ando
--

COPY public.tournage (id, acteurid, datetournage, plateauid) FROM stdin;
\.


--
-- Name: acteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.acteur_id_seq', 10, true);


--
-- Name: auteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.auteur_id_seq', 11, true);


--
-- Name: detailsscene_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.detailsscene_id_seq', 18, true);


--
-- Name: expression_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.expression_id_seq', 10, true);


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.film_id_seq', 10, true);


--
-- Name: indisponibiliteacteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.indisponibiliteacteur_id_seq', 3, true);


--
-- Name: indisponibiliteplateau_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.indisponibiliteplateau_id_seq', 4, true);


--
-- Name: personnage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.personnage_id_seq', 10, true);


--
-- Name: plateau_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.plateau_id_seq', 10, true);


--
-- Name: scene_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.scene_id_seq', 16, true);


--
-- Name: tournage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ando
--

SELECT pg_catalog.setval('public.tournage_id_seq', 1, false);


--
-- Name: acteur acteur_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.acteur
    ADD CONSTRAINT acteur_pkey PRIMARY KEY (id);


--
-- Name: auteur auteur_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pkey PRIMARY KEY (id);


--
-- Name: detailsscene detailsscene_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.detailsscene
    ADD CONSTRAINT detailsscene_pkey PRIMARY KEY (id);


--
-- Name: expression expression_expression_key; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.expression
    ADD CONSTRAINT expression_expression_key UNIQUE (expression);


--
-- Name: expression expression_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.expression
    ADD CONSTRAINT expression_pkey PRIMARY KEY (id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: indisponibiliteacteur indisponibiliteacteur_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteacteur
    ADD CONSTRAINT indisponibiliteacteur_pkey PRIMARY KEY (id);


--
-- Name: indisponibiliteplateau indisponibiliteplateau_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteplateau
    ADD CONSTRAINT indisponibiliteplateau_pkey PRIMARY KEY (id);


--
-- Name: personnage personnage_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_pkey PRIMARY KEY (id);


--
-- Name: plateau plateau_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.plateau
    ADD CONSTRAINT plateau_pkey PRIMARY KEY (id);


--
-- Name: scene scene_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_pkey PRIMARY KEY (id);


--
-- Name: tournage tournage_pkey; Type: CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.tournage
    ADD CONSTRAINT tournage_pkey PRIMARY KEY (id);


--
-- Name: listescene _RETURN; Type: RULE; Schema: public; Owner: ando
--

CREATE OR REPLACE VIEW public.listescene AS
 SELECT s.filmid,
    p.id AS plateauid,
    p.nom AS plateau,
    s.id AS sceneid,
    s.duree,
    s.dateplanification
   FROM (public.scene s
     JOIN public.plateau p ON ((p.id = s.plateauid)))
  GROUP BY p.id, p.nom, s.id, s.filmid;


--
-- Name: detailsscene detailsscene_expressionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.detailsscene
    ADD CONSTRAINT detailsscene_expressionid_fkey FOREIGN KEY (expressionid) REFERENCES public.expression(id);


--
-- Name: detailsscene detailsscene_personnageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.detailsscene
    ADD CONSTRAINT detailsscene_personnageid_fkey FOREIGN KEY (personnageid) REFERENCES public.personnage(id);


--
-- Name: detailsscene detailsscene_sceneid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.detailsscene
    ADD CONSTRAINT detailsscene_sceneid_fkey FOREIGN KEY (sceneid) REFERENCES public.scene(id);


--
-- Name: indisponibiliteacteur indisponibiliteacteur_acteurid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteacteur
    ADD CONSTRAINT indisponibiliteacteur_acteurid_fkey FOREIGN KEY (acteurid) REFERENCES public.acteur(id);


--
-- Name: indisponibiliteplateau indisponibiliteplateau_plateauid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.indisponibiliteplateau
    ADD CONSTRAINT indisponibiliteplateau_plateauid_fkey FOREIGN KEY (plateauid) REFERENCES public.plateau(id);


--
-- Name: personnage personnage_acteurid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_acteurid_fkey FOREIGN KEY (acteurid) REFERENCES public.acteur(id);


--
-- Name: personnage personnage_filmid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_filmid_fkey FOREIGN KEY (filmid) REFERENCES public.film(id);


--
-- Name: scene scene_auteurid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_auteurid_fkey FOREIGN KEY (auteurid) REFERENCES public.auteur(id);


--
-- Name: scene scene_filmid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_filmid_fkey FOREIGN KEY (filmid) REFERENCES public.film(id);


--
-- Name: scene scene_plateauid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.scene
    ADD CONSTRAINT scene_plateauid_fkey FOREIGN KEY (plateauid) REFERENCES public.plateau(id);


--
-- Name: tournage tournage_acteurid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.tournage
    ADD CONSTRAINT tournage_acteurid_fkey FOREIGN KEY (acteurid) REFERENCES public.acteur(id);


--
-- Name: tournage tournage_plateauid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ando
--

ALTER TABLE ONLY public.tournage
    ADD CONSTRAINT tournage_plateauid_fkey FOREIGN KEY (plateauid) REFERENCES public.plateau(id);


--
-- PostgreSQL database dump complete
--


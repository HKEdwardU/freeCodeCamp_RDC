--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_log; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_log (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    num_of_guess integer,
    ans_number integer NOT NULL
);


ALTER TABLE public.game_log OWNER TO freecodecamp;

--
-- Name: game_log_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_log_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_log_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_log_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_log_game_id_seq OWNED BY public.game_log.game_id;


--
-- Name: user_list; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_list (
    user_id integer NOT NULL,
    user_name character varying(22)
);


ALTER TABLE public.user_list OWNER TO freecodecamp;

--
-- Name: user_list_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_list_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_list_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_list_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_list_user_id_seq OWNED BY public.user_list.user_id;


--
-- Name: game_log game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_log ALTER COLUMN game_id SET DEFAULT nextval('public.game_log_game_id_seq'::regclass);


--
-- Name: user_list user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_list ALTER COLUMN user_id SET DEFAULT nextval('public.user_list_user_id_seq'::regclass);


--
-- Data for Name: game_log; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_log VALUES (1, 1, 5, 453);
INSERT INTO public.game_log VALUES (2, 10, NULL, 140);
INSERT INTO public.game_log VALUES (3, 11, NULL, 34);
INSERT INTO public.game_log VALUES (4, 11, NULL, 744);
INSERT INTO public.game_log VALUES (5, 12, NULL, 311);
INSERT INTO public.game_log VALUES (6, 12, NULL, 767);
INSERT INTO public.game_log VALUES (7, 11, NULL, 243);
INSERT INTO public.game_log VALUES (8, 11, NULL, 335);
INSERT INTO public.game_log VALUES (9, 11, NULL, 445);
INSERT INTO public.game_log VALUES (10, 10, NULL, 767);
INSERT INTO public.game_log VALUES (11, 10, NULL, 239);
INSERT INTO public.game_log VALUES (12, 10, NULL, 215);
INSERT INTO public.game_log VALUES (13, 10, NULL, 837);
INSERT INTO public.game_log VALUES (14, 13, NULL, 426);
INSERT INTO public.game_log VALUES (15, 13, NULL, 845);
INSERT INTO public.game_log VALUES (16, 14, NULL, 902);
INSERT INTO public.game_log VALUES (17, 14, NULL, 66);
INSERT INTO public.game_log VALUES (18, 13, NULL, 226);
INSERT INTO public.game_log VALUES (19, 13, NULL, 501);
INSERT INTO public.game_log VALUES (20, 13, NULL, 735);
INSERT INTO public.game_log VALUES (21, 15, NULL, 685);
INSERT INTO public.game_log VALUES (22, 15, 2, 935);
INSERT INTO public.game_log VALUES (23, 16, 716, 715);
INSERT INTO public.game_log VALUES (24, 16, 474, 473);
INSERT INTO public.game_log VALUES (25, 17, 740, 739);
INSERT INTO public.game_log VALUES (26, 17, 777, 776);
INSERT INTO public.game_log VALUES (27, 16, 2, 917);
INSERT INTO public.game_log VALUES (28, 16, 629, 627);
INSERT INTO public.game_log VALUES (29, 16, 536, 535);
INSERT INTO public.game_log VALUES (30, 18, 106, 105);
INSERT INTO public.game_log VALUES (31, 18, 614, 613);
INSERT INTO public.game_log VALUES (32, 19, 639, 638);
INSERT INTO public.game_log VALUES (33, 19, 451, 450);
INSERT INTO public.game_log VALUES (34, 18, 2, 425);
INSERT INTO public.game_log VALUES (35, 18, 57, 55);
INSERT INTO public.game_log VALUES (36, 18, 166, 165);


--
-- Data for Name: user_list; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_list VALUES (1, 'Tester');
INSERT INTO public.user_list VALUES (2, 'user_1744604036278');
INSERT INTO public.user_list VALUES (3, 'user_1744604036277');
INSERT INTO public.user_list VALUES (4, 'Tester2');
INSERT INTO public.user_list VALUES (5, 'user_1744604145572');
INSERT INTO public.user_list VALUES (6, 'user_1744604145571');
INSERT INTO public.user_list VALUES (7, 'Tester3');
INSERT INTO public.user_list VALUES (8, 'user_1744604187184');
INSERT INTO public.user_list VALUES (9, 'user_1744604187183');
INSERT INTO public.user_list VALUES (10, 'Tester1');
INSERT INTO public.user_list VALUES (11, 'user_1744616815494');
INSERT INTO public.user_list VALUES (12, 'user_1744616815493');
INSERT INTO public.user_list VALUES (13, 'user_1744617817944');
INSERT INTO public.user_list VALUES (14, 'user_1744617817943');
INSERT INTO public.user_list VALUES (15, 'EDU');
INSERT INTO public.user_list VALUES (16, 'user_1744619098432');
INSERT INTO public.user_list VALUES (17, 'user_1744619098431');
INSERT INTO public.user_list VALUES (18, 'user_1744619123104');
INSERT INTO public.user_list VALUES (19, 'user_1744619123103');


--
-- Name: game_log_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_log_game_id_seq', 36, true);


--
-- Name: user_list_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_list_user_id_seq', 19, true);


--
-- Name: game_log game_log_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_log
    ADD CONSTRAINT game_log_pkey PRIMARY KEY (game_id);


--
-- Name: user_list user_list_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_list
    ADD CONSTRAINT user_list_pkey PRIMARY KEY (user_id);


--
-- Name: game_log game_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_log
    ADD CONSTRAINT game_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_list(user_id);


--
-- PostgreSQL database dump complete
--


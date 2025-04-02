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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type text,
    is_spherical boolean,
    distance_from_earth_inly numeric(7,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying NOT NULL,
    reached_by_man boolean NOT NULL,
    year_of_reach text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying NOT NULL,
    description text,
    has_life boolean NOT NULL,
    population_in_m integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    mission_codename text NOT NULL,
    moon_id integer,
    planet_id integer,
    year_of_landing text NOT NULL,
    num_of_spaceman integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying NOT NULL,
    star_type text,
    distance_from_earth_inly numeric(7,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy A', 'Type A', true, 84.20);
INSERT INTO public.galaxy VALUES (2, 'Galaxy B', 'Type B', false, 24.50);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'barred spiral', true, 0.00);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', false, 14.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy (M51)', 'Spiral', true, 23.70);
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'Spiral', false, 25850.00);
INSERT INTO public.galaxy VALUES (7, 'UEE', 'Type A', true, 99999.99);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 2, 'Moon', true, '1969');
INSERT INTO public.moon VALUES (2, 3, 'Io', true, '1979');
INSERT INTO public.moon VALUES (3, 4, 'Titan', true, '2005');
INSERT INTO public.moon VALUES (4, 4, 'Rhea', false, NULL);
INSERT INTO public.moon VALUES (5, 4, 'Dione', false, NULL);
INSERT INTO public.moon VALUES (7, 5, 'Dwarf Moon 1', false, NULL);
INSERT INTO public.moon VALUES (8, 6, 'Exo-Moon A', false, NULL);
INSERT INTO public.moon VALUES (9, 7, 'Selene Prime', true, '2242');
INSERT INTO public.moon VALUES (10, 7, 'Helios Minor', false, NULL);
INSERT INTO public.moon VALUES (11, 7, 'Titanus', false, NULL);
INSERT INTO public.moon VALUES (12, 7, 'Luminara', false, NULL);
INSERT INTO public.moon VALUES (13, 8, 'Deserto', true, '2305');
INSERT INTO public.moon VALUES (14, 8, 'Sirocco', false, NULL);
INSERT INTO public.moon VALUES (15, 8, 'Arido', true, '2310');
INSERT INTO public.moon VALUES (16, 8, 'Xanadu', false, NULL);
INSERT INTO public.moon VALUES (17, 9, 'Aeris', true, '2298');
INSERT INTO public.moon VALUES (18, 9, 'Zephyros', false, NULL);
INSERT INTO public.moon VALUES (19, 9, 'Cyclone', true, '2302');
INSERT INTO public.moon VALUES (20, 9, 'Nimbus', false, NULL);
INSERT INTO public.moon VALUES (21, 10, 'Ita', true, '2801');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Planet A', 'Planet A', false, NULL);
INSERT INTO public.planet VALUES (2, 5, 'Earth', 'The planet we call home.', true, 700);
INSERT INTO public.planet VALUES (3, 5, 'Juptier', 'The fifth planet from the Sun', false, NULL);
INSERT INTO public.planet VALUES (4, 5, 'Saturn', 'The sixth planet from the Sun, known for its beautiful rings and many moons.', false, NULL);
INSERT INTO public.planet VALUES (5, 6, 'Proxima b (hypothetical)', 'Potentially habitable exoplanet', false, NULL);
INSERT INTO public.planet VALUES (6, 7, 'M51- planetary system 1', 'Exoplanetary system with multiple planets', false, NULL);
INSERT INTO public.planet VALUES (7, 8, 'Aethelgard', 'Temperate planet with expansive oceans and large continents. Shows signs of unusual geological activity.', true, 500);
INSERT INTO public.planet VALUES (8, 9, 'Xylos', 'Desert planet with evidence of ancient river systems and potential subsurface water.', false, NULL);
INSERT INTO public.planet VALUES (9, 10, 'Aerilon', 'Rocky planet with a thin atmosphere, showing signs of past volcanic activity.', false, NULL);
INSERT INTO public.planet VALUES (10, 11, 'Hurston', 'Base of Hurston"s company', true, 1);
INSERT INTO public.planet VALUES (11, 11, 'Crusader', 'Base of Crusader Corp', true, 1);
INSERT INTO public.planet VALUES (12, 11, 'Arccorp', 'Base of Arccorp', true, 1);
INSERT INTO public.planet VALUES (13, 11, 'Microtech', 'Base of Microtech', true, 1);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Eagle', 1, 2, '1969', 3, 'Apollo 11');
INSERT INTO public.spacecraft VALUES (2, 'Voyager Program', 2, 3, '1979', 0, 'Voyager 2');
INSERT INTO public.spacecraft VALUES (3, 'Saturn Tour', 3, 4, '2004', 0, 'Cassini-Huygens');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Star A', 'Type A', 88.70);
INSERT INTO public.star VALUES (2, 1, 'Star B', 'Type A', 82.60);
INSERT INTO public.star VALUES (3, 2, 'Star C', 'Type B', 25.00);
INSERT INTO public.star VALUES (4, 2, 'Star d', 'Type C', 26.10);
INSERT INTO public.star VALUES (5, 3, 'Sun', 'G-type main sequence', 0.00);
INSERT INTO public.star VALUES (6, 4, 'Alpha Centauri A', 'K-type Main Sequence', 4.37);
INSERT INTO public.star VALUES (7, 5, 'NGC 5772', 'O-type Supergiant', NULL);
INSERT INTO public.star VALUES (8, 1, 'Althea Prime', 'G2V', 25850.00);
INSERT INTO public.star VALUES (9, 1, 'Lyra-7', 'K1V', 25850.00);
INSERT INTO public.star VALUES (10, 1, 'Volturna', 'F5V', 25850.00);
INSERT INTO public.star VALUES (11, 7, 'Stanton', 'G-type main sequence', 99999.99);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_seq', 13, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_fkey_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fkey_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fkey_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fkey_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: spacecraft spacecraft_fkey_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_fkey_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: spacecraft spacecraft_fkey_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_fkey_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


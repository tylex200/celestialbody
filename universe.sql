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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    discovery_year integer,
    orbit_period_in_years integer,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(55),
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2),
    size_in_light_years integer,
    distance_to_earth_in_ly numeric(10,4),
    number_of_stars character varying(30)
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
    name character varying(60) NOT NULL,
    type character varying(60),
    diameter integer,
    orbital_period_days numeric(10,3),
    planet_id integer
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
    name character varying(60) NOT NULL,
    type character varying(55),
    has_ring_system boolean,
    diameter_km integer,
    orbital_period_days integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_type character varying(60),
    is_visible boolean,
    age_in_millions_of_years integer,
    size character varying(60),
    distance_from_earth integer,
    constellation text,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, 75, 'Ice,dust');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1995, 2533, 'Ice,gas');
INSERT INTO public.comet VALUES (3, 'Encke', 1786, 3, 'Ice,rock');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', false, 13.61, 100000, NULL, '100-400 Billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', false, 10.00, 220000, 2.5000, '1 Trillion');
INSERT INTO public.galaxy VALUES (3, 'UGC 2885', 'Spiral', false, 13.00, 832000, 232.0000, '1 Trillion+');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', false, 10.00, 60000, 2.7300, '40 Billion');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', false, 13.00, 50000, 28.0000, '100 Billion');
INSERT INTO public.galaxy VALUES (6, 'Whirpool', 'Spiral', false, 400.00, 76000, 31.0000, '100 Billion');
INSERT INTO public.galaxy VALUES (7, 'Bode''s Galaxy', 'Spiral', false, 13.00, 90000, 12.0000, '250 Billion');
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 'Spiral', false, 13.00, 37000, 12.0000, '30 Billion');
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'Ring', false, 500.00, 150000, 500.0000, 'unknown');
INSERT INTO public.galaxy VALUES (10, 'NGC 1300', 'Spiral', false, 10.00, 110000, 61.0000, '100 Billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rocky', 3474, 27.300, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rocky', 22, 0.300, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocky', 12, 1.300, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Icy/Rocky', 5268, 7.150, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Icy/Rocky', 4821, 16.700, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Volcanic', 3643, 1.770, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Icy', 3122, 3.550, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Icy/Rocky', 5151, 15.950, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy', 504, 1.370, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Icy', 396, 0.940, 6);
INSERT INTO public.moon VALUES (11, 'Lapetus', 'Icy', 1469, 79.300, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 'Icy', 2710, -5.900, 8);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Rocky', 340, 360.100, 8);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Icy/Rocky', 1523, 13.500, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'Icy/Rocky', 1578, 8.700, 7);
INSERT INTO public.moon VALUES (16, 'Charon', 'Rocky', 1212, 6.390, 9);
INSERT INTO public.moon VALUES (17, 'Styx', 'Rocky', 16, 20.200, 9);
INSERT INTO public.moon VALUES (18, 'Haumea I', 'Icy', 400, 50.000, 11);
INSERT INTO public.moon VALUES (19, 'Haumea II', 'Icy', 200, 20.000, 11);
INSERT INTO public.moon VALUES (20, 'Eris I', 'Icy', 700, 15.800, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, 4880, 88, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, 12104, 225, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', false, 12742, 365, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', false, 6779, 687, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', true, 139820, 4333, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', true, 116460, 10759, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', true, 50724, 30687, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', true, 49244, 60190, 6);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', false, 2377, 90560, 4);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet', false, 2326, 557000, 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf planet', false, 1632, 284000, 3);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf planet', false, 1430, 309000, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Main sequence', true, 5000, 'Medium', 4, 'Centaurus', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Supergiant', true, 800, 'Very Large', 642, 'Orion', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf', true, 4500, 'SMALL', 4, 'Centaurus', 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Supergiant', true, 800, 'Very large', 860, 'Orion', 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Main sequence', true, 450, 'Medium', 25, 'Lyra', 1);
INSERT INTO public.star VALUES (1, 'Sirius', 'Main sequence', true, 120, 'Large', 9, 'Canis Major', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key1 UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_close_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_close_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


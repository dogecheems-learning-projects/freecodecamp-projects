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
-- Name: galactic_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galactic_event (
    event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    event_type character varying(50) NOT NULL,
    magnitude numeric(5,2) NOT NULL,
    recorded_year bigint NOT NULL
);


ALTER TABLE public.galactic_event OWNER TO freecodecamp;

--
-- Name: galactic_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galactic_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galactic_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: galactic_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galactic_event_event_id_seq OWNED BY public.galactic_event.event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    distance_from_earth_in_light_years numeric(20,2) NOT NULL,
    has_life boolean DEFAULT false
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    has_atmosphere boolean DEFAULT false,
    orbital_period numeric(6,2) NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    has_life boolean DEFAULT false,
    mass_relative_to_earth numeric(10,2) NOT NULL,
    has_rings boolean DEFAULT false
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
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean DEFAULT true,
    mass_in_solar_units numeric(10,2) NOT NULL
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
-- Name: galactic_event event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_event ALTER COLUMN event_id SET DEFAULT nextval('public.galactic_event_event_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galactic_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galactic_event VALUES (1, 'SN 1987A', 1, 'Supernova', 18.00, 1987);
INSERT INTO public.galactic_event VALUES (2, 'Sagittarius A* Flare', 1, 'Black Hole Flare', 25.30, 2019);
INSERT INTO public.galactic_event VALUES (3, 'Andromeda Collision Prediction', 2, 'Future Collision', 99.90, 4000000000);
INSERT INTO public.galactic_event VALUES (4, 'Triangulum Starburst', 3, 'Star Formation Burst', 30.50, 2021);
INSERT INTO public.galactic_event VALUES (5, 'M87 Black Hole Imaging', 5, 'Black Hole Event', 50.00, 2019);
INSERT INTO public.galactic_event VALUES (6, 'Large Magellanic Collision Forecast', 6, 'Future Collision', 99.90, 2000000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy', 2540000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Part of the local group', 2730000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 'Has a bright nucleus', 28000000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'Famous interacting galaxy', 23160000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic', 'Irregular', 'A satellite of the Milky Way', 163000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true, 15.95);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, true, 1.37);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, false, 0.94);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2706, true, -5.88);
INSERT INTO public.moon VALUES (12, 'Proteus', 8, 420, false, 1.12);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 1522, false, 13.46);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 471, false, 1.41);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1158, false, 2.52);
INSERT INTO public.moon VALUES (16, 'Charon', 9, 1212, false, 6.39);
INSERT INTO public.moon VALUES (17, 'Styx', 9, 16, false, 20.00);
INSERT INTO public.moon VALUES (18, 'Nix', 9, 49, false, 25.00);
INSERT INTO public.moon VALUES (19, 'Hydra', 9, 65, false, 38.20);
INSERT INTO public.moon VALUES (20, 'Kepler-1625b I', 10, 3071, NULL, 287.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, 1.00, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, 0.11, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false, 0.82, false);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 'Terrestrial', false, 0.06, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, 317.80, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, 95.16, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, 14.54, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, 17.15, true);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Exoplanet', NULL, 2.40, NULL);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 2, 'Hot Jupiter', false, 0.69, false);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 2, 'Gas Giant', false, 1.39, false);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 4, 'Exoplanet', NULL, 1.50, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Main Sequence', 4600, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Main Sequence', 200, true, 2.02);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 9, true, 11.60);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 4850, true, 0.12);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Main Sequence', 455, true, 2.15);
INSERT INTO public.star VALUES (6, 'Alpha Cenaturi A', 1, 'Main Sequence', 6000, true, 1.10);


--
-- Name: galactic_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galactic_event_event_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galactic_event galactic_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_event
    ADD CONSTRAINT galactic_event_name_key UNIQUE (name);


--
-- Name: galactic_event galactic_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_event
    ADD CONSTRAINT galactic_event_pkey PRIMARY KEY (event_id);


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
-- Name: galactic_event galactic_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galactic_event
    ADD CONSTRAINT galactic_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


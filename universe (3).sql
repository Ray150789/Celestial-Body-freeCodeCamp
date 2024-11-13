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
    name character varying(30),
    type_of_galaxy character varying(30) NOT NULL,
    description text NOT NULL,
    size_in_lightyears integer
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
-- Name: matter; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.matter (
    phase character varying(30),
    gravitational_constant numeric,
    environment character varying(30)
);


ALTER TABLE public.matter OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit_planet character varying(30),
    orbit_distance_in_km numeric(30,2),
    radius_in_km numeric(30,2) NOT NULL
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
    name character varying(30),
    has_life boolean NOT NULL,
    galaxy_located character varying(30) NOT NULL,
    diameter_in_km numeric,
    no_of_moons integer
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
    name character varying(30),
    galaxy_located character varying(30) NOT NULL,
    magnitude numeric(15,2),
    star_type character varying(15) NOT NULL
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'A spiral galaxy with a flat, spinning disk and central bulge', 87400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'It has a barred spiral structure, with a central orange-white ball of older stars, and blue-white rings of hot, young stars. Dark blue-gray lanes show where new stars are forming', 152000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 'Has a high star formation rate, with many sites of rapid star birth, Includes a bright blue patch called NGC 604, which is one of the largest stellar nurseries in the Local Group ', 60000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 'A supermassive black hole at its core, luminous jet of plasma that originates from the core', 132000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Spiral', 'Star-forming regions, glowing nebulae, an off-centered bar, and a single spiral arm', 32500);
INSERT INTO public.galaxy VALUES (6, 'Abell 1576 BCG', 'Elliptical', 'Brightest Cluster Galaxy is supergiant', 1077000);


--
-- Data for Name: matter; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.matter VALUES ('gas', NULL, NULL);
INSERT INTO public.matter VALUES ('liquid', NULL, NULL);
INSERT INTO public.matter VALUES ('solid', NULL, NULL);
INSERT INTO public.matter VALUES (NULL, 1, 'STORMY');
INSERT INTO public.matter VALUES (NULL, 25, 'VOLCANO');
INSERT INTO public.matter VALUES (NULL, 100, 'BLIZZARD');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Deimos', 'Mars', 23458.00, 7.50);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 9378.00, 13.30);
INSERT INTO public.moon VALUES (4, 'Amalthea', 'Jupiter', 181000.00, 5125768.00);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Jupiter', 1883000.00, 2400.00);
INSERT INTO public.moon VALUES (6, 'Europa', 'Jupiter', 671000.00, 1565.00);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Jupiter', 1070000.00, 2735.00);
INSERT INTO public.moon VALUES (8, 'IO', 'Jupiter', 422000.00, 1820.00);
INSERT INTO public.moon VALUES (9, 'Dione', 'Saturn', 377400.00, 560.00);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn', 238020.00, 250.00);
INSERT INTO public.moon VALUES (11, 'Hyperion', 'Saturn', 1481100.00, 11655000.00);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Saturn', 3561300.00, 718.00);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Saturn', 185539.00, 199.00);
INSERT INTO public.moon VALUES (14, 'Pheobe', 'Saturn', 12952000.00, 105.00);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Saturn', 527040.00, 764.00);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Saturn', 294660.00, 533.00);
INSERT INTO public.moon VALUES (17, 'Titan', 'Saturn', 1221850.00, 2575.00);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Uranus', 190900.00, 580.00);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Uranus', 129800.00, 235.00);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Uranus', 582600.00, 761.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Milky Way', 4875, 0);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Milky Way', 12104, 0);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Milky Way', 12742, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Milky Way', 6779, 2);
INSERT INTO public.planet VALUES (5, 'Ceres', false, 'Milky Way', 946, 0);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 'Milky Way', 139820, 95);
INSERT INTO public.planet VALUES (7, 'Saturn', false, 'Milky Way', 116460, 146);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 'Milky Way', 50724, 28);
INSERT INTO public.planet VALUES (9, 'Neptune', false, 'Milky Way', 49224, 16);
INSERT INTO public.planet VALUES (10, 'Pluto', false, 'Milky Way', 2374, 5);
INSERT INTO public.planet VALUES (11, 'Charon', false, 'Milky Way', 1212, 0);
INSERT INTO public.planet VALUES (12, '2003 UB313', false, 'Milky Way', 2326, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Milky Way', 1.46, 'binary');
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Andromeda', 0.31, 'spectro binary');
INSERT INTO public.star VALUES (3, 'Beta Trianguli', 'Triangulum Galaxy', 3.00, 'giant star');
INSERT INTO public.star VALUES (4, 'Spica', 'Messier 87', 3.55, 'binary');
INSERT INTO public.star VALUES (5, 'S Doradus', 'Large Magellanic Cloud', 9.57, 'variable');
INSERT INTO public.star VALUES (6, 'Cluster', 'Abell 1576 BCG', 0.00, 'Cluster');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT description UNIQUE (name);


--
-- Name: planet diameter_in_km; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT diameter_in_km UNIQUE (diameter_in_km);


--
-- Name: star galaxy_located; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_located UNIQUE (name);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: star star_galaxy_located_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_located_key UNIQUE (galaxy_located);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_orbit_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbit_planet_fkey FOREIGN KEY (orbit_planet) REFERENCES public.planet(name);


--
-- Name: planet planet_galaxy_located_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_located_fkey FOREIGN KEY (galaxy_located) REFERENCES public.star(galaxy_located);


--
-- Name: star star_galaxy_located_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_located_fkey FOREIGN KEY (galaxy_located) REFERENCES public.galaxy(name);


--
-- PostgreSQL database dump complete
--


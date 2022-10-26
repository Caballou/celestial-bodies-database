--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text,
    star_id integer,
    element character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text,
    constellation_id integer,
    naked_eye_visible boolean
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
    year_discovered integer,
    planet_id integer,
    name character varying(30) NOT NULL,
    diameter_in_km integer
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
    name character varying(30) NOT NULL,
    sun_distance_in_au numeric(3,1),
    planet_id integer NOT NULL,
    has_moon boolean,
    star_id integer,
    orbital_period_in_years numeric(5,2)
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    apparent_magnitude numeric(4,2),
    distance_in_light_years numeric(5,2)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 'Aries', 'Ram', NULL, 'Fire');
INSERT INTO public.constellation VALUES (5, 'Leo', 'Lion', NULL, 'Fire');
INSERT INTO public.constellation VALUES (6, 'Sagittarius', 'Archer', NULL, 'Fire');
INSERT INTO public.constellation VALUES (3, 'Capricornius', 'Sea Goat', NULL, 'Earth');
INSERT INTO public.constellation VALUES (7, 'Taurus', 'Bull', NULL, 'Earth');
INSERT INTO public.constellation VALUES (8, 'Virgo', 'Virgin or maiden', NULL, 'Earth');
INSERT INTO public.constellation VALUES (4, 'Gemini', 'Pair of twins', NULL, 'Air');
INSERT INTO public.constellation VALUES (1, 'Aquarius', 'Water-bearer', NULL, 'Air');
INSERT INTO public.constellation VALUES (10, 'Coma Berenices', 'Berenice''s Hair', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Black Eye Galaxy', 'It looks like an eye with dark stripe', 10, false);
INSERT INTO public.galaxy VALUES (2, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', 10, false);
INSERT INTO public.galaxy VALUES (3, 'Malin 1', 'Named after its discoverer, David Malin', 10, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Loos like a sombrero', 8, false);
INSERT INTO public.galaxy VALUES (4, 'Butterfly Galaxies', 'Binary galaxies. It looks like a pair of butterflies', 8, false);
INSERT INTO public.galaxy VALUES (6, 'Needle Galaxy', 'Named because of its thin appearance', 10, false);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'The appearance from Earth of the galaxy--a band of light', 6, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 3, 'Moon', 3476);
INSERT INTO public.moon VALUES (2, 1877, 4, 'Phobos', 23);
INSERT INTO public.moon VALUES (3, 1877, 4, 'Deimos', 13);
INSERT INTO public.moon VALUES (4, 1610, 5, 'Io', 3630);
INSERT INTO public.moon VALUES (5, 1610, 5, 'Europa', 3138);
INSERT INTO public.moon VALUES (7, 1610, 5, 'Callistro', 4800);
INSERT INTO public.moon VALUES (8, 1892, 5, 'Amalthea', 200);
INSERT INTO public.moon VALUES (9, 1904, 5, 'Himalia', 170);
INSERT INTO public.moon VALUES (10, 1979, 5, 'Thebe', 90);
INSERT INTO public.moon VALUES (11, 1789, 6, 'Mimas', 394);
INSERT INTO public.moon VALUES (12, 1789, 6, 'Enceladus', 502);
INSERT INTO public.moon VALUES (13, 1684, 6, 'Tethys', 1048);
INSERT INTO public.moon VALUES (14, 1684, 6, 'Dione', 1120);
INSERT INTO public.moon VALUES (15, 1672, 6, 'Rhea', 1530);
INSERT INTO public.moon VALUES (16, 1655, 6, 'Titan', 5150);
INSERT INTO public.moon VALUES (17, 1848, 6, 'Hyperion', 270);
INSERT INTO public.moon VALUES (18, 1671, 6, 'Iapetus', 1435);
INSERT INTO public.moon VALUES (19, 1899, 6, 'Phoebe', 220);
INSERT INTO public.moon VALUES (20, 2000, 6, 'Paaliaq', 25);
INSERT INTO public.moon VALUES (6, 1610, 5, 'Ganymede', 5265);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 0.4, 1, false, 4, 0.24);
INSERT INTO public.planet VALUES ('Venus', 0.7, 2, false, 6, 0.62);
INSERT INTO public.planet VALUES ('Earth', 1.0, 3, true, 7, 1.00);
INSERT INTO public.planet VALUES ('Mars', 1.5, 4, true, 8, 1.88);
INSERT INTO public.planet VALUES ('Jupiter', 5.2, 5, true, 9, 11.86);
INSERT INTO public.planet VALUES ('Saturn', 9.5, 6, true, 10, 29.45);
INSERT INTO public.planet VALUES ('Uranus', 19.8, 7, true, 1, 84.02);
INSERT INTO public.planet VALUES ('Neptune', 30.1, 8, true, 11, 164.79);
INSERT INTO public.planet VALUES ('Ceres', 2.8, 9, false, 6, 4.60);
INSERT INTO public.planet VALUES ('Orcus', 39.0, 10, true, 3, 247.50);
INSERT INTO public.planet VALUES ('Pluto', 39.0, 11, true, 3, 247.90);
INSERT INTO public.planet VALUES ('Haumea', 42.0, 12, true, 12, 283.80);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Hamal', 7, 2.00, 66.00);
INSERT INTO public.star VALUES (2, 'Enif', 7, 2.40, 688.20);
INSERT INTO public.star VALUES (3, 'Kaus Australis', 7, 1.85, 143.20);
INSERT INTO public.star VALUES (4, 'Spica', 7, 0.97, 260.90);
INSERT INTO public.star VALUES (5, 'Rasalhague', 7, 2.07, 48.60);
INSERT INTO public.star VALUES (6, 'Regulus', 7, 1.39, 77.00);
INSERT INTO public.star VALUES (7, 'Rigil Kentaurus', 7, -0.27, 4.36);
INSERT INTO public.star VALUES (8, 'Aldebaran', 7, 0.86, 66.23);
INSERT INTO public.star VALUES (9, 'Diphda', 7, 2.02, 96.22);
INSERT INTO public.star VALUES (10, 'Deneb Algedi', 7, 1.25, 39.00);
INSERT INTO public.star VALUES (11, 'Sadalsuud', 7, 2.90, 612.00);
INSERT INTO public.star VALUES (12, 'Arcturus', 7, -0.05, 37.00);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_mil numeric(15,2) NOT NULL,
    distance_from_earth_mil numeric(15,2) NOT NULL,
    galaxy_types_id integer NOT NULL,
    number_of_star integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    distance_from_earth_km numeric(15,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    "exists" boolean,
    spherical boolean,
    planet_types_id integer NOT NULL,
    star_id integer,
    number_of_moons integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    number_of_planets integer DEFAULT 0
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 540.50, 160.00, 2, 0);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 54.60, 160.00, 1, 0);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic', 660.00, 200.00, 3, 0);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 30.40, 770.00, 4, 0);
INSERT INTO public.galaxy VALUES (5, 'triangulum Galaxy', 50.70, 890.00, 5, 0);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 60.80, 40.20, 6, 0);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', NULL);
INSERT INTO public.galaxy_types VALUES (4, 'ESO 325-G004', NULL);
INSERT INTO public.galaxy_types VALUES (5, 'M101', NULL);
INSERT INTO public.galaxy_types VALUES (6, 'MGC 1965', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, 0.00);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, 0.00);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, 0.00);
INSERT INTO public.moon VALUES (4, 'Amalthea', NULL, 4, 0.00);
INSERT INTO public.moon VALUES (5, 'Io', NULL, 4, 0.00);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (8, 'Callisto', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (10, 'Pan', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (11, 'Atlas', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (12, 'Prometheus', NULL, 5, 0.00);
INSERT INTO public.moon VALUES (13, 'Enceladus', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (14, 'Tethys', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (15, 'Dione', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (16, 'Rhea', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (17, 'Titan', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (18, 'Hyperion', NULL, 6, 0.00);
INSERT INTO public.moon VALUES (19, 'Umbriel', NULL, 7, 0.00);
INSERT INTO public.moon VALUES (20, 'Titania', NULL, 7, 0.00);
INSERT INTO public.moon VALUES (21, 'Triton', NULL, 8, 0.00);
INSERT INTO public.moon VALUES (22, 'Kerberos', NULL, 2, 0.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 1, 2, 0);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 2, 2, 0);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 4, 2, 0);
INSERT INTO public.planet VALUES (4, 'Mars', false, false, 5, 2, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 7, 3, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 7, 3, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', false, false, 6, 3, 0);
INSERT INTO public.planet VALUES (8, 'Neptune', false, false, 6, 3, 0);
INSERT INTO public.planet VALUES (9, '14 Andromedae b', false, false, 3, 6, 0);
INSERT INTO public.planet VALUES (10, '18 Belhini b', false, false, 3, 6, 0);
INSERT INTO public.planet VALUES (11, '42 Draconis b', false, false, 4, 6, 0);
INSERT INTO public.planet VALUES (12, '47 Ursae Majoris b', false, false, 2, 6, 0);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Circumbinary Planet', 'An exoplanet that orbits two stars');
INSERT INTO public.planet_types VALUES (2, 'Double Planet', 'Two planetary-mass objects orbiting eachother');
INSERT INTO public.planet_types VALUES (3, 'Eccentric Jupiter', 'A gas gaint that orbits its star in an eccentric orbit');
INSERT INTO public.planet_types VALUES (4, 'Exoplanet', 'A planet that does not orbit the Sun');
INSERT INTO public.planet_types VALUES (5, 'Extragalactic Planet', 'An exoplanet outside the Milky Way');
INSERT INTO public.planet_types VALUES (6, 'Goldilocks Planet', 'A planet that is neither hot nor cold');
INSERT INTO public.planet_types VALUES (7, 'Hot Jupiter', 'A planet with same characteristics as Jupiter');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', NULL, 1, 0);
INSERT INTO public.star VALUES (2, 'Eridanus', NULL, 2, 0);
INSERT INTO public.star VALUES (3, 'Cassiopeia', NULL, 3, 0);
INSERT INTO public.star VALUES (4, 'Scorpius', NULL, 4, 0);
INSERT INTO public.star VALUES (5, 'Crux', NULL, 5, 0);
INSERT INTO public.star VALUES (6, 'Leo', NULL, 6, 0);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_key PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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


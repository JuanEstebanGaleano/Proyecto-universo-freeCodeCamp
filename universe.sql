CREATE DATABASE universe;


\c universe


CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC(12,2),
    has_life BOOLEAN NOT NULL
);


CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    temperature INT NOT NULL,
    mass NUMERIC(10,2),
    is_spherical BOOLEAN NOT NULL
);


CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_type TEXT NOT NULL,
    age_in_millions_of_years INT,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    description TEXT
);

CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    speed INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    description TEXT
);

INSERT INTO galaxy(name, description, age_in_millions_of_years, distance_from_earth, has_life)
VALUES
('Milky Way', 'Our home galaxy', 13600, 0, true),
('Andromeda', 'Nearest spiral galaxy', 10000, 2537000, false),
('Triangulum', 'Small spiral galaxy', 12000, 3000000, false),
('Whirlpool', 'Interacting galaxy', 8000, 23000000, false),
('Sombrero', 'Bright galaxy', 9000, 29000000, false),
('Pinwheel', 'Face-on spiral galaxy', 13000, 21000000, false);

INSERT INTO star(name, galaxy_id, temperature, mass, is_spherical)
VALUES
('Sun', 1, 5778, 1.00, true),
('Sirius', 1, 9940, 2.10, true),
('Betelgeuse', 1, 3500, 20.00, true),
('Rigel', 2, 12100, 21.00, true),
('Vega', 3, 9602, 2.14, true),
('Polaris', 4, 6015, 5.40, true);

INSERT INTO planet(name, star_id, planet_type, age_in_millions_of_years, has_life)
VALUES
('Mercury', 1, 'Rocky', 4500, false),
('Venus', 1, 'Rocky', 4500, false),
('Earth', 1, 'Rocky', 4500, true),
('Mars', 1, 'Rocky', 4500, false),
('Jupiter', 1, 'Gas Giant', 4500, false),
('Saturn', 1, 'Gas Giant', 4500, false),
('Uranus', 1, 'Ice Giant', 4500, false),
('Neptune', 1, 'Ice Giant', 4500, false),
('Kepler-22b', 2, 'Super Earth', 6000, false),
('Proxima b', 3, 'Terrestrial', 5000, false),
('Gliese 581g', 4, 'Exoplanet', 7000, false),
('HD 209458 b', 5, 'Hot Jupiter', 4000, false);

INSERT INTO moon(name, planet_id, diameter, is_spherical, description)
VALUES
('Moon', 3, 3474, true, 'Earth moon'),
('Phobos', 4, 22, false, 'Moon of Mars'),
('Deimos', 4, 12, false, 'Moon of Mars'),
('Io', 5, 3643, true, 'Moon of Jupiter'),
('Europa', 5, 3122, true, 'Moon of Jupiter'),
('Ganymede', 5, 5268, true, 'Largest moon'),
('Callisto', 5, 4820, true, 'Moon of Jupiter'),
('Titan', 6, 5150, true, 'Moon of Saturn'),
('Enceladus', 6, 504, true, 'Ice moon'),
('Mimas', 6, 396, true, 'Small moon'),
('Triton', 8, 2706, true, 'Moon of Neptune'),
('Nereid', 8, 340, true, 'Moon of Neptune'),
('Miranda', 7, 471, true, 'Moon of Uranus'),
('Ariel', 7, 1158, true, 'Moon of Uranus'),
('Umbriel', 7, 1169, true, 'Moon of Uranus'),
('Titania', 7, 1578, true, 'Moon of Uranus'),
('Oberon', 7, 1523, true, 'Moon of Uranus'),
('Charon', 10, 1212, true, 'Moon-like body'),
('Despina', 8, 150, false, 'Small moon'),
('Larissa', 8, 194, false, 'Irregular moon');

INSERT INTO comet(name, speed, is_active, description)
VALUES
('Halley', 70, true, 'Famous periodic comet'),
('Hale-Bopp', 44, true, 'Bright comet'),
('Encke', 69, true, 'Short-period comet');

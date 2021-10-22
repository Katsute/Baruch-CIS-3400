SELECT * FROM people;

--

SELECT * FROM people;

--

SELECT 'DataCamp <3 SQL' AS result;

--

SELECT 'SQL is cool' AS result;

--

SELECT title from films;

SELECT release_year from films;

SELECT name from people;

--

SELECT title FROM films;

SELECT title, release_year FROM films;

SELECT title, release_year, country FROM films;

SELECT * FROM films;

--

SELECT DISTINCT country FROM films;

SELECT DISTINCT certification FROM films;

SELECT DISTINCT role FROM roles;

--

SELECT COUNT(*) FROM reviews;

--

SELECT COUNT(*) FROM people;

SELECT COUNT(birthdate) FROM people;

SELECT COUNT(DISTINCT birthdate) FROM people;

SELECT COUNT(DISTINCT language) FROM films;

SELECT COUNT(DISTINCT country) FROM films;
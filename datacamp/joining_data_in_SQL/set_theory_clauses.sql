SELECT *
FROM economies2010
UNION
SELECT *
FROM economies2015
ORDER BY code, year;

--

SELECT DISTINCT(country_code)
FROM cities
UNION
SELECT DISTINCT(code)
FROM currencies
ORDER BY country_code;

--

SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;

--

SELECT code, year
FROM economies
INTERSECT
SELECT country_code, year
FROM populations
ORDER BY code, year;

--

SELECT name
FROM countries
INTERSECT
SELECT name
FROM cities;

--

SELECT name
FROM cities
EXCEPT
SELECT capital
FROM countries
ORDER BY name;

--

SELECT capital
FROM countries
EXCEPT
SELECT name
FROM cities
ORDER BY capital;

--

SELECT *
FROM countries
WHERE region = 'Middle East';

SELECT DISTINCT(name)
FROM languages
ORDER BY name;

SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
     FROM countries
     WHERE region = 'Middle East')
ORDER BY name;

--

SELECT COUNT(countries)
FROM countries
WHERE continent = 'Oceania';

SELECT
    code,
    name,
    basic_unit AS currency
FROM countries as c1
INNER JOIN currencies as c2
    USING(code)
WHERE continent = 'Oceania';

SELECT
	code,
	name
FROM countries
WHERE
	continent = 'Oceania' AND
	code NOT IN (
		SELECT code FROM currencies
	);

--

SELECT name
FROM cities AS c1
WHERE
    country_code IN (
        SELECT e.code
        FROM economies as e
        UNION
        SELECT c2.code
        FROM currencies AS c2
        EXCEPT
        SELECT p.country_code
        FROM populations AS p
    )
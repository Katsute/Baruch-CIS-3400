SELECT * FROM cities;

SELECT *
FROM cities
    INNER JOIN countries
        ON cities.country_code = countries.code;

SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
    INNER JOIN countries
        ON cities.country_code = countries.code;

--

SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
    INNER JOIN economies AS e
        ON c.code = e.code;

--

SELECT
    c.code,
    c.name,
    c.region,
    p.year,
    p.fertility_rate
FROM countries AS c
    INNER JOIN populations AS p
        ON c.code = p.country_code;

SELECT
    c.code,
    c.name,
    c.region,
    p.year,
    p.fertility_rate,
    e.unemployment_rate,
    e.year
FROM countries AS c
    INNER JOIN populations AS p
        ON c.code = p.country_code
    INNER JOIN economies AS e
        ON c.code = e.code;

SELECT
    c.code,
    c.name,
    c.region,
    p.year,
    p.fertility_rate,
    e.unemployment_rate
FROM countries AS c
    INNER JOIN populations AS p
        ON c.code = p.country_code
    INNER JOIN economies AS e
        ON
            c.code = e.code AND
            e.year = p.year;

--

SELECT
    c.name AS country,
    c.continent,
    l.name AS language,
    l.official
FROM countries AS c
    INNER JOIN languages as l
        ON c.code = l.code;

--

SELECT
    p1.country_code,
    p1.size AS size2010,
    p2.size AS size2015
FROM populations AS p1
    INNER JOIN populations AS p2
        ON p1.country_code = p2.country_code;

SELECT
    p1.country_code,
    p1.size AS size2010,
    p2.size AS size2015
FROM populations AS p1
    INNER JOIN populations AS p2
        ON
        p1.country_code = p2.country_code AND
        p1.year = p2.year - 5;

SELECT
    p1.country_code,
    p1.size AS size2010,
    p2.size AS size2015,
    ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
FROM populations AS p1
    INNER JOIN populations AS p2
        ON
        p1.country_code = p2.country_code AND
        p1.year = p2.year - 5;

--

SELECT name, continent, code, surface_area,
    CASE
        WHEN surface_area > 2000000 THEN 'large'
        WHEN surface_area > 350000 THEN 'medium'
        ELSE 'small' END
        AS geosize_group
FROM countries;

--

SELECT country_code, size,
    CASE
        WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
FROM populations
WHERE year = 2015;



SELECT country_code, size,
    CASE
        WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
        INTO pop_plus
FROM populations
WHERE year = 2015;

SELECT * FROM pop_plus;



SELECT country_code, size,
    CASE
        WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
        INTO pop_plus
FROM populations
WHERE year = 2015;

SELECT name, continent, geosize_group, popsize_group
FROM countries_plus AS c
    INNER JOIN pop_plus AS p
      ON c.code = p.country_code
ORDER BY geosize_group;
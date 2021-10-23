SELECT AVG(life_expectancy)
FROM populations
WHERE year = 2015;

SELECT *
FROM populations
WHERE
    life_expectancy > 1.15 * (
        SELECT AVG(life_expectancy)
        FROM populations
        WHERE year = 2015
    ) AND
    year = 2015;

--

SELECT name, country_code, urbanarea_pop
FROM cities
WHERE
  name IN (
      SELECT capital
      FROM countries
  )
ORDER BY urbanarea_pop DESC;

--

SELECT countries.name AS country,
    (SELECT COUNT(*)
     FROM cities
     WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

--

SELECT code, COUNT(code) as lang_num
FROM languages
GROUP BY code;

SELECT local_name, sq.lang_num
FROM countries,
  	(SELECT code, COUNT(*) AS lang_num
  	 FROM languages
  	 GROUP BY code) AS sq
    WHERE countries.code = sq.code
ORDER BY lang_num DESC;
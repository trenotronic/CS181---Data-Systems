/* Tren Meckel 
 * December 2024 */

/* for me to look */
SHOW TABLES;
DESCRIBE topnames;
SELECT name FROM topnames;

/* Problem 1 : Create a list of boy and girl
 * names which show up in the table (no repeats in
 * the list) */

SELECT DISTINCT sex, name FROM topnames ORDER BY sex;

/* Problem 2 : Create a list of all boy names 
 * by year in this current century (since year
 * 2000) */

SELECT year, name FROM topnames WHERE sex = 'Male' AND year > 1999;

/* Problem 3 : Repeat the above query except sort 
 * them by the count with largest counts first.
 * It is ok to display the year, name and count */

SELECT count, year, name FROM topnames WHERE sex = 'Male' AND year > 1999
ORDER BY count DESC;

/* Problem 4 : Print a list of all girl names that
 * end in an 'a' */

SELECT name FROM topnames WHERE sex = 'Female' and name LIKE '%A';

/* Problem 5 : Print a list of the top 10 
 * year, name, count values in the database where the
 * top 10 is decided by count values. Sort the data
 * from largest count to smallest (in top 10) */

SELECT year, name, count FROM topnames ORDER BY count DESC
LIMIT 10;

/* Problem 6 : Mary had quite the run of being 
 * the most popular girl's name. Print the
 * following data about Mary's historic popularity:
 * • The first year Mary was the most popular name. Call this field FirstYear.
 * • The last year Mary was the most popular name. Call this field LastYear.
 * • The count of the number of times Mary was the most popular name. Call this
     field Frequency.
 * • The number of times Mary was not the most popular name in that span of time
 *   from her first year of popularity through her last year of popularity. 
 *   Call this field NumberMisses */

/* Just for me to look */
SELECT name, year, count FROM topnames ORDER BY year;


WITH PopularYears AS (
    SELECT year
    FROM topnames AS t1
    WHERE sex = 'Female' AND name = 'Mary' AND 
          count > (SELECT MAX(count) 
                   FROM topnames AS t2 
                   WHERE t2.year = t1.year AND t2.sex = 'Male')
					 )
SELECT 
    MIN(year) AS FirstYear,
    MAX(year) AS LastYear,
    COUNT(*) AS Frequency,
    (MAX(year) - MIN(year) + 1) - COUNT(*) AS NumberMisses
FROM PopularYears;

              
              
/* Problem 7 : Building on this Mary idea of 
 * streaks of values, now print a list of all female
 * names along with the number of years they were 
 * ranked as the most popular. Sort the list by number
 * of years, starting with the most number of years first */
   
SELECT name, COUNT(*) AS YearsMostPopular
FROM topnames AS t1
WHERE sex = 'Female' AND 
      count > (SELECT MAX(count) 
               FROM topnames AS t2 
               WHERE t2.year = t1.year AND t2.sex = 'Male')
GROUP BY name
ORDER BY YearsMostPopular DESC, name ASC;


             





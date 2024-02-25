-- This SQL statement creates a new database named LifeExpectancyDB
CREATE DATABASE LifeExpectancy;
USE LifeExpectancy;

-- From this file: /Users/preem.ds/Documents/WHO_region_Life_Expectancy_At_Birth.csv
SELECT *
FROM LifeExpectancy.who_region_life_expectancy_at_birth;



-- From this file: /Users/preem.ds/Documents/life_Expectancy_At_Birth_cav.csv
SELECT *
FROM LifeExpectancy.life_expectancy_at_birth_cav;



-- From this file: /Users/preem.ds/Documents/HALE_WHO_region_Life_Expectancy_At_Birth.csv
SELECT *
FROM LifeExpectancy.hale_who_region_life_expectancy_at_birth;



-- From this file: /Users/preem.ds/Documents/HALE_life_Expectancy_At_Birth.csv
SELECT *
FROM LifeExpectancy.hale_life_expectancy_at_birth;

SELECT Period, gender, COUNT(*) as total_count
FROM (
    SELECT Period, gender FROM hale_life_expectancy_at_birth
    UNION ALL
    SELECT Period, gender FROM hale_who_region_life_expectancy_at_birth
    UNION ALL
    SELECT Period, gender FROM life_expectancy_at_birth_cav
    UNION ALL
    SELECT Period, gender FROM who_region_life_expectancy_at_birth
) AS combined
GROUP BY Period, gender;

SELECT location, gender, COUNT(*) as total_count
FROM (
    SELECT location, gender FROM hale_life_expectancy_at_birth
    UNION ALL
    SELECT location, gender FROM hale_who_region_life_expectancy_at_birth
    UNION ALL
    SELECT location, gender FROM life_expectancy_at_birth_cav
    UNION ALL
    SELECT location, gender FROM who_region_life_expectancy_at_birth
) AS combined
GROUP BY location, gender;


SELECT ROUND(AVG(Hale_Expectency), 2) AS average_hale_expectancy, 
       ROUND(AVG(Life_expectancy), 2) AS average_life_expectancy
FROM (
    SELECT Hale_Expectency, Life_expectancy FROM hale_who_region_life_expectancy_at_birth
    -- Include other tables with UNION ALL if needed
) AS combined_data;







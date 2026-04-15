Lesson 4
SELECT DISTINCT Director FROM movies ORDER BY Director ASC;
SELECT title, year FROM movies ORDER BY year DESC LIMIT 4;
SELECT title FROM movies ORDER BY title ASC LIMIT 5;
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;
Review 1
List all the Canadian cities and their populations ✓
->SELECT City, Population FROM north_american_cities WHERE Country = "Canada";
Order all the cities in the United States by their latitude from north to south
->SELECT City FROM north_american_cities WHERE Country = "United States" ORDER BY Latitude DESC;
List all the cities west of Chicago, ordered from west to east ✓
->SELECT City FROM north_american_cities WHERE Longitude < -87.629798 ORDER BY City ASC;
List the two largest cities in Mexico (by population)
-> SELECT City, Population FROM north_american_cities WHERE Country= "Mexico" AND Population >= 1742000;
List the third and fourth largest cities (by population) in the United States and their population
->SELECT city, population FROM north_american_cities WHERE country LIKE "United States" ORDER BY population DESC LIMIT 2 OFFSET 2;

Lesson 6
Find the domestic and international sales for each movie ✓
->SELECT Title, Domestic_sales, International_sales FROM movies INNER JOIN Boxoffice ON Movies.Id = Boxoffice.Movie_id;
Show the sales numbers for each movie that did better internationally rather than domestically ✓
->SELECT Title, Domestic_sales, International_sales FROM movies INNER JOIN Boxoffice ON Movies.Id = Boxoffice.Movie_id WHERE International_sales> Domestic_sales;
List all the movies by their ratings in descending order ✓
-> SELECT Title, Rating FROM movies INNER JOIN Boxoffice ON Movies.Id = Boxoffice.Movie_id ORDER BY Rating DESC;

Lesson 7
Find the list of all buildings that have employees ✓
-> SELECT DISTINCT building FROM employees;
Find the list of all buildings and their capacity ✓
-> SELECT DISTINCT building_name, role 
FROM buildings 
  LEFT JOIN employees
    ON building_name = building;

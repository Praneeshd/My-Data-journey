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

Day 3- Lesson 8
Find the name and role of all employees who have not been assigned to a building ✓
->SELECT Name, Role FROM employees WHERE Building IS NULL;

Find the names of the buildings that hold no employees ✓
->SELECT Building_name FROM Buildings LEFT JOIN Employees ON Building_name= Building WHERE Building IS NULL;

Lesson 9
List all movies and their combined sales in millions of dollars ✓
->SELECT Title, (Domestic_sales + International_sales)/1000000 AS Combined_sales FROM movies INNER JOIN Boxoffice ON Movies.Id = Boxoffice.Movie_id;
List all movies and their ratings in percent ✓
->SELECT Title, Rating* 10 AS ratings_in_percent FROM movies INNER JOIN Boxoffice ON Movies.Id= Boxoffice.movie_id;
List all movies that were released on even number years ✓
-> SELECT Title, Year FROM movies WHERE Year% 2=0;

lesson 10
Find the longest time that an employee has been at the studio ✓
->SELECT Name, MAX(years_employed) AS longest_employed_time FROM employees;
For each role, find the average number of years employed by employees in that role ✓
->SELECT Role, AVG(years_employed) AS Average_years_employed FROM employees GROUP BY Role;
Find the total number of employee years worked in each building ✓
->SELECT Building, SUM(years_employed) AS total_no_of_employee_years FROM employees GROUP BY Building;

lesson 11
Find the number of Artists in the studio (without a HAVING clause) ✓
->SELECT COUNT(Role) FROM employees WHERE Role = "Artist";
Find the number of Employees of each role in the studio ✓
->SELECT Role, COUNT(Role) FROM employees GROUP BY Role;
Find the total number of years employed by all Engineers ✓
->SELECT Role, SUM(years_employed) FROM employees WHERE Role= "Engineer";

lesson 12
Find the number of movies each director has directed ✓
->SELECT Director, COUNT(Title) FROM movies GROUP BY Director;
Find the total domestic and international sales that can be attributed to each director ✓
SELECT Director, SUM(Domestic_sales) + SUM(International_sales) AS Total_international_and_international_sales FROM movies INNER JOIN Boxoffice ON movies.Id= Boxoffice.movie_id GROUP BY Director;

lesson 13
Add the studio's new production, Toy Story 4 to the list of movies (you can use any director) ✓
->INSERT INTO Movies (Id, Title, Director, Year, Length_minutes) VALUES(15, "Toy Story 4", "Brad Bird", 2026, 140);
Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. ✓
->INSERT INTO Boxoffice (Movie_id, Rating, Domestic_sales, International_sales)
VALUES(15, 8.7, 340000000, 270000000);

lesson 14
The director for A Bug's Life is incorrect, it was actually directed by John Lasseter ✓
  ->UPDATE Movies SET Director= "John Lasseter" WHERE Title= "A Bug's Life";
The year that Toy Story 2 was released is incorrect, it was actually released in 1999 ✓
->UPDATE Movies SET Year= 1999 WHERE Title= "Toy Story 2 ";
Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich ✓
->UPDATE Movies SET Title= "Toy Story 3", Director= "Lee Unkrich" WHERE Title= "Toy Story 8";

Lesson 15
This database is getting too big, lets remove all movies that were released before 2005. ✓
->DELETE FROM Movies WHERE Year < 2005;
Andrew Stanton has also left the studio, so please remove all movies directed by him. ✓
->DELETE FROM Movies WHERE Director= "Andrew Stanton";

Lesson 16
  Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded
This table has no constraints. ✓
->CREATE TABLE Database (Name VARCHAR(50), Version Float, Download_count Integer);

lesson 17
Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in. ✓
  ->ALTER TABLE Movies ADD Aspect_ratio Float;
Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English. ✓
->ALTER TABLE Movies ADD Language VARCHAR(100) DEFAULT English; 

lesson 18
We've sadly reached the end of our lessons, lets clean up by removing the Movies table ✓
->DROP TABLE Movies;
  And drop the BoxOffice table as well ✓
->DROP TABLE Boxoffice;

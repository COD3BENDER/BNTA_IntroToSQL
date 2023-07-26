DROP TABLE movies; -- WE DONE THIS TO BE ABLE TO RUN THE FILE AGAIN AS TABLE NAMES ARE UNIQUE -- we wouldnt do this normally.

CREATE TABLE movies(
    id SERIAL, 
    title VARCHAR(255),
    duration INT,
    rating VARCHAR(255)
);

-- CREATE

-- Keywords used: INSERT INTO and VALUES
-- when adding entries they should be in the same order so (title,duration,rating) --> Values(title,duratio,rating)

INSERT INTO movies (title,duration,rating) VALUES ('Alien',117,'18'); --> Strings are single quotes and we dont have to add id as SERIAL will deal with it
INSERT INTO movies (title,duration,rating) VALUES ('The Imitation Game',114,'12A');
INSERT INTO movies (title,duration,rating) VALUES ('Iron Man',126,'12A');
INSERT INTO movies (title,duration,rating) VALUES ('The Martian',144,'12A');
INSERT INTO movies (title,rating) VALUES ('Braveheart','PG');
INSERT INTO movies (title, duration, rating) VALUES ('Guardians of the Galaxy', 121, '12A');
INSERT INTO movies (title, duration, rating) VALUES ('You Only Live Twice', 117, 'PG');
INSERT INTO movies (title, duration, rating) VALUES ('I Know What You Did Last Summer', 101, '18');

--===============================================================================================================================================================
--UPDATE
--===============================================================================================================================================================
-- Keywords used: UPDATE
--  if you update a single parameter you can use WHERE as without it it will update the whole table so you have to be specific and most of the time you select with ID.
-- you can use code to get IDs

-- comment out for now -----------------------------
UPDATE movies SET rating = '12A' WHERE id = 5;  --CODE

-- to update more than one parameter you can do this: Also for some reason when you update a single parameter you cant use brackets it will give you errors.

-- comment out for now -----------------------------
UPDATE movies SET (duration, rating) = (178, '15') WHERE id = 5; --CODE


--===============================================================================================================================================================
-- DELETE
--===============================================================================================================================================================
-- Keywords used: DELETE FROM, WHERE

-- comment out for now -----------------------------
DELETE FROM movies WHERE id = 5; -- will delete the row with id 5 --CODE

--===============================================================================================================================================================
-- READ
--===============================================================================================================================================================
-- Keywords used: SELECT, FROM, WHERE, LIKE, NOT..., COUNT, GROUP BY
-- We have to select from database and where selecting from.
-- SELECT IS A SAFE MODIFICATION --> doesnt actually modify the database in anyway


-- comment out for now -----------------------------
 SELECT title FROM movies WHERE rating = 'PG'; --CODE
 SELECT * FROM movies WHERE rating = 'PG'; --CODE
 SELECT title FROM movies WHERE duration > 120; --CODE

 SELECT * FROM movies; --CODE
-- LIKE works something like equals unless you tell it where it can be fuzzy with the matching --> you do this by providing a % sign

SELECT * FROM movies WHERE title LIKE 'Alien'; --CODE

-- this gives you everything that starts and ends with you --> so if you put the % after the You it will give everything that starts with you
-- if you put the % at the front it will give everything that ends with you and if you put both you will get both

SELECT * FROM movies WHERE title LIKE '%You%'; --CODE

-- if you want to check for the word you regardless of capitalization then you can do LOWER()

SELECT * FROM movies WHERE title LIKE LOWER('%You%'); --CODE

-- you can also negate it using NOT

SELECT * FROM movies WHERE title NOT LIKE LOWER('%You%'); --CODE

-- This return the database in the order we define and if there is a tie then it will be sorted using ID number. Capitals will take prefernce before the lower case.
SELECT * FROM movies ORDER BY duration; --CODE

-- Ordering does matter -- we will always start with SELECT and then where we are SELECTING FROM and then WHERE ... and then ORDER BY ending with how we should Order.
SELECT title FROM movies WHERE rating = '12A' ORDER BY duration DESC; --CODE


SELECT COUNT(*) FROM movies; --CODE

-- you can get all the distinct elements using for example if you had 10 12A and 1 PG and 5 18s --> it will retyrn 12A,PG,18 without the amount of times its appeared.
SELECT DISTINCT rating FROM movies; --CODE
SELECT DISTINCT rating FROM movies WHERE duration > 120; --CODE

-- AGGREGATION FUNCTIONS:
--///////////////////////

-- USING GROUP BY allows us to use other functions such as count wheere we couldnt do that before as DISTINCT would delete all other instances of it an just return 1 of each
-- GROUP BY doesnt delete but returns 1 of each so we can still count the number of times it occurs.
-- if you GROUP BY a certian column then you have to also SELECT that column 

SELECT rating, COUNT(*) FROM movies GROUP BY rating;  --CODE
SELECT rating, SUM(duration) FROM movies GROUP BY rating; -- CODE

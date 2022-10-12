CREATE DATABASE Chuchu;
USE Chuchu;
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age
INTEGER);
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");

/*Querying table */
SELECT * FROM persons;
SELECT * FROM hobbies;

/* Adding one row to each table */
INSERT INTO persons (name, age) VALUES ("Lemuel Den", 13);
INSERT INTO hobbies (person_id, name) VALUES (9, "reading");

/* Joining tables to their hobbies */
SELECT persons.name, hobbies.name 
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/* Joining tables to their hobbies */
SELECT persons.name, hobbies.name 
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id
WHERE persons.name = "Bobby McBobbyFace";

/*Challenge 2 */
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);
INSERT INTO orders (customer_id, item, price)
VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
VALUES (1, "TARDIS", 1000000.00);

/* querying tables*/
SELECT * FROM customers;
SELECT * FROM orders;

/*Joining two tables with Left outer join*/
SELECT customers.name, customers.email, orders.item, orders.price
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id;

/*Joining customers to their total price*/
SELECT customers.name, customers.email, sum(orders.price) AS total_price
FROM customers
LEFT OUTER JOIN orders 
ON customers.id=orders.customer_id 
GROUP BY orders.customer_id ORDER BY total_price DESC; 

/* Challenge 3 */
CREATE TABLE movie (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
INSERT INTO movie VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movie VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movie VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movie VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movie VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movie VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movie VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movie VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);

/* querying tables*/
SELECT * FROM movie;

/*Joining sequels to title */
SELECT movie.id, movie.title, movie.released, movie.sequel_id
FROM movie
JOIN movie a
ON movie.id = a.id;
SELECT movie.id, movie.sequel_id
FROM movie
JOIN movie b
ON movie.id = b.id;

SELECT a.id,  a.title, b.title
FROM movie a
LEFT OUTER JOIN movie b 
ON a.sequel_id = b.id;

/*Challenge 4 */
CREATE table documents (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT,content
TEXT,author TEXT);
INSERT INTO documents (author, title, content)
VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates,
heights.");

/* Querying table*/
SELECT * FROM documents;

/* Update in Table*/
UPDATE documents SET author = "Jackie Draper"
WHERE author = "Jackie Paper";

/*Querying Table Again*/
SELECT * FROM documents;

/*Deleting row */
DELETE FROM documents WHERE title = "Things I'm Afraid Of";

/* Querying table */
SELECT * FROM documents;

/* Challenge 5 */
CREATE TABLE clothes (id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,design TEXT);
INSERT INTO clothes (type, design)
VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
VALUES ("blazer", "black sequin");

/*Querying Table*/
SELECT * FROM clothes;

/* Alter table by adding price*/
ALTER TABLE clothes ADD price INTEGER;
SELECT * FROM clothes;

/* Update price column*/
UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;
SELECT * FROM clothes;

/* Adding new item to table*/
INSERT INTO clothes(type, design, price)
VALUES ("shirt", "plain", 40);
SELECT * FROM clothes;
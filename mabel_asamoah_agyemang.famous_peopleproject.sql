CREATE DATABASE Famous_People;
USE Famous_People;
CREATE TABLE celebrities(id INT PRIMARY KEY AUTO_INCREMENT, Name TEXT, Occupation TEXT, Marital_status TEXT, Children INT);
INSERT INTO celebrities VALUES (1,'Marilyn Munroe', 'Actress', 'S', 0);
INSERT INTO celebrities VALUES (2,'J K Rowling', 'Author', 'M', 3);
INSERT INTO celebrities VALUES (3,'John Grisham', 'Author', 'M', 2);
INSERT INTO celebrities VALUES (4,'Meghan Markle', 'Actress', 'M', 2);
INSERT INTO celebrities VALUES (5,'Ernest Hemingway', 'Author', 'S', 1);
INSERT INTO celebrities VALUES (6,'Bill Gates', 'Business man', 'M', 2);
INSERT INTO celebrities VALUES (7,'Dangote', 'Business man', 'S', 3);
INSERT INTO celebrities VALUES (8,'Albert Einstein', 'Scientist', 'S', 0);
INSERT INTO celebrities VALUES (9,'Marie Curie ', 'Scientist', 'S', 1);

CREATE TABLE industry(id INT PRIMARY KEY AUTO_INCREMENT, Industry TEXT, celebrity_index INT);
INSERT INTO industry VALUES (1,'Acting ',1 );
INSERT INTO industry VALUES (2,'Acting ',4 );
INSERT INTO industry VALUES (3,'Business',6 );
INSERT INTO industry VALUES (4,'Business',7 );
INSERT INTO industry VALUES (5,'Science',9 );
INSERT INTO industry VALUES (6,'Science',8);
INSERT INTO industry VALUES (7,'Writing',3 );
INSERT INTO industry VALUES (8,'Writing',2 );
INSERT INTO industry VALUES (9,'Writing',5 );

CREATE TABLE Family(id INT PRIMARY KEY, spouse TEXT, spouse_index int);
INSERT INTO Family VALUES(1, 'Jamie Robertson',2);
INSERT INTO Family VALUES(2, 'Harry Markle',4);
INSERT INTO Family VALUES(3, 'Melinda Gates',6);
INSERT INTO Family VALUES(4, 'Sally Grisham',2);


/* Querying table*/
SELECT * FROM celebrities;
SELECT * FROM industry;
SELECT * FROM Family;

/* Querying aggregates :min children, max children, sum of all children, average num of chidren*/
SELECT MIN(Children) FROM celebrities;
SELECT MAX(Children) FROM celebrities;
SELECT SUM(Children) FROM celebrities;
SELECT AVG(Children) FROM celebrities;

/* Celebrities with minimum and maximum number of children*/
SELECT Name FROM celebrities WHERE Children = 0;
SELECT Name FROM celebrities WHERE Children = 3;

/* Pairing Celebrities with their industries*/
SELECT celebrities.Name, industry.Industry
FROM celebrities
JOIN industry
ON celebrities.id = industry.celebrity_index;

/*Querying celebrities and their respective spouses*/
SELECT celebrities.Name, Family.spouse
FROM celebrities
JOIN Family
ON celebrities.id = Family.spouse_index;






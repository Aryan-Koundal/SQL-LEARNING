CREATE DATABASE aryan;
CREATE DATABASE IF NOT EXISTS aryan;
-- DROP DATABASE aryan;
DROP DATABASE IF EXISTS kaku;
use aryan;
CREATE TABLE student(
 id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);
CREATE TABLE student3(
id INT PRIMARY KEY,
name VARCHAR(50),
marks INT,
grade CHAR ,
city VARCHAR(30)
);
CREATE TABLE student4(
id INT,
name VARCHAR(50),
FOREIGN KEY (id) REFERENCES student(id)
);
CREATE TABLE student5(
id INT,
name VARCHAR(50),
FOREIGN KEY (id) REFERENCES student3(id)
);
DROP TABLE student5;
CREATE TABLE student5(
id INT,
name VARCHAR(50),
FOREIGN KEY (id) REFERENCES student3(id)
ON UPDATE CASCADE 
ON DELETE CASCADE
);
CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT);
INSERT INTO employee 
(id,name,manager_id)
VALUES
(101,"ARYAN",101),
(102,"HARSH",102),
(103,"MOHIT",103),
(100,"ISHA",103),
(105,"DEEPALI",101),
(106,"NIDHI",102);
INSERT INTO student5
(id,name)
VALUES
(101,"ARYAN"),
(102,"HARSH"),
(103,"MOHIT"),
(100,"ISHA"),
(105,"DEEPALI"),
(106,"NIDHI");
SELECT *FROM student4;
SELECT *FROM student5;
INSERT INTO student3
(id,name,marks,grade,city)
VALUES
(101,"ARYAN",99,"A","HP"),
(102,"HARSH",98,"A","HP"),
(103,"MOHIT",97,"B","CHANDIGARH"),
(104,"ISHA",96,"B","CHANDIGARH"),
(105,"DEEPALI",99,"A","PALAMPUR"),
(106,"NIDHI",96,"A","DHARAMSHALA");
UPDATE student3
SET city = "CHANDIGARH"
WHERE id =104;

UPDATE student3
SET id = 100
WHERE id =104;

UPDATE student3
SET id = 1000
WHERE id =105;
INSERT INTO student VALUES(1,"ARYAN",18);
INSERT INTO student VALUES(2,"HARSH",20);
INSERT INTO student VALUES(3,"MOHIT",24);
INSERT INTO student VALUES(4,"ISHA",22);
SELECT *FROM student;

CREATE TABLE student2(
 rollno INT,
 name VARCHAR(50),
 age INT NOT NULL
 );
INSERT INTO student2
(name, rollno, age,reg_no)
VALUES
("ARYAN",101,18),
("HARSH",102,20),
("MOHIT",103,24),
("ISHA",104,22);
ALTER TABLE student2
DROP PRIMARY KEY,
ADD PRIMARY KEY (rollno, name);
ALTER TABLE student2
ADD abc_id char;
UPDATE student2
SET abc_id = "A"
WHERE rollno =101;
UPDATE student2
SET abc_id = "A"
WHERE rollno =102;
UPDATE student2
SET abc_id = "B"
WHERE rollno =103;
UPDATE student2
SET abc_id = "C"
WHERE rollno =104;
ALTER TABLE student2
ADD reg_no INT UNIQUE;
UPDATE student2
SET reg_no = 99
WHERE rollno = 101;
UPDATE student2
SET reg_no = 999
WHERE rollno = 102;

CREATE TABLE temp(
id INT,
student_name VARCHAR(50),
FOREIGN KEY (id,student_name) REFERENCES student2(rollno, name)
);
INSERT INTO student4
(id,name,marks,grade,city)
VALUES
(101,"ARYAN",99,"A","HP"),
(102,"HARSH",98,"A","HP"),
(103,"MOHIT",97,"B","CHANDIGARH"),
(104,"ISHA",96,"B","CHANDIGARH"),
(105,"DEEPALI",99,"A","PALAMPUR"),
(106,"NIDHI",96,"A","DHARAMSHALA");
ALTER TABLE temp
ADD salary INT DEFAULT 25000;
UPDATE temp
SET salary =20000
WHERE id = 101;
ALTER TABLE temp
ADD age INT,
ADD CONSTRAINT age_check CHECK (age>=18 AND ID >=100);
UPDATE temp
SET age =18
WHERE ID =101;
UPDATE temp
SET  age =20
WHERE ID =102;
INSERT INTO temp(id,student_name)
VALUES 
(101,"ARYAN"),
(102,"HARSH");
SELECT NAME, ROLLNO FROM STUDENT2;
-- TRUNCATE TABLE temp;
SELECT *FROM temp;
SELECT *FROM student2 WHERE rollno > 101;
SELECT *FROM student2 WHERE rollno+10>110;
SELECT *FROM student2 WHERE rollno+10=111;
SELECT *FROM student2 WHERE rollno+10=111 AND rollno+10>110;
SELECT *FROM student2 WHERE rollno+10=111 OR rollno>110;
SELECT *FROM student2 WHERE rollno BETWEEN 101 AND 103;
SELECT *FROM student2 WHERE rollno IN(101);
SELECT *FROM student2 WHERE rollno NOT IN(101);
SELECT *FROM student2 LIMIT 2;
SELECT *FROM student2 WHERE rollno>100 LIMIT 2;
SELECT *FROM student2 ORDER BY name ASC;
SELECT *FROM student2 ORDER BY name DESC;
SELECT DISTINCT abc_id FROM student2;
SELECT AVG(age) FROM student2;
SELECT MAX(age) FROM student2;
SELECT SUM(age) FROM student2;
SELECT COUNT(age) FROM student2;
SELECT abc_id , COUNT(name) FROM student2 GROUP BY abc_id;
SELECT *FROM student2;
SELECT *FROM student3;
SELECT *FROM student2 INNER JOIN student3 ON student2.rollno = student3.id;
SELECT *FROM student2 LEFT JOIN student3 ON student2.rollno = student3.id;
SELECT student2.name,
       student2.rollno,
       student2.abc_id,
       student3.marks,
       student3.grade,
       student3.city
FROM student2 LEFT JOIN student3 ON student2.rollno = student3.id;
SELECT *FROM student3 RIGHT JOIN student2 ON student3.id = student2.rollno;
SELECT *FROM student2 RIGHT JOIN student3 ON student2.rollno = student3.id;
SELECT *FROM student2 as a
LEFT JOIN student3 as b
ON a.rollno = b.id
UNION 
SELECT *FROM student2 as a
RIGHT JOIN student3 as b
ON a.rollno = b.id;
SELECT *FROM student2
UNION 
SELECT *FROM student3;
SELECT *FROM student2 LEFT JOIN student3 ON student2.rollno = student3.id WHERE student3.id IS NULL;
SELECT city , avg(marks) FROM student3 GROUP BY city ORDER BY city ASC;
SELECT grade, count(id) FROM student3 GROUP BY grade ORDER BY grade ASC;
SELECT count(name),city FROM student3 GROUP BY city HAVING max(marks)>90;
SELECT city FROM student3 WHERE grade = "A" GROUP BY city HAVING MAX(marks)>96;
ALTER TABLE student5
CHANGE COLUMN name  PERSONS VARCHAR(50);
ALTER TABLE student5
CHANGE COLUMN id ID INT;
SELECT *FROM student5;
SELECT a.name as manager_name,b.name FROM employee as a JOIN employee as b ON a.id = b.manager_id;
SELECT *FROM employee;
SELECT (SELECT max(marks)FROM student3),name FROM student3;
SELECT id,name FROM student3 WHERE id % 2 = 0;
SELECT *FROM student3 WHERE id in (101,102,106,1000);
SELECT *FROM (SELECT *FROM student3 WHERE grade = "A") as ARYAN;
SELECT *FROM student3 WHERE id IN(SELECT id FROM student3 WHERE id %2=0);
SELECT name,marks FROM student3 WHERE marks > (SELECT AVG(marks)FROM student3);
CREATE VIEW view1 AS SELECT id FROM student3;
CREATE VIEW view2 AS SELECT * FROM student3;
SELECT *FROM view1;
SELECT *FROM view2;
SELECT *FROM view2 WHERE marks>96;
SHOW DATABASES;
SHOW TABLES;
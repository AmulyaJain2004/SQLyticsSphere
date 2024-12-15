USE mydb;

CREATE TABLE student_table ( -- It is used to create a table with below features
    sid INT PRIMARY KEY NOT NULL,
    sname VARCHAR(50);
    sage INT,
    subject varchar(20)
);

SELECT * FROM student_table; -- It is used to select the table and show all columns(*) of table
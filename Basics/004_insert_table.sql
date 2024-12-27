USE mydb;

SHOW TABLES;

DESC student_table;

SELECT * FROM student_table;

INSERT INTO student_table (
    sid,
    sname,
    sage,
    subject
)
VALUES
(1001, "Aman", 18, "CSE");

INSERT INTO student_table (
    sid,
    sname,
    sage,
    subject
)
VALUES
(1002, "Akash", 19, "ASE");
(1003, "Ram", 21, "CSE");
(1004, "Ravi", 17, "MECH");
(1005, "Saurabh", 20, "ECE");
(1006, "Saksham", 18, "CSE");
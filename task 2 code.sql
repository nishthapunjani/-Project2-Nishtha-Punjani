
-- 1.Database Setup : Create a database named "student_database."Create a table called " student_table " with the following columns: Student_id (integer),Stu_name (text), Department (text), email_id (text ),Phone_no (numeric), Address (text),Date_of_birth (date), Gender (text), Major (text), GPA (numeric),Grade (text) should be A,B,C etc.

CREATE TABLE student_table (
Student_id INT,
Stu_name VARCHAR(100),
Department VARCHAR(100),
email_id VARCHAR(100),
Phone_no decimal(20,0),
Address VARCHAR(100),
Date_of_birth DATE,
Gender VARCHAR(100),
Major VARCHAR(100),
GPA DECIMAL(20,2), 
Grade VARCHAR(10)
);

-- 2.Data Entry : Insert 10 sample records into the "student_table" using INSERT command.

INSERT INTO student_table VALUES (1, 'Clark','Computer Science','clark@example.com',1234567890,'DELHI','2004-05-15', 'Male', 'Software Engineering',9.8, 'A'),
(2, 'John','Computer Science','john@example.com',1234534890,'Gujrat','2005-04-19', 'Male', 'Civil Engineering',9.0, 'A'),
(3, 'Joseph','Computer Science','joseph@example.com',9834567890,'Goa','2003-10-15', 'Male', 'Electrical  Engineering',8.0, 'C'),
(4, 'Clara','Computer Science','clara@example.com',1234007890,'Haryana','2004-11-10', 'Female', 'Chemical  Engineering',7.4, 'C'),
(5, 'Matt','Computer Science','matt@example.com',1984567890,'DELHI','2004-01-05', 'Male', 'Software Engineering',7.5, 'C'),
(6, 'David','Computer Science','david@example.com',1234567890,'Mumbai','2005-02-23', 'Male', 'Electrical  Engineering',6.6, 'D'),
(7, 'Deryl','Computer Science','derly@example.com',1234567890,'Chandigarh','2004-09-09', 'Male', 'Software Engineering',8.8, 'B'),
(8, 'Nora','Computer Science','nora@example.com',1234097890,'Mumbai','2006-05-25', 'Female', 'Chemical  Engineering',9.5, 'A'),
(9, 'Amy','Computer Science','amy@example.com',1289567890,'DELHI','2004-12-27', 'Female', 'Software Engineering',4.5, 'E'),
(10, 'kyla','Computer Science','kyla@example.com',1114567890,'DELHI','2003-07-20', 'Female', 'Biomedical  Engineering',4.8, 'E');

SELECT * FROM student_table;

-- 3.Student Information Retrieval : Develop a query to retrieve all students' information from the "student_table" and sort them in  descending order by their grade.

SELECT * FROM student_table
ORDER BY 
    CASE Grade
        WHEN 'A' THEN 1
        WHEN 'B' THEN 2
        WHEN 'C' THEN 3
        WHEN 'D' THEN 4
        WHEN 'E' THEN 5
        ELSE 6
    END ASC;

-- 4.Query for Male Students:.Implement a query to retrieve information about all male students from the "student_table." 

SELECT * FROM student_table
WHERE Gender = 'Male';

-- 5.Query for Students with GPA less than 5.0 : Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table."

SELECT * FROM student_table
WHERE gpa < 5.0;

-- 6.Update Student Email and Grade : Write an update statement to modify the email and grade of a student with a specific ID in the "student_table."

UPDATE student_table
SET email_id = 'jos@example.com', GRADE ='B'
WHERE Stu_name = 'Joseph';  
SELECT * FROM student_table;

-- 7.Query for Students with Grade "B" : Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table."

SELECT 
Stu_name AS Name,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, Date_of_birth))::INT AS Age
FROM
    student_table
WHERE grade = 'B';

-- 8.Grouping and Calculation : Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination.

SELECT
    Department,
    Gender,
     ROUND(AVG(GPA), 2) AS Average_GPA
FROM
    student_table
GROUP BY
    Department,
    Gender;
    
-- 9.Table Renaming : Rename the "student_table" to "student_info" using the appropriate SQL statement.

ALTER TABLE student_table RENAME TO student_info;

 \pset title 'student_info'
 
 
-- 10.Retrieve Student with Highest GPA: Write a query to retrieve the name of the student with the highest GPA from the "student_info" table.


SELECT
    Stu_name,
    GPA
FROM
    student_info
WHERE
    GPA = (SELECT MAX(GPA) FROM student_info);
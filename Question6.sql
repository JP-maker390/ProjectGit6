/*
Siemens Skills Program Challenge
Question 6

*/

 CREATE TABLE Grades (
    Grade INT,
    Min_Value INT,
    Max_Value INT
);

INSERT INTO Grades (Grade, Min_Value, Max_Value) VALUES
(1, 0, 9),
(2, 10, 19),
(3, 20, 29),
(4, 30, 39),
(5, 40, 49),
(6, 50, 59),
(7, 60, 69),
(8, 70, 79),
(9, 80, 89),
(10, 90, 100);

INSERT INTO Student (ID, NAME, VALUE) VALUES
(1, 'Julia', 81),
(2, 'Carol', 68),
(3, 'Maria', 99),
(4, 'Andreia', 78),
(5, 'Jaqueline', 63),
(6, 'Marcela', 88);

/*Create a table with ID NAME VALUE AND GRADE*/

CREATE TABLE STUDENT_GRADE (
  ID INT,
  NAME VARCHAR(50),
  VALUE INT,
  GRADE INT
 );
 
INSERT INTO Student (ID, NAME, VALUE, GRADE) VALUES
(1, 'Julia', 81,9),
(2, 'Carol', 68,7),
(3, 'Maria', 99,10),
(4, 'Andreia', 78,8),
(5, 'Jaqueline', 63,7),
(6, 'Marcela', 88,9);


SELECT 
    Student.ID,
    Student.NAME,
    (SELECT Grades.Grade
     FROM Grades
     WHERE Student.Value BETWEEN Min_Value AND Max_Value) AS Grades,
     Student.VALUE
FROM Student;

/*
Initial test without the "NULL" condition for names with a grade lower than 8.
*/
SELECT 
    Student.ID,
    Student.NAME,
    (SELECT Grades.Grade
     FROM Grades
     WHERE Student.Value BETWEEN Min_Value AND Max_Value) AS Grade,
     Student.VALUE
  FROM 
      Student
    
  ORDER BY Grade DESC, NAME DESC; 
 
 /* Joana gives Eva the task of generating a report containing three columns: 
Name, Grade and Value.
Question 6 complete
*/

 SELECT 
    Student.ID,
    
     CASE 
        WHEN (SELECT Grades.Grade
              FROM Grades
              WHERE Student.Value BETWEEN Grades.Min_Value AND Grades.Max_Value) >= 8
        THEN Student.NAME
        ELSE NULL
    END AS NAME,
    (SELECT Grades.Grade
     FROM Grades
     WHERE Student.Value BETWEEN Min_Value AND Max_Value) AS Grade,
     Student.VALUE
  FROM 
      Student
    
  ORDER BY Grade DESC, NAME DESC; 


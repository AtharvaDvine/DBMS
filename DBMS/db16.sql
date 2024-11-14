

-- Create table for Students
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);

-- Insert sample data into Student table
INSERT INTO Student (StudentID, Name, Marks) VALUES
(1, 'Alice', 1300),
(2, 'Bob', 950),
(3, 'Charlie', 875),
(4, 'David', 920),
(5, 'Eva', 1400),
(6, 'Frank', 800);

DELIMITER //

CREATE PROCEDURE proc_Grade(IN student_id INT)
BEGIN
    DECLARE student_marks INT;
    DECLARE grade_category VARCHAR(50);

    -- Retrieve the marks for the specified student
    SELECT Marks INTO student_marks
    FROM Student
    WHERE StudentID = student_id;

    -- Determine the grade category based on marks
    IF student_marks >= 990 AND student_marks <= 1500 THEN
        SET grade_category = 'Distinction';
    ELSEIF student_marks >= 900 AND student_marks <= 989 THEN
        SET grade_category = 'First Class';
    ELSEIF student_marks >= 825 AND student_marks <= 899 THEN
        SET grade_category = 'Higher Second Class';
    ELSE
        SET grade_category = 'No Category';
    END IF;

    -- Output the category for the specified student
    SELECT Name AS StudentName, student_marks AS Marks, grade_category AS Category
    FROM Student
    WHERE StudentID = student_id;
END //

DELIMITER ;

-- Test the procedure with a student ID
CALL proc_Grade(1);  
CALL proc_Grade(2);  
CALL proc_Grade(3);  
CALL proc_Grade(4);  
CALL proc_Grade(6);  

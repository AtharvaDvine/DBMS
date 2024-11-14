-- Set a different delimiter to handle the procedure block
DELIMITER //

-- Create the stored procedure
CREATE PROCEDURE proc_Grade(IN p_name VARCHAR(50), IN p_total_marks INT)
BEGIN
    DECLARE v_class VARCHAR(20);

    -- Categorization logic based on marks
    IF p_total_marks >= 990 AND p_total_marks <= 1500 THEN
        SET v_class = 'Distinction';
    ELSEIF p_total_marks >= 900 AND p_total_marks <= 989 THEN
        SET v_class = 'First Class';
    ELSEIF p_total_marks >= 825 AND p_total_marks <= 899 THEN
        SET v_class = 'Higher Second Class';
    ELSE
        SET v_class = 'No Category';
    END IF;

    -- Insert the result into Result table
    INSERT INTO Result (Name, Class)
    VALUES (p_name, v_class);
END //

-- Reset the delimiter back to default
DELIMITER ;

-- Create tables for testing the procedure
CREATE TABLE Result (
    Roll INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Class VARCHAR(20)
);

CREATE TABLE Stud_Marks (
    Name VARCHAR(50),
    total_marks INT
);

-- Insert sample data into Stud_Marks
INSERT INTO Stud_Marks (Name, total_marks) VALUES
('John Doe', 1050),
('Jane Smith', 875),
('Alice Johnson', 920),
('Bob Brown', 800),
('Charlie White', 1330);

-- Call the stored procedure with sample data
CALL proc_Grade('John Doe', 1050);
CALL proc_Grade('Jane Smith', 875);
CALL proc_Grade('Alice Johnson', 920);
CALL proc_Grade('Bob Brown', 800);
CALL proc_Grade('Charlie White', 1330);

-- Select the results from the Result table to verify
SELECT * FROM Result;

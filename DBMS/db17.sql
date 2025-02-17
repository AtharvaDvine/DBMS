DELIMITER //

CREATE PROCEDURE proc_Book_Fine(IN p_roll_no INT, IN p_name_of_book VARCHAR(100))
BEGIN
    DECLARE v_date_of_issue DATE;
    DECLARE v_return_date DATE;
    DECLARE v_no_of_days INT;
    DECLARE v_fine_amount INT DEFAULT 0;
    DECLARE v_status CHAR(1);
    DECLARE INVALID_BOOK CONDITION FOR SQLSTATE '45000';
    
    -- Fetch the DateofIssue and Status from Borrower table
    BEGIN
        DECLARE CONTINUE HANDLER FOR NOT FOUND
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book or Roll No not found';
        
        SELECT DateofIssue, Status
        INTO v_date_of_issue, v_status
        FROM Borrower
        WHERE Roll_no = p_roll_no AND NameofBook = p_name_of_book;

    END;
    
    -- Check if the book status is 'I' (Issued)
    IF v_status = 'I' THEN
        -- Calculate the number of days since the book was issued
        SET v_return_date = CURDATE();  -- Using current system date as return date
        SET v_no_of_days = DATEDIFF(v_return_date, v_date_of_issue);

        -- Determine fine amount based on number of days
        IF v_no_of_days BETWEEN 15 AND 30 THEN
            SET v_fine_amount = v_no_of_days * 5;  -- Rs. 5 per day
        ELSEIF v_no_of_days > 30 THEN
            SET v_fine_amount = v_no_of_days * 50;  -- Rs. 50 per day
        ELSE
            SET v_fine_amount = 0;  -- No fine if within 15 days
        END IF;

        -- Update the book status from 'I' (Issued) to 'R' (Returned)
        UPDATE Borrower
        SET Status = 'R'
        WHERE Roll_no = p_roll_no AND NameofBook = p_name_of_book;

        -- If fine is applicable, insert the fine details into the Fine table
        IF v_fine_amount > 0 THEN
            INSERT INTO Fine(Roll_no, Date, Amt)
            VALUES (p_roll_no, v_return_date, v_fine_amount);
        END IF;

    ELSE
        -- Raise an exception if the book is not issued (status is not 'I')
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book status is not Issued';
    END IF;

END //

DELIMITER ;



-- Create Borrower Table
CREATE TABLE Borrower (
    Roll_no INT,
    Name VARCHAR(100),
    DateofIssue DATE,
    NameofBook VARCHAR(100),
    Status CHAR(1)
);

-- Create Fine Table
CREATE TABLE Fine (
    Roll_no INT,
    Date DATE,
    Amt INT
);


-- Insert Sample Data into Borrower Table
INSERT INTO Borrower (Roll_no, Name, DateofIssue, NameofBook, Status)
VALUES
(101, 'John Doe', '2024-10-01', 'The Great Gatsby', 'I'),
(102, 'Jane Smith', '2024-09-15', 'To Kill a Mockingbird', 'I'),
(103, 'Alice Brown', '2024-08-01', '1984', 'I'),
(104, 'Bob White', '2024-07-20', 'Moby *****', 'R');  -- Book already returned (R)
SELECT * FROM Borrower;

CALL proc_Book_Fine(101, 'The Great Gatsby');

CALL proc_Book_Fine(102, 'To Kill a Mockingbird');

SELECT * FROM Fine;
SELECT * FROM Borrower;
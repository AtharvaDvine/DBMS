CREATE TABLE O_RollCall (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    date DATE
);

CREATE TABLE N_RollCall (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    date DATE
);


INSERT INTO O_RollCall (roll_no, name, date)
VALUES
    (1, 'Paras', '2024-01-01'),
    (2, 'Sarth', '2024-01-02'),
    (3, 'Balaji', '2024-01-03'),
    (5, 'Atharva', '2024-01-04');


INSERT INTO N_RollCall (roll_no, name, date)
VALUES
    (3, 'Balaji', '2024-01-01'),
    (4, 'Sudarshan', '2024-01-06'),
    (6, 'Rahul', '2024-01-07'),
    (7, 'Mayur', '2024-01-08');


DELIMITER $$

CREATE PROCEDURE MergeRollCall()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE r_no INT;
    DECLARE r_name VARCHAR(50);
    DECLARE r_date DATE;
    
    DECLARE cur CURSOR FOR
        SELECT roll_no, name, date FROM N_RollCall;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO r_no, r_name, r_date;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF NOT EXISTS (
            SELECT 1
            FROM O_RollCall
            WHERE roll_no = r_no
        ) THEN
            INSERT INTO O_RollCall (roll_no, name, date)
            VALUES (r_no, r_name, r_date);
        END IF;
    END LOOP;
    
    CLOSE cur;
END$$

DELIMITER ;

SELECT * FROM O_RollCall;

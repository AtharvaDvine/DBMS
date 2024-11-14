CREATE TABLE Library (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255),
    author VARCHAR(255),
    publisher VARCHAR(255),
    year_published INT
);

CREATE TABLE Library_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    book_id INT,
    old_book_name VARCHAR(255),
    old_author VARCHAR(255),
    old_publisher VARCHAR(255),
    old_year_published INT,
    change_date DATETIME
);

DELIMITER $$

CREATE TRIGGER before_library_update
BEFORE UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (action_type, book_id, old_book_name, old_author, old_publisher, old_year_published, change_date)
    VALUES ('UPDATE', OLD.book_id, OLD.book_name, OLD.author, OLD.publisher, OLD.year_published, NOW());
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_library_delete
AFTER DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (action_type, book_id, old_book_name, old_author, old_publisher, old_year_published, change_date)
    VALUES ('DELETE', OLD.book_id, OLD.book_name, OLD.author, OLD.publisher, OLD.year_published, NOW());
END $$

DELIMITER ;

INSERT INTO Library (book_id, book_name, author, publisher, year_published)
VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925);

INSERT INTO Library (book_id, book_name, author, publisher, year_published)
VALUES (2, '1984', 'George Orwell', 'Secker & Warburg', 1949);

UPDATE Library
SET book_name = 'The Great Gatsby (Updated)', author = 'F. Scott Fitzgerald', year_published = 1926
WHERE book_id = 1;

DELETE FROM Library
WHERE book_id = 2;

SELECT * FROM Library_Audit;



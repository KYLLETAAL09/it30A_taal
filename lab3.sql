create table books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(50) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_publisher VARCHAR(50) NOT NULL,
    book_year INT
);

INSERT INTO books (book_title, book_author, book_publisher, book_year) VALUES 
("Life-Study of Genesis","Witness Lee","Spiritual Growth", 2000),
     ("Life-Study of Exodus","Witness Lee","Study of the Bible", 2001),
     ("Life-Study of Acts","Witness Lee","Spiritual Growth", 2002),

CRREATE TABLE borrow(
        borrow_id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT NOT NULL,
        book_id INT NOT NULL,

        borrow_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        borrow_return_date TIMESTAMP NULL DEFAULT NULL,

        CONSTRAINT fk_borrow_student FOREIGN KEY (student_id)
          REFERENCES students(student_id) ,

          CONSTRAINT fk_borrow_student FOREIGN KEY (book_id)
            REFERENCES books(book_id)
);

INSERT INTO borrrow (student_id,book_id) VALIUES
(1,2),
(2,1),
(3,3);
create table books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(50) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_category VARCHAR(50) NOT NULL,
);

INSERT INTO books (book_title,book_author,book_category) VALUES 
("Life-Study of Genesis","Witness Lee","Spiritual Growth");


CREATE TABLE borrow(
        borrow_id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT NOT NULL,
        book_id INT NOT NULL,

        borrow_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        borrow_return_date TIMESTAMP NULL DEFAULT NULL,

        CONSTRAINT fk_borrow_student FOREIGN KEY (student_id)
          REFERENCES students(student_id),


        CONSTRAINT fk_borrow_book FOREIGN KEY (book_id)
          REFERENCES books(book_id)
);

INSERT INTO borrow (student_id,book_id) VALUES
(1,2);


SELECT
     br.borrow_id,

  
     CONCAT(
        s.student_first_name,
        '',
        s.student_last_name
     ) as student_name,
     

     b.book_tiitle,
     b.book_author,
     b.book_category,

     br.borrow_date,
     br.borrow_retun_date
     FROM borrow br
     JOIN student s ON
       br.student_id = s.student_id
     JOIN books b ON
         br.book_id = b.book_id

      WHERE br.borrow_return_date IS NOT NULL
      ORDER BY br.borrow_date DESC;
      
    UPDATE borrow
    SET borrow_return_date = CURRENT_TIMESTAMP
    WHERE borrow_id = 1 AND borrow_return_date IS NOT NULL;
    
      SELECT
           br.borrow_id,

      CONCAT(
           s.student_first_name,
           ' ',
           s.student_last_name
      ) as student_name,

      b.book_title,
      b.book_author,
      b.book_category,

      br.borrow_date,
      br.borrow_return_date
  FROM borrow br
  JOIN students s ON 
       br.student_id = s.student_id
  JOIN books b ON 
       br.book_id = b.book_id

 WHERE br.borrow_return_date is NOT NULL
 ORDER BY br.borrow_date DESC;    

 UPDATE borrow
 SET borrow_return_date = CURRENT_TIMESTAMP
 WHERE borrow_id = 1 AND borrow_return_date IS NULL
 ORDER BY borrow_date DESC;

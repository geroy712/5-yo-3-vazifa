
CREATE TABLE school (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(150),
    phone_number CHAR(15),
    davlat_maktabi BOOLEAN
);

CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number CHAR(15),
    school_id INT REFERENCES school(id)
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    school_id INT REFERENCES school(id)
);

CREATE TABLE class (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    teacher_id INT REFERENCES teacher(id),
    school_id INT REFERENCES school(id)
);

CREATE TABLE subject (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class_id INT REFERENCES class(id),
    teacher_id INT REFERENCES teacher(id)
);

CREATE TABLE enrollment (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    class_id INT REFERENCES class(id),
    enrollment_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE grade (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    subject_id INT REFERENCES subject(id),
    grade_value INT,
    date_given TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(id),
    class_id INT REFERENCES class(id),
    date DATE DEFAULT CURRENT_DATE
);
INSERT INTO school (name, address, phone_number, davlat_maktabi)
VALUES 
('Oltinsoy Maktabi', 'Tashkent Street 10', '1234567890', TRUE),
('Yangiobod Maktabi', 'Samarqand Street 20', '0987654321', FALSE);

INSERT INTO teacher (first_name, last_name, email, phone_number, school_id)
VALUES 
('Ali', 'Valiyev', 'ali@gmail.com', '1122334455', 1),
('Bobur', 'Karimov', 'bobur@gmail.com', '9988776655', 2);

INSERT INTO student (first_name, last_name, date_of_birth, gender, school_id)
VALUES 
('Aziz', 'Ismoilov', '2010-05-20', 'M', 1),
('Dilnoza', 'Tursunova', '2011-06-15', 'F', 2);
SELECT id, first_name, last_name, TO_CHAR(date_of_birth, 'YYYY-MM-DD') AS birth_date
FROM student;
ALTER TABLE school RENAME TO schools;
ALTER TABLE teacher RENAME TO teachers;

ALTER TABLE student RENAME COLUMN first_name TO fname;
ALTER TABLE student RENAME COLUMN last_name TO lname;
ALTER TABLE grade RENAME COLUMN grade_value TO score;
ALTER TABLE student ADD COLUMN middle_name VARCHAR(50);
ALTER TABLE student ADD COLUMN email VARCHAR(100);

ALTER TABLE class DROP COLUMN teacher_id;
UPDATE school SET address = 'Buxoro Street 5' WHERE id = 1;
UPDATE teacher SET email = 'new_email@gmail.com' WHERE id = 2;
UPDATE student SET first_name = 'Alisher' WHERE id = 1;
UPDATE student SET last_name = 'Rasulov' WHERE id = 2;
DELETE FROM grade WHERE id = 1;
DELETE FROM attendance WHERE id = 2;
DELETE FROM enrollment WHERE id = 1;
DELETE FROM subject WHERE id = 1;


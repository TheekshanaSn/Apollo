CREATE TABLE student
(
    student_id VARCHAR(15),
    acedemic_year YEAR NOT NULL, 
    status VARCHAR(10) NOT NULL,
    st_nic VARCHAR(15) NOT NULL,
    dob DATE,
    department VARCHAR(10),
    PRIMARY KEY(student_id),
    FOREIGN KEY (st_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE student_course_unit
(
    student_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);


CREATE TABLE technical_officer_course_unit
(
    to_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (to_id, course_code),
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);


--Insert data into student table
INSERT INTO student(student_id, acedemic_year, status, st_nic, dob, department)
VALUES
('TG1376', 2024, 'proper', '200123567856', '2002-10-24', 'ICT'),
('TG1398', 2024, 'proper', '200202676389', '2002-02-08', 'ICT'),
('TG1366', 2024, 'proper', '200220803567', '2002-03-20', 'ICT'),
('TG1353', 2024, 'proper', '200290898983', '2002-04-13', 'ICT'),
('TG1474', 2024, 'proper', '200023676276', '2002-09-30', 'ET'),
('TG1444', 2024, 'proper', '200245357872', '2002-03-07', 'ET'),
('TG1610', 2024, 'proper', '200266989943', '2000-09-24', 'BST'),
('TG1605', 2024, 'proper', '200256789387', '2001-11-08', 'BST'),
('TG1393', 2024, 'suspended', '200223537858', '2002-12-22', 'ICT'),
('TG1688', 2024, 'suspended', '200256687748', '2002-01-17', 'BST'),
('TG1024', 2023, 'repeat', '200123564765', '2001-05-24', 'ET'),
('TG987', 2023, 'repeat', '200078774675', '2000-02-10', 'ET'),
('TG1123', 2023, 'repeat', '200066455876', '2000-08-15', 'BST'),
('TG1276', 2023, 'repeat', '200123645434', '2001-06-20', 'BST'),
('TG765', 2022, 'repeat', '200123546384', '2001-02-18', 'ICT');





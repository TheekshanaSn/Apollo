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
    student_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);


CREATE TABLE technical_officer_course_unit
(
    to_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (to_id, course_code),
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);


------------------------Create Accounts-----------------------------------------

CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'dean'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON apollo.* TO 'dean'@'localhost';

CREATE USER 'lecturer'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON apollo.* TO 'lecturer'@'localhost';

CREATE USER 'technical_officer'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE ON apollo.Attendance TO 'tech_officer'@'localhost';

CREATE USER 'student'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON apollo.Attendance TO 'student'@'localhost';
GRANT SELECT ON apollo.Marks TO 'student'@'localhost';


FLUSH PRIVILEGES;
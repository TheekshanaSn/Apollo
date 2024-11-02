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

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpwd';
GRANT ALL PRIVILEGES ON apollo.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'dean'@'localhost' IDENTIFIED BY 'deanpwd';
GRANT ALL PRIVILEGES ON apollo.* TO 'dean'@'localhost';

CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecturerpwd';
GRANT SELECT, INSERT, UPDATE, DELETE ON apollo.* TO 'lecturer'@'localhost';

CREATE USER 'technical_officer'@'localhost' IDENTIFIED BY 'topwd';
GRANT SELECT, INSERT, UPDATE ON apollo.Attendance TO 'technical_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON apollo.view_attendance_percentage TO 'technical_officer'@'localhost';


CREATE USER 'technical_officer'@'localhost' IDENTIFIED BY 'technical_officer_password';
GRANT SELECT, INSERT, UPDATE ON apollo.Attendance TO 'technical_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON apollo.view_attendance_percentage TO 'technical_officer'@'localhost';


CREATE USER 'student'@'localhost' IDENTIFIED BY 'student_password';
GRANT SELECT ON apollo.view_attendance_summary_individual TO 'student'@'localhost';
GRANT SELECT ON apollo.view_final_marks_individual TO 'student'@'localhost';
GRANT SELECT ON apollo.view_grades_individual TO 'student'@'localhost';


FLUSH PRIVILEGES;

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

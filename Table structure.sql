CREATE TABLE technical_officer
(
    to_id VARCHAR(15),
    to_nic VARCHAR(15)  NOT NULL,
     PRIMARY KEY(to_id),
    FOREIGN KEY (to_nic) REFERENCES user(u_nic) ON DELETE CASCADE
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
)
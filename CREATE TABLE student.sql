CREATE TABLE technical_officer
(
    to_id VARCHAR(15),
    to_nic VARCHAR(15)  NOT NULL,
     PRIMARY KEY(to_id),
    FOREIGN KEY (to_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE admin
(
    admin_id VARCHAR(15),
    ad_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(admin_id),
    FOREIGN KEY (ad_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE marks
(
    
    student_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    Q1 INT CHECK (Q1 BETWEEN 0 AND 100), 
    Q2 INT CHECK (Q2 BETWEEN 0 AND 100),
    Q3 INT CHECK (Q3 BETWEEN 0 AND 100),
    assessment_mark INT CHECK (assessment_mark BETWEEN 0 AND 100),
    mid_exam_theory INT CHECK (mid_exam_theory BETWEEN 0 AND 100),
    mid_exam_practical INT CHECK (mid_exam_practical BETWEEN 0 AND 100),
    final_exam_theory INT CHECK (final_exam_theory BETWEEN 0 AND 100),
    final_exam_practical INT CHECK (final_exam_practical BETWEEN 0 AND 100),
    
   
    PRIMARY KEY(student_id,course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

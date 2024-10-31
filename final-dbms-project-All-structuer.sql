-- Theekshana
 CREATE TABLE User
(
    u_nic VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    f_name VARCHAR(20),
    l_name VARCHAR(20), 
    address VARCHAR (50),
     gender CHAR(1),
    PRIMARY KEY(u_nic)
   
);

-- Theekshana
CREATE TABLE user_phone
(
    p_u_nic VARCHAR(15),
    u_phone VARCHAR(15),
    PRIMARY KEY (p_u_nic,u_phone),
    FOREIGN KEY(p_u_nic) REFERENCES user(u_nic) ON DELETE CASCADE
    
);

-- Theekshana

CREATE TABLE Medical(
     medical_id  VARCHAR(15),
     med_student_id VARCHAR(15),
     date DATE,
     PRIMARY KEY(medical_id),
     FOREIGN KEY(med_student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

-- Theekshana
CREATE TABLE Attendance
(
    attendance_id VARCHAR(15),
    at_student_id VARCHAR(15),
    at_course_code VARCHAR(15),
    at_course_type VARCHAR(10),
    date DATE,
    attendence VARCHAR(20),
    medical_status VARCHAR(15),
    session_no INT NOT NULL,
    at_to_id VARCHAR(15),
    PRIMARY KEY(attendance_id),
    FOREIGN KEY (medical_status) REFERENCES medical(medical_id) ON DELETE CASCADE,
    FOREIGN KEY (at_student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (at_course_code,at_course_type) REFERENCES course_unit(course_code,type) ON DELETE CASCADE,
    FOREIGN KEY (at_to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);




-- Dinidu

CREATE TABLE student
(
    student_id VARCHAR(15),
    acedemic_year YEAR NOT NULL, 
    status VARCHAR(10) NOT NULL,
    st_nic VARCHAR(15) NOT NULL,
    dob DATE,
    department VARCHAR(10),
    PRIMARY KEY(student_id),
    FOREIGN KEY (st_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Dinudu

CREATE TABLE student_course_unit
(
    student_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

-- Dinidu
CREATE TABLE technical_officer_course_unit
(
    to_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (to_id, course_code),
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

-- Nimash
CREATE TABLE lecturer
(
    lecturer_id VARCHAR(15),
    department VARCHAR(70) NOT NULL, 
    lc_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(lecturer_id),
    FOREIGN KEY(lc_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Nimesh

CREATE TABLE dean
(
    dean_id VARCHAR(15),
    dean_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(dean_id),
    FOREIGN KEY (dean_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Nimesh
CREATE TABLE course_unit
(
    course_code VARCHAR(15),
    name VARCHAR(50) NOT NULL, 
    type VARCHAR(20) ,
    credit INT NOT NULL CHECK (credit > 0 AND credit < 4), 
    c_to_id VARCHAR(15),
    c_lecturer_id VARCHAR(15),
    PRIMARY KEY(course_code,type),
    FOREIGN KEY (c_to_id) REFERENCES technical_officer(to_id) ON DELETE SET NULL, 
    FOREIGN KEY (c_lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE SET NULL
);






-- Sasidu
CREATE TABLE admin
(
    admin_id VARCHAR(15),
    ad_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(admin_id),
    FOREIGN KEY (ad_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Sasindu
CREATE TABLE technical_officer
(
    to_id VARCHAR(15),
    to_nic VARCHAR(15)  NOT NULL,
     PRIMARY KEY(to_id),
    FOREIGN KEY (to_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Sasiru
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




 CREATE TABLE User
(
    u_nic VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    f_name VARCHAR(20),
    l_name VARCHAR(20), 
    /*ADD*/ address VARCHAR (50),
   /*ADD*/ gender CHAR(1),
    PRIMARY KEY(u_nic)
   
);

CREATE TABLE User_Phone
(
    p_u_nic VARCHAR(15),
    u_phone VARCHAR(15),
    PRIMARY KEY (p_u_nic,u_phone),
    FOREIGN KEY(p_u_nic) REFERENCES user(u_nic) ON DELETE CASCADE
    
);

<<<<<<< Updated upstream

CREATE TABLE Medical(
     medical_id  VARCHAR(15),
     med_student_id VARCHAR(15),
     date DATE,
     PRIMARY KEY(medical_id),
     FOREIGN KEY(med_student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

=======
>>>>>>> Stashed changes
CREATE TABLE Attendance
(
    attendance_id VARCHAR(15),
    at_student_id VARCHAR(15),
    at_course_code VARCHAR(15),
    at_course_type(T/P) VARCHAR(10),
--    /*not now*/ eligibility VARCHAR(8) NOT NULL,
<<<<<<< Updated upstream
    date DATE,
    attendence VARCHAR(20),
    medical_status VARCHAR(15),
=======
    date DATE ,
    attendance VARCHAR(15),
>>>>>>> Stashed changes
    session_no INT NOT NULL,
    at_to_id VARCHAR(15),
    PRIMARY KEY(attendance_id),
    FOREIGN KEY (at_student_id) REFERENCES student(student_id) ON DELETE CASCADE,
<<<<<<< Updated upstream
    FOREIGN KEY (at_course_code,at_course_type) REFERENCES course_unit(course_code,type) ON DELETE CASCADE,
=======
    FOREIGN KEY (at_course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
>>>>>>> Stashed changes
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);


CREATE TABLE Medical
(
medical_id VARCHAR(15),
med_student_id VARCHAR(15),
-- tech_officer_id VARCHAR(15),
date  DATE,
PRIMARY KEY (medical_id),
FOREIGN KEY (med_student_id) REFERENCES student(student_id),
-- FOREIGN KEY (tech_officer_id) REFERENCES technical_officer(to_id)
);







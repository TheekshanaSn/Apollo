

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

CREATE TABLE user_phone
(
    p_u_nic VARCHAR(15),
    u_phone VARCHAR(15),
    PRIMARY KEY (p_u_nic,u_phone),
    FOREIGN KEY(p_u_nic) REFERENCES user(u_nic) ON DELETE CASCADE
    
);


CREATE TABLE Medical(
     medical_id  VARCHAR(15),
     med_student_id VARCHAR(15),
     date DATE,
     PRIMARY KEY(medical_id),
     FOREIGN KEY(med_student_id) REFERENCES student(student_id) ON DELETE CASCADE
);

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








 CREATE TABLE user
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

CREATE TABLE attendance
(
    -- attendance_id VARCHAR(15),
    at_student_id VARCHAR(15),
    at_course_code VARCHAR(15),
    type(T/P) VARCHAR(10),
--    /*not now*/ eligibility VARCHAR(8) NOT NULL,
    date DATE ,
    medical_status VARCHAR(15),
    session_no INT NOT NULL,
    to_id VARCHAR(15),
    PRIMARY KEY(at_student_id,at_course_code),
    FOREIGN KEY (at_student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (at_course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE,
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);





 CREATE TABLE user
(
    u_nic VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    f_name VARCHAR(20),
    l_name VARCHAR(20), 
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
    attendance_id VARCHAR(15),
    type VARCHAR(10) NOT NULL,
    eligibility VARCHAR(8) NOT NULL,
    date DATE NOT NULL,
    student_id VARCHAR(15) NOT NULL,
    to_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(attendance_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);



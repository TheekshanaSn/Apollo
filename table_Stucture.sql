CREATE TABLE lecturer
(
    lecturer_id VARCHAR(15),
    department VARCHAR(70) NOT NULL, 
    lc_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(lecturer_id),
    FOREIGN KEY (lc_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE dean
(
    dean_id VARCHAR(15),
    dean_nic VARCHAR(15) NOT NULL,
     PRIMARY KEY(dean_id),
    FOREIGN KEY (dean_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);
CREATE TABLE course_unit
(
    course_code VARCHAR(15),
    name VARCHAR(50) NOT NULL, 
    type VARCHAR(20) NOT NULL,
    credit INT NOT NULL CHECK (credit > 0 AND credit < 4), 
    lecturer_incharge VARCHAR(50),
    c_to_id VARCHAR(15) NOT NULL,
    c_lecturer_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(course_code),
    FOREIGN KEY (c_to_id) REFERENCES technical_officer(to_id) ON DELETE SET NULL, 
    FOREIGN KEY (c_lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE SET NULL
);
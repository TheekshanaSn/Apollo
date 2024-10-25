-- Theekshana
 CREATE TABLE user
(
    u_nic VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    PRIMARY KEY(u_nic)
    -- Changed to VARCHAR for flexibility, allows for different phone formats
);

-- Theekshana
CREATE TABLE user_phone
(
    p_u_nic VARCHAR(15),
    u_phone VARCHAR(15),
    PRIMARY KEY (p_u_nic,u_phone),
    FOREIGN KEY(p_u_nic) REFERENCES user(u_nic) ON DELETE CASCADE
    
);


-- Table for student details
-- Sasiru
CREATE TABLE student
(
    student_id VARCHAR(15),
    acedemic_year DATE NOT NULL, -- Renamed 'year' to 'enrollment_year' for clarity
    status VARCHAR(10) NOT NULL,
    st_nic VARCHAR(15) NOT NULL,
    gender CHAR(1),
    dob DATE,
     PRIMARY KEY(student_id),
    FOREIGN KEY (st_nic) REFERENCES user(u_nic) ON DELETE CASCADE -- Cascade delete for better data consistency
);

-- Table for lecturer details
-- Jira
CREATE TABLE lecturer
(
    lecturer_id VARCHAR(15),
    department VARCHAR(70) NOT NULL, -- Increased department name length for more descriptive values
    lc_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(lecturer_id),
    FOREIGN KEY (lc_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Table for admin details
-- Sasiru
CREATE TABLE admin
(
    admin_id VARCHAR(15),
    ad_nic VARCHAR(15) NOT NULL,
    PRIMARY KEY(admin_id),
    FOREIGN KEY (ad_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Table for dean details
-- Jira
CREATE TABLE dean
(
    dean_id VARCHAR(15),
    dean_nic VARCHAR(15) NOT NULL,
     PRIMARY KEY(dean_id),
    FOREIGN KEY (dean_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Table for technical officer details
-- Dinudu
CREATE TABLE technical_officer
(
    to_id VARCHAR(15),
    to_nic VARCHAR(15)  NOT NULL,
     PRIMARY KEY(to_id),
    FOREIGN KEY (to_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

-- Table for course units
-- Jira
CREATE TABLE course_unit
(
    course_code VARCHAR(15),
    name VARCHAR(50) NOT NULL, -- Increased length for more descriptive course names
    type VARCHAR(20) NOT NULL,
    credit INT NOT NULL CHECK (credit > 0 AND credit < 4), -- Added a check constraint to ensure credits are positive
    lecturer_incharge VARCHAR(50),
    c_to_id VARCHAR(15),
    c_lecturer_id VARCHAR(15),
    PRIMARY KEY(course_code),
    FOREIGN KEY (c_to_id) REFERENCES technical_officer(to_id) ON DELETE SET NULL, -- Set to NULL on delete for flexibility
    FOREIGN KEY (c_lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE SET NULL
);

-- Table linking students to course units
-- Dinudu
CREATE TABLE student_course_unit
(
    student_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

-- Table linking technical officers to course units
-- Dinidu
CREATE TABLE technical_officer_course_unit
(
    to_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (to_id, course_code),
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

-- Table for storing marks

-- Sasiru
CREATE TABLE marks
(
    mark_id VARCHAR(15),
    eligibility VARCHAR(15) NOT NULL,
    Q1 INT CHECK (Q1 BETWEEN 0 AND 100), -- Added check constraint for valid marks range
    Q2 INT CHECK (Q2 BETWEEN 0 AND 100),
    Q3 INT CHECK (Q3 BETWEEN 0 AND 100),
    assessment_mark INT CHECK (assessment_mark BETWEEN 0 AND 100),
    mid_exam_theory INT CHECK (mid_exam_theory BETWEEN 0 AND 100),
    mid_exam_practical INT CHECK (mid_exam_practical BETWEEN 0 AND 100),
    final_exam_theory INT CHECK (final_exam_theory BETWEEN 0 AND 100),
    final_exam_practical INT CHECK (final_exam_practical BETWEEN 0 AND 100),
    grade CHAR(1),
    student_id VARCHAR(15) NOT NULL,
    course_code VARCHAR(15) NOT NULL,
    PRIMARY KEY(mark_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

-- Table for attendance records
-- Theekshana
CREATE TABLE attendance
(
    attendance_id VARCHAR(15),
    type VARCHAR(10) NOT NULL,
    /*not now*/ eligibility VARCHAR(8) NOT NULL,
    date DATE NOT NULL,
    student_id VARCHAR(15) NOT NULL,
    to_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(attendance_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);
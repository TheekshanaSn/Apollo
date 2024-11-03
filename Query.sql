-----------Lecture details--------------
CREATE VIEW lecture_detail AS
SELECT l.lecturer_id, l.department, l.lc_nic, u.email, u.f_name, u.l_name, u.address, u.gender
FROM lecturer l INNER JOIN user u
ON l.lc_nic = u.u_nic;

select * from lecture_detail;


-------------------------------Student Details--------------------------------------
CREATE VIEW Student_details AS
SELECT s.student_id, s.department, s.acedemic_year, s.st_nic, CONCAT(u.f_name, ' ', u.l_name) AS Name, u.gender, u.email, u.address, s.status
FROM student s INNER JOIN user u
ON s.st_nic = u.u_nic;

SELECT * FROM Student_details;


--------------------course of student----------------------
DELIMITER //

CREATE PROCEDURE course_student(IN c_code VARCHAR(10))
BEGIN
SELECT su.student_id, CONCAT(u.f_name, ' ' , u.l_name) AS "Student Name"
FROM student_course_unit su INNER JOIN student s
ON su.student_id = s.student_id
INNER JOIN user u ON s.st_nic = u.u_nic
WHERE su.course_code = c_code;
END //

DELIMITER ;

call course_student('ICT1212');



-----------------Check student quize marks-----------------------

DELIMITER //

CREATE PROCEDURE check_quize_marks(IN st_id VARCHAR(10))
BEGIN
SELECT course_code AS "Course code", ((Q1 + Q2 + Q3 - LEAST(Q1, LEAST(Q2, Q3))) / 2) * 0.05 AS "Five_Percent_Average_Quiz_Score"
FROM marks
WHERE student_id = st_id;
END //

DELIMITER ;

CALL check_quize_marks('TG1444');


--------------Student SGPA -----------------
CREATE VIEW Student_SGPA AS
SELECT 
    student_id,
    CASE 
        WHEN total_credits > 0 THEN ROUND(total_grade_points / total_credits, 5)
        ELSE 0.00000
    END AS SGPA
FROM 
    (SELECT 
        s.student_id,
        SUM(CASE 
                WHEN s.grade = 'A+' THEN 4.0
                WHEN s.grade = 'A' THEN 4.0
                WHEN s.grade = 'A-' THEN 3.7
                WHEN s.grade = 'B+' THEN 3.3
                WHEN s.grade = 'B' THEN 3.0
                WHEN s.grade = 'B-' THEN 2.7
                WHEN s.grade = 'C+' THEN 2.3
                WHEN s.grade = 'C' THEN 2.0
                WHEN s.grade = 'C-' THEN 1.7
                WHEN s.grade = 'D+' THEN 1.3
                WHEN s.grade = 'D' THEN 1.0
                WHEN s.grade = 'E' THEN 0.7
                WHEN s.grade = 'E*' THEN 0.5
                WHEN s.grade = 'F' THEN 0.0
                ELSE 0
            END) AS total_grade_points,
        COUNT(s.course_code) AS total_credits
     FROM 
        student_final_grades3 s
     WHERE 
        s.course_code != 'ENG1222'  -- Exclude the specified course
     GROUP BY 
        s.student_id) AS grades_summary;


select * from Student_SGPA;
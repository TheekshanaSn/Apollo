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
CREATE VIEW sgpa AS
SELECT
    CONCAT(u.f_name, " ", u.l_name) AS "FULL NAME",
    grades_summary.student_id,
    (grades_summary.total_grade_points / NULLIF(grades_summary.total_credits, 0)) AS sgpa
FROM
    (SELECT
        s.student_id,
        SUM(CASE
                WHEN s.grade = 'A+' THEN c.credit * 4.0
                WHEN s.grade = 'A' THEN c.credit * 4.0
                WHEN s.grade = 'A-' THEN c.credit * 3.7
                WHEN s.grade = 'B+' THEN c.credit * 3.3
                WHEN s.grade = 'B' THEN c.credit * 3.0
                WHEN s.grade = 'B-' THEN c.credit * 2.7
                WHEN s.grade = 'C+' THEN c.credit * 2.3
                WHEN s.grade = 'C' THEN c.credit * 2.0
                WHEN s.grade = 'C-' THEN c.credit * 1.7
                WHEN s.grade = 'D+' THEN c.credit * 1.3
                WHEN s.grade = 'D' THEN c.credit * 1.0
                WHEN s.grade = 'E' THEN c.credit * 0.7
                WHEN s.grade = 'E*' THEN c.credit * 0.5
                WHEN s.grade = 'F' THEN c.credit * 0.0
                ELSE 0
            END) AS total_grade_points,
        SUM(c.credit) AS total_credits
     FROM
        student_final_grades s
     JOIN course_unit c ON s.course_code = c.course_code
     
     GROUP BY s.student_id) AS grades_summary
JOIN student st ON grades_summary.student_id = st.student_id
JOIN user u ON u.u_nic = st.st_nic;

select * from sgpa;

--------------student Age---------------------
DELIMITER //
CREATE PROCEDURE st_age(IN st_id VARCHAR(10))
BEGIN
	SELECT student_id,
	year(curdate()) - year(dob) AS Age
	FROM student
	WHERE student_id = st_id;
END //
DELIMITER ;

call st_age('TG1444');
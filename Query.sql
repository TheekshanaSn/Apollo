-----------Lecture details--------------
CREATE VIEW lecture_detail AS
SELECT l.lecturer_id, l.department, l.lc_nic, u.email, u.f_name, u.l_name, u.address, u.gender
FROM lecturer l INNER JOIN user u
ON l.lc_nic = u.u_nic;

select * from lecture_detail;


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
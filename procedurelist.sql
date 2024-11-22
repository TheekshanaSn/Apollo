DELIMITER $$

CREATE PROCEDURE course_details(IN C_code VARCHAR(15))
BEGIN
   SELECT c.course_code AS "COURSE CODE",
          c.name AS "NAME",
          c.type AS "COURSE TYPE",
          c.credit AS "CREDIT VALUE",
          CONCAT(u.f_name, " ", u.l_name) AS "LECTURER NAME"
   FROM course_unit AS c
   JOIN lecturer AS l ON c.c_lecturer_id = l.lecturer_id
   JOIN user AS u ON u.u_nic = l.lc_nic
   WHERE c.course_code = C_code;
END $$

DELIMITER ;

CALL course_details("ENG1222");


DELIMITER $$

CREATE PROCEDURE student_course(IN student_id VARCHAR(15))
BEGIN
    SELECT cu.course_code AS "COURSE CODE",
	       cu.name AS "COURSE NAME",
		   cu.type AS "TYPE"
    FROM student AS s 
    JOIN student_course_unit AS scu ON s.student_id = scu.student_id
    JOIN course_unit AS cu ON cu.course_code = scu.course_code
    WHERE s.student_id = student_id; 
END $$

DELIMITER ;


CALL student_course('TG1376');

SELECT
    CONCAT(u.f_name, " ", u.l_name) AS "FULL NAME",
    grades_summary.student_id,
    (grades_summary.total_grade_points / NULLIF(grades_summary.total_credits, 0)) AS cgpa
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
     WHERE
        s.course_code != 'ENG1222' 
     GROUP BY s.student_id) AS grades_summary
JOIN student st ON grades_summary.student_id = st.student_id
JOIN user u ON u.u_nic = st.st_nic;

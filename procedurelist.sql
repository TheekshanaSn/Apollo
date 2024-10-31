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
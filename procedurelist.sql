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
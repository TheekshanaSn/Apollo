--Attendance Related Function--


--All studence Attendance Only Theory above 80 present without Medical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='T'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;



--All studence Attendance Only Pactical above 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='P'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;


--All studence Attendance Theory and Pactical above 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='TP'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;






--All student Attendance, Subject by Subject with Medical
--view table
CREATE OR REPLACE VIEW All_Attendance AS
SELECT at_student_id,at_course_code,COUNT( attendance_id)/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' OR medical_status IS NOT NULL
GROUP BY at_course_code,at_Student_id ORDER BY at_student_id;


 SELECT * FROM all_attendance;






--All studence Attendance above 80 present with Medical only Theory

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='T' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;


 --All studence Attendance above 80 present with Medical only Practical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='P' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;


--All studence Attendance above 80 present with Medical Theory and Practical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 as 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='TP' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;



-- CREATE PROCEDURE Function to view attendance by Student
DELIMITER //
CREATE PROCEDURE attendance_for_subject ( student VARCHAR(15),type VARCHAR(10) )
BEGIN
SELECT at_student_id,at_course_code,COUNT( attendance_id)/15*100 AS 'Percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance
WHERE at_student_id=student AND at_course_type=type  AND (attendance='Present' OR medical_status IS NOT NULL)
GROUP BY at_course_code;
End//
DELIMITER ;


CALL attendance_for_subject('TG1366','T');





--View  With Attendance with medical only theory
CREATE VIEW attendance_with_medical_theory AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='T' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;


--View  With Attendance with medical only pactical
CREATE VIEW attendance_with_medical_pactical AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='P' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;



--View  With Attendance with medical only theory and pactical
CREATE VIEW attendance_with_medical_theory_and_pactical AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='TP' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;





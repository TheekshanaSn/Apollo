--Attendance Related Function--


--All studence Attendance Only Theory above 80 present without Medical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='T'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;


--All studence Attendance Only Pactical above 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='P'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;


--All studence Attendance Theory and Pactical above 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='TP'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)>=80 ORDER BY at_student_id;





-- 80% > attendance_percentage student---->


--All studence Attendance Only Theory less 80 present without Medical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='T'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)<80 ORDER BY at_student_id;



--All studence Attendance Only Pactical less 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='P'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)<80 ORDER BY at_student_id;


--All studence Attendance Theory and Pactical less 80 present without Medical
SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' AND at_course_type='TP'
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))*100/15)<80 ORDER BY at_student_id;








--All student Attendance with Medical
--view table
CREATE OR REPLACE VIEW All_Attendance AS
SELECT at_student_id,at_course_code,COUNT( attendance_id)/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE Attendance = 'Present' OR medical_status IS NOT NULL
GROUP BY at_course_code,at_Student_id ORDER BY at_student_id;

 SELECT * FROM all_attendance;


--All student Attendance by theory with Medical
CREATE OR REPLACE VIEW attendance_theory AS 
SELECT at_Student_id,at_course_code,COUNT(attendance_id)/15*100 AS 'Attendance percentage'
FROM attendance
WHERE at_course_type='T' AND (attendance='present' OR medical_status IS NOT NULL)
GROUP BY  at_Student_id,at_course_code ORDER BY at_student_id;


--All student Attendance by pactical with Medical
CREATE OR REPLACE VIEW attendance_pactical AS 
SELECT at_Student_id,at_course_code,COUNT(attendance_id)/15*100 AS 'Attendance percentage'
FROM attendance
WHERE at_course_type='P' AND (attendance='present' OR medical_status IS NOT NULL)
GROUP BY  at_Student_id,at_course_code ORDER BY at_student_id;


--All student Attendance by theory and pactical with Medical
CREATE OR REPLACE VIEW attendance_theory_and_pactical AS 
SELECT at_Student_id,at_course_code,COUNT(attendance_id)/15*100 AS 'Attendance percentage'
FROM attendance
WHERE at_course_type='TP' AND (attendance='present' OR medical_status IS NOT NULL)
GROUP BY  at_Student_id,at_course_code ORDER BY at_student_id;









--All studence Attendance above 80 present with Medical only Theory

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='T' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;


 --All studence Attendance above 80 present with Medical only Practical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='P' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;


--All studence Attendance above 80 present with Medical Theory and Practical

SELECT at_student_id,at_course_code,(COUNT( Attendance_id))/15*100 AS 'Attendance percentage'
FROM Attendance 
WHERE at_course_type='TP' AND (Attendance = 'Present' OR medical_status IS NOT NULL) 
GROUP BY at_student_id,at_course_code
HAVING ((COUNT( Attendance_ID))/15*100)>=80 ORDER BY at_student_id;






-- CREATE PROCEDURE Function to view attendance by Student
DELIMITER //
CREATE PROCEDURE attendance_for_student ( student VARCHAR(15),type VARCHAR(10) )
BEGIN
SELECT at_student_id,at_course_code,COUNT( attendance_id)/15*100 AS 'Percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance
WHERE at_student_id=student AND at_course_type=type  AND (attendance='Present' OR medical_status IS NOT NULL)
GROUP BY at_course_code;
End//
DELIMITER ;

CALL attendance_for_student('TG1366','T');



-- CREATE PROCEDURE Function to view attendance subject by subject 
DELIMITER //
CREATE PROCEDURE attendance_for_subject ( subject VARCHAR(15),type VARCHAR(10) )
BEGIN
SELECT at_course_code,at_student_id,COUNT( attendance_id)/15*100 AS 'Percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance
WHERE at_course_code=subject AND at_course_type=type  AND (attendance='Present' OR medical_status IS NOT NULL)
GROUP BY at_Student_id;
End//
DELIMITER ;

CALL attendance_for_subject('ICT1212','T');







--View  With Attendance and precentage with medical only theory
CREATE VIEW attendance_with_medical_theory AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='T' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;


--View  With Attendance and precentage with medical only pactical
CREATE VIEW attendance_with_medical_pactical AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='P' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;



--View  With Attendance and precentage with medical only theory and pactical
CREATE VIEW attendance_with_medical_theory_and_pactical AS
SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)*100/15)>=80,"Eligible","Not eligible") AS 'Eligibility'
FROM attendance 
WHERE at_course_type='TP' AND (attendance = 'Present' OR medical_status IS NOT NULL)
GROUP BY at_student_id,at_course_code;




--as individuals by giving the registration no..

--as individuals by giving the registration no only theory

SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance 
WHERE at_course_type="T" AND (attendance = 'Present' OR medical_status IS NOT NULL) AND at_Student_id='TG1398'
GROUP BY at_course_code,at_Student_id;

--as individuals by giving the registration no only pactical

SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance 
WHERE at_course_type="P" AND (attendance = 'Present' OR medical_status IS NOT NULL) AND at_Student_id='TG1398'
GROUP BY at_course_code,at_Student_id;

--as individuals by giving the registration no only theory and pactical

SELECT at_student_id,at_course_code,(COUNT( attendance_id))/15*100 AS 'percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance 
WHERE at_course_type="TP" AND  (attendance = 'Present' OR medical_status IS NOT NULL) AND at_Student_id='TG1398'
GROUP BY at_course_code,at_Student_id;





-- CREATE PROCEDURE Function to view attendance by Student
DELIMITER //
CREATE PROCEDURE attendance_for_student_and_course ( student VARCHAR(15),subject VARCHAR(15),type VARCHAR(10) )
BEGIN
SELECT at_student_id,at_course_code,COUNT( attendance_id)/15*100 AS 'Percentage',
IF((COUNT( attendance_id)/15*100)>=80,"Eligible","Not eligible") AS 'Eligiblity'
FROM attendance
WHERE at_student_id=student AND at_course_code=subject AND at_course_type=type AND (attendance='Present' OR medical_status IS NOT NULL)
GROUP BY at_course_code;
End//
DELIMITER ;


CALL attendance_for_student_and_course('TG1366','ICT1212','T');
CALL attendance_for_student_and_course('TG1353','ICT1222','P');
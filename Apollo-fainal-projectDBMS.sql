CREATE DATABASE apollo;
USE apollo;

CREATE TABLE User (
    u_nic VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    f_name VARCHAR(20),
    l_name VARCHAR(20), 
    address VARCHAR(50),
    gender CHAR(1),
    PRIMARY KEY(u_nic)
);

CREATE TABLE technical_officer (
    to_id VARCHAR(15),
    to_nic VARCHAR(15),
    PRIMARY KEY(to_id),
    FOREIGN KEY (to_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE lecturer
(
    lecturer_id VARCHAR(15),
    department VARCHAR(70), 
    lc_nic VARCHAR(15),
    PRIMARY KEY(lecturer_id),
    FOREIGN KEY(lc_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);


CREATE TABLE dean (
    dean_id VARCHAR(15),
    dean_nic VARCHAR(15),
    PRIMARY KEY(dean_id),
    FOREIGN KEY (dean_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE admin (
    admin_id VARCHAR(15),
    ad_nic VARCHAR(15),
    PRIMARY KEY(admin_id),
    FOREIGN KEY (ad_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE student (
    student_id VARCHAR(15),
    acedemic_year YEAR NOT NULL, 
    status VARCHAR(10) NOT NULL,
    st_nic VARCHAR(15),
    dob DATE,
    department VARCHAR(10),
    PRIMARY KEY(student_id),
    FOREIGN KEY (st_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE user_phone (
    p_u_nic VARCHAR(15),
    u_phone VARCHAR(15),
    PRIMARY KEY (p_u_nic, u_phone),
    FOREIGN KEY(p_u_nic) REFERENCES user(u_nic) ON DELETE CASCADE
);

CREATE TABLE course_unit
(
    course_code VARCHAR(15),
    name VARCHAR(50), 
    type VARCHAR(10) ,
    credit INT CHECK (credit > 0 AND credit < 4), 
    c_to_id VARCHAR(15),
    c_lecturer_id VARCHAR(15),
    PRIMARY KEY(course_code,type),
    FOREIGN KEY (c_to_id) REFERENCES technical_officer(to_id) ON DELETE SET NULL, 
    FOREIGN KEY (c_lecturer_id) REFERENCES lecturer(lecturer_id) ON DELETE SET NULL
);



CREATE TABLE student_course_unit (
    student_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

CREATE TABLE technical_officer_course_unit (
    to_id VARCHAR(15),
    course_code VARCHAR(15),
    PRIMARY KEY (to_id, course_code),
    FOREIGN KEY (to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);

CREATE TABLE Medical (
    medical_id VARCHAR(15),
    med_student_id VARCHAR(15),
    date DATE,
    PRIMARY KEY(medical_id),
    FOREIGN KEY (med_student_id) REFERENCES student(student_id) ON DELETE CASCADE
);


CREATE TABLE Attendance (
    attendance_id VARCHAR(15),
    at_student_id VARCHAR(15),
    at_course_code VARCHAR(15),
    at_course_type VARCHAR(10),
    date DATE,
    attendence VARCHAR(20),
    medical_status VARCHAR(15),
    session_no INT NOT NULL,
    at_to_id VARCHAR(15),
    PRIMARY KEY(attendance_id),
    FOREIGN KEY (medical_status) REFERENCES medical(medical_id) ON DELETE CASCADE,
    FOREIGN KEY (at_student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (at_course_code, at_course_type) REFERENCES course_unit(course_code, type) ON DELETE CASCADE,
    FOREIGN KEY (at_to_id) REFERENCES technical_officer(to_id) ON DELETE CASCADE
);


CREATE TABLE marks (
    student_id VARCHAR(15),
    course_code VARCHAR(15),
    Q1 INT CHECK (Q1 BETWEEN 0 AND 100), 
    Q2 INT CHECK (Q2 BETWEEN 0 AND 100),
    Q3 INT CHECK (Q3 BETWEEN 0 AND 100),
    assessment_mark INT CHECK (assessment_mark BETWEEN 0 AND 100),
    mid_exam_theory INT CHECK (mid_exam_theory BETWEEN 0 AND 100),
    mid_exam_practical INT CHECK (mid_exam_practical BETWEEN 0 AND 100),
    final_exam_theory INT CHECK (final_exam_theory BETWEEN 0 AND 100),
    final_exam_practical INT CHECK (final_exam_practical BETWEEN 0 AND 100),
    PRIMARY KEY(student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES course_unit(course_code) ON DELETE CASCADE
);


ALTER TABLE attendance
CHANGE attendence attendance VARCHAR(20);



INSERT INTO user(u_nic,email,f_name,l_name,address,gender)
VALUES

('781472419V','saman.ekanayaka77@gmail.com','Saman','Ekanayaka','No. 21 Katharagama Road, Hambanthota','M'),

 ('200123567856','kasun.bandara07@gmail
.com','kasun','bandara','123/4, Temple Road, Kandy ','M'),

('200202676389','nadeesha.ekanayake23@gmail
.com','Nadeesha','Ekanayake','78, Station Road, Galle ','F'),

 ('200220803567','dilini.jayawardena88@gmail
.com','Dilini','Jayawardana','No. 32, Green Lane, Nugegoda ','F'),

 ('200290898983','lahiru.sadaruwan15@gmail
.com','Lahiru','Sadaruwan','56/7A, Lake Road, Nuwara Eliya ','M'),

 ('200023676276','sajith.gunaratne56@gmail
.com','Sajiith','Madushan','21, Park Avenue, Ratnapura','M'),

 ('200245357872','harsha.weerasinghe34@gmail
.com','Harsha','Devappriya','89, Hill Street, Matara','M'),

 ('200266989943','tharindu.rathnayake09@gmail
.com',' Tharindu','Madushan','No. 101, Church Road, Negombo','M'),

 ('200256789387','chathurika.abeysinghe77@gmail
.com','Chathurika','Abeyasinghe','34/2, Riverside Road, Anuradhapura','F'),

('200223537858','lakshman.karumar68@gmail.com','lakshman','kumar','No. 45, Station Road, Badulla','M'),

('200256687748','thushara.jayasinghe271@gmail.com','Thushara','jayasinghe','55, Market Road, Ampara','M'),

('200123564765','supun.chamod126@gmail.com','Supun','Chamod','67, New Town Road, Polonnaruwa ','M'),

('200078774675','gayantha.fernando91@gmail.com','Gayantha','Fernando','9/1, Post Office Road, Kurunegala','M'),

('200066455876','ruwanthi.desilva30@gmail.com','Ruwanthi','Desilva','No. 23, College Avenue, Trincomalee','F'),

('200123645434','nisansala.samarasinghe81@gmail.com','Nisansala','samarasinghe','No. 72, High Street, Kalutara','F'),

('200123546384','chamara.maduranga2001@gmail.com','Chamara','Maduranga','No. 90, Temple Road, Puttalam','M'),

('983223897V','sandun.silva03@gmail.com.com','kasun','bandara','No. 5, School Lane, Jaffna','M'),

('995623567V','krishan.amarasinhe50@gmail.com','krishan','Amarasinhe','No. 41, Circular Road, Mannar','M'),

('983889364V','hansamal.witharana50@gmail.com','Hansamal','Witharana','83, School Lane, Dehiwala','M'),

('987865786V','namal.kumara564@gmail.com','Namal','Kumara','No. 28, Lake Drive, Gampaha','M'),

('990623567V','isuru.dealwis04@gmail.com','Isuru','dealwis','14, Park View, Kegalle','M'),

('628776349V','nuwantha.wickramasinghe45@gmail.com','Nuwantha','wickramasinghe','48/2, Kandy Road, Chilaw ','M'),

 ('978467895V','kumari.hettiarachchi44@gmail.com','Kumari','hettiarachchi','12/3B, Beach Road, Batticaloa','F'),

('995123567V','menaka.kodithuwakku59@gmail.com','Menaka','kodithuwakku','No. 19, Railway Avenue, Hambantota','M'),

('986523567V','malini.gamage18@gmail.com','Malini','Gamage','34/5, Queens Road, Vavuniya','F'),

('985727664V','piumi.abeykoon50@gmail.com','Piumi','abeykoon','75/1, St. Marys Road, Moratuwa','F'),

 ('976458123V', 'kasun.senanayaka07@gmail.com', 'Kasun', 'Senanayaka', 'No. 12/1, Kandy Road, Kurunegala', 'M'),

 ('875412369V', 'nadeesha.ekanayake23@gmail.com', 'Nadeesha', 'Ekanayake', 'No. 24/A, Dharmapala Mawatha, Gampaha', 'F'),
 
('945621378V', 'dilini.jayawardena88@gmail.com', 'Dilini', 'Jayawardena', 'No. 78, Lake Drive, Nuwara Eliya', 'F'),

 ('893246517V', 'lahiru.perera15@gmail.com', 'Lahiru', 'Perera', 'No. 36, Old Matara Road, Galle', 'M'),
 
('852369741V', 'lakmal.gunaratne56@gmail.com', 'Lakmal', 'Gunaratne', 'No. 102, Hospital Road, Batticaloa', 'M');


INSERT INTO technical_officer
VALUES ('To001','983223897V'),
        ('To002','995623567V'),
        ('To003','983889364V'),
        ('To004','987865786V'),
        ('To005','990623567V');


INSERT INTO admin
VALUES ('Ad100','781472419V');


INSERT INTO dean (dean_id,dean_nic)
VALUES
("Lec001","628776349V");


INSERT INTO lecturer(lecturer_id,department,lc_nic)
VALUES 
("Lec001","ICT","628776349V"),
("Lec002","ICT","978467895V"),
("Lec003","ICT","995123567V"),
("Lec004","ET", "986523567V"),
("Lec005","ET", "985727664V"),
("Lec006","BST","976458123V"),
("Lec007","BST","875412369V"),
("Lec008","BST","945621378V"),
("Lec009","MD", "893246517V"),
("Lec010","MD", "852369741V");


INSERT INTO student(student_id, acedemic_year, status, st_nic, dob, department)
VALUES
('TG1376', 2024, 'proper', '200123567856', '2002-10-24', 'ICT'),
('TG1398', 2024, 'proper', '200202676389', '2002-02-08', 'ICT'),
('TG1366', 2024, 'proper', '200220803567', '2002-03-20', 'ICT'),
('TG1353', 2024, 'proper', '200290898983', '2002-04-13', 'ICT'),
('TG1474', 2024, 'proper', '200023676276', '2002-09-30', 'ET'),
('TG1444', 2024, 'proper', '200245357872', '2002-03-07', 'ET'),
('TG1610', 2024, 'proper', '200266989943', '2000-09-24', 'BST'),
('TG1605', 2024, 'proper', '200256789387', '2001-11-08', 'BST'),
('TG1393', 2024, 'suspended', '200223537858', '2002-12-22', 'ICT'),
('TG1688', 2024, 'suspended', '200256687748', '2002-01-17', 'BST'),
('TG1024', 2023, 'repeat', '200123564765', '2001-05-24', 'ET'),
('TG987', 2023, 'repeat', '200078774675', '2000-02-10', 'ET'),
('TG1123', 2023, 'repeat', '200066455876', '2000-08-15', 'BST'),
('TG1276', 2023, 'repeat', '200123645434', '2001-06-20', 'BST'),
('TG765', 2022, 'repeat', '200123546384', '2001-02-18', 'ICT');



INSERT INTO course_unit (course_code,name,type,credit,c_lecturer_id,c_to_id)
VALUES
("ICT1212","Database Management Systems",          "T", 2,"Lec001","To001"),
("ICT1222","Database Management Systems Practicum","P", 2,"Lec001","To001"),
("ICT1233","Server-Side Web Development",          "T", 3,"Lec002","To001"),
("ICT1233","Server-Side Web Development",          "P", 3,"Lec002","To001"),
("ICT1242","Computer Architecture",                "T", 2,"Lec003","To001"),
("ICT1253","Computer Networks",                    "T", 3,"Lec003","To001"),
("ICT1253","Computer Networks",                    "P", 3,"Lec003","To001"),
("TMS1233","Discrete Mathematics",                 "T", 3,"Lec004","To001"),

("ENT1211","Workshop Technology II",               "P", 1,"Lec004","To003"),
("ENT1221","Electricity and Magnetism",            "TP",1,"Lec005","To003"),
("ENT1231","Engineering properties of matter",     "P", 1,"Lec004","To003"),
("ENT1242","Electricity and Magnetism",            "T", 2,"Lec004","TO002"),
("ENT1253","Engineering Properties of Matter",     "T", 3,"Lec005","To002"),
("TMS1213","Applied Calculus II",                  "T", 3,"Lec005","To002"),
("TMS1223","Computer Programming Techniques",      "TP",3,"Lec002","To003"),


("BST1212","Information Technology II",            "TP",2,"Lec001","To004"),
("BST1222","Electronics for Biosystems Technology","TP",2,"Lec006","To004"),
("BST1232","Organic Chemistry",                    "TP",2,"Lec007","To004"),
("BST1242","Basic Biochemistry",                   "TP",2,"Lec006","To004"),
("BST1251","BST1251 Fundamental Genetics",         "T" ,1,"Lec008","To004"),
("BST1262","Basic Microbiology",                   "TP",2,"Lec007","To004"),
("BST1272","Introduction to Fisheries Biology",    "TP",2,"Lec006","To004"),
("BST1282","Fundamentals in Agriculture",          "TP",2,"Lec008","To004"),


("ENG1222","English II",                           "T", 2,"Lec009","To005"),
("TCS1212","Fundamentals of Management",           "T", 2,"Lec010","To005");



INSERT INTO technical_officer_course_unit (to_id, course_code)
VALUES 
    ('To001', 'ICT1212'),
    ('To001', 'ICT1222'),
    ('To001', 'ICT1233'),
    ('To001', 'ICT1242'),
    ('To001', 'ICT1253'),
    ('To001', 'TMS1233'),

    ('To002', 'ENT1242'),
    ('To002', 'ENT1253'),
    ('To002', 'TMS1213'),

    ('To003', 'ENT1211'),
    ('To003', 'ENT1221'),
    ('To003', 'ENT1231'),
    ('To003', 'TMS1223'),

    ('To004', 'BST1212'),
    ('To004', 'BST1222'),
    ('To004', 'BST1232'),
    ('To004', 'BST1242'),
    ('To004', 'BST1251'),
    ('To004', 'BST1262'),
    ('To004', 'BST1272'),
    ('To004', 'BST1282'),

    ('To005', 'ENG1222'),
    ('To005', 'TCS1212');


   

   
INSERT INTO Medical(medical_id,med_student_id,date)
VALUES
    ('M001','TG1376','2024-08-24'),
    ('M002','TG1398','2024-08-15'),
    ('M003','TG1366','2024-08-14'),
    ('M004','TG1353','2024-08-17'),
    ('M005','TG1376','2024-11-23'),
    ('M006','TG1398','2024-10-04'),
    ('M007','TG1366','2024-10-24'),
    ('M008','TG1353','2024-09-22');


    INSERT INTO attendance(attendance_id,at_student_id,at_course_code,at_course_type,date,attendance,medical_status,session_no,at_to_id)
VALUES


('AT0001','TG1376','ICT1212','T','2024-08-13','present',NULL,1,'To001'),
('AT0002','TG1376','ICT1222','P','2024-08-13','present',NULL,1,'To001'), 
('AT0003','TG1376','ICT1212','T','2024-08-20','absences',NULL,2,'To001'), 
('AT0004','TG1376','ICT1222','P','2024-08-20','absences',NULL,2,'To001'),
('AT0005','TG1376','ICT1212','T','2024-08-27','present',NULL,3,'To001'),
('AT0006','TG1376','ICT1222','P','2024-08-27','present',NULL,3,'To001'),
('AT0007','TG1376','ICT1212','T','2024-08-03','present',NULL,4,'To001'),
('AT0008','TG1376','ICT1222','P','2024-08-03','present',NULL,4,'To001'),
('AT0009','TG1376','ICT1212','T','2024-08-10','present',NULL,5,'To001'),
('AT0010','TG1376','ICT1222','P','2024-08-10','present',NULL,5,'To001'),
('AT0011','TG1376','ICT1212','T','2024-08-17','present',NULL,6,'To001'),
('AT0012','TG1376','ICT1222','P','2024-08-17','present',NULL,6,'To001'),
('AT0013','TG1376','ICT1212','T','2024-08-24','absences','M001',7,'To001'),
('AT0014','TG1376','ICT1222','P','2024-08-24','absences','M001',7,'To001'),
('AT0015','TG1376','ICT1212','T','2024-09-01','present',NULL,8,'To001'),
('AT0016','TG1376','ICT1222','P','2024-09-01','present',NULL,8,'To001'),
('AT0017','TG1376','ICT1212','T','2024-09-08','present',NULL,9,'To001'),
('AT0018','TG1376','ICT1222','P','2024-09-08','present',NULL,9,'To001'),
('AT0019','TG1376','ICT1212','T','2024-09-15','present',NULL,10,'To001'),
('AT0020','TG1376','ICT1222','P','2024-09-15','present',NULL,10,'To001'),
('AT0021','TG1376','ICT1212','T','2024-09-21','present',NULL,11,'To001'),
('AT0022','TG1376','ICT1222','P','2024-09-21','present',NULL,11,'To001'),
('AT0023','TG1376','ICT1212','T','2024-09-28','present',NULL,12,'To001'),
('AT0024','TG1376','ICT1222','P','2024-09-28','present',NULL,12,'To001'),
('AT0025','TG1376','ICT1212','T','2024-10-05','present',NULL,13,'To001'),
('AT0026','TG1376','ICT1222','P','2024-10-05','present',NULL,13,'To001'),
('AT0027','TG1376','ICT1212','T','2024-10-12','present',NULL,14,'To001'),
('AT0028','TG1376','ICT1222','P','2024-10-12','present',NULL,14,'To001'),
('AT0029','TG1376','ICT1212','T','2024-10-19','present',NULL,15,'To001'),
('AT0030','TG1376','ICT1222','P','2024-10-19','present',NULL,15,'To001'),


('AT0031', 'TG1376', 'ICT1233', 'T', '2024-08-14', 'present',NULL, 1, 'To001'),
('AT0032', 'TG1376', 'ICT1233', 'T', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0033', 'TG1376', 'ICT1233', 'T', '2024-08-28', 'present',NULL, 3, 'To001'),
('AT0034', 'TG1376', 'ICT1233', 'T', '2024-09-05', 'present',NULL, 4, 'To001'),
('AT0035', 'TG1376', 'ICT1233', 'T', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0036', 'TG1376', 'ICT1233', 'T', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0037', 'TG1376', 'ICT1233', 'T', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0038', 'TG1376', 'ICT1233', 'T', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0039', 'TG1376', 'ICT1233', 'T', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0040', 'TG1376', 'ICT1233', 'T', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0041', 'TG1376', 'ICT1233', 'T', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT0042', 'TG1376', 'ICT1233', 'T', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0043', 'TG1376', 'ICT1233', 'T', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0044', 'TG1376', 'ICT1233', 'T', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0045', 'TG1376', 'ICT1233', 'T', '2024-11-21', 'present',NULL, 15, 'To001'),

('AT00826', 'TG1376', 'ICT1233', 'P', '2024-08-14', 'present',NULL, 1, 'To001'),
('AT00827', 'TG1376', 'ICT1233', 'P', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT00828', 'TG1376', 'ICT1233', 'P', '2024-08-28', 'present',NULL, 3, 'To001'),
('AT00829', 'TG1376', 'ICT1233', 'P', '2024-09-05', 'present',NULL, 4, 'To001'),
('AT00830', 'TG1376', 'ICT1233', 'P', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT00831', 'TG1376', 'ICT1233', 'P', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT00832', 'TG1376', 'ICT1233', 'P', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT00833', 'TG1376', 'ICT1233', 'P', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT00834', 'TG1376', 'ICT1233', 'P', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT00835', 'TG1376', 'ICT1233', 'P', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT00836', 'TG1376', 'ICT1233', 'P', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT00837', 'TG1376', 'ICT1233', 'P', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT00838', 'TG1376', 'ICT1233', 'P', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT00839', 'TG1376', 'ICT1233', 'P', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT00840', 'TG1376', 'ICT1233', 'P', '2024-11-21', 'present',NULL, 15, 'To001'),


('AT0046', 'TG1376', 'ICT1242', 'T', '2024-08-15', 'present',NULL, 1, 'To001'),
('AT0047', 'TG1376', 'ICT1242', 'T', '2024-08-22', 'present',NULL, 2, 'To001'),
('AT0048', 'TG1376', 'ICT1242', 'T', '2024-08-29', 'present',NULL, 3, 'To001'),
('AT0049', 'TG1376', 'ICT1242', 'T', '2024-09-06', 'present',NULL, 4, 'To001'),
('AT0050', 'TG1376', 'ICT1242', 'T', '2024-09-13', 'present',NULL, 5, 'To001'),
('AT0051', 'TG1376', 'ICT1242', 'T', '2024-09-20', 'present',NULL, 6, 'To001'),
('AT0052', 'TG1376', 'ICT1242', 'T', '2024-09-27', 'present',NULL, 7, 'To001'),
('AT0053', 'TG1376', 'ICT1242', 'T', '2024-10-04', 'present',NULL, 8, 'To001'),
('AT0054', 'TG1376', 'ICT1242', 'T', '2024-10-27', 'present',NULL, 9, 'To001'),
('AT0055', 'TG1376', 'ICT1242', 'T', '2024-11-03', 'present',NULL, 10, 'To001'),
('AT0056', 'TG1376', 'ICT1242', 'T', '2024-11-10', 'present',NULL, 11, 'To001'),
('AT0057', 'TG1376', 'ICT1242', 'T', '2024-11-17', 'present',NULL, 12, 'To001'),
('AT0058', 'TG1376', 'ICT1242', 'T', '2024-11-24', 'present',NULL, 13, 'To001'),
('AT0059', 'TG1376', 'ICT1242', 'T', '2024-12-01', 'present',NULL, 14, 'To001'),
('AT0060', 'TG1376', 'ICT1242', 'T', '2024-12-08', 'present',NULL, 15, 'To001'),


('AT0061', 'TG1376', 'ICT1253', 'T', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0062', 'TG1376', 'ICT1253', 'T', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0063', 'TG1376', 'ICT1253', 'T', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0064', 'TG1376', 'ICT1253', 'T', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0065', 'TG1376', 'ICT1253', 'T', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0066', 'TG1376', 'ICT1253', 'T', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0067', 'TG1376', 'ICT1253', 'T', '2024-09-28', 'absences',NULL, 7, 'To001'),
('AT0068', 'TG1376', 'ICT1253', 'T', '2024-10-05', 'absences',NULL, 8, 'To001'),
('AT0069', 'TG1376', 'ICT1253', 'T', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0070', 'TG1376', 'ICT1253', 'T', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0071', 'TG1376', 'ICT1253', 'T', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0072', 'TG1376', 'ICT1253', 'T', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0073', 'TG1376', 'ICT1253', 'T', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0074', 'TG1376', 'ICT1253', 'T', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0075', 'TG1376', 'ICT1253', 'T', '2024-11-23', 'absences','M005', 15, 'To001'),

('AT0841', 'TG1376', 'ICT1253', 'P', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0842', 'TG1376', 'ICT1253', 'P', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0843', 'TG1376', 'ICT1253', 'P', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0844', 'TG1376', 'ICT1253', 'P', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0845', 'TG1376', 'ICT1253', 'P', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0846', 'TG1376', 'ICT1253', 'P', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0847', 'TG1376', 'ICT1253', 'P', '2024-09-28', 'absences',NULL, 7, 'To001'),
('AT0848', 'TG1376', 'ICT1253', 'P', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0849', 'TG1376', 'ICT1253', 'P', '2024-10-12', 'present',NULL, 9, 'To001'), 
('AT0850', 'TG1376', 'ICT1253', 'P', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0851', 'TG1376', 'ICT1253', 'P', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0852', 'TG1376', 'ICT1253', 'P', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0853', 'TG1376', 'ICT1253', 'P', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0854', 'TG1376', 'ICT1253', 'P', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0855', 'TG1376', 'ICT1253', 'P', '2024-11-23', 'absences','M005', 15, 'To001'),


('AT0076', 'TG1376', 'TMS1233', 'T', '2024-08-17', 'present',NULL, 1, 'To001'),
('AT0077', 'TG1376', 'TMS1233', 'T', '2024-08-24', 'present',NULL, 2, 'To001'),
('AT0078', 'TG1376', 'TMS1233', 'T', '2024-08-31', 'present',NULL, 3, 'To001'),
('AT0079', 'TG1376', 'TMS1233', 'T', '2024-09-08', 'present',NULL, 4, 'To001'),
('AT0080', 'TG1376', 'TMS1233', 'T', '2024-09-15', 'present',NULL, 5, 'To001'),
('AT0081', 'TG1376', 'TMS1233', 'T', '2024-09-22', 'present',NULL, 6, 'To001'),
('AT0082', 'TG1376', 'TMS1233', 'T', '2024-09-29', 'present',NULL, 7, 'To001'),
('AT0083', 'TG1376', 'TMS1233', 'T', '2024-10-06', 'present',NULL, 8, 'To001'),
('AT0084', 'TG1376', 'TMS1233', 'T', '2024-10-29', 'present',NULL, 9, 'To001'),
('AT0085', 'TG1376', 'TMS1233', 'T', '2024-11-05', 'present',NULL, 10, 'To001'),
('AT0086', 'TG1376', 'TMS1233', 'T', '2024-11-12', 'present',NULL, 11, 'To001'),
('AT0087', 'TG1376', 'TMS1233', 'T', '2024-11-19', 'present',NULL, 12, 'To001'),
('AT0088', 'TG1376', 'TMS1233', 'T', '2024-11-26', 'present',NULL, 13, 'To001'),
('AT0089', 'TG1376', 'TMS1233', 'T', '2024-12-03', 'present',NULL, 14, 'To001'),
('AT0090', 'TG1376', 'TMS1233', 'T', '2024-12-10', 'present',NULL, 15, 'To001'),





('AT0091','TG1398','ICT1212','T','2024-08-13','present',NULL,1,'To001'),
('AT0092','TG1398','ICT1222','P','2024-08-13','present',NULL,1,'To001'),
('AT0093','TG1398','ICT1212','T','2024-08-20','present',NULL,2,'To001'),
('AT0094','TG1398','ICT1222','P','2024-08-20','present',NULL,2,'To001'),
('AT0095','TG1398','ICT1212','T','2024-08-27','present',NULL,3,'To001'),
('AT0096','TG1398','ICT1222','P','2024-08-27','present',NULL,3,'To001'),
('AT0097','TG1398','ICT1212','T','2024-08-03','present',NULL,4,'To001'),
('AT0098','TG1398','ICT1222','P','2024-08-03','present',NULL,4,'To001'),
('AT0099','TG1398','ICT1212','T','2024-08-10','present',NULL,5,'To001'),
('AT0100','TG1398','ICT1222','P','2024-08-10','present',NULL,5,'To001'),
('AT0101','TG1398','ICT1212','T','2024-08-17','present',NULL,6,'To001'),
('AT0102','TG1398','ICT1222','P','2024-08-17','present',NULL,6,'To001'),
('AT0103','TG1398','ICT1212','T','2024-08-24','present',NULL,7,'To001'),
('AT0104','TG1398','ICT1222','P','2024-08-24','present',NULL,7,'To001'),
('AT0105','TG1398','ICT1212','T','2024-09-01','present',NULL,8,'To001'),
('AT0106','TG1398','ICT1222','P','2024-09-01','present',NULL,8,'To001'),
('AT0107','TG1398','ICT1212','T','2024-09-08','present',NULL,9,'To001'),
('AT0108','TG1398','ICT1222','P','2024-09-08','present',NULL,9,'To001'),
('AT0109','TG1398','ICT1212','T','2024-09-15','present',NULL,10,'To001'),
('AT0110','TG1398','ICT1222','P','2024-09-15','present',NULL,10,'To001'),
('AT0111','TG1398','ICT1212','T','2024-09-21','present',NULL,11,'To001'),
('AT0112','TG1398','ICT1222','P','2024-09-21','present',NULL,11,'To001'),
('AT0113','TG1398','ICT1212','T','2024-09-28','present',NULL,12,'To001'),
('AT0114','TG1398','ICT1222','P','2024-09-28','present',NULL,12,'To001'),
('AT0115','TG1398','ICT1212','T','2024-10-05','present',NULL,13,'To001'),
('AT0116','TG1398','ICT1222','P','2024-10-05','present',NULL,13,'To001'),
('AT0117','TG1398','ICT1212','T','2024-10-12','present',NULL,14,'To001'),
('AT0118','TG1398','ICT1222','P','2024-10-12','present',NULL,14,'To001'),
('AT0119','TG1398','ICT1212','T','2024-10-19','present',NULL,15,'To001'),
('AT0120','TG1398','ICT1222','P','2024-10-19','present',NULL,15,'To001'),


('AT0121', 'TG1398', 'ICT1233', 'T', '2024-08-14', 'absences',NULL, 1, 'To001'),
('AT0122', 'TG1398', 'ICT1233', 'T', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0123', 'TG1398', 'ICT1233', 'T', '2024-08-28', 'absences',NULL, 3, 'To001'),
('AT0124', 'TG1398', 'ICT1233', 'T', '2024-09-05', 'absences',NULL, 4, 'To001'),
('AT0125', 'TG1398', 'ICT1233', 'T', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0126', 'TG1398', 'ICT1233', 'T', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0127', 'TG1398', 'ICT1233', 'T', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0128', 'TG1398', 'ICT1233', 'T', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0129', 'TG1398', 'ICT1233', 'T', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0130', 'TG1398', 'ICT1233', 'T', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0131', 'TG1398', 'ICT1233', 'T', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT0132', 'TG1398', 'ICT1233', 'T', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0133', 'TG1398', 'ICT1233', 'T', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0134', 'TG1398', 'ICT1233', 'T', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0135', 'TG1398', 'ICT1233', 'T', '2024-11-21', 'absences',NULL, 15, 'To001'),

('AT0856', 'TG1398', 'ICT1233', 'P', '2024-08-14', 'absences',NULL, 1, 'To001'),
('AT0857', 'TG1398', 'ICT1233', 'P', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0858', 'TG1398', 'ICT1233', 'P', '2024-08-28', 'absences',NULL, 3, 'To001'),
('AT0859', 'TG1398', 'ICT1233', 'P', '2024-09-05', 'absences',NULL, 4, 'To001'),
('AT0860', 'TG1398', 'ICT1233', 'P', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0861', 'TG1398', 'ICT1233', 'P', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0862', 'TG1398', 'ICT1233', 'P', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0863', 'TG1398', 'ICT1233', 'P', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0864', 'TG1398', 'ICT1233', 'P', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0865', 'TG1398', 'ICT1233', 'P', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0866', 'TG1398', 'ICT1233', 'P', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT0867', 'TG1398', 'ICT1233', 'P', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0868', 'TG1398', 'ICT1233', 'P', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0869', 'TG1398', 'ICT1233', 'P', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0870', 'TG1398', 'ICT1233', 'P', '2024-11-21', 'absences',NULL, 15, 'To001'),


('AT0136', 'TG1398', 'ICT1242', 'T', '2024-08-15', 'absences','M002', 1, 'To001'),
('AT0137', 'TG1398', 'ICT1242', 'T', '2024-08-22', 'present',NULL, 2, 'To001'),
('AT0138', 'TG1398', 'ICT1242', 'T', '2024-08-29', 'present',NULL, 3, 'To001'),
('AT0139', 'TG1398', 'ICT1242', 'T', '2024-09-06', 'absences',NULL, 4, 'To001'),
('AT0140', 'TG1398', 'ICT1242', 'T', '2024-09-13', 'present',NULL, 5, 'To001'),
('AT0141', 'TG1398', 'ICT1242', 'T', '2024-09-20', 'present',NULL, 6, 'To001'),
('AT0142', 'TG1398', 'ICT1242', 'T', '2024-09-27', 'absences',NULL, 7, 'To001'),
('AT0143', 'TG1398', 'ICT1242', 'T', '2024-10-04', 'absences','M006', 8, 'To001'),
('AT0144', 'TG1398', 'ICT1242', 'T', '2024-10-27', 'present',NULL, 9, 'To001'),
('AT0145', 'TG1398', 'ICT1242', 'T', '2024-11-03', 'present',NULL, 10, 'To001'),
('AT0146', 'TG1398', 'ICT1242', 'T', '2024-11-10', 'present',NULL, 11, 'To001'),
('AT0147', 'TG1398', 'ICT1242', 'T', '2024-11-17', 'present',NULL, 12, 'To001'),
('AT0148', 'TG1398', 'ICT1242', 'T', '2024-11-24', 'present',NULL, 13, 'To001'),
('AT0149', 'TG1398', 'ICT1242', 'T', '2024-12-01', 'present',NULL, 14, 'To001'),
('AT0150', 'TG1398', 'ICT1242', 'T', '2024-12-08', 'present',NULL, 15, 'To001'),


('AT0151', 'TG1398', 'ICT1253', 'T', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0152', 'TG1398', 'ICT1253', 'T', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0153', 'TG1398', 'ICT1253', 'T', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0154', 'TG1398', 'ICT1253', 'T', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0155', 'TG1398', 'ICT1253', 'T', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0156', 'TG1398', 'ICT1253', 'T', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0157', 'TG1398', 'ICT1253', 'T', '2024-09-28', 'present',NULL, 7, 'To001'),
('AT0158', 'TG1398', 'ICT1253', 'T', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0159', 'TG1398', 'ICT1253', 'T', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0160', 'TG1398', 'ICT1253', 'T', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0161', 'TG1398', 'ICT1253', 'T', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0162', 'TG1398', 'ICT1253', 'T', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0163', 'TG1398', 'ICT1253', 'T', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0164', 'TG1398', 'ICT1253', 'T', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0165', 'TG1398', 'ICT1253', 'T', '2024-11-23', 'present',NULL, 15, 'To001'),

('AT0871', 'TG1398', 'ICT1253', 'P', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0872', 'TG1398', 'ICT1253', 'P', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0873', 'TG1398', 'ICT1253', 'P', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0874', 'TG1398', 'ICT1253', 'P', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0875', 'TG1398', 'ICT1253', 'P', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0876', 'TG1398', 'ICT1253', 'P', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0877', 'TG1398', 'ICT1253', 'P', '2024-09-28', 'present',NULL, 7, 'To001'),
('AT0878', 'TG1398', 'ICT1253', 'P', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0879', 'TG1398', 'ICT1253', 'P', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0880', 'TG1398', 'ICT1253', 'P', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0881', 'TG1398', 'ICT1253', 'P', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0882', 'TG1398', 'ICT1253', 'P', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0883', 'TG1398', 'ICT1253', 'P', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0884', 'TG1398', 'ICT1253', 'P', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0885', 'TG1398', 'ICT1253', 'P', '2024-11-23', 'present',NULL, 15, 'To001'),


('AT0166', 'TG1398', 'TMS1233', 'T', '2024-08-17', 'present',NULL, 1, 'To001'),
('AT0167', 'TG1398', 'TMS1233', 'T', '2024-08-24', 'present',NULL, 2, 'To001'),
('AT0168', 'TG1398', 'TMS1233', 'T', '2024-08-31', 'present',NULL, 3, 'To001'),
('AT0169', 'TG1398', 'TMS1233', 'T', '2024-09-08', 'present',NULL, 4, 'To001'),
('AT0170', 'TG1398', 'TMS1233', 'T', '2024-09-15', 'present',NULL, 5, 'To001'),
('AT0171', 'TG1398', 'TMS1233', 'T', '2024-09-22', 'present',NULL, 6, 'To001'),
('AT0172', 'TG1398', 'TMS1233', 'T', '2024-09-29', 'present',NULL, 7, 'To001'),
('AT0173', 'TG1398', 'TMS1233', 'T', '2024-10-06', 'present',NULL, 8, 'To001'),
('AT0174', 'TG1398', 'TMS1233', 'T', '2024-10-29', 'present',NULL, 9, 'To001'),
('AT0175', 'TG1398', 'TMS1233', 'T', '2024-11-05', 'present',NULL, 10, 'To001'),
('AT0176', 'TG1398', 'TMS1233', 'T', '2024-11-12', 'present',NULL, 11, 'To001'),
('AT0177', 'TG1398', 'TMS1233', 'T', '2024-11-19', 'present',NULL, 12, 'To001'),
('AT0178', 'TG1398', 'TMS1233', 'T', '2024-11-26', 'present',NULL, 13, 'To001'),
('AT0179', 'TG1398', 'TMS1233', 'T', '2024-12-03', 'present',NULL, 14, 'To001'),
('AT0180', 'TG1398', 'TMS1233', 'T', '2024-12-10', 'present',NULL, 15, 'To001'),



('AT0181', 'TG1366', 'ICT1212', 'T', '2024-08-13', 'present',NULL, 1, 'To001'),
('AT0182', 'TG1366', 'ICT1222', 'P', '2024-08-13', 'absences',NULL, 1, 'To001'),
('AT0183', 'TG1366', 'ICT1212', 'T', '2024-08-20', 'present',NULL, 2, 'To001'),
('AT0184', 'TG1366', 'ICT1222', 'P', '2024-08-20', 'absences',NULL, 2, 'To001'),
('AT0185', 'TG1366', 'ICT1212', 'T', '2024-08-27', 'present',NULL, 3, 'To001'),
('AT0186', 'TG1366', 'ICT1222', 'P', '2024-08-27', 'absences',NULL, 3, 'To001'),
('AT0187', 'TG1366', 'ICT1212', 'T', '2024-08-03', 'present',NULL, 4, 'To001'),
('AT0188', 'TG1366', 'ICT1222', 'P', '2024-08-03', 'present',NULL, 4, 'To001'),
('AT0189', 'TG1366', 'ICT1212', 'T', '2024-08-10', 'present',NULL, 5, 'To001'),
('AT0190', 'TG1366', 'ICT1222', 'P', '2024-08-10', 'present',NULL, 5, 'To001'),
('AT0191', 'TG1366', 'ICT1212', 'T', '2024-08-17', 'present',NULL, 6, 'To001'),
('AT0192', 'TG1366', 'ICT1222', 'P', '2024-08-17', 'present',NULL, 6, 'To001'),
('AT0193', 'TG1366', 'ICT1212', 'T', '2024-08-24', 'present',NULL, 7, 'To001'),
('AT0194', 'TG1366', 'ICT1222', 'P', '2024-08-24', 'present',NULL, 7, 'To001'),
('AT0195', 'TG1366', 'ICT1212', 'T', '2024-09-01', 'present',NULL, 8, 'To001'),
('AT0196', 'TG1366', 'ICT1222', 'P', '2024-09-01', 'present',NULL, 8, 'To001'),
('AT0197', 'TG1366', 'ICT1212', 'T', '2024-09-08', 'present',NULL, 9, 'To001'),
('AT0198', 'TG1366', 'ICT1222', 'P', '2024-09-08', 'present',NULL, 9, 'To001'),
('AT0199', 'TG1366', 'ICT1212', 'T', '2024-09-15', 'present',NULL, 10, 'To001'),
('AT0200', 'TG1366', 'ICT1222', 'P', '2024-09-15', 'present',NULL, 10, 'To001'),
('AT0201', 'TG1366', 'ICT1212', 'T', '2024-09-21', 'present',NULL, 11, 'To001'),
('AT0202', 'TG1366', 'ICT1222', 'P', '2024-09-21', 'present',NULL, 11, 'To001'),
('AT0203', 'TG1366', 'ICT1212', 'T', '2024-09-28', 'present',NULL, 12, 'To001'),
('AT0204', 'TG1366', 'ICT1222', 'P', '2024-09-28', 'present',NULL, 12, 'To001'),
('AT0205', 'TG1366', 'ICT1212', 'T', '2024-10-05', 'present',NULL, 13, 'To001'),
('AT0206', 'TG1366', 'ICT1222', 'P', '2024-10-05', 'present',NULL, 13, 'To001'),
('AT0207', 'TG1366', 'ICT1212', 'T', '2024-10-12', 'present',NULL, 14, 'To001'),
('AT0208', 'TG1366', 'ICT1222', 'P', '2024-10-12', 'present',NULL, 14, 'To001'),
('AT0209', 'TG1366', 'ICT1212', 'T', '2024-10-19', 'present',NULL, 15, 'To001'),
('AT0210', 'TG1366', 'ICT1222', 'P', '2024-10-19', 'present',NULL, 15, 'To001'),


('AT0211', 'TG1366', 'ICT1233', 'T', '2024-08-14', 'absences','M003', 1, 'To001'),
('AT0212', 'TG1366', 'ICT1233', 'T', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0213', 'TG1366', 'ICT1233', 'T', '2024-08-28', 'present',NULL, 3, 'To001'),
('AT0214', 'TG1366', 'ICT1233', 'T', '2024-09-05', 'present',NULL, 4, 'To001'),
('AT0215', 'TG1366', 'ICT1233', 'T', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0216', 'TG1366', 'ICT1233', 'T', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0217', 'TG1366', 'ICT1233', 'T', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0218', 'TG1366', 'ICT1233', 'T', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0219', 'TG1366', 'ICT1233', 'T', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0220', 'TG1366', 'ICT1233', 'T', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0221', 'TG1366', 'ICT1233', 'T', '2024-10-24', 'absences','M007', 11, 'To001'),
('AT0222', 'TG1366', 'ICT1233', 'T', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0223', 'TG1366', 'ICT1233', 'T', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0224', 'TG1366', 'ICT1233', 'T', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0225', 'TG1366', 'ICT1233', 'T', '2024-11-21', 'present',NULL, 15, 'To001'),

('886', 'TG1366', 'ICT1233', 'P', '2024-08-14', 'absences','M003', 1, 'To001'),
('887', 'TG1366', 'ICT1233', 'P', '2024-08-21', 'present',NULL, 2, 'To001'),
('888', 'TG1366', 'ICT1233', 'P', '2024-08-28', 'present',NULL, 3, 'To001'),
('889', 'TG1366', 'ICT1233', 'P', '2024-09-05', 'present',NULL, 4, 'To001'),
('890', 'TG1366', 'ICT1233', 'P', '2024-09-12', 'present',NULL, 5, 'To001'),
('891', 'TG1366', 'ICT1233', 'P', '2024-09-19', 'present',NULL, 6, 'To001'),
('892', 'TG1366', 'ICT1233', 'P', '2024-09-26', 'present',NULL, 7, 'To001'),
('893', 'TG1366', 'ICT1233', 'P', '2024-10-03', 'present',NULL, 8, 'To001'),
('894', 'TG1366', 'ICT1233', 'P', '2024-10-10', 'present',NULL, 9, 'To001'),
('895', 'TG1366', 'ICT1233', 'P', '2024-10-17', 'present',NULL, 10, 'To001'),
('896', 'TG1366', 'ICT1233', 'P', '2024-10-24', 'absences','M007', 11, 'To001'),
('897', 'TG1366', 'ICT1233', 'P', '2024-10-31', 'present',NULL, 12, 'To001'),
('898', 'TG1366', 'ICT1233', 'P', '2024-11-07', 'present',NULL, 13, 'To001'),
('899', 'TG1366', 'ICT1233', 'P', '2024-11-14', 'present',NULL, 14, 'To001'),
('900', 'TG1366', 'ICT1233', 'P', '2024-11-21', 'present',NULL, 15, 'To001'),


('AT0226', 'TG1366', 'ICT1242', 'T', '2024-08-15', 'present',NULL, 1, 'To001'),
('AT0227', 'TG1366', 'ICT1242', 'T', '2024-08-22', 'present',NULL, 2, 'To001'),
('AT0228', 'TG1366', 'ICT1242', 'T', '2024-08-29', 'present',NULL, 3, 'To001'),
('AT0229', 'TG1366', 'ICT1242', 'T', '2024-09-06', 'present',NULL, 4, 'To001'),
('AT0230', 'TG1366', 'ICT1242', 'T', '2024-09-13', 'present',NULL, 5, 'To001'),
('AT0231', 'TG1366', 'ICT1242', 'T', '2024-09-20', 'present',NULL, 6, 'To001'),
('AT0232', 'TG1366', 'ICT1242', 'T', '2024-09-27', 'present',NULL, 7, 'To001'),
('AT0233', 'TG1366', 'ICT1242', 'T', '2024-10-04', 'present',NULL, 8, 'To001'),
('AT0234', 'TG1366', 'ICT1242', 'T', '2024-10-27', 'present',NULL, 9, 'To001'),
('AT0235', 'TG1366', 'ICT1242', 'T', '2024-11-03', 'present',NULL, 10, 'To001'),
('AT0236', 'TG1366', 'ICT1242', 'T', '2024-11-10', 'present',NULL, 11, 'To001'),
('AT0237', 'TG1366', 'ICT1242', 'T', '2024-11-17', 'present',NULL, 12, 'To001'),
('AT0238', 'TG1366', 'ICT1242', 'T', '2024-11-24', 'present',NULL, 13, 'To001'),
('AT0239', 'TG1366', 'ICT1242', 'T', '2024-12-01', 'present',NULL, 14, 'To001'),
('AT0240', 'TG1366', 'ICT1242', 'T', '2024-12-08', 'present',NULL, 15, 'To001'),


('AT0241', 'TG1366', 'ICT1253', 'T', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0242', 'TG1366', 'ICT1253', 'T', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0243', 'TG1366', 'ICT1253', 'T', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0244', 'TG1366', 'ICT1253', 'T', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0245', 'TG1366', 'ICT1253', 'T', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0246', 'TG1366', 'ICT1253', 'T', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0247', 'TG1366', 'ICT1253', 'T', '2024-09-28', 'present',NULL, 7, 'To001'),
('AT0248', 'TG1366', 'ICT1253', 'T', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0249', 'TG1366', 'ICT1253', 'T', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0250', 'TG1366', 'ICT1253', 'T', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0251', 'TG1366', 'ICT1253', 'T', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0252', 'TG1366', 'ICT1253', 'T', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0253', 'TG1366', 'ICT1253', 'T', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0254', 'TG1366', 'ICT1253', 'T', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0255', 'TG1366', 'ICT1253', 'T', '2024-11-23', 'present',NULL, 15, 'To001'),

('901', 'TG1366', 'ICT1253', 'P', '2024-08-16', 'present',NULL, 1, 'To001'),
('902', 'TG1366', 'ICT1253', 'P', '2024-08-23', 'present',NULL, 2, 'To001'),
('903', 'TG1366', 'ICT1253', 'P', '2024-08-30', 'present',NULL, 3, 'To001'),
('904', 'TG1366', 'ICT1253', 'P', '2024-09-07', 'present',NULL, 4, 'To001'),
('905', 'TG1366', 'ICT1253', 'P', '2024-09-14', 'present',NULL, 5, 'To001'),
('906', 'TG1366', 'ICT1253', 'P', '2024-09-21', 'present',NULL, 6, 'To001'),
('907', 'TG1366', 'ICT1253', 'P', '2024-09-28', 'present',NULL, 7, 'To001'),
('908', 'TG1366', 'ICT1253', 'P', '2024-10-05', 'present',NULL, 8, 'To001'),
('909', 'TG1366', 'ICT1253', 'P', '2024-10-12', 'present',NULL, 9, 'To001'),
('910', 'TG1366', 'ICT1253', 'P', '2024-10-19', 'present',NULL, 10, 'To001'),
('911', 'TG1366', 'ICT1253', 'P', '2024-10-26', 'present',NULL, 11, 'To001'),
('912', 'TG1366', 'ICT1253', 'P', '2024-11-02', 'present',NULL, 12, 'To001'),
('913', 'TG1366', 'ICT1253', 'P', '2024-11-09', 'present',NULL, 13, 'To001'),
('914', 'TG1366', 'ICT1253', 'P', '2024-11-16', 'present',NULL, 14, 'To001'),
('915', 'TG1366', 'ICT1253', 'P', '2024-11-23', 'present',NULL, 15, 'To001'),


('AT0256', 'TG1366', 'TMS1233', 'T', '2024-08-17', 'present',NULL, 1, 'To001'),
('AT0257', 'TG1366', 'TMS1233', 'T', '2024-08-24', 'present',NULL, 2, 'To001'),
('AT0258', 'TG1366', 'TMS1233', 'T', '2024-08-31', 'present',NULL, 3, 'To001'),
('AT0259', 'TG1366', 'TMS1233', 'T', '2024-09-08', 'present',NULL, 4, 'To001'),
('AT0260', 'TG1366', 'TMS1233', 'T', '2024-09-15', 'present',NULL, 5, 'To001'),
('AT0261', 'TG1366', 'TMS1233', 'T', '2024-09-22', 'present',NULL, 6, 'To001'),
('AT0262', 'TG1366', 'TMS1233', 'T', '2024-09-29', 'present',NULL, 7, 'To001'),
('AT0263', 'TG1366', 'TMS1233', 'T', '2024-10-06', 'present',NULL, 8, 'To001'),
('AT0264', 'TG1366', 'TMS1233', 'T', '2024-10-29', 'present',NULL, 9, 'To001'),
('AT0265', 'TG1366', 'TMS1233', 'T', '2024-11-05', 'present',NULL, 10, 'To001'),
('AT0266', 'TG1366', 'TMS1233', 'T', '2024-11-12', 'present',NULL, 11, 'To001'),
('AT0267', 'TG1366', 'TMS1233', 'T', '2024-11-19', 'present',NULL, 12, 'To001'),
('AT0268', 'TG1366', 'TMS1233', 'T', '2024-11-26', 'present',NULL, 13, 'To001'),
('AT0269', 'TG1366', 'TMS1233', 'T', '2024-12-03', 'present',NULL, 14, 'To001'),
('AT0270', 'TG1366', 'TMS1233', 'T', '2024-12-10', 'present',NULL, 15, 'To001'),




('AT0271', 'TG1353', 'ICT1212', 'T', '2024-08-13', 'present',NULL, 1, 'To001'),
('AT0272', 'TG1353', 'ICT1222', 'P', '2024-08-13', 'present',NULL, 1, 'To001'),
('AT0273', 'TG1353', 'ICT1212', 'T', '2024-08-20', 'present',NULL, 2, 'To001'),
('AT0274', 'TG1353', 'ICT1222', 'P', '2024-08-20', 'present',NULL, 2, 'To001'),
('AT0275', 'TG1353', 'ICT1212', 'T', '2024-08-27', 'present',NULL, 3, 'To001'),
('AT0276', 'TG1353', 'ICT1222', 'P', '2024-08-27', 'present',NULL, 3, 'To001'),
('AT0277', 'TG1353', 'ICT1212', 'T', '2024-08-03', 'present',NULL, 4, 'To001'),
('AT0278', 'TG1353', 'ICT1222', 'P', '2024-08-03', 'present',NULL, 4, 'To001'),
('AT0279', 'TG1353', 'ICT1212', 'T', '2024-08-10', 'present',NULL, 5, 'To001'),
('AT0280', 'TG1353', 'ICT1222', 'P', '2024-08-10', 'present',NULL, 5, 'To001'),
('AT0281', 'TG1353', 'ICT1212', 'T', '2024-08-17', 'present',NULL, 6, 'To001'),
('AT0282', 'TG1353', 'ICT1222', 'P', '2024-08-17', 'present',NULL, 6, 'To001'),
('AT0283', 'TG1353', 'ICT1212', 'T', '2024-08-24', 'present',NULL, 7, 'To001'),
('AT0284', 'TG1353', 'ICT1222', 'P', '2024-08-24', 'present',NULL, 7, 'To001'),
('AT0285', 'TG1353', 'ICT1212', 'T', '2024-09-01', 'present',NULL, 8, 'To001'),
('AT0286', 'TG1353', 'ICT1222', 'P', '2024-09-01', 'present',NULL, 8, 'To001'),
('AT0287', 'TG1353', 'ICT1212', 'T', '2024-09-08', 'present',NULL, 9, 'To001'),
('AT0288', 'TG1353', 'ICT1222', 'P', '2024-09-08', 'present',NULL, 9, 'To001'),
('AT0289', 'TG1353', 'ICT1212', 'T', '2024-09-15', 'present',NULL, 10, 'To001'),
('AT0290', 'TG1353', 'ICT1222', 'P', '2024-09-15', 'present',NULL, 10, 'To001'),
('AT0291', 'TG1353', 'ICT1212', 'T', '2024-09-21', 'present',NULL, 11, 'To001'),
('AT0292', 'TG1353', 'ICT1222', 'P', '2024-09-21', 'present',NULL, 11, 'To001'),
('AT0293', 'TG1353', 'ICT1212', 'T', '2024-09-28', 'present',NULL, 12, 'To001'),
('AT0294', 'TG1353', 'ICT1222', 'P', '2024-09-28', 'present',NULL, 12, 'To001'),
('AT0295', 'TG1353', 'ICT1212', 'T', '2024-10-05', 'present',NULL, 13, 'To001'),
('AT0296', 'TG1353', 'ICT1222', 'P', '2024-10-05', 'present',NULL, 13, 'To001'),
('AT0297', 'TG1353', 'ICT1212', 'T', '2024-10-12', 'present',NULL, 14, 'To001'),
('AT0298', 'TG1353', 'ICT1222', 'P', '2024-10-12', 'present',NULL, 14, 'To001'),
('AT0299', 'TG1353', 'ICT1212', 'T', '2024-10-19', 'present',NULL, 15, 'To001'),
('AT0300', 'TG1353', 'ICT1222', 'P', '2024-10-19', 'present',NULL, 15, 'To001'),


('AT0301', 'TG1353', 'ICT1233', 'T', '2024-08-14', 'present',NULL, 1, 'To001'),
('AT0302', 'TG1353', 'ICT1233', 'T', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0303', 'TG1353', 'ICT1233', 'T', '2024-08-28', 'present',NULL, 3, 'To001'),
('AT0304', 'TG1353', 'ICT1233', 'T', '2024-09-05', 'present',NULL, 4, 'To001'),
('AT0305', 'TG1353', 'ICT1233', 'T', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0306', 'TG1353', 'ICT1233', 'T', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0307', 'TG1353', 'ICT1233', 'T', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0308', 'TG1353', 'ICT1233', 'T', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0309', 'TG1353', 'ICT1233', 'T', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0310', 'TG1353', 'ICT1233', 'T', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0311', 'TG1353', 'ICT1233', 'T', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT0312', 'TG1353', 'ICT1233', 'T', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0313', 'TG1353', 'ICT1233', 'T', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0314', 'TG1353', 'ICT1233', 'T', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0315', 'TG1353', 'ICT1233', 'T', '2024-11-21', 'present',NULL, 15, 'To001'),

('AT0916', 'TG1353', 'ICT1233', 'P', '2024-08-14', 'present',NULL, 1, 'To001'),
('AT0917', 'TG1353', 'ICT1233', 'P', '2024-08-21', 'present',NULL, 2, 'To001'),
('AT0918', 'TG1353', 'ICT1233', 'P', '2024-08-28', 'present',NULL, 3, 'To001'),
('AT0919', 'TG1353', 'ICT1233', 'P', '2024-09-05', 'present',NULL, 4, 'To001'),
('AT0920', 'TG1353', 'ICT1233', 'P', '2024-09-12', 'present',NULL, 5, 'To001'),
('AT0921', 'TG1353', 'ICT1233', 'P', '2024-09-19', 'present',NULL, 6, 'To001'),
('AT0922', 'TG1353', 'ICT1233', 'P', '2024-09-26', 'present',NULL, 7, 'To001'),
('AT0923', 'TG1353', 'ICT1233', 'P', '2024-10-03', 'present',NULL, 8, 'To001'),
('AT0924', 'TG1353', 'ICT1233', 'P', '2024-10-10', 'present',NULL, 9, 'To001'),
('AT0925', 'TG1353', 'ICT1233', 'P', '2024-10-17', 'present',NULL, 10, 'To001'),
('AT0926', 'TG1353', 'ICT1233', 'P', '2024-10-24', 'present',NULL, 11, 'To001'),
('AT0927', 'TG1353', 'ICT1233', 'P', '2024-10-31', 'present',NULL, 12, 'To001'),
('AT0928', 'TG1353', 'ICT1233', 'P', '2024-11-07', 'present',NULL, 13, 'To001'),
('AT0929', 'TG1353', 'ICT1233', 'P', '2024-11-14', 'present',NULL, 14, 'To001'),
('AT0930', 'TG1353', 'ICT1233', 'P', '2024-11-21', 'present',NULL, 15, 'To001'),


('AT0316', 'TG1353', 'ICT1242', 'T', '2024-08-15', 'present',NULL, 1, 'To001'),
('AT0317', 'TG1353', 'ICT1242', 'T', '2024-08-22', 'present',NULL, 2, 'To001'),
('AT0318', 'TG1353', 'ICT1242', 'T', '2024-08-29', 'present',NULL, 3, 'To001'),
('AT0319', 'TG1353', 'ICT1242', 'T', '2024-09-06', 'present',NULL, 4, 'To001'),
('AT0320', 'TG1353', 'ICT1242', 'T', '2024-09-13', 'present',NULL, 5, 'To001'),
('AT0321', 'TG1353', 'ICT1242', 'T', '2024-09-20', 'present',NULL, 6, 'To001'),
('AT0322', 'TG1353', 'ICT1242', 'T', '2024-09-27', 'present',NULL, 7, 'To001'),
('AT0323', 'TG1353', 'ICT1242', 'T', '2024-10-04', 'present',NULL, 8, 'To001'),
('AT0324', 'TG1353', 'ICT1242', 'T', '2024-10-27', 'present',NULL, 9, 'To001'),
('AT0325', 'TG1353', 'ICT1242', 'T', '2024-11-03', 'present',NULL, 10, 'To001'),
('AT0326', 'TG1353', 'ICT1242', 'T', '2024-11-10', 'present',NULL, 11, 'To001'),
('AT0327', 'TG1353', 'ICT1242', 'T', '2024-11-17', 'present',NULL, 12, 'To001'),
('AT0328', 'TG1353', 'ICT1242', 'T', '2024-11-24', 'present',NULL, 13, 'To001'),
('AT0329', 'TG1353', 'ICT1242', 'T', '2024-12-01', 'present',NULL, 14, 'To001'),
('AT0330', 'TG1353', 'ICT1242', 'T', '2024-12-08', 'present',NULL, 15, 'To001'),


('AT0331', 'TG1353', 'ICT1253', 'T', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0332', 'TG1353', 'ICT1253', 'T', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0333', 'TG1353', 'ICT1253', 'T', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0334', 'TG1353', 'ICT1253', 'T', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0335', 'TG1353', 'ICT1253', 'T', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0336', 'TG1353', 'ICT1253', 'T', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0337', 'TG1353', 'ICT1253', 'T', '2024-09-28', 'present',NULL, 7, 'To001'),
('AT0338', 'TG1353', 'ICT1253', 'T', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0339', 'TG1353', 'ICT1253', 'T', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0340', 'TG1353', 'ICT1253', 'T', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0341', 'TG1353', 'ICT1253', 'T', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0342', 'TG1353', 'ICT1253', 'T', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0343', 'TG1353', 'ICT1253', 'T', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0344', 'TG1353', 'ICT1253', 'T', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0345', 'TG1353', 'ICT1253', 'T', '2024-11-23', 'present',NULL, 15, 'To001'),

('AT0931', 'TG1353', 'ICT1253', 'P', '2024-08-16', 'present',NULL, 1, 'To001'),
('AT0932', 'TG1353', 'ICT1253', 'P', '2024-08-23', 'present',NULL, 2, 'To001'),
('AT0933', 'TG1353', 'ICT1253', 'P', '2024-08-30', 'present',NULL, 3, 'To001'),
('AT0934', 'TG1353', 'ICT1253', 'P', '2024-09-07', 'present',NULL, 4, 'To001'),
('AT0935', 'TG1353', 'ICT1253', 'P', '2024-09-14', 'present',NULL, 5, 'To001'),
('AT0936', 'TG1353', 'ICT1253', 'P', '2024-09-21', 'present',NULL, 6, 'To001'),
('AT0937', 'TG1353', 'ICT1253', 'P', '2024-09-28', 'present',NULL, 7, 'To001'),
('AT0938', 'TG1353', 'ICT1253', 'P', '2024-10-05', 'present',NULL, 8, 'To001'),
('AT0939', 'TG1353', 'ICT1253', 'P', '2024-10-12', 'present',NULL, 9, 'To001'),
('AT0940', 'TG1353', 'ICT1253', 'P', '2024-10-19', 'present',NULL, 10, 'To001'),
('AT0941', 'TG1353', 'ICT1253', 'P', '2024-10-26', 'present',NULL, 11, 'To001'),
('AT0942', 'TG1353', 'ICT1253', 'P', '2024-11-02', 'present',NULL, 12, 'To001'),
('AT0943', 'TG1353', 'ICT1253', 'P', '2024-11-09', 'present',NULL, 13, 'To001'),
('AT0944', 'TG1353', 'ICT1253', 'P', '2024-11-16', 'present',NULL, 14, 'To001'),
('AT0945', 'TG1353', 'ICT1253', 'P', '2024-11-23', 'present',NULL, 15, 'To001'),


('AT0346', 'TG1353', 'TMS1233', 'T', '2024-08-17', 'absences','M004', 1, 'To001'),
('AT0347', 'TG1353', 'TMS1233', 'T', '2024-08-24', 'present',NULL, 2, 'To001'),
('AT0348', 'TG1353', 'TMS1233', 'T', '2024-08-31', 'present',NULL, 3, 'To001'),
('AT0349', 'TG1353', 'TMS1233', 'T', '2024-09-08', 'present',NULL, 4, 'To001'),
('AT0350', 'TG1353', 'TMS1233', 'T', '2024-09-15', 'present',NULL, 5, 'To001'),
('AT0351', 'TG1353', 'TMS1233', 'T', '2024-09-22', 'absences','M008', 6, 'To001'),
('AT0352', 'TG1353', 'TMS1233', 'T', '2024-09-29', 'present',NULL, 7, 'To001'),
('AT0353', 'TG1353', 'TMS1233', 'T', '2024-10-06', 'absences',NULL, 8, 'To001'),
('AT0354', 'TG1353', 'TMS1233', 'T', '2024-10-29', 'present',NULL, 9, 'To001'),
('AT0355', 'TG1353', 'TMS1233', 'T', '2024-11-05', 'present',NULL, 10, 'To001'),
('AT0356', 'TG1353', 'TMS1233', 'T', '2024-11-12', 'present',NULL, 11, 'To001'),
('AT0357', 'TG1353', 'TMS1233', 'T', '2024-11-19', 'present',NULL, 12, 'To001'),
('AT0358', 'TG1353', 'TMS1233', 'T', '2024-11-26', 'present',NULL, 13, 'To001'),
('AT0359', 'TG1353', 'TMS1233', 'T', '2024-12-03', 'present',NULL, 14, 'To001'),
('AT0360', 'TG1353', 'TMS1233', 'T', '2024-12-10', 'absences',NULL, 15, 'To001'),



('AT0362', 'TG1474', 'ENT1211', 'P', '2024-08-13', 'present',NULL, 1, 'To003'),
('AT0364', 'TG1474', 'ENT1211', 'P', '2024-08-20', 'present',NULL, 2, 'To003'),
('AT0366', 'TG1474', 'ENT1211', 'P', '2024-08-27', 'present',NULL, 3, 'To003'),
('AT0368', 'TG1474', 'ENT1211', 'P', '2024-08-03', 'present',NULL, 4, 'To003'),
('AT0370', 'TG1474', 'ENT1211', 'P', '2024-08-10', 'present',NULL, 5, 'To003'),
('AT0372', 'TG1474', 'ENT1211', 'P', '2024-08-17', 'present',NULL, 6, 'To003'),
('AT0374', 'TG1474', 'ENT1211', 'P', '2024-08-24', 'present',NULL, 7, 'To003'),
('AT0376', 'TG1474', 'ENT1211', 'P', '2024-09-01', 'present',NULL, 8, 'To003'),
('AT0378', 'TG1474', 'ENT1211', 'P', '2024-09-08', 'present',NULL, 9, 'To003'),
('AT0380', 'TG1474', 'ENT1211', 'P', '2024-09-15', 'present',NULL, 10, 'To003'),
('AT0382', 'TG1474', 'ENT1211', 'P', '2024-09-21', 'present',NULL, 11, 'To003'),
('AT0384', 'TG1474', 'ENT1211', 'P', '2024-09-28', 'present',NULL, 12, 'To003'),
('AT0386', 'TG1474', 'ENT1211', 'P', '2024-10-05', 'present',NULL, 13, 'To003'),
('AT0388', 'TG1474', 'ENT1211', 'P', '2024-10-12', 'present',NULL, 14, 'To003'),
('AT0390', 'TG1474', 'ENT1211', 'P', '2024-10-19', 'present',NULL, 15, 'To003'),


('AT0391', 'TG1474', 'ENT1221', 'TP', '2024-08-14', 'present',NULL, 1, 'To003'),
('AT0392', 'TG1474', 'ENT1221', 'TP', '2024-08-21', 'present',NULL, 2, 'To003'),
('AT0393', 'TG1474', 'ENT1221', 'TP', '2024-08-28', 'present',NULL, 3, 'To003'),
('AT0394', 'TG1474', 'ENT1221', 'TP', '2024-09-05', 'present',NULL, 4, 'To003'),
('AT0395', 'TG1474', 'ENT1221', 'TP', '2024-09-12', 'present',NULL, 5, 'To003'),
('AT0396', 'TG1474', 'ENT1221', 'TP', '2024-09-19', 'present',NULL, 6, 'To003'),
('AT0397', 'TG1474', 'ENT1221', 'TP', '2024-09-26', 'present',NULL, 7, 'To003'),
('AT0398', 'TG1474', 'ENT1221', 'TP', '2024-10-03', 'present',NULL, 8, 'To003'),
('AT0399', 'TG1474', 'ENT1221', 'TP', '2024-10-10', 'present',NULL, 9, 'To003'),
('AT0400', 'TG1474', 'ENT1221', 'TP', '2024-10-17', 'present',NULL, 10, 'To003'),
('AT0401', 'TG1474', 'ENT1221', 'TP', '2024-10-24', 'present',NULL, 11, 'To003'),
('AT0402', 'TG1474', 'ENT1221', 'TP', '2024-10-31', 'present',NULL, 12, 'To003'),
('AT0403', 'TG1474', 'ENT1221', 'TP', '2024-11-07', 'present',NULL, 13, 'To003'),
('AT0404', 'TG1474', 'ENT1221', 'TP', '2024-11-14', 'present',NULL, 14, 'To003'),
('AT0405', 'TG1474', 'ENT1221', 'TP', '2024-11-21', 'present',NULL, 15, 'To003'),


('AT0406', 'TG1474', 'ENT1231', 'P', '2024-08-13', 'present',NULL, 1, 'To003'),
('AT0407', 'TG1474', 'ENT1231', 'P', '2024-08-20', 'present',NULL, 2, 'To003'),
('AT0408', 'TG1474', 'ENT1231', 'P', '2024-08-27', 'present',NULL, 3, 'To003'),
('AT0409', 'TG1474', 'ENT1231', 'P', '2024-08-03', 'present',NULL, 4, 'To003'),
('AT0410', 'TG1474', 'ENT1231', 'P', '2024-08-10', 'present',NULL, 5, 'To003'),
('AT0411', 'TG1474', 'ENT1231', 'P', '2024-08-17', 'present',NULL, 6, 'To003'),
('AT0412', 'TG1474', 'ENT1231', 'P', '2024-08-24', 'present',NULL, 7, 'To003'),
('AT0413', 'TG1474', 'ENT1231', 'P', '2024-09-01', 'present',NULL, 8, 'To003'),
('AT0414', 'TG1474', 'ENT1231', 'P', '2024-09-08', 'present',NULL, 9, 'To003'),
('AT0415', 'TG1474', 'ENT1231', 'P', '2024-09-15', 'present',NULL, 10, 'To003'),
('AT0416', 'TG1474', 'ENT1231', 'P', '2024-09-21', 'present',NULL, 11, 'To003'),
('AT0417', 'TG1474', 'ENT1231', 'P', '2024-09-28', 'present',NULL, 12, 'To003'),
('AT0418', 'TG1474', 'ENT1231', 'P', '2024-10-05', 'present',NULL, 13, 'To003'),
('AT0419', 'TG1474', 'ENT1231', 'P', '2024-10-12', 'present',NULL, 14, 'To003'),
('AT0420', 'TG1474', 'ENT1231', 'P', '2024-10-19', 'present',NULL, 15, 'To003'),


('AT0421', 'TG1474', 'ENT1242', 'T', '2024-08-16', 'present',NULL, 1, 'To002'),
('AT0422', 'TG1474', 'ENT1242', 'T', '2024-08-23', 'present',NULL, 2, 'To002'),
('AT0423', 'TG1474', 'ENT1242', 'T', '2024-08-30', 'present',NULL, 3, 'To002'),
('AT0424', 'TG1474', 'ENT1242', 'T', '2024-09-07', 'present',NULL, 4, 'To002'),
('AT0425', 'TG1474', 'ENT1242', 'T', '2024-09-14', 'present',NULL, 5, 'To002'),
('AT0426', 'TG1474', 'ENT1242', 'T', '2024-09-21', 'present',NULL, 6, 'To002'),
('AT0427', 'TG1474', 'ENT1242', 'T', '2024-09-28', 'present',NULL, 7, 'To002'),
('AT0428', 'TG1474', 'ENT1242', 'T', '2024-10-05', 'present',NULL, 8, 'To002'),
('AT0429', 'TG1474', 'ENT1242', 'T', '2024-10-12', 'present',NULL, 9, 'To002'),
('AT0430', 'TG1474', 'ENT1242', 'T', '2024-10-19', 'present',NULL, 10, 'To002'),
('AT0431', 'TG1474', 'ENT1242', 'T', '2024-10-26', 'present',NULL, 11, 'To002'),
('AT0432', 'TG1474', 'ENT1242', 'T', '2024-11-02', 'present',NULL, 12, 'To002'),
('AT0433', 'TG1474', 'ENT1242', 'T', '2024-11-09', 'present',NULL, 13, 'To002'),
('AT0434', 'TG1474', 'ENT1242', 'T', '2024-11-16', 'present',NULL, 14, 'To002'),
('AT0435', 'TG1474', 'ENT1242', 'T', '2024-11-23', 'present',NULL, 15, 'To002'),


('AT0436', 'TG1474', 'ENT1253', 'T', '2024-08-17', 'present',NULL, 1, 'To002'),
('AT0437', 'TG1474', 'ENT1253', 'T', '2024-08-24', 'present',NULL, 2, 'To002'),
('AT0438', 'TG1474', 'ENT1253', 'T', '2024-08-31', 'present',NULL, 3, 'To002'),
('AT0439', 'TG1474', 'ENT1253', 'T', '2024-09-08', 'present',NULL, 4, 'To002'),
('AT0440', 'TG1474', 'ENT1253', 'T', '2024-09-15', 'present',NULL, 5, 'To002'),
('AT0441', 'TG1474', 'ENT1253', 'T', '2024-09-22', 'present',NULL, 6, 'To002'),
('AT0442', 'TG1474', 'ENT1253', 'T', '2024-09-29', 'present',NULL, 7, 'To002'),
('AT0443', 'TG1474', 'ENT1253', 'T', '2024-10-06', 'present',NULL, 8, 'To002'),
('AT0444', 'TG1474', 'ENT1253', 'T', '2024-10-29', 'present',NULL, 9, 'To002'),
('AT0445', 'TG1474', 'ENT1253', 'T', '2024-11-05', 'present',NULL, 10, 'To002'),
('AT0446', 'TG1474', 'ENT1253', 'T', '2024-11-12', 'present',NULL, 11, 'To002'),
('AT0447', 'TG1474', 'ENT1253', 'T', '2024-11-19', 'present',NULL, 12, 'To002'),
('AT0448', 'TG1474', 'ENT1253', 'T', '2024-11-26', 'present',NULL, 13, 'To002'),
('AT0449', 'TG1474', 'ENT1253', 'T', '2024-12-03', 'present',NULL, 14, 'To002'),
('AT0450', 'TG1474', 'ENT1253', 'T', '2024-12-10', 'present',NULL, 15, 'To002'),


('AT0451', 'TG1474', 'TMS1213', 'T', '2024-08-15', 'present',NULL, 1, 'To002'),
('AT0452', 'TG1474', 'TMS1213', 'T', '2024-08-22', 'present',NULL, 2, 'To002'),
('AT0453', 'TG1474', 'TMS1213', 'T', '2024-08-29', 'present',NULL, 3, 'To002'),
('AT0454', 'TG1474', 'TMS1213', 'T', '2024-09-06', 'present',NULL, 4, 'To002'),
('AT0455', 'TG1474', 'TMS1213', 'T', '2024-09-13', 'present',NULL, 5, 'To002'),
('AT0456', 'TG1474', 'TMS1213', 'T', '2024-09-20', 'present',NULL, 6, 'To002'),
('AT0457', 'TG1474', 'TMS1213', 'T', '2024-09-27', 'present',NULL, 7, 'To002'),
('AT0458', 'TG1474', 'TMS1213', 'T', '2024-10-04', 'present',NULL, 8, 'To002'),
('AT0459', 'TG1474', 'TMS1213', 'T', '2024-10-27', 'present',NULL, 9, 'To002'),
('AT0460', 'TG1474', 'TMS1213', 'T', '2024-11-03', 'present',NULL, 10, 'To002'),
('AT0461', 'TG1474', 'TMS1213', 'T', '2024-11-10', 'present',NULL, 11, 'To002'),
('AT0462', 'TG1474', 'TMS1213', 'T', '2024-11-17', 'present',NULL, 12, 'To002'),
('AT0463', 'TG1474', 'TMS1213', 'T', '2024-11-24', 'present',NULL, 13, 'To002'),
('AT0464', 'TG1474', 'TMS1213', 'T', '2024-12-01', 'present',NULL, 14, 'To002'),
('AT0465', 'TG1474', 'TMS1213', 'T', '2024-12-08', 'present',NULL, 15, 'To002'),


('AT0466', 'TG1474', 'TMS1223', 'TP', '2024-08-15', 'present',NULL, 1, 'To003'),
('AT0467', 'TG1474', 'TMS1223', 'TP', '2024-08-22', 'present',NULL, 2, 'To003'),
('AT0468', 'TG1474', 'TMS1223', 'TP', '2024-08-29', 'present',NULL, 3, 'To003'),
('AT0469', 'TG1474', 'TMS1223', 'TP', '2024-09-06', 'present',NULL, 4, 'To003'),
('AT0470', 'TG1474', 'TMS1223', 'TP', '2024-09-13', 'present',NULL, 5, 'To003'),
('AT0471', 'TG1474', 'TMS1223', 'TP', '2024-09-20', 'present',NULL, 6, 'To003'),
('AT0472', 'TG1474', 'TMS1223', 'TP', '2024-09-27', 'present',NULL, 7, 'To003'),
('AT0473', 'TG1474', 'TMS1223', 'TP', '2024-10-04', 'present',NULL, 8, 'To003'),
('AT0474', 'TG1474', 'TMS1223', 'TP', '2024-10-27', 'present',NULL, 9, 'To003'),
('AT0475', 'TG1474', 'TMS1223', 'TP', '2024-11-03', 'present',NULL, 10, 'To003'),
('AT0476', 'TG1474', 'TMS1223', 'TP', '2024-11-10', 'present',NULL, 11, 'To003'),
('AT0477', 'TG1474', 'TMS1223', 'TP', '2024-11-17', 'present',NULL, 12, 'To003'),
('AT0478', 'TG1474', 'TMS1223', 'TP', '2024-11-24', 'present',NULL, 13, 'To003'),
('AT0479', 'TG1474', 'TMS1223', 'TP', '2024-12-01', 'present',NULL, 14, 'To003'),
('AT0480', 'TG1474', 'TMS1223', 'TP', '2024-12-08', 'present',NULL, 15, 'To003'),




('AT0481', 'TG1444', 'ENT1211', 'P', '2024-08-13', 'present',NULL, 1, 'To003'),
('AT0482', 'TG1444', 'ENT1211', 'P', '2024-08-20', 'present',NULL, 2, 'To003'),
('AT0483', 'TG1444', 'ENT1211', 'P', '2024-08-27', 'present',NULL, 3, 'To003'),
('AT0484', 'TG1444', 'ENT1211', 'P', '2024-08-03', 'present',NULL, 4, 'To003'),
('AT0485', 'TG1444', 'ENT1211', 'P', '2024-08-10', 'present',NULL, 5, 'To003'),
('AT0486', 'TG1444', 'ENT1211', 'P', '2024-08-17', 'present',NULL, 6, 'To003'),
('AT0487', 'TG1444', 'ENT1211', 'P', '2024-08-24', 'present',NULL, 7, 'To003'),
('AT0488', 'TG1444', 'ENT1211', 'P', '2024-09-01', 'present',NULL, 8, 'To003'),
('AT0489', 'TG1444', 'ENT1211', 'P', '2024-09-08', 'present',NULL, 9, 'To003'),
('AT0490', 'TG1444', 'ENT1211', 'P', '2024-09-15', 'present',NULL, 10, 'To003'),
('AT0491', 'TG1444', 'ENT1211', 'P', '2024-09-21', 'present',NULL, 11, 'To003'),
('AT0492', 'TG1444', 'ENT1211', 'P', '2024-09-28', 'present',NULL, 12, 'To003'),
('AT0493', 'TG1444', 'ENT1211', 'P', '2024-10-05', 'present',NULL, 13, 'To003'),
('AT0494', 'TG1444', 'ENT1211', 'P', '2024-10-12', 'present',NULL, 14, 'To003'),
('AT0495', 'TG1444', 'ENT1211', 'P', '2024-10-19', 'present',NULL, 15, 'To003'),


('AT0496', 'TG1444', 'ENT1221', 'TP', '2024-08-14', 'present',NULL, 1, 'To003'),
('AT0497', 'TG1444', 'ENT1221', 'TP', '2024-08-21', 'present',NULL, 2, 'To003'),
('AT0498', 'TG1444', 'ENT1221', 'TP', '2024-08-28', 'present',NULL, 3, 'To003'),
('AT0499', 'TG1444', 'ENT1221', 'TP', '2024-09-05', 'present',NULL, 4, 'To003'),
('AT0500', 'TG1444', 'ENT1221', 'TP', '2024-09-12', 'present',NULL, 5, 'To003'),
('AT0501', 'TG1444', 'ENT1221', 'TP', '2024-09-19', 'present',NULL, 6, 'To003'),
('AT0502', 'TG1444', 'ENT1221', 'TP', '2024-09-26', 'present',NULL, 7, 'To003'),
('AT0503', 'TG1444', 'ENT1221', 'TP', '2024-10-03', 'present',NULL, 8, 'To003'),
('AT0504', 'TG1444', 'ENT1221', 'TP', '2024-10-10', 'present',NULL, 9, 'To003'),
('AT0505', 'TG1444', 'ENT1221', 'TP', '2024-10-17', 'present',NULL, 10, 'To003'),
('AT0506', 'TG1444', 'ENT1221', 'TP', '2024-10-24', 'present',NULL, 11, 'To003'),
('AT0507', 'TG1444', 'ENT1221', 'TP', '2024-10-31', 'present',NULL, 12, 'To003'),
('AT0508', 'TG1444', 'ENT1221', 'TP', '2024-11-07', 'present',NULL, 13, 'To003'),
('AT0509', 'TG1444', 'ENT1221', 'TP', '2024-11-14', 'present',NULL, 14, 'To003'),
('AT0510', 'TG1444', 'ENT1221', 'TP', '2024-11-21', 'present',NULL, 15, 'To003'),


('AT0511', 'TG1444', 'ENT1231', 'P', '2024-08-13', 'present',NULL, 1, 'To003'),
('AT0512', 'TG1444', 'ENT1231', 'P', '2024-08-20', 'present',NULL, 2, 'To003'),
('AT0513', 'TG1444', 'ENT1231', 'P', '2024-08-27', 'present',NULL, 3, 'To003'),
('AT0514', 'TG1444', 'ENT1231', 'P', '2024-08-03', 'present',NULL, 4, 'To003'),
('AT0515', 'TG1444', 'ENT1231', 'P', '2024-08-10', 'present',NULL, 5, 'To003'),
('AT0516', 'TG1444', 'ENT1231', 'P', '2024-08-17', 'present',NULL, 6, 'To003'),
('AT0517', 'TG1444', 'ENT1231', 'P', '2024-08-24', 'present',NULL, 7, 'To003'),
('AT0518', 'TG1444', 'ENT1231', 'P', '2024-09-01', 'present',NULL, 8, 'To003'),
('AT0519', 'TG1444', 'ENT1231', 'P', '2024-09-08', 'present',NULL, 9, 'To003'),
('AT0520', 'TG1444', 'ENT1231', 'P', '2024-09-15', 'present',NULL, 10, 'To003'),
('AT0521', 'TG1444', 'ENT1231', 'P', '2024-09-21', 'present',NULL, 11, 'To003'),
('AT0522', 'TG1444', 'ENT1231', 'P', '2024-09-28', 'present',NULL, 12, 'To003'),
('AT0523', 'TG1444', 'ENT1231', 'P', '2024-10-05', 'present',NULL, 13, 'To003'),
('AT0524', 'TG1444', 'ENT1231', 'P', '2024-10-12', 'present',NULL, 14, 'To003'),
('AT0525', 'TG1444', 'ENT1231', 'P', '2024-10-19', 'present',NULL, 15, 'To003'),


('AT0526', 'TG1444', 'ENT1242', 'T', '2024-08-16', 'present',NULL, 1, 'To002'),
('AT0527', 'TG1444', 'ENT1242', 'T', '2024-08-23', 'present',NULL, 2, 'To002'),
('AT0528', 'TG1444', 'ENT1242', 'T', '2024-08-30', 'present',NULL, 3, 'To002'),
('AT0529', 'TG1444', 'ENT1242', 'T', '2024-09-07', 'present',NULL, 4, 'To002'),
('AT0530', 'TG1444', 'ENT1242', 'T', '2024-09-14', 'present',NULL, 5, 'To002'),
('AT0531', 'TG1444', 'ENT1242', 'T', '2024-09-21', 'present',NULL, 6, 'To002'),
('AT0532', 'TG1444', 'ENT1242', 'T', '2024-09-28', 'present',NULL, 7, 'To002'),
('AT0533', 'TG1444', 'ENT1242', 'T', '2024-10-05', 'present',NULL, 8, 'To002'),
('AT0534', 'TG1444', 'ENT1242', 'T', '2024-10-12', 'present',NULL, 9, 'To002'),
('AT0535', 'TG1444', 'ENT1242', 'T', '2024-10-19', 'present',NULL, 10, 'To002'),
('AT0536', 'TG1444', 'ENT1242', 'T', '2024-10-26', 'present',NULL, 11, 'To002'),
('AT0537', 'TG1444', 'ENT1242', 'T', '2024-11-02', 'present',NULL, 12, 'To002'),
('AT0538', 'TG1444', 'ENT1242', 'T', '2024-11-09', 'present',NULL, 13, 'To002'),
('AT0539', 'TG1444', 'ENT1242', 'T', '2024-11-16', 'present',NULL, 14, 'To002'),
('AT0540', 'TG1444', 'ENT1242', 'T', '2024-11-23', 'present',NULL, 15, 'To002'),


('AT0541', 'TG1444', 'ENT1253', 'T', '2024-08-17', 'present',NULL, 1, 'To002'),
('AT0542', 'TG1444', 'ENT1253', 'T', '2024-08-24', 'present',NULL, 2, 'To002'),
('AT0543', 'TG1444', 'ENT1253', 'T', '2024-08-31', 'present',NULL, 3, 'To002'),
('AT0544', 'TG1444', 'ENT1253', 'T', '2024-09-08', 'present',NULL, 4, 'To002'),
('AT0545', 'TG1444', 'ENT1253', 'T', '2024-09-15', 'present',NULL, 5, 'To002'),
('AT0546', 'TG1444', 'ENT1253', 'T', '2024-09-22', 'present',NULL, 6, 'To002'),
('AT0547', 'TG1444', 'ENT1253', 'T', '2024-09-29', 'present',NULL, 7, 'To002'),
('AT0548', 'TG1444', 'ENT1253', 'T', '2024-10-06', 'present',NULL, 8, 'To002'),
('AT0549', 'TG1444', 'ENT1253', 'T', '2024-10-29', 'present',NULL, 9, 'To002'),
('AT0550', 'TG1444', 'ENT1253', 'T', '2024-11-05', 'present',NULL, 10, 'To002'),
('AT0551', 'TG1444', 'ENT1253', 'T', '2024-11-12', 'present',NULL, 11, 'To002'),
('AT0552', 'TG1444', 'ENT1253', 'T', '2024-11-19', 'present',NULL, 12, 'To002'),
('AT0553', 'TG1444', 'ENT1253', 'T', '2024-11-26', 'present',NULL, 13, 'To002'),
('AT0554', 'TG1444', 'ENT1253', 'T', '2024-12-03', 'present',NULL, 14, 'To002'),
('AT0555', 'TG1444', 'ENT1253', 'T', '2024-12-10', 'present',NULL, 15, 'To002'),


('AT0556', 'TG1444', 'TMS1213', 'T', '2024-08-15', 'present',NULL, 1, 'To002'),
('AT0557', 'TG1444', 'TMS1213', 'T', '2024-08-22', 'present',NULL, 2, 'To002'),
('AT0558', 'TG1444', 'TMS1213', 'T', '2024-08-29', 'present',NULL, 3, 'To002'),
('AT0559', 'TG1444', 'TMS1213', 'T', '2024-09-06', 'present',NULL, 4, 'To002'),
('AT0560', 'TG1444', 'TMS1213', 'T', '2024-09-13', 'present',NULL, 5, 'To002'),
('AT0561', 'TG1444', 'TMS1213', 'T', '2024-09-27', 'present',NULL, 7, 'To002'),
('AT0562', 'TG1444', 'TMS1213', 'T', '2024-09-20', 'present',NULL, 6, 'To002'),
('AT0563', 'TG1444', 'TMS1213', 'T', '2024-10-04', 'present',NULL, 8, 'To002'),
('AT0564', 'TG1444', 'TMS1213', 'T', '2024-10-27', 'present',NULL, 9, 'To002'),
('AT0565', 'TG1444', 'TMS1213', 'T', '2024-11-03', 'present',NULL, 10, 'To002'),
('AT0566', 'TG1444', 'TMS1213', 'T', '2024-11-10', 'present',NULL, 11, 'To002'),
('AT0567', 'TG1444', 'TMS1213', 'T', '2024-11-17', 'present',NULL, 12, 'To002'),
('AT0568', 'TG1444', 'TMS1213', 'T', '2024-11-24', 'present',NULL, 13, 'To002'),
('AT0569', 'TG1444', 'TMS1213', 'T', '2024-12-01', 'present',NULL, 14, 'To002'),
('AT0570', 'TG1444', 'TMS1213', 'T', '2024-12-08', 'present',NULL, 15, 'To002'),

('AT0571', 'TG1444', 'TMS1223', 'TP', '2024-08-15', 'present',NULL, 1, 'To003'),
('AT0572', 'TG1444', 'TMS1223', 'TP', '2024-08-22', 'present',NULL, 2, 'To003'),
('AT0573', 'TG1444', 'TMS1223', 'TP', '2024-08-29', 'present',NULL, 3, 'To003'),
('AT0574', 'TG1444', 'TMS1223', 'TP', '2024-09-06', 'present',NULL, 4, 'To003'),
('AT0575', 'TG1444', 'TMS1223', 'TP', '2024-09-13', 'present',NULL, 5, 'To003'),
('AT0576', 'TG1444', 'TMS1223', 'TP', '2024-09-20', 'present',NULL, 6, 'To003'),
('AT0577', 'TG1444', 'TMS1223', 'TP', '2024-09-27', 'present',NULL, 7, 'To003'),
('AT0578', 'TG1444', 'TMS1223', 'TP', '2024-10-04', 'present',NULL, 8, 'To003'),
('AT0579', 'TG1444', 'TMS1223', 'TP', '2024-10-27', 'present',NULL, 9, 'To003'),
('AT0580', 'TG1444', 'TMS1223', 'TP', '2024-11-03', 'present',NULL, 10, 'To003'),
('AT0581', 'TG1444', 'TMS1223', 'TP', '2024-11-10', 'present',NULL, 11, 'To003'),
('AT0582', 'TG1444', 'TMS1223', 'TP', '2024-11-17', 'present',NULL, 12, 'To003'),
('AT0583', 'TG1444', 'TMS1223', 'TP', '2024-11-24', 'present',NULL, 13, 'To003'),
('AT0584', 'TG1444', 'TMS1223', 'TP', '2024-12-01', 'present',NULL, 14, 'To003'),
('AT0585', 'TG1444', 'TMS1223', 'TP', '2024-12-08', 'present',NULL, 15, 'To003'),




('AT0586', 'TG1610', 'BST1212', 'TP', '2024-08-13', 'present',NULL, 1, 'To004'),
('AT0587', 'TG1610', 'BST1212', 'TP', '2024-08-20', 'present',NULL, 2, 'To004'),
('AT0588', 'TG1610', 'BST1212', 'TP', '2024-08-27', 'present',NULL, 3, 'To004'),
('AT0589', 'TG1610', 'BST1212', 'TP', '2024-09-03', 'present',NULL, 4, 'To004'),
('AT0590', 'TG1610', 'BST1212', 'TP', '2024-09-10', 'present',NULL, 5, 'To004'),
('AT0591', 'TG1610', 'BST1212', 'TP', '2024-09-17', 'present',NULL, 6, 'To004'),
('AT0592', 'TG1610', 'BST1212', 'TP', '2024-09-24', 'present',NULL, 7, 'To004'),
('AT0593', 'TG1610', 'BST1212', 'TP', '2024-10-01', 'present',NULL, 8, 'To004'),
('AT0594', 'TG1610', 'BST1212', 'TP', '2024-10-08', 'present',NULL, 9, 'To004'),
('AT0595', 'TG1610', 'BST1212', 'TP', '2024-10-15', 'present',NULL, 10, 'To004'),
('AT0596', 'TG1610', 'BST1212', 'TP', '2024-10-22', 'present',NULL, 11, 'To004'),
('AT0597', 'TG1610', 'BST1212', 'TP', '2024-10-29', 'present',NULL, 12, 'To004'),
('AT0598', 'TG1610', 'BST1212', 'TP', '2024-11-05', 'present',NULL, 13, 'To004'),
('AT0599', 'TG1610', 'BST1212', 'TP', '2024-11-12', 'present',NULL, 14, 'To004'),
('AT0600', 'TG1610', 'BST1212', 'TP', '2024-11-19', 'present',NULL, 15, 'To004'),


('AT0601', 'TG1610', 'BST1222', 'TP', '2024-08-14', 'present',NULL, 1, 'To004'),
('AT0602', 'TG1610', 'BST1222', 'TP', '2024-08-21', 'present',NULL, 2, 'To004'),
('AT0603', 'TG1610', 'BST1222', 'TP', '2024-08-28', 'present',NULL, 3, 'To004'),
('AT0604', 'TG1610', 'BST1222', 'TP', '2024-09-05', 'present',NULL, 4, 'To004'),
('AT0605', 'TG1610', 'BST1222', 'TP', '2024-09-12', 'present',NULL, 5, 'To004'),
('AT0606', 'TG1610', 'BST1222', 'TP', '2024-09-19', 'present',NULL, 6, 'To004'),
('AT0607', 'TG1610', 'BST1222', 'TP', '2024-09-26', 'present',NULL, 7, 'To004'),
('AT0608', 'TG1610', 'BST1222', 'TP', '2024-10-03', 'present',NULL, 8, 'To004'),
('AT0609', 'TG1610', 'BST1222', 'TP', '2024-10-10', 'present',NULL, 9, 'To004'),
('AT0610', 'TG1610', 'BST1222', 'TP', '2024-10-17', 'present',NULL, 10, 'To004'),
('AT0611', 'TG1610', 'BST1222', 'TP', '2024-10-24', 'present',NULL, 11, 'To004'),
('AT0612', 'TG1610', 'BST1222', 'TP', '2024-10-31', 'present',NULL, 12, 'To004'),
('AT0613', 'TG1610', 'BST1222', 'TP', '2024-11-07', 'present',NULL, 13, 'To004'),
('AT0614', 'TG1610', 'BST1222', 'TP', '2024-11-14', 'present',NULL, 14, 'To004'),
('AT0615', 'TG1610', 'BST1222', 'TP', '2024-11-21', 'present',NULL, 15, 'To004'),


('AT0616', 'TG1610', 'BST1232', 'TP', '2024-08-14', 'present',NULL, 1, 'To004'),
('AT0617', 'TG1610', 'BST1232', 'TP', '2024-08-21', 'present',NULL, 2, 'To004'),
('AT0618', 'TG1610', 'BST1232', 'TP', '2024-08-28', 'present',NULL, 3, 'To004'),
('AT0619', 'TG1610', 'BST1232', 'TP', '2024-09-05', 'present',NULL, 4, 'To004'),
('AT0620', 'TG1610', 'BST1232', 'TP', '2024-09-12', 'present',NULL, 5, 'To004'),
('AT0621', 'TG1610', 'BST1232', 'TP', '2024-09-19', 'present',NULL, 6, 'To004'),
('AT0622', 'TG1610', 'BST1232', 'TP', '2024-09-26', 'present',NULL, 7, 'To004'),
('AT0623', 'TG1610', 'BST1232', 'TP', '2024-10-03', 'present',NULL, 8, 'To004'),
('AT0624', 'TG1610', 'BST1232', 'TP', '2024-10-10', 'present',NULL, 9, 'To004'),
('AT0625', 'TG1610', 'BST1232', 'TP', '2024-10-17', 'present',NULL, 10, 'To004'),
('AT0626', 'TG1610', 'BST1232', 'TP', '2024-10-24', 'present',NULL, 11, 'To004'),
('AT0627', 'TG1610', 'BST1232', 'TP', '2024-10-31', 'present',NULL, 12, 'To004'),
('AT0628', 'TG1610', 'BST1232', 'TP', '2024-11-07', 'present',NULL, 13, 'To004'),
('AT0629', 'TG1610', 'BST1232', 'TP', '2024-11-14', 'present',NULL, 14, 'To004'),
('AT0630', 'TG1610', 'BST1232', 'TP', '2024-11-21', 'present',NULL, 15, 'To004'),


('AT0631', 'TG1610', 'BST1242', 'TP', '2024-08-15', 'present',NULL, 1, 'To004'),
('AT0632', 'TG1610', 'BST1242', 'TP', '2024-08-22', 'present',NULL, 2, 'To004'),
('AT0633', 'TG1610', 'BST1242', 'TP', '2024-08-29', 'present',NULL, 3, 'To004'),
('AT0634', 'TG1610', 'BST1242', 'TP', '2024-09-06', 'present',NULL, 4, 'To004'),
('AT0635', 'TG1610', 'BST1242', 'TP', '2024-09-13', 'present',NULL, 5, 'To004'),
('AT0636', 'TG1610', 'BST1242', 'TP', '2024-09-20', 'present',NULL, 6, 'To004'),
('AT0637', 'TG1610', 'BST1242', 'TP', '2024-09-27', 'present',NULL, 7, 'To004'),
('AT0638', 'TG1610', 'BST1242', 'TP', '2024-10-04', 'present',NULL, 8, 'To004'),
('AT0639', 'TG1610', 'BST1242', 'TP', '2024-10-11', 'present',NULL, 9, 'To004'),
('AT0640', 'TG1610', 'BST1242', 'TP', '2024-10-18', 'present',NULL, 10, 'To004'),
('AT0641', 'TG1610', 'BST1242', 'TP', '2024-10-25', 'present',NULL, 11, 'To004'),
('AT0642', 'TG1610', 'BST1242', 'TP', '2024-11-01', 'present',NULL, 12, 'To004'),
('AT0643', 'TG1610', 'BST1242', 'TP', '2024-11-08', 'present',NULL, 13, 'To004'),
('AT0644', 'TG1610', 'BST1242', 'TP', '2024-11-15', 'present',NULL, 14, 'To004'),
('AT0645', 'TG1610', 'BST1242', 'TP', '2024-11-22', 'present',NULL, 15, 'To004'),


('AT0646', 'TG1610', 'BST1251', 'T', '2024-08-15', 'present',NULL, 1, 'To004'),
('AT0647', 'TG1610', 'BST1251', 'T', '2024-08-22', 'present',NULL, 2, 'To004'),
('AT0648', 'TG1610', 'BST1251', 'T', '2024-08-29', 'present',NULL, 3, 'To004'),
('AT0649', 'TG1610', 'BST1251', 'T', '2024-09-06', 'present',NULL, 4, 'To004'),
('AT0650', 'TG1610', 'BST1251', 'T', '2024-09-13', 'present',NULL, 5, 'To004'),
('AT0651', 'TG1610', 'BST1251', 'T', '2024-09-20', 'present',NULL, 6, 'To004'),
('AT0652', 'TG1610', 'BST1251', 'T', '2024-09-27', 'present',NULL, 7, 'To004'),
('AT0653', 'TG1610', 'BST1251', 'T', '2024-10-04', 'present',NULL, 8, 'To004'),
('AT0654', 'TG1610', 'BST1251', 'T', '2024-10-27', 'present',NULL, 9, 'To004'),
('AT0655', 'TG1610', 'BST1251', 'T', '2024-11-03', 'present',NULL, 10, 'To004'),
('AT0656', 'TG1610', 'BST1251', 'T', '2024-11-10', 'present',NULL, 11, 'To004'),
('AT0657', 'TG1610', 'BST1251', 'T', '2024-11-17', 'present',NULL, 12, 'To004'),
('AT0658', 'TG1610', 'BST1251', 'T', '2024-11-24', 'present',NULL, 13, 'To004'),
('AT0659', 'TG1610', 'BST1251', 'T', '2024-12-01', 'present',NULL, 14, 'To004'),
('AT0660', 'TG1610', 'BST1251', 'T', '2024-12-08', 'present',NULL, 15, 'To004'),


('AT0661', 'TG1610', 'BST1262', 'TP', '2024-08-16', 'present',NULL, 1, 'To004'),
('AT0662', 'TG1610', 'BST1262', 'TP', '2024-08-23', 'present',NULL, 2, 'To004'),
('AT0663', 'TG1610', 'BST1262', 'TP', '2024-08-30', 'present',NULL, 3, 'To004'),
('AT0664', 'TG1610', 'BST1262', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0665', 'TG1610', 'BST1262', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0666', 'TG1610', 'BST1262', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0667', 'TG1610', 'BST1262', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0668', 'TG1610', 'BST1262', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0669', 'TG1610', 'BST1262', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0670', 'TG1610', 'BST1262', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0671', 'TG1610', 'BST1262', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0672', 'TG1610', 'BST1262', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0673', 'TG1610', 'BST1262', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0674', 'TG1610', 'BST1262', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0675', 'TG1610', 'BST1262', 'TP', '2024-11-23', 'present',NULL, 15, 'To004'),


('AT0676', 'TG1610', 'BST1272', 'TP', '2024-08-16', 'present',NULL, 1, 'To004'),
('AT0677', 'TG1610', 'BST1272', 'TP', '2024-08-23', 'present',NULL, 2, 'To004'),
('AT0678', 'TG1610', 'BST1272', 'TP', '2024-08-30', 'present',NULL, 3, 'To004'),
('AT0679', 'TG1610', 'BST1272', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0680', 'TG1610', 'BST1272', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0681', 'TG1610', 'BST1272', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0682', 'TG1610', 'BST1272', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0683', 'TG1610', 'BST1272', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0684', 'TG1610', 'BST1272', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0685', 'TG1610', 'BST1272', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0686', 'TG1610', 'BST1272', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0687', 'TG1610', 'BST1272', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0688', 'TG1610', 'BST1272', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0689', 'TG1610', 'BST1272', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0690', 'TG1610', 'BST1272', 'TP', '2024-11-23', 'present',NULL, 15, 'To004'),


('AT0691', 'TG1610', 'BST1282', 'TP', '2024-08-17', 'present',NULL, 1, 'To004'),
('AT0692', 'TG1610', 'BST1282', 'TP', '2024-08-24', 'present',NULL, 2, 'To004'),
('AT0693', 'TG1610', 'BST1282', 'TP', '2024-08-31', 'present',NULL, 3, 'To004'),
('AT0694', 'TG1610', 'BST1282', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0695', 'TG1610', 'BST1282', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0696', 'TG1610', 'BST1282', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0697', 'TG1610', 'BST1282', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0698', 'TG1610', 'BST1282', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0699', 'TG1610', 'BST1282', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0700', 'TG1610', 'BST1282', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0701', 'TG1610', 'BST1282', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0702', 'TG1610', 'BST1282', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0703', 'TG1610', 'BST1282', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0704', 'TG1610', 'BST1282', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0705', 'TG1610', 'BST1282', 'TP', '2024-11-23', 'present',NULL, 15, 'To004'),



('AT0706', 'TG1605', 'BST1212', 'TP', '2024-08-13', 'present',NULL, 1, 'To004'),
('AT0707', 'TG1605', 'BST1212', 'TP', '2024-08-20', 'present',NULL, 2, 'To004'),
('AT0708', 'TG1605', 'BST1212', 'TP', '2024-08-27', 'present',NULL, 3, 'To004'),
('AT0709', 'TG1605', 'BST1212', 'TP', '2024-09-03', 'present',NULL, 4, 'To004'),
('AT0710', 'TG1605', 'BST1212', 'TP', '2024-09-10', 'present',NULL, 5, 'To004'),
('AT0711', 'TG1605', 'BST1212', 'TP', '2024-09-17', 'present',NULL, 6, 'To004'),
('AT0712', 'TG1605', 'BST1212', 'TP', '2024-09-24', 'present',NULL, 7, 'To004'),
('AT0713', 'TG1605', 'BST1212', 'TP', '2024-10-01', 'present',NULL, 8, 'To004'),
('AT0714', 'TG1605', 'BST1212', 'TP', '2024-10-08', 'present',NULL, 9, 'To004'),
('AT0715', 'TG1605', 'BST1212', 'TP', '2024-10-15', 'present',NULL, 10, 'To004'),
('AT0716', 'TG1605', 'BST1212', 'TP', '2024-10-22', 'present',NULL, 11, 'To004'),
('AT0717', 'TG1605', 'BST1212', 'TP', '2024-10-29', 'present',NULL, 12, 'To004'),
('AT0718', 'TG1605', 'BST1212', 'TP', '2024-11-05', 'present',NULL, 13, 'To004'),
('AT0719', 'TG1605', 'BST1212', 'TP', '2024-11-12', 'present',NULL, 14, 'To004'),
('AT0720', 'TG1605', 'BST1212', 'TP', '2024-11-19', 'present',NULL, 15, 'To004'),


('AT0721', 'TG1605', 'BST1222', 'TP', '2024-08-14', 'present',NULL, 1, 'To004'),
('AT0722', 'TG1605', 'BST1222', 'TP', '2024-08-21', 'present',NULL, 2, 'To004'),
('AT0723', 'TG1605', 'BST1222', 'TP', '2024-08-28', 'present',NULL, 3, 'To004'),
('AT0724', 'TG1605', 'BST1222', 'TP', '2024-09-05', 'present',NULL, 4, 'To004'),
('AT0725', 'TG1605', 'BST1222', 'TP', '2024-09-12', 'present',NULL, 5, 'To004'),
('AT0726', 'TG1605', 'BST1222', 'TP', '2024-09-19', 'present',NULL, 6, 'To004'),
('AT0727', 'TG1605', 'BST1222', 'TP', '2024-09-26', 'present',NULL, 7, 'To004'),
('AT0728', 'TG1605', 'BST1222', 'TP', '2024-10-03', 'present',NULL, 8, 'To004'),
('AT0729', 'TG1605', 'BST1222', 'TP', '2024-10-10', 'present',NULL, 9, 'To004'),
('AT0730', 'TG1605', 'BST1222', 'TP', '2024-10-17', 'present',NULL, 10, 'To004'),
('AT0731', 'TG1605', 'BST1222', 'TP', '2024-10-24', 'present',NULL, 11, 'To004'),
('AT0732', 'TG1605', 'BST1222', 'TP', '2024-10-31', 'present',NULL, 12, 'To004'),
('AT0733', 'TG1605', 'BST1222', 'TP', '2024-11-07', 'present',NULL, 13, 'To004'),
('AT0734', 'TG1605', 'BST1222', 'TP', '2024-11-14', 'present',NULL, 14, 'To004'),
('AT0735', 'TG1605', 'BST1222', 'TP', '2024-11-21', 'present',NULL, 15, 'To004'),


('AT0736', 'TG1605', 'BST1232', 'TP', '2024-08-14', 'present',NULL, 1, 'To004'),
('AT0737', 'TG1605', 'BST1232', 'TP', '2024-08-21', 'present',NULL, 2, 'To004'),
('AT0738', 'TG1605', 'BST1232', 'TP', '2024-08-28', 'present',NULL, 3, 'To004'),
('AT0739', 'TG1605', 'BST1232', 'TP', '2024-09-05', 'present',NULL, 4, 'To004'),
('AT0740', 'TG1605', 'BST1232', 'TP', '2024-09-12', 'present',NULL, 5, 'To004'),
('AT0741', 'TG1605', 'BST1232', 'TP', '2024-09-19', 'present',NULL, 6, 'To004'),
('AT0742', 'TG1605', 'BST1232', 'TP', '2024-09-26', 'present',NULL, 7, 'To004'),
('AT0743', 'TG1605', 'BST1232', 'TP', '2024-10-03', 'present',NULL, 8, 'To004'),
('AT0744', 'TG1605', 'BST1232', 'TP', '2024-10-10', 'present',NULL, 9, 'To004'),
('AT0745', 'TG1605', 'BST1232', 'TP', '2024-10-17', 'present',NULL, 10, 'To004'),
('AT0746', 'TG1605', 'BST1232', 'TP', '2024-10-24', 'present',NULL, 11, 'To004'),
('AT0747', 'TG1605', 'BST1232', 'TP', '2024-10-31', 'present',NULL, 12, 'To004'),
('AT0748', 'TG1605', 'BST1232', 'TP', '2024-11-07', 'present',NULL, 13, 'To004'),
('AT0749', 'TG1605', 'BST1232', 'TP', '2024-11-14', 'present',NULL, 14, 'To004'),
('AT0750', 'TG1605', 'BST1232', 'TP', '2024-11-21', 'present',NULL, 15, 'To004'),


('AT0751', 'TG1605', 'BST1242', 'TP', '2024-08-15', 'present',NULL, 1, 'To004'),
('AT0752', 'TG1605', 'BST1242', 'TP', '2024-08-22', 'present',NULL, 2, 'To004'),
('AT0753', 'TG1605', 'BST1242', 'TP', '2024-08-29', 'present',NULL, 3, 'To004'),
('AT0754', 'TG1605', 'BST1242', 'TP', '2024-09-06', 'present',NULL, 4, 'To004'),
('AT0755', 'TG1605', 'BST1242', 'TP', '2024-09-13', 'present',NULL, 5, 'To004'),
('AT0756', 'TG1605', 'BST1242', 'TP', '2024-09-20', 'present',NULL, 6, 'To004'),
('AT0757', 'TG1605', 'BST1242', 'TP', '2024-09-27', 'present',NULL, 7, 'To004'),
('AT0758', 'TG1605', 'BST1242', 'TP', '2024-10-04', 'present',NULL, 8, 'To004'),
('AT0759', 'TG1605', 'BST1242', 'TP', '2024-10-11', 'present',NULL, 9, 'To004'),
('AT0760', 'TG1605', 'BST1242', 'TP', '2024-10-18', 'present',NULL, 10, 'To004'),
('AT0761', 'TG1605', 'BST1242', 'TP', '2024-10-25', 'present',NULL, 11, 'To004'),
('AT0762', 'TG1605', 'BST1242', 'TP', '2024-11-01', 'present',NULL, 12, 'To004'),
('AT0763', 'TG1605', 'BST1242', 'TP', '2024-11-08', 'present',NULL, 13, 'To004'),
('AT0764', 'TG1605', 'BST1242', 'TP', '2024-11-15', 'present',NULL, 14, 'To004'),
('AT0765', 'TG1605', 'BST1242', 'TP', '2024-11-22', 'present',NULL, 15, 'To004'),


('AT0766', 'TG1605', 'BST1251', 'T', '2024-08-15', 'present',NULL, 1, 'To004'),
('AT0767', 'TG1605', 'BST1251', 'T', '2024-08-22', 'present',NULL, 2, 'To004'),
('AT0768', 'TG1605', 'BST1251', 'T', '2024-08-29', 'present',NULL, 3, 'To004'),
('AT0769', 'TG1605', 'BST1251', 'T', '2024-09-06', 'present',NULL, 4, 'To004'),
('AT0770', 'TG1605', 'BST1251', 'T', '2024-09-13', 'present',NULL, 5, 'To004'),
('AT0771', 'TG1605', 'BST1251', 'T', '2024-09-20', 'present',NULL, 6, 'To004'),
('AT0772', 'TG1605', 'BST1251', 'T', '2024-09-27', 'present',NULL, 7, 'To004'),
('AT0773', 'TG1605', 'BST1251', 'T', '2024-10-04', 'present',NULL, 8, 'To004'),
('AT0774', 'TG1605', 'BST1251', 'T', '2024-10-27', 'present',NULL, 9, 'To004'),
('AT0775', 'TG1605', 'BST1251', 'T', '2024-11-03', 'present',NULL, 10, 'To004'),
('AT0776', 'TG1605', 'BST1251', 'T', '2024-11-10', 'present',NULL, 11, 'To004'),
('AT0777', 'TG1605', 'BST1251', 'T', '2024-11-17', 'present',NULL, 12, 'To004'),
('AT0778', 'TG1605', 'BST1251', 'T', '2024-11-24', 'present',NULL, 13, 'To004'),
('AT0779', 'TG1605', 'BST1251', 'T', '2024-12-01', 'present',NULL, 14, 'To004'),
('AT0780', 'TG1605', 'BST1251', 'T', '2024-12-08', 'present',NULL, 15, 'To004'),


('AT0781', 'TG1605', 'BST1262', 'TP', '2024-08-16', 'present',NULL, 1, 'To004'),
('AT0782', 'TG1605', 'BST1262', 'TP', '2024-08-23', 'present',NULL, 2, 'To004'),
('AT0783', 'TG1605', 'BST1262', 'TP', '2024-08-30', 'present',NULL, 3, 'To004'),
('AT0784', 'TG1605', 'BST1262', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0785', 'TG1605', 'BST1262', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0786', 'TG1605', 'BST1262', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0787', 'TG1605', 'BST1262', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0788', 'TG1605', 'BST1262', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0789', 'TG1605', 'BST1262', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0790', 'TG1605', 'BST1262', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0791', 'TG1605', 'BST1262', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0792', 'TG1605', 'BST1262', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0793', 'TG1605', 'BST1262', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0794', 'TG1605', 'BST1262', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0795', 'TG1605', 'BST1262', 'TP', '2024-11-23', 'present',NULL, 15, 'To004'),


('AT0796', 'TG1605', 'BST1272', 'TP', '2024-08-16', 'present',NULL, 1, 'To004'),
('AT0797', 'TG1605', 'BST1272', 'TP', '2024-08-23', 'present',NULL, 2, 'To004'),
('AT0798', 'TG1605', 'BST1272', 'TP', '2024-08-30', 'present',NULL, 3, 'To004'),
('AT0799', 'TG1605', 'BST1272', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0800', 'TG1605', 'BST1272', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0801', 'TG1605', 'BST1272', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0802', 'TG1605', 'BST1272', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0803', 'TG1605', 'BST1272', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0804', 'TG1605', 'BST1272', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0805', 'TG1605', 'BST1272', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0806', 'TG1605', 'BST1272', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0807', 'TG1605', 'BST1272', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0808', 'TG1605', 'BST1272', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0809', 'TG1605', 'BST1272', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0810', 'TG1605', 'BST1272', 'TP', '2024-11-23', 'present',NULL, 15, 'To004'),


('AT0811', 'TG1605', 'BST1282', 'TP', '2024-08-17', 'present',NULL, 1, 'To004'),
('AT0812', 'TG1605', 'BST1282', 'TP', '2024-08-24', 'present',NULL, 2, 'To004'),
('AT0813', 'TG1605', 'BST1282', 'TP', '2024-08-31', 'present',NULL, 3, 'To004'),
('AT0814', 'TG1605', 'BST1282', 'TP', '2024-09-07', 'present',NULL, 4, 'To004'),
('AT0815', 'TG1605', 'BST1282', 'TP', '2024-09-14', 'present',NULL, 5, 'To004'),
('AT0816', 'TG1605', 'BST1282', 'TP', '2024-09-21', 'present',NULL, 6, 'To004'),
('AT0817', 'TG1605', 'BST1282', 'TP', '2024-09-28', 'present',NULL, 7, 'To004'),
('AT0818', 'TG1605', 'BST1282', 'TP', '2024-10-05', 'present',NULL, 8, 'To004'),
('AT0819', 'TG1605', 'BST1282', 'TP', '2024-10-12', 'present',NULL, 9, 'To004'),
('AT0820', 'TG1605', 'BST1282', 'TP', '2024-10-19', 'present',NULL, 10, 'To004'),
('AT0821', 'TG1605', 'BST1282', 'TP', '2024-10-26', 'present',NULL, 11, 'To004'),
('AT0822', 'TG1605', 'BST1282', 'TP', '2024-11-02', 'present',NULL, 12, 'To004'),
('AT0823', 'TG1605', 'BST1282', 'TP', '2024-11-09', 'present',NULL, 13, 'To004'),
('AT0824', 'TG1605', 'BST1282', 'TP', '2024-11-16', 'present',NULL, 14, 'To004'),
('AT0825', 'TG1605', 'BST1282', 'TP', '2024-11-23', 'present',NULL, 15, 'To004');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT0946', 'TG1376', 'ENG1222', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT0947', 'TG1376', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT0948', 'TG1376', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT0949', 'TG1376', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT0950', 'TG1376', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT0951', 'TG1376', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT0952', 'TG1376', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT0953', 'TG1376', 'ENG1222', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT0954', 'TG1376', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT0955', 'TG1376', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT0956', 'TG1376', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT0957', 'TG1376', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT0958', 'TG1376', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT0959', 'TG1376', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT0960', 'TG1376', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT0961', 'TG1398', 'ENG1222', 'T', '2024-08-15', 'absences','M002', 1, 'To005'),
('AT0962', 'TG1398', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT0963', 'TG1398', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT0964', 'TG1398', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT0965', 'TG1398', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT0966', 'TG1398', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT0967', 'TG1398', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT0968', 'TG1398', 'ENG1222', 'T', '2024-10-04', 'absences','M006', 8, 'To005'),
('AT0969', 'TG1398', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT0970', 'TG1398', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT0971', 'TG1398', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT0972', 'TG1398', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT0973', 'TG1398', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT0974', 'TG1398', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT0975', 'TG1398', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT0976', 'TG1366', 'ENG1222', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT0977', 'TG1366', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT0978', 'TG1366', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT0979', 'TG1366', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT0980', 'TG1366', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT0981', 'TG1366', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT0982', 'TG1366', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT0983', 'TG1366', 'ENG1222', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT0984', 'TG1366', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT0985', 'TG1366', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT0986', 'TG1366', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT0987', 'TG1366', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT0988', 'TG1366', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT0989', 'TG1366', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT0990', 'TG1366', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT0991', 'TG1353', 'ENG1222', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT0992', 'TG1353', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT0993', 'TG1353', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT0994', 'TG1353', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT0995', 'TG1353', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT0996', 'TG1353', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT0997', 'TG1353', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT0998', 'TG1353', 'ENG1222', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT0999', 'TG1353', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1000', 'TG1353', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1001', 'TG1353', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1002', 'TG1353', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1003', 'TG1353', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1004', 'TG1353', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1005', 'TG1353', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1006', 'TG1474', 'ENG1222', 'T', '2024-08-16', 'present',NULL, 1, 'To005'),
('AT1007', 'TG1474', 'ENG1222', 'T', '2024-08-23', 'present',NULL, 2, 'To005'),
('AT1008', 'TG1474', 'ENG1222', 'T', '2024-08-30', 'present',NULL, 3, 'To005'),
('AT1009', 'TG1474', 'ENG1222', 'T', '2024-09-07', 'present',NULL, 4, 'To005'),
('AT1010', 'TG1474', 'ENG1222', 'T', '2024-09-14', 'present',NULL, 5, 'To005'),
('AT1011', 'TG1474', 'ENG1222', 'T', '2024-09-21', 'present',NULL, 6, 'To005'),
('AT1012', 'TG1474', 'ENG1222', 'T', '2024-09-28', 'present',NULL, 7, 'To005'),
('AT1013', 'TG1474', 'ENG1222', 'T', '2024-10-05', 'present',NULL, 8, 'To005'),
('AT1014', 'TG1474', 'ENG1222', 'T', '2024-10-28', 'present',NULL, 9, 'To005'),
('AT1015', 'TG1474', 'ENG1222', 'T', '2024-11-04', 'present',NULL, 10, 'To005'),
('AT1016', 'TG1474', 'ENG1222', 'T', '2024-11-11', 'present',NULL, 11, 'To005'),
('AT1017', 'TG1474', 'ENG1222', 'T', '2024-11-18', 'present',NULL, 12, 'To005'),
('AT1018', 'TG1474', 'ENG1222', 'T', '2024-11-25', 'present',NULL, 13, 'To005'),
('AT1019', 'TG1474', 'ENG1222', 'T', '2024-12-02', 'present',NULL, 14, 'To005'),
('AT1020', 'TG1474', 'ENG1222', 'T', '2024-12-09', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1021', 'TG1444', 'ENG1222', 'T', '2024-08-16', 'present',NULL, 1, 'To005'),
('AT1022', 'TG1444', 'ENG1222', 'T', '2024-08-23', 'present',NULL, 2, 'To005'),
('AT1023', 'TG1444', 'ENG1222', 'T', '2024-08-30', 'present',NULL, 3, 'To005'),
('AT1024', 'TG1444', 'ENG1222', 'T', '2024-09-07', 'present',NULL, 4, 'To005'),
('AT1025', 'TG1444', 'ENG1222', 'T', '2024-09-14', 'present',NULL, 5, 'To005'),
('AT1026', 'TG1444', 'ENG1222', 'T', '2024-09-21', 'present',NULL, 6, 'To005'),
('AT1027', 'TG1444', 'ENG1222', 'T', '2024-09-28', 'present',NULL, 7, 'To005'),
('AT1028', 'TG1444', 'ENG1222', 'T', '2024-10-05', 'present',NULL, 8, 'To005'),
('AT1029', 'TG1444', 'ENG1222', 'T', '2024-10-28', 'present',NULL, 9, 'To005'),
('AT1030', 'TG1444', 'ENG1222', 'T', '2024-11-04', 'present',NULL, 10, 'To005'),
('AT1031', 'TG1444', 'ENG1222', 'T', '2024-11-11', 'present',NULL, 11, 'To005'),
('AT1032', 'TG1444', 'ENG1222', 'T', '2024-11-18', 'present',NULL, 12, 'To005'),
('AT1033', 'TG1444', 'ENG1222', 'T', '2024-11-25', 'present',NULL, 13, 'To005'),
('AT1034', 'TG1444', 'ENG1222', 'T', '2024-12-02', 'present',NULL, 14, 'To005'),
('AT1035', 'TG1444', 'ENG1222', 'T', '2024-12-09', 'present',NULL, 15, 'To005');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1036', 'TG1610', 'ENG1222', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1037', 'TG1610', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1038', 'TG1610', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1039', 'TG1610', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1040', 'TG1610', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1041', 'TG1610', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1042', 'TG1610', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1043', 'TG1610', 'ENG1222', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1044', 'TG1610', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1045', 'TG1610', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1046', 'TG1610', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1047', 'TG1610', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1048', 'TG1610', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1049', 'TG1610', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1050', 'TG1610', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1051', 'TG1605', 'ENG1222', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1052', 'TG1605', 'ENG1222', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1053', 'TG1605', 'ENG1222', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1054', 'TG1605', 'ENG1222', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1055', 'TG1605', 'ENG1222', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1056', 'TG1605', 'ENG1222', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1057', 'TG1605', 'ENG1222', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1058', 'TG1605', 'ENG1222', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1059', 'TG1605', 'ENG1222', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1060', 'TG1605', 'ENG1222', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1061', 'TG1605', 'ENG1222', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1062', 'TG1605', 'ENG1222', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1063', 'TG1605', 'ENG1222', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1064', 'TG1605', 'ENG1222', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1065', 'TG1605', 'ENG1222', 'T', '2024-12-08', 'present',NULL, 15, 'To005');






INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1066', 'TG1376', 'TCS1212', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1067', 'TG1376', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1068', 'TG1376', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1069', 'TG1376', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1070', 'TG1376', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1071', 'TG1376', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1072', 'TG1376', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1073', 'TG1376', 'TCS1212', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1074', 'TG1376', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1075', 'TG1376', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1076', 'TG1376', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1077', 'TG1376', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1078', 'TG1376', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1079', 'TG1376', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1080', 'TG1376', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1081', 'TG1398', 'TCS1212', 'T', '2024-08-15', 'absences','M002', 1, 'To005'),
('AT1082', 'TG1398', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1083', 'TG1398', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1084', 'TG1398', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1085', 'TG1398', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1086', 'TG1398', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1087', 'TG1398', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1088', 'TG1398', 'TCS1212', 'T', '2024-10-04', 'absences','M006', 8, 'To005'),
('AT1089', 'TG1398', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1090', 'TG1398', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1091', 'TG1398', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1092', 'TG1398', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1093', 'TG1398', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1094', 'TG1398', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1095', 'TG1398', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendence, medical_status, session_no, at_to_id)
VALUES
('AT1096', 'TG1366', 'TCS1212', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1097', 'TG1366', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1098', 'TG1366', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1099', 'TG1366', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1100', 'TG1366', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1101', 'TG1366', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1102', 'TG1366', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1103', 'TG1366', 'TCS1212', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1104', 'TG1366', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1105', 'TG1366', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1106', 'TG1366', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1107', 'TG1366', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1108', 'TG1366', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1109', 'TG1366', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1110', 'TG1366', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1111', 'TG1353', 'TCS1212', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1112', 'TG1353', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1113', 'TG1353', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1114', 'TG1353', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1115', 'TG1353', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1116', 'TG1353', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1117', 'TG1353', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1118', 'TG1353', 'TCS1212', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1119', 'TG1353', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1120', 'TG1353', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1121', 'TG1353', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1122', 'TG1353', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1123', 'TG1353', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1124', 'TG1353', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1125', 'TG1353', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1126', 'TG1474', 'TCS1212', 'T', '2024-08-16', 'present',NULL, 1, 'To005'),
('AT1127', 'TG1474', 'TCS1212', 'T', '2024-08-23', 'present',NULL, 2, 'To005'),
('AT1128', 'TG1474', 'TCS1212', 'T', '2024-08-30', 'present',NULL, 3, 'To005'),
('AT1129', 'TG1474', 'TCS1212', 'T', '2024-09-07', 'present',NULL, 4, 'To005'),
('AT1130', 'TG1474', 'TCS1212', 'T', '2024-09-14', 'present',NULL, 5, 'To005'),
('AT1131', 'TG1474', 'TCS1212', 'T', '2024-09-21', 'present',NULL, 6, 'To005'),
('AT1132', 'TG1474', 'TCS1212', 'T', '2024-09-28', 'present',NULL, 7, 'To005'),
('AT1133', 'TG1474', 'TCS1212', 'T', '2024-10-05', 'present',NULL, 8, 'To005'),
('AT1134', 'TG1474', 'TCS1212', 'T', '2024-10-28', 'present',NULL, 9, 'To005'),
('AT1135', 'TG1474', 'TCS1212', 'T', '2024-11-04', 'present',NULL, 10, 'To005'),
('AT1136', 'TG1474', 'TCS1212', 'T', '2024-11-11', 'present',NULL, 11, 'To005'),
('AT1137', 'TG1474', 'TCS1212', 'T', '2024-11-18', 'present',NULL, 12, 'To005'),
('AT1138', 'TG1474', 'TCS1212', 'T', '2024-11-25', 'present',NULL, 13, 'To005'),
('AT1139', 'TG1474', 'TCS1212', 'T', '2024-12-02', 'present',NULL, 14, 'To005'),
('AT1140', 'TG1474', 'TCS1212', 'T', '2024-12-09', 'present',NULL, 15, 'To005');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1141', 'TG1444', 'TCS1212', 'T', '2024-08-16', 'present',NULL, 1, 'To005'),
('AT1142', 'TG1444', 'TCS1212', 'T', '2024-08-23', 'present',NULL, 2, 'To005'),
('AT1143', 'TG1444', 'TCS1212', 'T', '2024-08-30', 'present',NULL, 3, 'To005'),
('AT1144', 'TG1444', 'TCS1212', 'T', '2024-09-07', 'present',NULL, 4, 'To005'),
('AT1145', 'TG1444', 'TCS1212', 'T', '2024-09-14', 'present',NULL, 5, 'To005'),
('AT1146', 'TG1444', 'TCS1212', 'T', '2024-09-21', 'present',NULL, 6, 'To005'),
('AT1147', 'TG1444', 'TCS1212', 'T', '2024-09-28', 'present',NULL, 7, 'To005'),
('AT1148', 'TG1444', 'TCS1212', 'T', '2024-10-05', 'present',NULL, 8, 'To005'),
('AT1149', 'TG1444', 'TCS1212', 'T', '2024-10-28', 'present',NULL, 9, 'To005'),
('AT1150', 'TG1444', 'TCS1212', 'T', '2024-11-04', 'present',NULL, 10, 'To005'),
('AT1151', 'TG1444', 'TCS1212', 'T', '2024-11-11', 'present',NULL, 11, 'To005'),
('AT1152', 'TG1444', 'TCS1212', 'T', '2024-11-18', 'present',NULL, 12, 'To005'),
('AT1153', 'TG1444', 'TCS1212', 'T', '2024-11-25', 'present',NULL, 13, 'To005'),
('AT1154', 'TG1444', 'TCS1212', 'T', '2024-12-02', 'present',NULL, 14, 'To005'),
('AT1155', 'TG1444', 'TCS1212', 'T', '2024-12-09', 'present',NULL, 15, 'To005');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1156', 'TG1610', 'TCS1212', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1157', 'TG1610', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1158', 'TG1610', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1159', 'TG1610', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1160', 'TG1610', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1161', 'TG1610', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1162', 'TG1610', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1163', 'TG1610', 'TCS1212', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1164', 'TG1610', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1165', 'TG1610', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1166', 'TG1610', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1167', 'TG1610', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1168', 'TG1610', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1169', 'TG1610', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1170', 'TG1610', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code,at_course_type, date,attendance, medical_status, session_no, at_to_id)
VALUES
('AT1171', 'TG1605', 'TCS1212', 'T', '2024-08-15', 'present',NULL, 1, 'To005'),
('AT1172', 'TG1605', 'TCS1212', 'T', '2024-08-22', 'present',NULL, 2, 'To005'),
('AT1173', 'TG1605', 'TCS1212', 'T', '2024-08-29', 'present',NULL, 3, 'To005'),
('AT1174', 'TG1605', 'TCS1212', 'T', '2024-09-06', 'present',NULL, 4, 'To005'),
('AT1175', 'TG1605', 'TCS1212', 'T', '2024-09-13', 'present',NULL, 5, 'To005'),
('AT1176', 'TG1605', 'TCS1212', 'T', '2024-09-20', 'present',NULL, 6, 'To005'),
('AT1177', 'TG1605', 'TCS1212', 'T', '2024-09-27', 'present',NULL, 7, 'To005'),
('AT1178', 'TG1605', 'TCS1212', 'T', '2024-10-04', 'present',NULL, 8, 'To005'),
('AT1179', 'TG1605', 'TCS1212', 'T', '2024-10-27', 'present',NULL, 9, 'To005'),
('AT1180', 'TG1605', 'TCS1212', 'T', '2024-11-03', 'present',NULL, 10, 'To005'),
('AT1181', 'TG1605', 'TCS1212', 'T', '2024-11-10', 'present',NULL, 11, 'To005'),
('AT1182', 'TG1605', 'TCS1212', 'T', '2024-11-17', 'present',NULL, 12, 'To005'),
('AT1183', 'TG1605', 'TCS1212', 'T', '2024-11-24', 'present',NULL, 13, 'To005'),
('AT1184', 'TG1605', 'TCS1212', 'T', '2024-12-01', 'present',NULL, 14, 'To005'),
('AT1185', 'TG1605', 'TCS1212', 'T', '2024-12-08', 'present',NULL, 15, 'To005');




-- suspended attendance add


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1186', 'TG1393', 'ICT1212', 'T', '2024-08-13', 'absences', NULL, 1, 'To001'),
('AT1187', 'TG1393', 'ICT1222', 'P', '2024-08-13', 'absences', NULL, 1, 'To001'), 
('AT1188', 'TG1393', 'ICT1212', 'T', '2024-08-20', 'absences', NULL, 2, 'To001'), 
('AT1189', 'TG1393', 'ICT1222', 'P', '2024-08-20', 'absences', NULL, 2, 'To001'),
('AT1190', 'TG1393', 'ICT1212', 'T', '2024-08-27', 'absences', NULL, 3, 'To001'),
('AT1191', 'TG1393', 'ICT1222', 'P', '2024-08-27', 'absences', NULL, 3, 'To001'),
('AT1192', 'TG1393', 'ICT1212', 'T', '2024-08-03', 'absences', NULL, 4, 'To001'),
('AT1193', 'TG1393', 'ICT1222', 'P', '2024-08-03', 'absences', NULL, 4, 'To001'),
('AT1194', 'TG1393', 'ICT1212', 'T', '2024-08-10', 'absences', NULL, 5, 'To001'),
('AT1195', 'TG1393', 'ICT1222', 'P', '2024-08-10', 'absences', NULL, 5, 'To001'),
('AT1196', 'TG1393', 'ICT1212', 'T', '2024-08-17', 'absences', NULL, 6, 'To001'),
('AT1197', 'TG1393', 'ICT1222', 'P', '2024-08-17', 'absences', NULL, 6, 'To001'),
('AT1198', 'TG1393', 'ICT1212', 'T', '2024-08-24', 'absences', NULL, 7, 'To001'),
('AT1199', 'TG1393', 'ICT1222', 'P', '2024-08-24', 'absences', NULL, 7, 'To001'),
('AT1200', 'TG1393', 'ICT1212', 'T', '2024-09-01', 'absences', NULL, 8, 'To001'),
('AT1201', 'TG1393', 'ICT1222', 'P', '2024-09-01', 'absences', NULL, 8, 'To001'),
('AT1202', 'TG1393', 'ICT1212', 'T', '2024-09-08', 'absences', NULL, 9, 'To001'),
('AT1203', 'TG1393', 'ICT1222', 'P', '2024-09-08', 'absences', NULL, 9, 'To001'),
('AT1204', 'TG1393', 'ICT1212', 'T', '2024-09-15', 'absences', NULL, 10, 'To001'),
('AT1205', 'TG1393', 'ICT1222', 'P', '2024-09-15', 'absences', NULL, 10, 'To001'),
('AT1206', 'TG1393', 'ICT1212', 'T', '2024-09-21', 'absences', NULL, 11, 'To001'),
('AT1207', 'TG1393', 'ICT1222', 'P', '2024-09-21', 'absences', NULL, 11, 'To001'),
('AT1208', 'TG1393', 'ICT1212', 'T', '2024-09-28', 'absences', NULL, 12, 'To001'),
('AT1209', 'TG1393', 'ICT1222', 'P', '2024-09-28', 'absences', NULL, 12, 'To001'),
('AT1210', 'TG1393', 'ICT1212', 'T', '2024-10-05', 'absences', NULL, 13, 'To001'),
('AT1211', 'TG1393', 'ICT1222', 'P', '2024-10-05', 'absences', NULL, 13, 'To001'),
('AT1212', 'TG1393', 'ICT1212', 'T', '2024-10-12', 'absences', NULL, 14, 'To001'),
('AT1213', 'TG1393', 'ICT1222', 'P', '2024-10-12', 'absences', NULL, 14, 'To001'),
('AT1214', 'TG1393', 'ICT1212', 'T', '2024-10-19', 'absences', NULL, 15, 'To001'),
('AT1215', 'TG1393', 'ICT1222', 'P', '2024-10-19', 'absences', NULL, 15, 'To001');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT01216', 'TG1393', 'ICT1233', 'T', '2024-08-14', 'absences', NULL, 1, 'To001'),
('AT01217', 'TG1393', 'ICT1233', 'T', '2024-08-21', 'absences', NULL, 2, 'To001'),
('AT01218', 'TG1393', 'ICT1233', 'T', '2024-08-28', 'absences', NULL, 3, 'To001'),
('AT01219', 'TG1393', 'ICT1233', 'T', '2024-09-05', 'absences', NULL, 4, 'To001'),
('AT01220', 'TG1393', 'ICT1233', 'T', '2024-09-12', 'absences', NULL, 5, 'To001'),
('AT01221', 'TG1393', 'ICT1233', 'T', '2024-09-19', 'absences', NULL, 6, 'To001'),
('AT01222', 'TG1393', 'ICT1233', 'T', '2024-09-26', 'absences', NULL, 7, 'To001'),
('AT01223', 'TG1393', 'ICT1233', 'T', '2024-10-03', 'absences', NULL, 8, 'To001'),
('AT01224', 'TG1393', 'ICT1233', 'T', '2024-10-10', 'absences', NULL, 9, 'To001'),
('AT01225', 'TG1393', 'ICT1233', 'T', '2024-10-17', 'absences', NULL, 10, 'To001'),
('AT01226', 'TG1393', 'ICT1233', 'T', '2024-10-24', 'absences', NULL, 11, 'To001'),
('AT01227', 'TG1393', 'ICT1233', 'T', '2024-10-31', 'absences', NULL, 12, 'To001'),
('AT01228', 'TG1393', 'ICT1233', 'T', '2024-11-07', 'absences', NULL, 13, 'To001'),
('AT01229', 'TG1393', 'ICT1233', 'T', '2024-11-14', 'absences', NULL, 14, 'To001'),
('AT01230', 'TG1393', 'ICT1233', 'T', '2024-11-21', 'absences', NULL, 15, 'To001'),

('AT01231', 'TG1393', 'ICT1233', 'P', '2024-08-14', 'absences', NULL, 1, 'To001'),
('AT01232', 'TG1393', 'ICT1233', 'P', '2024-08-21', 'absences', NULL, 2, 'To001'),
('AT01233', 'TG1393', 'ICT1233', 'P', '2024-08-28', 'absences', NULL, 3, 'To001'),
('AT01234', 'TG1393', 'ICT1233', 'P', '2024-09-05', 'absences', NULL, 4, 'To001'),
('AT01235', 'TG1393', 'ICT1233', 'P', '2024-09-12', 'absences', NULL, 5, 'To001'),
('AT01236', 'TG1393', 'ICT1233', 'P', '2024-09-19', 'absences', NULL, 6, 'To001'),
('AT01237', 'TG1393', 'ICT1233', 'P', '2024-09-26', 'absences', NULL, 7, 'To001'),
('AT01238', 'TG1393', 'ICT1233', 'P', '2024-10-03', 'absences', NULL, 8, 'To001'),
('AT01239', 'TG1393', 'ICT1233', 'P', '2024-10-10', 'absences', NULL, 9, 'To001'),
('AT01240', 'TG1393', 'ICT1233', 'P', '2024-10-17', 'absences', NULL, 10, 'To001'),
('AT01241', 'TG1393', 'ICT1233', 'P', '2024-10-24', 'absences', NULL, 11, 'To001'),
('AT01242', 'TG1393', 'ICT1233', 'P', '2024-10-31', 'absences', NULL, 12, 'To001'),
('AT01243', 'TG1393', 'ICT1233', 'P', '2024-11-07', 'absences', NULL, 13, 'To001'),
('AT01244', 'TG1393', 'ICT1233', 'P', '2024-11-14', 'absences', NULL, 14, 'To001'),
('AT01245', 'TG1393', 'ICT1233', 'P', '2024-11-21', 'absences', NULL, 15, 'To001');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1246', 'TG1393', 'ICT1242', 'T', '2024-08-15', 'absences', NULL, 1, 'To001'),
('AT1247', 'TG1393', 'ICT1242', 'T', '2024-08-22', 'absences', NULL, 2, 'To001'),
('AT1248', 'TG1393', 'ICT1242', 'T', '2024-08-29', 'absences', NULL, 3, 'To001'),
('AT1249', 'TG1393', 'ICT1242', 'T', '2024-09-06', 'absences', NULL, 4, 'To001'),
('AT1250', 'TG1393', 'ICT1242', 'T', '2024-09-13', 'absences', NULL, 5, 'To001'),
('AT1251', 'TG1393', 'ICT1242', 'T', '2024-09-20', 'absences', NULL, 6, 'To001'),
('AT1252', 'TG1393', 'ICT1242', 'T', '2024-09-27', 'absences', NULL, 7, 'To001'),
('AT1253', 'TG1393', 'ICT1242', 'T', '2024-10-04', 'absences', NULL, 8, 'To001'),
('AT1254', 'TG1393', 'ICT1242', 'T', '2024-10-27', 'absences', NULL, 9, 'To001'),
('AT1255', 'TG1393', 'ICT1242', 'T', '2024-11-03', 'absences', NULL, 10, 'To001'),
('AT1256', 'TG1393', 'ICT1242', 'T', '2024-11-10', 'absences', NULL, 11, 'To001'),
('AT1257', 'TG1393', 'ICT1242', 'T', '2024-11-17', 'absences', NULL, 12, 'To001'),
('AT1258', 'TG1393', 'ICT1242', 'T', '2024-11-24', 'absences', NULL, 13, 'To001'),
('AT1259', 'TG1393', 'ICT1242', 'T', '2024-12-01', 'absences', NULL, 14, 'To001'),
('AT1260', 'TG1393', 'ICT1242', 'T', '2024-12-08', 'absences', NULL, 15, 'To001'),

('AT1261', 'TG1393', 'ICT1253', 'T', '2024-08-16', 'absences', NULL, 1, 'To001'),
('AT1262', 'TG1393', 'ICT1253', 'T', '2024-08-23', 'absences', NULL, 2, 'To001'),
('AT1263', 'TG1393', 'ICT1253', 'T', '2024-08-30', 'absences', NULL, 3, 'To001'),
('AT1264', 'TG1393', 'ICT1253', 'T', '2024-09-07', 'absences', NULL, 4, 'To001'),
('AT1265', 'TG1393', 'ICT1253', 'T', '2024-09-14', 'absences', NULL, 5, 'To001'),
('AT1266', 'TG1393', 'ICT1253', 'T', '2024-09-21', 'absences', NULL, 6, 'To001'),
('AT1267', 'TG1393', 'ICT1253', 'T', '2024-09-28', 'absences', NULL, 7, 'To001'),
('AT1268', 'TG1393', 'ICT1253', 'T', '2024-10-05', 'absences', NULL, 8, 'To001'),
('AT1269', 'TG1393', 'ICT1253', 'T', '2024-10-12', 'absences', NULL, 9, 'To001'),
('AT1270', 'TG1393', 'ICT1253', 'T', '2024-10-19', 'absences', NULL, 10, 'To001'),
('AT1271', 'TG1393', 'ICT1253', 'T', '2024-10-26', 'absences', NULL, 11, 'To001'),
('AT1272', 'TG1393', 'ICT1253', 'T', '2024-11-02', 'absences', NULL, 12, 'To001'),
('AT1273', 'TG1393', 'ICT1253', 'T', '2024-11-09', 'absences', NULL, 13, 'To001'),
('AT1274', 'TG1393', 'ICT1253', 'T', '2024-11-16', 'absences', NULL, 14, 'To001'),
('AT1275', 'TG1393', 'ICT1253', 'T', '2024-11-23', 'absences', NULL, 15, 'To001');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1276', 'TG1393', 'ICT1253', 'P', '2024-08-16', 'absences', NULL, 1, 'To001'),
('AT1277', 'TG1393', 'ICT1253', 'P', '2024-08-23', 'absences', NULL, 2, 'To001'),
('AT1278', 'TG1393', 'ICT1253', 'P', '2024-08-30', 'absences', NULL, 3, 'To001'),
('AT1279', 'TG1393', 'ICT1253', 'P', '2024-09-07', 'absences', NULL, 4, 'To001'),
('AT1280', 'TG1393', 'ICT1253', 'P', '2024-09-14', 'absences', NULL, 5, 'To001'),
('AT1281', 'TG1393', 'ICT1253', 'P', '2024-09-21', 'absences', NULL, 6, 'To001'),
('AT1282', 'TG1393', 'ICT1253', 'P', '2024-09-28', 'absences', NULL, 7, 'To001'),
('AT1283', 'TG1393', 'ICT1253', 'P', '2024-10-05', 'absences', NULL, 8, 'To001'),
('AT1284', 'TG1393', 'ICT1253', 'P', '2024-10-12', 'absences', NULL, 9, 'To001'),
('AT1285', 'TG1393', 'ICT1253', 'P', '2024-10-19', 'absences', NULL, 10, 'To001'),
('AT1286', 'TG1393', 'ICT1253', 'P', '2024-10-26', 'absences', NULL, 11, 'To001'),
('AT1287', 'TG1393', 'ICT1253', 'P', '2024-11-02', 'absences', NULL, 12, 'To001'),
('AT1288', 'TG1393', 'ICT1253', 'P', '2024-11-09', 'absences', NULL, 13, 'To001'),
('AT1289', 'TG1393', 'ICT1253', 'P', '2024-11-16', 'absences', NULL, 14, 'To001'),
('AT1290', 'TG1393', 'ICT1253', 'P', '2024-11-23', 'absences',NULL, 15, 'To001'),

('AT1291', 'TG1393', 'TMS1233', 'T', '2024-08-17', 'absences', NULL, 1, 'To001'),
('AT1292', 'TG1393', 'TMS1233', 'T', '2024-08-24', 'absences', NULL, 2, 'To001'),
('AT1293', 'TG1393', 'TMS1233', 'T', '2024-08-31', 'absences', NULL, 3, 'To001'),
('AT1294', 'TG1393', 'TMS1233', 'T', '2024-09-08', 'absences', NULL, 4, 'To001'),
('AT1295', 'TG1393', 'TMS1233', 'T', '2024-09-15', 'absences', NULL, 5, 'To001'),
('AT1296', 'TG1393', 'TMS1233', 'T', '2024-09-22', 'absences', NULL, 6, 'To001'),
('AT1297', 'TG1393', 'TMS1233', 'T', '2024-09-29', 'absences', NULL, 7, 'To001'),
('AT1298', 'TG1393', 'TMS1233', 'T', '2024-10-06', 'absences', NULL, 8, 'To001'),
('AT1299', 'TG1393', 'TMS1233', 'T', '2024-10-29', 'absences', NULL, 9, 'To001'),
('AT1300', 'TG1393', 'TMS1233', 'T', '2024-11-05', 'absences', NULL, 10, 'To001'),
('AT1301', 'TG1393', 'TMS1233', 'T', '2024-11-12', 'absences', NULL, 11, 'To001'),
('AT1302', 'TG1393', 'TMS1233', 'T', '2024-11-19', 'absences', NULL, 12, 'To001'),
('AT1303', 'TG1393', 'TMS1233', 'T', '2024-11-26', 'absences', NULL, 13, 'To001'),
('AT1304', 'TG1393', 'TMS1233', 'T', '2024-12-03', 'absences', NULL, 14, 'To001'),
('AT1305', 'TG1393', 'TMS1233', 'T', '2024-12-10', 'absences', NULL, 15, 'To001');




INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
    ('AT1306', 'TG1688', 'BST1212', 'TP', '2024-08-13', 'absences', NULL, 1, 'To004'),
    ('AT1307', 'TG1688', 'BST1212', 'TP', '2024-08-20', 'absences', NULL, 2, 'To004'),
    ('AT1308', 'TG1688', 'BST1212', 'TP', '2024-08-27', 'absences', NULL, 3, 'To004'),
    ('AT1309', 'TG1688', 'BST1212', 'TP', '2024-09-03', 'absences', NULL, 4, 'To004'),
    ('AT1310', 'TG1688', 'BST1212', 'TP', '2024-09-10', 'absences', NULL, 5, 'To004'),
    ('AT1311', 'TG1688', 'BST1212', 'TP', '2024-09-17', 'absences', NULL, 6, 'To004'),
    ('AT1312', 'TG1688', 'BST1212', 'TP', '2024-09-24', 'absences', NULL, 7, 'To004'),
    ('AT1313', 'TG1688', 'BST1212', 'TP', '2024-10-01', 'absences', NULL, 8, 'To004'),
    ('AT1314', 'TG1688', 'BST1212', 'TP', '2024-10-08', 'absences', NULL, 9, 'To004'),
    ('AT1315', 'TG1688', 'BST1212', 'TP', '2024-10-15', 'absences', NULL, 10, 'To004'),
    ('AT1316', 'TG1688', 'BST1212', 'TP', '2024-10-22', 'absences', NULL, 11, 'To004'),
    ('AT1317', 'TG1688', 'BST1212', 'TP', '2024-10-29', 'absences', NULL, 12, 'To004'),
    ('AT1318', 'TG1688', 'BST1212', 'TP', '2024-11-05', 'absences', NULL, 13, 'To004'),
    ('AT1319', 'TG1688', 'BST1212', 'TP', '2024-11-12', 'absences', NULL, 14, 'To004'),
    ('AT1320', 'TG1688', 'BST1212', 'TP', '2024-11-19', 'absences', NULL, 15, 'To004'),

    ('AT1321', 'TG1688', 'BST1222', 'TP', '2024-08-14', 'absences', NULL, 1, 'To004'),
    ('AT1322', 'TG1688', 'BST1222', 'TP', '2024-08-21', 'absences', NULL, 2, 'To004'),
    ('AT1323', 'TG1688', 'BST1222', 'TP', '2024-08-28', 'absences', NULL, 3, 'To004'),
    ('AT1324', 'TG1688', 'BST1222', 'TP', '2024-09-05', 'absences', NULL, 4, 'To004'),
    ('AT1325', 'TG1688', 'BST1222', 'TP', '2024-09-12', 'absences', NULL, 5, 'To004'),
    ('AT1326', 'TG1688', 'BST1222', 'TP', '2024-09-19', 'absences', NULL, 6, 'To004'),
    ('AT1327', 'TG1688', 'BST1222', 'TP', '2024-09-26', 'absences', NULL, 7, 'To004'),
    ('AT1328', 'TG1688', 'BST1222', 'TP', '2024-10-03', 'absences', NULL, 8, 'To004'),
    ('AT1329', 'TG1688', 'BST1222', 'TP', '2024-10-10', 'absences', NULL, 9, 'To004'),
    ('AT1330', 'TG1688', 'BST1222', 'TP', '2024-10-17', 'absences', NULL, 10, 'To004'),
    ('AT1331', 'TG1688', 'BST1222', 'TP', '2024-10-24', 'absences', NULL, 11, 'To004'),
    ('AT1332', 'TG1688', 'BST1222', 'TP', '2024-10-31', 'absences', NULL, 12, 'To004'),
    ('AT1333', 'TG1688', 'BST1222', 'TP', '2024-11-07', 'absences', NULL, 13, 'To004'),
    ('AT1334', 'TG1688', 'BST1222', 'TP', '2024-11-14', 'absences', NULL, 14, 'To004'),
    ('AT1335', 'TG1688', 'BST1222', 'TP', '2024-11-21', 'absences', NULL, 15, 'To004');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1336', 'TG1688', 'BST1232', 'TP', '2024-08-14', 'absences', NULL, 1, 'To004'),
('AT1337', 'TG1688', 'BST1232', 'TP', '2024-08-21', 'absences', NULL, 2, 'To004'),
('AT1338', 'TG1688', 'BST1232', 'TP', '2024-08-28', 'absences', NULL, 3, 'To004'),
('AT1339', 'TG1688', 'BST1232', 'TP', '2024-09-05', 'absences', NULL, 4, 'To004'),
('AT1340', 'TG1688', 'BST1232', 'TP', '2024-09-12', 'absences', NULL, 5, 'To004'),
('AT1341', 'TG1688', 'BST1232', 'TP', '2024-09-19', 'absences', NULL, 6, 'To004'),
('AT1342', 'TG1688', 'BST1232', 'TP', '2024-09-26', 'absences', NULL, 7, 'To004'),
('AT1343', 'TG1688', 'BST1232', 'TP', '2024-10-03', 'absences', NULL, 8, 'To004'),
('AT1344', 'TG1688', 'BST1232', 'TP', '2024-10-10', 'absences', NULL, 9, 'To004'),
('AT1345', 'TG1688', 'BST1232', 'TP', '2024-10-17', 'absences', NULL, 10, 'To004'),
('AT1346', 'TG1688', 'BST1232', 'TP', '2024-10-24', 'absences', NULL, 11, 'To004'),
('AT1347', 'TG1688', 'BST1232', 'TP', '2024-10-31', 'absences', NULL, 12, 'To004'),
('AT1348', 'TG1688', 'BST1232', 'TP', '2024-11-07', 'absences', NULL, 13, 'To004'),
('AT1349', 'TG1688', 'BST1232', 'TP', '2024-11-14', 'absences', NULL, 14, 'To004'),
('AT1350', 'TG1688', 'BST1232', 'TP', '2024-11-21', 'absences', NULL, 15, 'To004'),

('AT1351', 'TG1688', 'BST1242', 'TP', '2024-08-15', 'absences', NULL, 1, 'To004'),
('AT1352', 'TG1688', 'BST1242', 'TP', '2024-08-22', 'absences', NULL, 2, 'To004'),
('AT1353', 'TG1688', 'BST1242', 'TP', '2024-08-29', 'absences', NULL, 3, 'To004'),
('AT1354', 'TG1688', 'BST1242', 'TP', '2024-09-06', 'absences', NULL, 4, 'To004'),
('AT1355', 'TG1688', 'BST1242', 'TP', '2024-09-13', 'absences', NULL, 5, 'To004'),
('AT1356', 'TG1688', 'BST1242', 'TP', '2024-09-20', 'absences', NULL, 6, 'To004'),
('AT1357', 'TG1688', 'BST1242', 'TP', '2024-09-27', 'absences', NULL, 7, 'To004'),
('AT1358', 'TG1688', 'BST1242', 'TP', '2024-10-04', 'absences', NULL, 8, 'To004'),
('AT1359', 'TG1688', 'BST1242', 'TP', '2024-10-11', 'absences', NULL, 9, 'To004'),
('AT1360', 'TG1688', 'BST1242', 'TP', '2024-10-18', 'absences', NULL, 10, 'To004'),
('AT1361', 'TG1688', 'BST1242', 'TP', '2024-10-25', 'absences', NULL, 11, 'To004'),
('AT1362', 'TG1688', 'BST1242', 'TP', '2024-11-01', 'absences', NULL, 12, 'To004'),
('AT1363', 'TG1688', 'BST1242', 'TP', '2024-11-08', 'absences', NULL, 13, 'To004'),
('AT1364', 'TG1688', 'BST1242', 'TP', '2024-11-15', 'absences', NULL, 14, 'To004'),
('AT1365', 'TG1688', 'BST1242', 'TP', '2024-11-22', 'absences', NULL, 15, 'To004');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1366', 'TG1688', 'BST1251', 'T', '2024-08-15', 'absences', NULL, 1, 'To004'),
('AT1367', 'TG1688', 'BST1251', 'T', '2024-08-22', 'absences', NULL, 2, 'To004'),
('AT1368', 'TG1688', 'BST1251', 'T', '2024-08-29', 'absences', NULL, 3, 'To004'),
('AT1369', 'TG1688', 'BST1251', 'T', '2024-09-06', 'absences', NULL, 4, 'To004'),
('AT1370', 'TG1688', 'BST1251', 'T', '2024-09-13', 'absences', NULL, 5, 'To004'),
('AT1371', 'TG1688', 'BST1251', 'T', '2024-09-20', 'absences', NULL, 6, 'To004'),
('AT1372', 'TG1688', 'BST1251', 'T', '2024-09-27', 'absences', NULL, 7, 'To004'),
('AT1373', 'TG1688', 'BST1251', 'T', '2024-10-04', 'absences', NULL, 8, 'To004'),
('AT1374', 'TG1688', 'BST1251', 'T', '2024-10-27', 'absences', NULL, 9, 'To004'),
('AT1375', 'TG1688', 'BST1251', 'T', '2024-11-03', 'absences', NULL, 10, 'To004'),
('AT1376', 'TG1688', 'BST1251', 'T', '2024-11-10', 'absences', NULL, 11, 'To004'),
('AT1377', 'TG1688', 'BST1251', 'T', '2024-11-17', 'absences', NULL, 12, 'To004'),
('AT1378', 'TG1688', 'BST1251', 'T', '2024-11-24', 'absences', NULL, 13, 'To004'),
('AT1379', 'TG1688', 'BST1251', 'T', '2024-12-01', 'absences', NULL, 14, 'To004'),
('AT1380', 'TG1688', 'BST1251', 'T', '2024-12-08', 'absences', NULL, 15, 'To004'),

('AT1381', 'TG1688', 'BST1262', 'TP', '2024-08-16', 'absences', NULL, 1, 'To004'),
('AT1382', 'TG1688', 'BST1262', 'TP', '2024-08-23', 'absences', NULL, 2, 'To004'),
('AT1383', 'TG1688', 'BST1262', 'TP', '2024-08-30', 'absences', NULL, 3, 'To004'),
('AT1384', 'TG1688', 'BST1262', 'TP', '2024-09-07', 'absences', NULL, 4, 'To004'),
('AT1385', 'TG1688', 'BST1262', 'TP', '2024-09-14', 'absences', NULL, 5, 'To004'),
('AT1386', 'TG1688', 'BST1262', 'TP', '2024-09-21', 'absences', NULL, 6, 'To004'),
('AT1387', 'TG1688', 'BST1262', 'TP', '2024-09-28', 'absences', NULL, 7, 'To004'),
('AT1388', 'TG1688', 'BST1262', 'TP', '2024-10-05', 'absences', NULL, 8, 'To004'),
('AT1389', 'TG1688', 'BST1262', 'TP', '2024-10-12', 'absences', NULL, 9, 'To004'),
('AT1390', 'TG1688', 'BST1262', 'TP', '2024-10-19', 'absences', NULL, 10, 'To004'),
('AT1391', 'TG1688', 'BST1262', 'TP', '2024-10-26', 'absences', NULL, 11, 'To004'),
('AT1392', 'TG1688', 'BST1262', 'TP', '2024-11-02', 'absences', NULL, 12, 'To004'),
('AT1393', 'TG1688', 'BST1262', 'TP', '2024-11-09', 'absences', NULL, 13, 'To004'),
('AT1394', 'TG1688', 'BST1262', 'TP', '2024-11-16', 'absences', NULL, 14, 'To004'),
('AT1395', 'TG1688', 'BST1262', 'TP', '2024-11-23', 'absences', NULL, 15, 'To004');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1396', 'TG1688', 'BST1251', 'T', '2024-08-15', 'absences', NULL, 1, 'To004'),
('AT1397', 'TG1688', 'BST1251', 'T', '2024-08-22', 'absences', NULL, 2, 'To004'),
('AT1398', 'TG1688', 'BST1251', 'T', '2024-08-29', 'absences', NULL, 3, 'To004'),
('AT1399', 'TG1688', 'BST1251', 'T', '2024-09-06', 'absences', NULL, 4, 'To004'),
('AT1400', 'TG1688', 'BST1251', 'T', '2024-09-13', 'absences', NULL, 5, 'To004'),
('AT1401', 'TG1688', 'BST1251', 'T', '2024-09-20', 'absences', NULL, 6, 'To004'),
('AT1402', 'TG1688', 'BST1251', 'T', '2024-09-27', 'absences', NULL, 7, 'To004'),
('AT1403', 'TG1688', 'BST1251', 'T', '2024-10-04', 'absences', NULL, 8, 'To004'),
('AT1404', 'TG1688', 'BST1251', 'T', '2024-10-27', 'absences', NULL, 9, 'To004'),
('AT1405', 'TG1688', 'BST1251', 'T', '2024-11-03', 'absences', NULL, 10, 'To004'),
('AT1406', 'TG1688', 'BST1251', 'T', '2024-11-10', 'absences', NULL, 11, 'To004'),
('AT1407', 'TG1688', 'BST1251', 'T', '2024-11-17', 'absences', NULL, 12, 'To004'),
('AT1408', 'TG1688', 'BST1251', 'T', '2024-11-24', 'absences', NULL, 13, 'To004'),
('AT1409', 'TG1688', 'BST1251', 'T', '2024-12-01', 'absences', NULL, 14, 'To004'),
('AT1410', 'TG1688', 'BST1251', 'T', '2024-12-08', 'absences', NULL, 15, 'To004'),

('AT1411', 'TG1688', 'BST1262', 'TP', '2024-08-16', 'absences', NULL, 1, 'To004'),
('AT1412', 'TG1688', 'BST1262', 'TP', '2024-08-23', 'absences', NULL, 2, 'To004'),
('AT1413', 'TG1688', 'BST1262', 'TP', '2024-08-30', 'absences', NULL, 3, 'To004'),
('AT1414', 'TG1688', 'BST1262', 'TP', '2024-09-07', 'absences', NULL, 4, 'To004'),
('AT1415', 'TG1688', 'BST1262', 'TP', '2024-09-14', 'absences', NULL, 5, 'To004'),
('AT1416', 'TG1688', 'BST1262', 'TP', '2024-09-21', 'absences', NULL, 6, 'To004'),
('AT1417', 'TG1688', 'BST1262', 'TP', '2024-09-28', 'absences', NULL, 7, 'To004'),
('AT1418', 'TG1688', 'BST1262', 'TP', '2024-10-05', 'absences', NULL, 8, 'To004'),
('AT1419', 'TG1688', 'BST1262', 'TP', '2024-10-12', 'absences', NULL, 9, 'To004'),
('AT1420', 'TG1688', 'BST1262', 'TP', '2024-10-19', 'absences', NULL, 10, 'To004'),
('AT1421', 'TG1688', 'BST1262', 'TP', '2024-10-26', 'absences', NULL, 11, 'To004'),
('AT1422', 'TG1688', 'BST1262', 'TP', '2024-11-02', 'absences', NULL, 12, 'To004'),
('AT1423', 'TG1688', 'BST1262', 'TP', '2024-11-09', 'absences', NULL, 13, 'To004'),
('AT1424', 'TG1688', 'BST1262', 'TP', '2024-11-16', 'absences', NULL, 14, 'To004'),
('AT1425', 'TG1688', 'BST1262', 'TP', '2024-11-23', 'absences', NULL, 15, 'To004');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1426', 'TG1688', 'ENG1222', 'T', '2024-08-15', 'absences', NULL, 1, 'To005'),
('AT1427', 'TG1688', 'ENG1222', 'T', '2024-08-22', 'absences', NULL, 2, 'To005'),
('AT1428', 'TG1688', 'ENG1222', 'T', '2024-08-29', 'absences', NULL, 3, 'To005'),
('AT1429', 'TG1688', 'ENG1222', 'T', '2024-09-06', 'absences', NULL, 4, 'To005'),
('AT1430', 'TG1688', 'ENG1222', 'T', '2024-09-13', 'absences', NULL, 5, 'To005'),
('AT1431', 'TG1688', 'ENG1222', 'T', '2024-09-20', 'absences', NULL, 6, 'To005'),
('AT1432', 'TG1688', 'ENG1222', 'T', '2024-09-27', 'absences', NULL, 7, 'To005'),
('AT1433', 'TG1688', 'ENG1222', 'T', '2024-10-04', 'absences', NULL, 8, 'To005'),
('AT1434', 'TG1688', 'ENG1222', 'T', '2024-10-27', 'absences', NULL, 9, 'To005'),
('AT1435', 'TG1688', 'ENG1222', 'T', '2024-11-03', 'absences', NULL, 10, 'To005'),
('AT1436', 'TG1688', 'ENG1222', 'T', '2024-11-10', 'absences', NULL, 11, 'To005'),
('AT1437', 'TG1688', 'ENG1222', 'T', '2024-11-17', 'absences', NULL, 12, 'To005'),
('AT1438', 'TG1688', 'ENG1222', 'T', '2024-11-24', 'absences', NULL, 13, 'To005'),
('AT1439', 'TG1688', 'ENG1222', 'T', '2024-12-01', 'absences', NULL, 14, 'To005'),
('AT1440', 'TG1688', 'ENG1222', 'T', '2024-12-08', 'absences', NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1441', 'TG1393', 'ENG1222', 'T', '2024-08-15', 'absences', NULL, 1, 'To005'),
('AT1442', 'TG1393', 'ENG1222', 'T', '2024-08-22', 'absences', NULL, 2, 'To005'),
('AT1443', 'TG1393', 'ENG1222', 'T', '2024-08-29', 'absences', NULL, 3, 'To005'),
('AT1444', 'TG1393', 'ENG1222', 'T', '2024-09-06', 'absences', NULL, 4, 'To005'),
('AT1445', 'TG1393', 'ENG1222', 'T', '2024-09-13', 'absences', NULL, 5, 'To005'),
('AT1446', 'TG1393', 'ENG1222', 'T', '2024-09-20', 'absences', NULL, 6, 'To005'),
('AT1447', 'TG1393', 'ENG1222', 'T', '2024-09-27', 'absences', NULL, 7, 'To005'),
('AT1448', 'TG1393', 'ENG1222', 'T', '2024-10-04', 'absences', NULL, 8, 'To005'),
('AT1449', 'TG1393', 'ENG1222', 'T', '2024-10-27', 'absences', NULL, 9, 'To005'),
('AT1450', 'TG1393', 'ENG1222', 'T', '2024-11-03', 'absences', NULL, 10, 'To005'),
('AT1451', 'TG1393', 'ENG1222', 'T', '2024-11-10', 'absences', NULL, 11, 'To005'),
('AT1452', 'TG1393', 'ENG1222', 'T', '2024-11-17', 'absences', NULL, 12, 'To005'),
('AT1453', 'TG1393', 'ENG1222', 'T', '2024-11-24', 'absences', NULL, 13, 'To005'),
('AT1454', 'TG1393', 'ENG1222', 'T', '2024-12-01', 'absences', NULL, 14, 'To005'),
('AT1455', 'TG1393', 'ENG1222', 'T', '2024-12-08', 'absences', NULL, 15, 'To005');


INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1456', 'TG1393', 'TCS1212', 'T', '2024-08-15', 'absences', NULL, 1, 'To005'),
('AT1457', 'TG1393', 'TCS1212', 'T', '2024-08-22', 'absences', NULL, 2, 'To005'),
('AT1458', 'TG1393', 'TCS1212', 'T', '2024-08-29', 'absences', NULL, 3, 'To005'),
('AT1459', 'TG1393', 'TCS1212', 'T', '2024-09-06', 'absences', NULL, 4, 'To005'),
('AT1460', 'TG1393', 'TCS1212', 'T', '2024-09-13', 'absences', NULL, 5, 'To005'),
('AT1461', 'TG1393', 'TCS1212', 'T', '2024-09-20', 'absences', NULL, 6, 'To005'),
('AT1462', 'TG1393', 'TCS1212', 'T', '2024-09-27', 'absences', NULL, 7, 'To005'),
('AT1463', 'TG1393', 'TCS1212', 'T', '2024-10-04', 'absences', NULL, 8, 'To005'),
('AT1464', 'TG1393', 'TCS1212', 'T', '2024-10-27', 'absences', NULL, 9, 'To005'),
('AT1465', 'TG1393', 'TCS1212', 'T', '2024-11-03', 'absences', NULL, 10, 'To005'),
('AT1466', 'TG1393', 'TCS1212', 'T', '2024-11-10', 'absences', NULL, 11, 'To005'),
('AT1467', 'TG1393', 'TCS1212', 'T', '2024-11-17', 'absences', NULL, 12, 'To005'),
('AT1468', 'TG1393', 'TCS1212', 'T', '2024-11-24', 'absences', NULL, 13, 'To005'),
('AT1469', 'TG1393', 'TCS1212', 'T', '2024-12-01', 'absences', NULL, 14, 'To005'),
('AT1470', 'TG1393', 'TCS1212', 'T', '2024-12-08', 'absences', NULL, 15, 'To005');



INSERT INTO attendance(attendance_id, at_student_id, at_course_code, at_course_type, date, attendance, medical_status, session_no, at_to_id)
VALUES
('AT1471', 'TG1688', 'TCS1212', 'T', '2024-08-15', 'absences', NULL, 1, 'To005'),
('AT1472', 'TG1688', 'TCS1212', 'T', '2024-08-22', 'absences', NULL, 2, 'To005'),
('AT1473', 'TG1688', 'TCS1212', 'T', '2024-08-29', 'absences', NULL, 3, 'To005'),
('AT1474', 'TG1688', 'TCS1212', 'T', '2024-09-06', 'absences', NULL, 4, 'To005'),
('AT1475', 'TG1688', 'TCS1212', 'T', '2024-09-13', 'absences', NULL, 5, 'To005'),
('AT1476', 'TG1688', 'TCS1212', 'T', '2024-09-20', 'absences', NULL, 6, 'To005'),
('AT1477', 'TG1688', 'TCS1212', 'T', '2024-09-27', 'absences', NULL, 7, 'To005'),
('AT1478', 'TG1688', 'TCS1212', 'T', '2024-10-04', 'absences', NULL, 8, 'To005'),
('AT1479', 'TG1688', 'TCS1212', 'T', '2024-10-27', 'absences', NULL, 9, 'To005'),
('AT1480', 'TG1688', 'TCS1212', 'T', '2024-11-03', 'absences', NULL, 10, 'To005'),
('AT1481', 'TG1688', 'TCS1212', 'T', '2024-11-10', 'absences', NULL, 11, 'To005'),
('AT1482', 'TG1688', 'TCS1212', 'T', '2024-11-17', 'absences', NULL, 12, 'To005'),
('AT1483', 'TG1688', 'TCS1212', 'T', '2024-11-24', 'absences', NULL, 13, 'To005'),
('AT1484', 'TG1688', 'TCS1212', 'T', '2024-12-01', 'absences', NULL, 14, 'To005'),
('AT1485', 'TG1688', 'TCS1212', 'T', '2024-12-08', 'absences', NULL, 15, 'To005');



INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1376', 'ICT1212', 75, 85, 67, 80, 78, 0, 88, 0),
('TG1376', 'ICT1222', 67, 72, 81, 76, 0, 64, 0, 82),
('TG1376', 'ICT1233', 90, 68, 84, 85, 0, 76, 80, 66),
('TG1376', 'ICT1242', 80, 78, 72, 75, 70, 0, 76, 0),
('TG1376', 'ICT1253', 82, 90, 68, 83, 81, 80, 86, 88),
('TG1376', 'TMS1233', 65, 87, 74, 80, 77, 0, 82, 0),
('TG1376', 'ENG1222', 84, 71, 78, 79, 76, 0, 83, 0),
('TG1376', 'TCS1212', 86, 69, 78, 82, 88, 0, 79, 0);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES

('TG1398', 'ICT1212', 80, 75, 81, 82, 78, 0, 88, 0),
('TG1398', 'ICT1222', 72, 88, 79, 74, 0, 76, 0, 85),
('TG1398', 'ICT1233', 85, 64, 90, 81, 0, 76, 89, 68),
('TG1398', 'ICT1242', 66, 83, 87, 72, 84, 0, 71, 0),
('TG1398', 'ICT1253', 88, 90, 74, 77, 69, 71, 86, 80),
('TG1398', 'TMS1233', 79, 82, 67, 75, 76, 0, 73, 0),
('TG1398', 'ENG1222', 83, 86, 85, 78, 70, 0, 81, 0),
('TG1398', 'TCS1212', 89, 82, 73, 84, 88, 0, 80, 0);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES

('TG1366', 'ICT1212', 70, 80, 77, 76, 78, 0, 85, 0),
('TG1366', 'ICT1222', 84, 66, 72, 75, 0, 71, 0, 80),
('TG1366', 'ICT1233', 86, 90, 74, 82, 0, 84, 76, 79),
('TG1366', 'ICT1242', 88, 68, 80, 70, 79, 0, 78, 0),
('TG1366', 'ICT1253', 65, 89, 81, 88, 80, 76, 72, 70),
('TG1366', 'TMS1233', 77, 75, 74, 73, 76, 0, 80, 0),
('TG1366', 'ENG1222', 70, 82, 90, 84, 88, 0, 82, 0),
('TG1366', 'TCS1212', 84, 68, 76, 78, 79, 0, 85, 0);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG1353', 'ICT1212', 72, 85, 90, 80, 84, 0, 86, 0),
('TG1353', 'ICT1222', 70, 68, 74, 77, 0, 82, 0, 90),
('TG1353', 'ICT1233', 82, 86, 85, 81, 0, 83, 68, 80),
('TG1353', 'ICT1242', 66, 88, 84, 75, 72, 0, 76, 0),
('TG1353', 'ICT1253', 90, 78, 89, 82, 88, 86, 84, 81),
('TG1353', 'TMS1233', 75, 72, 66, 70, 78, 0, 80, 0),
('TG1353', 'ENG1222', 81, 79, 87, 82, 85, 0, 81, 0),
('TG1353', 'TCS1212', 88, 82, 75, 84, 80, 0, 83, 0);


INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1474', 'ENT1211', 40, 35, 40, 38, 35, 42, 37, 48),
('TG1474', 'ENT1221', 45, 38, 50, 48, 39, 37, 46, 40),
('TG1474', 'ENT1231', 47, 36, 46, 40, 50, 39, 42, 48),
('TG1474', 'ENT1242', 45, 47, 38, 41, 49, 40, 37, 50),
('TG1474', 'ENT1253', 39, 44, 42, 50, 42, 48, 45, 37),
('TG1474', 'TMS1213', 47, 40, 48, 41, 33, 35, 42, 50),
('TG1474', 'TMS1223', 40, 46, 50, 47, 37, 44, 39, 48),
('TG1474', 'ENG1222', 78, 40, 38, 45, 49, 50, 39, 42),
('TG1474', 'TCS1212', 46, 40, 50, 36, 35, 45, 38, 47);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG1444', 'ENT1211', 81, 86, 75, 82, 80, 74, 83, 79),
('TG1444', 'ENT1221', 70, 75, 79, 76, 78, 82, 81, 84),
('TG1444', 'ENT1231', 88, 86, 77, 84, 82, 80, 78, 76),
('TG1444', 'ENT1242', 78, 90, 85, 81, 79, 76, 84, 82),
('TG1444', 'ENT1253', 86, 84, 82, 88, 89, 78, 87, 90),
('TG1444', 'TMS1213', 80, 78, 72, 73, 70, 75, 77, 81),
('TG1444', 'TMS1223', 89, 85, 88, 86, 87, 83, 82, 81),
('TG1444', 'ENG1222', 67, 74, 80, 82, 83, 88, 90, 86),
('TG1444', 'TCS1212', 88, 56, 66, 57, 72, 85, 56, 76);


INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1610', 'BST1212', 80, 78, 67, 75, 82, 84, 72, 70),
('TG1610', 'BST1222', 84, 63, 70, 74, 78, 75, 86, 69),
('TG1610', 'BST1232', 85, 70, 68, 76, 75, 68, 82, 80),
('TG1610', 'BST1242', 78, 81, 87, 81, 84, 66, 79, 70),
('TG1610', 'BST1251', 82, 69, 84, 73, 67, 70, 78, 76),
('TG1610', 'BST1262', 67, 75, 82, 77, 72, 71, 80, 73),
('TG1610', 'BST1272', 83, 76, 68, 80, 75, 67, 70, 79),
('TG1610', 'BST1282', 88, 66, 90, 82, 80, 73, 78, 71),
('TG1610', 'ENG1222', 77, 66, 85, 55, 64, 55, 45, 55),  
('TG1610', 'TCS1212', 87, 54, 68, 67, 77, 90, 57, 68); 


INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1605', 'BST1212', 81, 79, 66, 78, 82, 70, 80, 75),
('TG1605', 'BST1222', 75, 82, 90, 81, 68, 72, 76, 84),
('TG1605', 'BST1232', 70, 88, 72, 76, 74, 66, 78, 83),
('TG1605', 'BST1242', 67, 75, 84, 79, 80, 69, 87, 70),
('TG1605', 'BST1251', 88, 73, 80, 77, 84, 68, 82, 71),
('TG1605', 'BST1262', 66, 78, 75, 74, 70, 70, 69, 78),
('TG1605', 'BST1272', 69, 80, 81, 80, 76, 67, 74, 72),
('TG1605', 'BST1282', 82, 88, 67, 83, 72, 68, 79, 76),
('TG1605', 'ENG1222', 80, 86, 67, 55, 45, 65, 87, 76),
('TG1605', 'TCS1212', 60, 65, 61, 83, 65, 68, 79, 88);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG1393', 'ICT1212', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'ICT1222', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'ICT1233', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'ICT1242', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'ICT1253', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'TMS1233', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'ENG1222', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1393', 'TCS1212', 0, 0, 0, 0, 0, 0, 0, 0);


INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG1688', 'BST1212', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1222', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1232', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1242', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1251', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1262', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1272', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'BST1282', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'ENG1222', 0, 0, 0, 0, 0, 0, 0, 0),
('TG1688', 'TCS1212', 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1024', 'ENT1211', 75, 79, 82, 83, 84, 81, 78, 85),
('TG1024', 'ENT1221', 68, 66, 64, 72, 70, 75, 67, 73),
('TG1024', 'ENT1231', 80, 82, 79, 85, 83, 84, 76, 77),
('TG1024', 'ENT1242', 74, 70, 72, 78, 66, 82, 75, 68),
('TG1024', 'ENT1253', 76, 78, 77, 81, 79, 75, 74, 82),
('TG1024', 'TMS1213', 84, 82, 80, 78, 76, 85, 74, 73),
('TG1024', 'TMS1223', 83, 81, 85, 84, 80, 79, 77, 78),
('TG1024', 'ENG1222', 82, 83, 75, 84, 78, 81, 80, 85),
('TG1024', 'TCS1212', 55, 66, 70, 69, 45, 55, 63, 69);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG987', 'ENT1211', 83, 79, 84, 75, 82, 85, 67, 69),
('TG987', 'ENT1221', 72, 76, 74, 79, 68, 81, 77, 80),
('TG987', 'ENT1231', 78, 66, 70, 73, 76, 72, 68, 75),
('TG987', 'ENT1242', 84, 85, 69, 82, 83, 80, 78, 77),
('TG987', 'ENT1253', 72, 67, 65, 74, 70, 77, 64, 66),
('TG987', 'TMS1213', 70, 75, 68, 78, 66, 73, 80, 76),
('TG987', 'TMS1223', 78, 81, 67, 73, 79, 74, 72, 84),
('TG987', 'ENG1222', 85, 83, 82, 80, 76, 84, 77, 65),
('TG987', 'TCS1212', 55, 66, 70, 85, 47, 77, 66, 60);


INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical)
 VALUES
('TG1123', 'BST1212', 75, 73, 64, 70, 72, 68, 74, 69),
('TG1123', 'BST1222', 69, 74, 72, 70, 68, 65, 73, 62),
('TG1123', 'BST1232', 70, 71, 75, 74, 73, 66, 75, 71),
('TG1123', 'BST1242', 71, 67, 69, 63, 76, 74, 65, 72),
('TG1123', 'BST1251', 74, 73, 72, 70, 74, 66, 73, 68),
('TG1123', 'BST1262', 62, 73, 68, 70, 72, 69, 71, 66),
('TG1123', 'BST1272', 74, 68, 67, 72, 65, 70, 69, 60),
('TG1123', 'BST1282', 73, 68, 72, 66, 71, 70, 63, 74),
('TG1123', 'ENG1222', 70, 69, 72, 66, 75, 70, 64, 72),
('TG1123', 'TCS1212', 74, 73, 67, 72, 65, 70, 69, 62);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG765', 'ICT1212', 63, 58, 67, 52, 65, 0, 59, 0),
('TG765', 'ICT1222', 70, 55, 60, 57, 0, 53, 0, 63),
('TG765', 'ICT1233', 68, 62, 65, 58, 0, 54, 69, 56),
('TG765', 'ICT1242', 66, 64, 58, 53, 70, 0, 61, 0),
('TG765', 'ICT1253', 60, 67, 55, 63, 69, 58, 66, 52),
('TG765', 'TMS1233', 62, 68, 56, 57, 63, 0, 59, 0),
('TG765', 'ENG1222', 69, 55, 64, 58, 60, 0, 66, 0),
('TG765', 'TCS1212', 59, 68, 54, 66, 63, 0, 65, 0);

INSERT INTO marks (student_id, course_code, Q1, Q2, Q3, assessment_mark, mid_exam_theory, mid_exam_practical, final_exam_theory, final_exam_practical) 
VALUES
('TG1276', 'BST1212', 68, 59, 60, 56, 70, 66, 58, 60),
('TG1276', 'BST1222', 65, 69, 59, 70, 66, 62, 56, 64),
('TG1276', 'BST1232', 57, 60, 65, 55, 64, 65, 67, 69),
('TG1276', 'BST1242', 63, 67, 62, 65, 66, 68, 69, 70),
('TG1276', 'BST1251', 60, 64, 65, 67, 68, 69, 66, 65),
('TG1276', 'BST1262', 66, 60, 68, 67, 69, 65, 62, 63),
('TG1276', 'BST1272', 62, 61, 60, 59, 58, 57, 56, 55),
('TG1276', 'BST1282', 68, 67, 66, 65, 64, 63, 62, 61),
('TG1276', 'ENG1222', 64, 63, 62, 61, 60, 59, 58, 57),
('TG1276', 'TCS1212', 69, 68, 67, 66, 65, 64, 63, 62);




UPDATE attendance 
SET attendance='absences' 
WHERE Attendance_id ="AT0347" OR 
      Attendance_id ="AT0348" OR 
      Attendance_id ="AT0467" OR 
      Attendance_id ="AT0469" OR 
      Attendance_id ="AT0470" OR 
      Attendance_id ="AT0471" OR 
      Attendance_id ="AT0473" OR 
      Attendance_id ="AT0280" OR 
      Attendance_id ="AT0290" OR
      Attendance_id ="AT0334" OR
      Attendance_id ="AT0335" OR
      Attendance_id ="AT0336" OR
      Attendance_id ="AT0337" OR
      Attendance_id ="AT0490" OR
      Attendance_id ="AT0493" OR
      Attendance_id ="AT0504" OR
      Attendance_id ="AT0500" OR
      Attendance_id ="AT0604" OR
      Attendance_id ="AT0607" OR
      Attendance_id ="AT0704" OR
      Attendance_id ="AT0790" OR
      Attendance_id ="AT0820" OR
      Attendance_id ="AT0946" OR
      Attendance_id ="AT0947" OR
      Attendance_id ="AT0950" OR
      Attendance_id ="AT0972" OR
      Attendance_id ="AT0976" OR
      Attendance_id ="AT0977" OR
      Attendance_id ="AT0978" OR
      Attendance_id ="AT0979" OR
      Attendance_id ="AT1000";





------------------------Create Accounts-----------------------------------------


CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'dean'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON apollo.* TO 'dean'@'localhost';

CREATE USER 'lecturer'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON apollo.* TO 'lecturer'@'localhost';

CREATE USER 'technical_officer'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE ON apollo.Attendance TO 'tech_officer'@'localhost';

CREATE USER 'student'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON apollo.Attendance TO 'student'@'localhost';
GRANT SELECT ON apollo.Marks TO 'student'@'localhost';


FLUSH PRIVILEGES;








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





----CA eligibility view----

CREATE VIEW ca_eligibility_view AS
SELECT 
    student_id,
    course_code,
    Q1,
    Q2,
    Q3,
    assessment_mark,
    mid_exam_theory,
    mid_exam_practical,
    
    
    (GREATEST(Q1, Q2, Q3) + 
     (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) +
     assessment_mark + 
     mid_exam_theory + 
     mid_exam_practical) AS total_CA_marks,
     
    
    ROUND(((GREATEST(Q1, Q2, Q3) + 
            (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) + 
            assessment_mark + 
            mid_exam_theory + 
            mid_exam_practical) / 500) * 40, 2) AS marks_out_of_40,
           
    
    CASE 
        WHEN ROUND(((GREATEST(Q1, Q2, Q3) + 
                     (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) + 
                     assessment_mark + 
                     mid_exam_theory + 
                     mid_exam_practical) / 500) * 40, 2) >= 20 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status
FROM 
    marks;


---final marks view---
    CREATE VIEW final_marks_view AS
SELECT 
    student_id,
    course_code,
    final_exam_theory,
    final_exam_practical,

    
    CASE 
        WHEN final_exam_theory IS NOT NULL AND final_exam_practical IS NOT NULL THEN 
            (final_exam_theory + final_exam_practical)  
        WHEN final_exam_theory IS NOT NULL AND final_exam_practical = 0 THEN 
            final_exam_theory  
        WHEN final_exam_practical IS NOT NULL AND final_exam_theory = 0 THEN 
            final_exam_practical  
        ELSE 
            0 
    END AS total_final_marks,

    
    ROUND(
        CASE 
            WHEN final_exam_theory IS NOT NULL AND final_exam_practical IS NOT NULL THEN 
                ((final_exam_theory + final_exam_practical) / 200) * 60  
            WHEN final_exam_theory IS NOT NULL AND final_exam_practical = 0 THEN 
                (final_exam_theory / 100) * 60  
            WHEN final_exam_practical IS NOT NULL AND final_exam_theory = 0 THEN 
                (final_exam_practical / 100) * 60  
            ELSE 
                0  
        END, 
    2) AS marks_out_of_60 

FROM 
    marks;


---student final grades view----
    CREATE VIEW student_final_grades AS
     SELECT
         fm.student_id,
         fm.course_code,
         fm.marks_out_of_60,
         ca.marks_out_of_40,
         (fm.marks_out_of_60 + ca.marks_out_of_40) AS final_mark_out_of_100,
         CASE
             WHEN s.status = 'repeat' THEN 'C'
             WHEN s.status = 'suspended' THEN 'WH'
             ELSE
                CASE
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 85 THEN 'A+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 80 THEN 'A'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 75 THEN 'A-'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 70 THEN 'B+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 65 THEN 'B'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 60 THEN 'B-'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 55 THEN 'C+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 50 THEN 'C'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 45 THEN 'C-'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 40 THEN 'D+'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 35 THEN 'D'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 30 THEN 'D-'
                   ELSE 'E'
               END
       END AS grade
    FROM
         final_marks_view fm
    JOIN
         ca_eligibility_view ca ON fm.student_id = ca.student_id AND fm.course_code = ca.course_code
    JOIN
         student s ON fm.student_id = s.student_id;



-------------Student SGPA -----------------
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


--------------------------------------------------------------------------------

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



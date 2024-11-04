--Insert data into student table
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



--Insert data into student_course_unit table
INSERT INTO student_course_unit (student_id, course_code)
VALUES
('TG1376', 'ICT1212'),
('TG1376', 'ICT1222'),
('TG1376', 'ICT1233'),
('TG1376', 'ICT1242'),
('TG1376', 'ICT1253'),
('TG1376', 'TMS1233'),
('TG1376', 'ENG1222'),
('TG1376', 'TCS1212'),

('TG1398', 'ICT1212'),
('TG1398', 'ICT1222'),
('TG1398', 'ICT1233'),
('TG1398', 'ICT1242'),
('TG1398', 'ICT1253'),
('TG1398', 'TMS1233'),
('TG1398', 'ENG1222'),
('TG1398', 'TCS1212'),

('TG1366', 'ICT1212'),
('TG1366', 'ICT1222'),
('TG1366', 'ICT1233'),
('TG1366', 'ICT1242'),
('TG1366', 'ICT1253'),
('TG1366', 'TMS1233'),
('TG1366', 'ENG1222'),
('TG1366', 'TCS1212'),

('TG1353', 'ICT1212'),
('TG1353', 'ICT1222'),
('TG1353', 'ICT1233'),
('TG1353', 'ICT1242'),
('TG1353', 'ICT1253'),
('TG1353', 'TMS1233'),
('TG1353', 'ENG1222'),
('TG1353', 'TCS1212'),

('TG1393', 'ICT1212'),
('TG1393', 'ICT1222'),
('TG1393', 'ICT1233'),
('TG1393', 'ICT1242'),
('TG1393', 'ICT1253'),
('TG1393', 'TMS1233'),
('TG1393', 'ENG1222'),
('TG1393', 'TCS1212'),

('TG765', 'ICT1212'),
('TG765', 'ICT1222'),
('TG765', 'ICT1233'),
('TG765', 'ICT1242'),
('TG765', 'ICT1253'),
('TG765', 'TMS1233'),
('TG765', 'ENG1222'),
('TG765', 'TCS1212'),

('TG1474', 'ENT1211'),
('TG1474', 'ENT1221'),
('TG1474', 'ENT1231'),
('TG1474', 'ENT1242'),
('TG1474', 'ENT1253'),
('TG1474', 'TMS1213'),
('TG1474', 'TMS1223'),
('TG1474', 'ENG1222'),
('TG1474', 'TCS1212'),

('TG1444', 'ENT1211'),
('TG1444', 'ENT1221'),
('TG1444', 'ENT1231'),
('TG1444', 'ENT1242'),
('TG1444', 'ENT1253'),
('TG1444', 'TMS1213'),
('TG1444', 'TMS1223'),
('TG1444', 'ENG1222'),
('TG1444', 'TCS1212'),

('TG1024', 'ENT1211'),
('TG1024', 'ENT1221'),
('TG1024', 'ENT1231'),
('TG1024', 'ENT1242'),
('TG1024', 'ENT1253'),
('TG1024', 'TMS1213'),
('TG1024', 'TMS1223'),
('TG1024', 'ENG1222'),
('TG1024', 'TCS1212'),

('TG987', 'ENT1211'),
('TG987', 'ENT1221'),
('TG987', 'ENT1231'),
('TG987', 'ENT1242'),
('TG987', 'ENT1253'),
('TG987', 'TMS1213'),
('TG987', 'TMS1223'),
('TG987', 'ENG1222'),
('TG987', 'TCS1212'),

('TG1610', 'BST1212'),
('TG1610', 'BST1222'),
('TG1610', 'BST1232'),
('TG1610', 'BST1242'),
('TG1610', 'BST1251'),
('TG1610', 'BST1262'),
('TG1610', 'BST1272'),
('TG1610', 'BST1282'),
('TG1610', 'ENG1222'),
('TG1610', 'TCS1212'),

('TG1605', 'BST1212'),
('TG1605', 'BST1222'),
('TG1605', 'BST1232'),
('TG1605', 'BST1242'),
('TG1605', 'BST1251'),
('TG1605', 'BST1262'),
('TG1605', 'BST1272'),
('TG1605', 'BST1282'),
('TG1605', 'ENG1222'),
('TG1605', 'TCS1212'),

('TG1688', 'BST1212'),
('TG1688', 'BST1222'),
('TG1688', 'BST1232'),
('TG1688', 'BST1242'),
('TG1688', 'BST1251'),
('TG1688', 'BST1262'),
('TG1688', 'BST1272'),
('TG1688', 'BST1282'),
('TG1688', 'ENG1222'),
('TG1688', 'TCS1212'),

('TG1123', 'BST1212'),
('TG1123', 'BST1222'),
('TG1123', 'BST1232'),
('TG1123', 'BST1242'),
('TG1123', 'BST1251'),
('TG1123', 'BST1262'),
('TG1123', 'BST1272'),
('TG1123', 'BST1282'),
('TG1123', 'ENG1222'),
('TG1123', 'TCS1212'),

('TG1276', 'BST1212'),
('TG1276', 'BST1222'),
('TG1276', 'BST1232'),
('TG1276', 'BST1242'),
('TG1276', 'BST1251'),
('TG1276', 'BST1262'),
('TG1276', 'BST1272'),
('TG1276', 'BST1282'),
('TG1276', 'ENG1222'),
('TG1276', 'TCS1212');


--Insert data into technical_officer_course_unit table
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
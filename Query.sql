-----------Lecture details--------------
CREATE VIEW lecture_detail AS
SELECT l.lecturer_id, l.department, l.lc_nic, u.email, u.f_name, u.l_name, u.address, u.gender
FROM lecturer l INNER JOIN user u
ON l.lc_nic = u.u_nic;
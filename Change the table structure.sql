
ALTER TABLE attendance
CHANGE attendence attendance VARCHAR(20);


UPDATE attendance 
SET attendance='absences' 
WHERE Attendance_id ="AT0280" OR 
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



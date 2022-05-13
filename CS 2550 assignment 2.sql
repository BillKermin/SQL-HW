-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 1/25/2022

SELECT first_name AS "First Name", last_name AS "Last Name", 
phone AS "Phone Number", To_Char(registration_date, 'Mon DD, YYYY') AS "Registration Date"
FROM student
WHERE To_Char(registration_date, 'Mon DD, YYYY') = 'Feb 19, 2007'
ORDER BY last_name, first_name;

SELECT course_no, section_id, To_Char(start_date_time, 'MONTH DD YYYY HH:MI AM') AS "STARTDATETIME", location
FROM section
WHERE location = 'L509'
ORDER BY start_date_time;

SELECT course_no, section_id, To_Char(start_date_time, 'YYYY-MM-DD HH:MI AM') AS STARTDATETIME,instructor_id, capacity
FROM section
WHERE To_Char(start_date_time, 'YYYY-MM') = '2007-04'
ORDER BY start_date_time DESC, course_no;

SELECT student_id, section_id, To_Char(enroll_date, 'Mon DD YYYY HH:MI AM') AS "Date and Time Enrolled"
FROM enrollment
WHERE enroll_date > To_Date('Feb 10 2007 10:00 AM', 'Mon DD YYYY HH:MI AM')
AND enroll_date < To_Date('Feb 11 2007 11:00 AM', 'Mon DD YYYY HH:MI AM')
ORDER BY enroll_date DESC, student_id, section_id;

SELECT To_Char(To_Date('Jan 10 2022', 'Mon DD YYYY') + 107, 'MON DD YYYY') AS "SEMESTEREND"
FROM Dual;

SELECT course_no, section_id, To_Char(start_date_time, 'HH:MI AM') AS "Hour Day"
FROM section
WHERE course_no BETWEEN '120' AND '129'
ORDER BY 'Hour Day', course_no, section_id;

SELECT last_name, first_name, To_Char(created_date, 'MM/DD/YYYY') AS "CREATED", To_Char(registration_date, 'MM/DD/YYYY') AS "REGDATE"
FROM student
WHERE To_Char(registration_date, 'DD') - To_Char(created_date, 'DD') >= 3
ORDER BY last_name, first_name;

SELECT last_name, first_name, phone, 
ROUND(((To_Date('03-FEB-2022', 'DD-MM-YYYY') - registration_date) / 365), 2) AS "Years"
FROM student
WHERE phone LIKE '203%'
ORDER BY last_name, first_name;

SELECT DISTINCT To_Char(start_date_time, 'HH:MI') AS "HOUR"
FROM section
ORDER BY To_Char(start_date_time, 'HH:MI') DESC;

SELECT student_id, section_id, To_Char(enroll_date, 'HH:MI AM') AS "ENROLLED"
FROM enrollment
WHERE To_Char(enroll_date, 'HH:MI') = '10:19'
ORDER BY student_id, section_id;




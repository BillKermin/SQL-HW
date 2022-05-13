-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 2/24/2022

SELECT g.grade_type_code, g.grade_code_occurrence, 
AVG(g.numeric_grade) AS "AVGGRADE"
FROM grade g
WHERE g.grade_type_code = 'QZ'
GROUP BY g.grade_code_occurrence, g.grade_type_code
ORDER BY g.grade_code_occurrence;

SELECT To_Char(s.registration_date, 'Mon') AS "Reg_Month", 
COUNT(*) AS "NUMSTUDENTS"
FROM student s
GROUP BY To_Char(s.registration_date, 'Mon')
ORDER BY "Reg_Month";

SELECT g.grade_type_code, MAX(g.numeric_grade) AS "HIGH",
MIN(g.numeric_grade) AS "LOW", ROUND(AVG(g.numeric_grade), 2) AS "AVE"
FROM grade g
GROUP BY g.grade_type_code
ORDER BY g.grade_type_code;

SELECT z.state, COUNT(*) AS "NUMZIPS"
FROM zipcode z
GROUP BY z.state
HAVING COUNT(*) > 15
ORDER BY NUMZIPS DESC;

SELECT e.section_id, To_Char(e.enroll_date, 'Mon DD YYYY') AS "EnrollDate", 
COUNT(*) AS "NUMSTUDENTS"
FROM enrollment e
WHERE To_Char(e.enroll_date, 'Mon DD YYYY') = 'Jan 30 2007'
OR To_Char(e.enroll_date, 'Mon DD YYYY') = 'Feb 21 2007'
GROUP BY e.section_id, To_Char(e.enroll_date, 'Mon DD YYYY')
ORDER BY e.section_id;

SELECT g.student_id, s.first_name, s.last_name, g.section_id, 
To_Char(AVG(g.numeric_grade), '99.9999') AS "AVGGRADE"
FROM grade g INNER JOIN student s
ON g.student_id = s.student_id
WHERE g.section_id = '147'
GROUP BY g.student_id, g.section_id, s.first_name, s.last_name
ORDER BY AVGGRADE DESC, g.student_id;

SELECT e.student_id, s.first_name, s.last_name, COUNT(*) AS "SECTIONS"
FROM enrollment e INNER JOIN student s
ON e.student_id = s.student_id
GROUP BY e.student_id, s.first_name, s.last_name
HAVING COUNT(*) > 2
ORDER BY SECTIONS DESC, s.last_name, s.first_name;

SELECT g.section_id, MIN(g.numeric_grade) AS "LOWSCORE"
FROM grade g
WHERE g.grade_type_code = 'QZ'
GROUP BY g.section_id
HAVING MIN(g.numeric_grade) > 85
ORDER BY LOWSCORE DESC, g.section_id;

SELECT s.employer, COUNT(*) AS "NUMEMPLOYEES"
FROM student s
GROUP BY s.employer
HAVING COUNT(*) > 3
ORDER BY NUMEMPLOYEES DESC, s.employer;

SELECT s.course_no, s.section_id, COUNT(*) AS "NUMQUIZGRADES", 
AVG(g.numeric_grade) AS "AVGGRADE"
FROM section s INNER JOIN enrollment e
ON s.section_id = e.section_id
INNER JOIN grade g
ON e.section_id = g.section_id
AND e.student_id = g.student_id
WHERE g.grade_type_code = 'QZ'
GROUP BY s.course_no, s.section_id
HAVING COUNT(*) > 23
ORDER BY s.course_no, s.section_id;


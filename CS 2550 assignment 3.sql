-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 2/10/2022

SELECT s.first_name, s.last_name, s.phone, z.city, z.state
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE z.city = 'Forest Hills'
AND z.state = 'NY'
ORDER BY s.last_name, s.first_name;

SELECT DISTINCT s.course_no, c.description, s.section_id, s.location, 
i.first_name, i.last_name
FROM section s INNER JOIN course c
ON s.course_no = c.course_no
INNER JOIN instructor i
ON s.instructor_id = s.instructor_id
WHERE s.course_no BETWEEN '100' AND '199'
AND s.instructor_id = '105'
AND i.first_name = 'Anita'
AND i.last_name = 'Morris'
ORDER BY s.course_no;

SELECT gt.description, gt.grade_type_code, gtw.percent_of_final_grade, 
s.location, s.capacity, s.course_no
FROM grade_type gt INNER JOIN grade_type_weight gtw
ON gt.grade_type_code = gtw.grade_type_code
INNER JOIN section s
ON gtw.section_id = s.section_id
WHERE s.course_no = '350' OR s.course_no = '420'
ORDER BY s.course_no, gt.description, s.location;

SELECT s.first_name AS "FIRST", s.last_name AS "LAST", To_Char(e.enroll_date, 
'Mon-DD-YYYY HH:MI AM') AS "ENROLLDATE", e.section_id AS "SECTIONID"
FROM enrollment e INNER JOIN student s
ON e.student_id = s.student_id
WHERE e.enroll_date > To_Date('Feb-14-2007 1:00 PM', 'Mon-DD-YYYY HH:MI AM')
AND e.enroll_date <= To_Date('Feb-19-2007 11:59 PM', 'Mon-DD-YYYY HH:MI AM')
ORDER BY s.last_name, s.first_name, e.section_id;

SELECT s.first_name AS "FIRST", s.last_name "LAST", To_Char(e.enroll_date, 'MM/DD/YY') AS "ENTOLLDA", 
g.section_id AS "SECTIONID", g.student_id, g.grade_type_code AS "GR", 
g.grade_code_occurrence, g.numeric_grade
FROM grade g INNER JOIN enrollment e
ON g.student_id = e.student_id
AND g.section_id = e.section_id
INNER JOIN student s
ON e.student_id = s.student_id
WHERE s.last_name LIKE 'S%'
AND s.first_name LIKE 'J%'
AND To_Char(e.enroll_date, 'MM') = '02'
ORDER BY s.last_name, s.first_name, g.student_id, 
g.grade_type_code, g.grade_code_occurrence;

SELECT s.section_id, s.course_no, c.description, c.prerequisite, s.location, s.capacity, i.first_name, i.last_name
FROM section s INNER JOIN course c
ON s.course_no = c.course_no
INNER JOIN instructor i
ON s.instructor_id = i.instructor_id
WHERE c.prerequisite IS NULL
ORDER BY s.course_no, s.location, i.last_name, i.first_name;

SELECT DISTINCT s.first_name, s.last_name, s.phone, To_Char(e.enroll_date, 'DD MON YYYY HH:MI AM') AS "ENROLLDATE"
FROM enrollment e INNER JOIN student s
ON e.student_id = s.student_id
INNER JOIN zipcode z
ON s.zip = z.zip
WHERE e.enroll_date < To_Date('Feb-7-2007 10:15 AM', 'Mon-DD-YYYY HH:MI AM')
AND (z.state = 'NY' AND z.city = 'Brooklyn')
ORDER BY s.last_name, s.first_name;

SELECT DISTINCT c.course_no, c.description, g.grade_type_code
FROM grade_type_weight g INNER JOIN section s
ON g.section_id = s.section_id
INNER JOIN course c
ON c.course_no = s.course_no
WHERE g.grade_type_code = 'PA'
ORDER BY c.course_no;

SELECT g.student_id, g.section_id, g.grade_code_occurrence, g.numeric_grade, gtw.drop_lowest AS "D"
FROM grade g INNER JOIN grade_type_weight gtw
ON g.section_id = gtw.section_id
WHERE g.numeric_grade < '72'
AND gtw.drop_lowest = 'Y'
ORDER BY g.student_id, g.section_id, g.grade_code_occurrence;

SELECT c.course_no, c.description, c.prerequisite, p.description
FROM course c INNER JOIN course p
ON c.prerequisite = p.course_no
WHERE c.course_no BETWEEN '100' AND '199'
ORDER BY c.course_no;







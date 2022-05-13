-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 2/17/2022

SELECT s.first_name || ' ' || s.last_name AS "FULLNAME", s.phone, z.city, 
z.state, z.zip, s.employer
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE s.employer = 'Amer.Legal Systems'
ORDER BY z.city, z.state, z.zip;

SELECT s.employer, z.city, z.state, s.zip
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE s.employer LIKE '%,%.%'
OR s.employer LIKE '%.%,%'
ORDER BY s.employer, s.zip;

SELECT RPAD(UPPER(s.last_name) || ', ' || SUBSTR(s.first_name, 1, 1) || '.', 25, '*') 
AS "Student Name", s.phone, z.city, z.state
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE SUBSTR(s.phone, 1, 3) = '203'
ORDER BY s.last_name DESC, s.first_name DESC;

SELECT LPAD(LOWER(i.last_name) || ' ' || LOWER(i.first_name), 30, '.') AS "Instructor Name",
i.zip, c.description, s.section_id
FROM instructor i INNER JOIN section s
ON i.instructor_id = s.instructor_id
INNER JOIN course c
ON s.course_no = c.course_no
WHERE i.zip = '10005'
ORDER BY s.section_id;

SELECT s.student_id, s.first_name, s.last_name, s.zip, z.city, z.state
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE z.city = 'Fresh Meadows'
OR z.city = 'Georgetown'
ORDER BY z.city, z.state, s.last_name, s.first_name;

SELECT s.course_no, c.description, s.location
FROM section s INNER JOIN course c
ON s.course_no = c.course_no
WHERE SUBSTR(s.location, 2, 1) = '3'
ORDER BY s.location, s.course_no;

SELECT
    CASE
        WHEN z.state = 'CT' THEN 'Conneticut'
        WHEN z.state = 'OH' THEN 'Ohio'    
    END AS "FullStateName",
     z.city, z.state
FROM zipcode z
WHERE z.state = 'CT'
OR z.state = 'OH'
ORDER BY z.city, z.state;

SELECT i.first_name || ' ' || i.last_name || ' ' || i.street_address || ' ' ||
z.city || ' ' || z.state || ' ' || i.zip AS "Instructor Address"
FROM instructor i INNER JOIN zipcode z
ON i.zip = z.zip
ORDER BY i.zip, i.last_name, i.first_name;

SELECT s.first_name, s.last_name, s.student_id, e.section_id,
g.numeric_grade, g.grade_type_code, g.grade_code_occurrence 
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE e.section_id = '120'
AND g.grade_type_code = 'QZ'
ORDER BY g.numeric_grade DESC, g.grade_code_occurrence;

SELECT s.first_name, s.last_name, s.student_id, e.section_id, g.numeric_grade, 
g.grade_type_code,
    CASE 
        WHEN g.numeric_grade >= '85' THEN 'PASSING GRADE'
        WHEN g.numeric_grade < '85' THEN 'FAILING GRADE'
    END AS "FINALEXAM"
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.grade_type_code = 'FI'
AND e.section_id = '101'
ORDER BY FINALEXAM DESC, s.last_name, s.first_name;








-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 3/3/2022

SELECT i.instructor_id, i.first_name, i.last_name, COUNT(*) AS "NUM_STUDENTS"
FROM instructor i INNER JOIN section s
ON i.instructor_id = s.instructor_id
INNER JOIN enrollment e
ON s.section_id = e.section_id
GROUP BY i.instructor_id, i.first_name, i.last_name
HAVING COUNT(*) > 24
ORDER BY "NUM_STUDENTS" DESC;

SELECT s.student_id, s.first_name, s.last_name, COUNT(*) AS "NUM_INSTRUCTORS"
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section s
ON e.section_id = s.section_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(*) > 2
ORDER BY "NUM_INSTRUCTORS" DESC, s.last_name, s.first_name;

SELECT s.first_name, s.last_name, g.grade_type_code AS GR, g.section_id, COUNT(*) AS "NUM_GRADETYPECODES"
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.section_id = '152'
GROUP BY s.first_name, s.last_name, g.grade_type_code, g.section_id
ORDER BY s.last_name, s.first_name, "NUM_GRADETYPECODES" DESC, g.grade_type_code;

SELECT s.first_name, s.last_name, g.grade_type_code AS GR, AVG(g.numeric_grade) AS "GRADES"
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE e.section_id BETWEEN 110 AND 125
AND g.grade_type_code = 'HM'
GROUP BY s.first_name, s.last_name, g.grade_type_code
HAVING AVG(g.numeric_grade) > 80
ORDER BY "GRADES" DESC, s.last_name, s.first_name;

SELECT g.section_id, c.description, COUNT(*) AS "NUMTYPES"
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
INNER JOIN grade_type_weight g
ON s.section_id = g.section_id
WHERE g.section_id < '100'
GROUP BY g.section_id, c.description
HAVING COUNT(*) > 2
ORDER BY "NUMTYPES" DESC, c.description, g.section_id;

SELECT z.city, z.state AS ST, z.zip, COUNT(*) AS "NUM_INSTRUCTORS"
FROM zipcode z INNER JOIN instructor i
ON z.zip = i.zip
GROUP BY z.city, z.state, z.zip
HAVING COUNT(*) > 1
ORDER BY "NUM_INSTRUCTORS" DESC;

SELECT gt.description, COUNT(*) NUMGRADES
FROM grade_type gt INNER JOIN grade_type_weight gtw
ON gt.grade_type_code = gtw.grade_type_code
INNER JOIN grade g
ON gtw.section_id = g.section_id
AND gtw.grade_type_code = g.grade_type_code
GROUP BY gt.description
ORDER BY NUMGRADES DESC;

SELECT c.description, COUNT(*) AS NUM_STUDENTS
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
INNER JOIN enrollment e
ON s.section_id = e.section_id
GROUP BY c.description
HAVING COUNT(*) > 10
ORDER BY NUM_STUDENTS, c.description;

SELECT COUNT(*) AS NUM_COURSES, s.student_id, s.first_name, s.last_name
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(*) > 2
ORDER BY NUM_COURSES DESC, s.student_id;

SELECT s.first_name, s.last_name, g.grade_type_code AS GR, COUNT(*) AS NUM_ASSIGNMENTS
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
GROUP BY s.first_name, s.last_name, g.grade_type_code
HAVING COUNT(*) > 10
ORDER BY s.first_name, s.last_name;

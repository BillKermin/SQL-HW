 -- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 1/25/2022

SELECT salutation, first_name, last_name
FROM instructor
ORDER BY last_name, first_name;

SELECT first_name, last_name
FROM instructor
WHERE last_name LIKE 'S%';

SELECT phone, first_name || ' ' || last_name AS "FULLNAME", employer
FROM student
WHERE last_name = 'Grant'
ORDER BY employer;

SELECT course_no, description, prerequisite
FROM course
WHERE prerequisite = '310'
ORDER BY course_no;

SELECT course_no, description, cost
FROM course
WHERE course_no BETWEEN '200' AND '299'
AND cost < '1100'
ORDER BY course_no;

SELECT course_no, section_id, location
FROM section
WHERE course_no BETWEEN '100' AND '199'
AND location IN ('L214', 'L509')
ORDER BY location, course_no;

SELECT course_no, section_id, capacity
FROM section
WHERE capacity IN ('12', '15')
ORDER BY capacity, course_no, section_id;

SELECT student_id, numeric_grade, section_id
FROM grade
WHERE section_id = '99'
AND grade_type_code = 'MT'
ORDER BY student_id, numeric_grade, section_id;

SELECT course_no, description, prerequisite
FROM course
WHERE course_no BETWEEN '200' AND '399'
AND prerequisite IS NOT NULL
ORDER BY description;

SELECT DISTINCT location
FROM section
ORDER BY location;

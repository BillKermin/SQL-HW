-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 3/31/2022


SELECT s.student_id, s.first_name, s.last_name, COUNT(*) AS NUMGRADES
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.grade_type_code = 'QZ'
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(*) = 
        (SELECT MAX(NUMGRADES) 
        FROM 
                (SELECT g.student_id, COUNT(*) AS NUMGRADES
                FROM grade g
                WHERE g.grade_type_code = 'QZ'
                GROUP BY g.student_id
                ORDER BY NUMGRADES, g.student_id))
ORDER BY s.last_name, s.first_name;


SELECT s.first_name AS STUDENT_FIRST, s.last_name AS STUDENT_LAST,
i.first_name AS INSTRUCTOR_FIRST, i.last_name AS INSTRUCTOR_LAST
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
INNER JOIN instructor i 
ON sec.instructor_id = i.instructor_id
WHERE i.zip = s.zip
ORDER BY STUDENT_FIRST, STUDENT_LAST;


SELECT s.first_name, s.last_name, z.city, s.zip, 'student' AS ROLE
FROM student s INNER JOIN zipcode z
ON s.zip = z.zip
WHERE s.last_name LIKE 'H%'
UNION
SELECT i.first_name, i.last_name, z.city, i.zip, 'instructor'
FROM instructor i INNER JOIN zipcode z
ON i.zip = z.zip
WHERE i.last_name LIKE 'H%'
ORDER BY ROLE, last_name, first_name;


SELECT t1.location, SECTIONS, STUDENTS
FROM 
    (SELECT s.location, COUNT(*) AS SECTIONS
    FROM section s
    GROUP BY s.location) t1
INNER JOIN
    (SELECT s.location, COUNT(*) AS STUDENTS
    FROM section s INNER JOIN enrollment e
    ON s.section_id = e.section_id
    GROUP BY s.location) t2
ON t1.location = t2.location
ORDER BY location;


SELECT grade_type_code, numeric_grade AS GRADE
FROM grade
WHERE student_id = 139
AND section_id = 95
UNION ALL
SELECT 'Average for student 139 is', CAST(AVG(numeric_grade) AS DECIMAL(5,2))
FROM grade
WHERE student_id = 139
AND section_id = 95
ORDER BY grade_type_code DESC;


SELECT i.first_name, i.last_name, NVL(SECTIONS, '0') AS SECTIONS
FROM instructor i
LEFT JOIN
    (SELECT first_name, last_name, COUNT(*) AS SECTIONS
    FROM instructor i INNER JOIN section s
    ON i.instructor_id = s.instructor_id
    GROUP BY first_name, last_name) r
ON i.first_name = r.first_name
ORDER BY i.last_name, i.first_name;


SELECT c.course_no, c.description, COUNT(*) AS TOTALGRADETYPES
FROM course c INNER JOIN
    (SELECT s.course_no, g.grade_type_code
    FROM section s INNER JOIN grade_type_weight gr
    ON s.section_id = gr.section_id
    INNER JOIN grade g
    ON g.section_id = gr.section_id
    AND g.grade_type_code = gr.grade_type_code
    GROUP BY s.course_no, g.grade_type_code
    ORDER BY s.course_no) t1
ON c.course_no = t1.course_no
GROUP BY c.course_no, c.description
HAVING COUNT(*) = 6
ORDER BY c.course_no;


SELECT z.zip, z.city, z.state AS ST, NVL(STUDENTS, '0') AS STUDENTS
FROM zipcode z LEFT JOIN
    (SELECT z.zip, z.city, z.state AS ST, COUNT(*) AS STUDENTS
    FROM student s INNER JOIN zipcode z
    ON s.zip = z.zip
    GROUP BY z.zip, z.city, z.state) r
ON z.zip = r.zip
WHERE z.city = 'Astoria'
ORDER BY z.zip;


SELECT c.course_no, c.description, NVL(ENROLLMENTS, '0') AS ENROLLMENTS
FROM course c LEFT JOIN
    (SELECT s.course_no, COUNT(*) AS ENROLLMENTS
    FROM section s INNER JOIN enrollment e
    ON s.section_id = e.section_id
    GROUP BY s.course_no) t1
ON c.course_no = t1.course_no
WHERE c.description LIKE '%Programming%'
ORDER BY ENROLLMENTS DESC, c.course_no;


SELECT l.student_id, l.first_name, l.last_name, NVL(ENROLLMENTS, '0') AS ENROLLMENTS
FROM student l LEFT JOIN
    (SELECT student_id, COUNT(*) AS ENROLLMENTS
    FROM enrollment e
    GROUP BY student_id) t1
ON l.student_id = t1.student_id
WHERE phone LIKE '203%'
ORDER BY l.last_name, l.first_name;














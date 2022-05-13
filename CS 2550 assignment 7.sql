-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 3/17/2022

SELECT i.last_name, i.first_name
FROM instructor i
WHERE i.instructor_id NOT IN 
        (SELECT s.instructor_id
        FROM section s INNER JOIN grade_type_weight g
        ON s.section_id = g.section_id
        WHERE g.grade_type_code = 'PJ')
ORDER BY i.last_name, i.first_name;





SELECT s.student_id, s.first_name, s.last_name
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE e.section_id = '147'
AND g.grade_type_code = 'FI'
AND g.numeric_grade >
        (SELECT AVG(g.numeric_grade)
        FROM grade g
        WHERE g.section_id = '147'
        AND g.grade_type_code = 'FI')
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY s.last_name, s.first_name;





SELECT *
FROM 
        (SELECT z.city, z.state AS ST, COUNT(*) AS NUMSTUDENTS 
        FROM zipcode z INNER JOIN student s
        ON z.zip = s.zip
        GROUP BY z.city, z.state
        ORDER BY NUMSTUDENTS DESC)
WHERE ROWNUM <= 1;

-- I found 57 unique students from brooklyn NY, I don't know where the 32 came from on the HW
--SELECT s.last_name, s.first_name, z.city, z.state
--FROM student s INNER JOIN zipcode z
--ON s.zip = z.zip
--WHERE z.city = 'Brooklyn'
--ORDER BY s.last_name;




SELECT s.student_id, s.first_name, s.last_name, g.numeric_grade
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.section_id = '142'
AND g.grade_type_code = 'FI'
AND g.numeric_grade = 
        (SELECT MIN(g.numeric_grade)
        FROM grade g
        WHERE g.section_id = '142'
        AND g.grade_type_code = 'FI');  
        
        
        
        
        
SELECT s.first_name, s.last_name, c.course_no, c.description, COUNT(*) AS NUMSECTIONS
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
INNER JOIN course c
ON sec.course_no = c.course_no
GROUP BY s.first_name, s.last_name, c.course_no, c.description
HAVING COUNT(*) > 1
ORDER BY s.last_name, s.first_name;





SELECT s.first_name, s.last_name
FROM student s INNER JOIN 
        (SELECT count(*) AS NUM, e.student_id
        FROM section sec INNER JOIN enrollment e
        ON sec.section_id = e.section_id
        INNER JOIN student s
        ON e.student_id = s.student_id
        WHERE sec.course_no BETWEEN 200 AND 299
        GROUP BY s.first_name, s.last_name, e.student_id) t1
ON s.student_id = t1.student_id
WHERE t1.NUM = 
        (SELECT MIN(SUM)
        FROM 
                (SELECT COUNT(*) AS SUM
                FROM section sec INNER JOIN enrollment e
                ON sec.section_id = e.section_id
                INNER JOIN student s
                ON e.student_id = s.student_id
                WHERE sec.course_no BETWEEN 200 AND 299
                GROUP BY s.first_name, s.last_name, e.student_id))
ORDER BY s.last_name, s.first_name;





SELECT c.course_no, c.description
FROM course c INNER JOIN
        (SELECT s.course_no, COUNT(*) AS SUM
        FROM enrollment e INNER JOIN section s
        ON e.section_id = s.section_id
        GROUP BY s.course_no) t1
ON c.course_no = t1.course_no
WHERE t1.SUM =
        (SELECT MIN(SUM)
        FROM 
                (SELECT COUNT(*) AS SUM
                FROM enrollment e INNER JOIN section s
                ON e.section_id = s.section_id
                GROUP BY s.course_no))
ORDER BY c.description;




SELECT s.first_name, s.last_name, e.section_id, sec.course_no
FROM student s
INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
WHERE EXISTS
        (SELECT start_date_time
        FROM section
        WHERE TO_CHAR(start_date_time, 'HH:MM') = '10:30')
ORDER BY s.first_name, s.last_name, sec.course_no, sec.section_id;




SELECT s.first_name, s.last_name, g.numeric_grade AS GRADE_ON_FINALEXAM
FROM student s
INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.section_id = 147
AND g.grade_type_code = 'FI'
AND g.numeric_grade < 
        (SELECT AVG(g.numeric_grade)
        FROM grade g
        WHERE g.grade_type_code = 'FI'
        AND g.section_id = 147)
ORDER BY GRADE_ON_FINALEXAM DESC, s.last_name, s.first_name;





SELECT s.first_name, s.last_name, s.phone
FROM student s
INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
INNER JOIN course c
ON sec.course_no = c.course_no
WHERE c.description  IN 
        (SELECT c.description
        FROM course c
        WHERE c.description = 'Intro to SQL'
        OR c.description = 'Oracle Tools'
        OR c.description = 'PL/SQL Programming'
        OR c.description = 'Database Design'
        OR c.description = 'Database System Principles'
        OR c.description = 'DB Programming with Java')
ORDER BY s.last_name, s.first_name;

















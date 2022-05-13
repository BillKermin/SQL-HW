-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 4/14/2022

INSERT INTO instructor
(instructor_id, salutation, first_name, last_name, street_address, zip, phone,
created_by, created_date, modified_by, modified_date)
VALUES
(815, 'Dr', 'Waldo', 'Wildcat', '1234 Stewart Stadium Way', '07002', NULL,
'JACOBMANN', SYSDATE, 'JACOBMANN', SYSDATE);

INSERT INTO section
(section_id, course_no, section_no, start_date_time, location, instructor_id, capacity,
created_by, created_date, modified_by, modified_date)
VALUES
(48, 142, 4, TO_DATE('September 22, 2011, 08:15 A.M.', 'Month dd, YYYY, HH:MI A.M.'), 'L211', 815, 15,
'JACOBMANN', SYSDATE, 'JACOBMANN', SYSDATE);

INSERT INTO enrollment
    SELECT student_id, 48, SYSDATE, NULL, 'JACOBMANN', SYSDATE, 'JACOBMANN', SYSDATE
    FROM student
    WHERE student_id IN (162, 364, 366, 367);

DELETE FROM grade
WHERE student_id = 147
AND section_id = 120;

DELETE FROM enrollment
WHERE student_id = 147
AND section_id = 120;

DELETE FROM grade
WHERE student_id = 180
AND section_id = 119;

DELETE FROM enrollment
WHERE student_id = 180
AND section_id = 119;

UPDATE instructor
SET phone = '4815162342'
WHERE instructor_id = 815;

UPDATE grade
SET numeric_grade = 100
WHERE grade_type_code = 'HM'
AND grade_code_occurrence = 1
AND section_id = 119;

UPDATE grade 
SET numeric_grade = numeric_grade + 10
WHERE grade_type_code = 'FI'
AND section_id = 119;

SELECT s.section_id, s.location, NVL(ENROLLED, '0') AS ENROLLED
FROM section s LEFT JOIN 
    (SELECT s.section_id, COUNT(*) AS ENROLLED
    FROM section s INNER JOIN enrollment e
    ON s.section_id = e.section_id
    WHERE course_no = 142
    GROUP BY s.section_id) t1
ON s.section_id = t1.section_id
WHERE s.course_no = 142
ORDER BY s.section_id;

SELECT i.first_name, i.last_name, i.phone
FROM instructor i INNER JOIN section s
ON i.instructor_id = s.instructor_id
WHERE s.course_no = 142
ORDER BY i.first_name, i.last_name;

SELECT s.student_id, s.first_name, s.last_name, AVERAGE
FROM student s INNER JOIN 
    (SELECT student_id, CAST(AVG(numeric_grade) AS DECIMAL(5,2)) AS AVERAGE
    FROM grade
    WHERE section_id = 119
    GROUP BY student_id) t1
ON s.student_id = t1.student_id
ORDER BY s.student_id;

SELECT s.instructor_id, COUNT(*) AS NUMSTUDENTS
FROM enrollment e INNER JOIN section s
ON e.section_id = s.section_id
WHERE s.location = 'L211'
GROUP BY s.instructor_id
HAVING COUNT(*) > 3;

SELECT i.instructor_id, first_name, last_name, NUMSTUDENTS
FROM instructor i INNER JOIN
    (SELECT s.instructor_id, COUNT(*) AS NUMSTUDENTS
    FROM enrollment e INNER JOIN section s
    ON e.section_id = s.section_id
    WHERE s.location = 'L211'
    GROUP BY s.instructor_id
    HAVING COUNT(*) > 3) t1
ON i.instructor_id = t1.instructor_id;

SELECT i.salutation || ' ' || i.first_name || ' ' || i.last_name AS INSTRUCTOR, i.phone
FROM instructor i INNER JOIN section s
ON i.instructor_id = s.instructor_id
WHERE (i.instructor_id, 1) IN 
    (SELECT instructor_id, COUNT(*)
    FROM section
    GROUP BY instructor_id
    HAVING COUNT(*) = 1)
AND s.course_no = 142;

SELECT DISTINCT s.first_name, s.last_name, t1.section_id, sec.course_no, NUMGRADES
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
LEFT JOIN
    (SELECT e.section_id, NVL(NUMGRADES, '0') AS NUMGRADES
    FROM enrollment e LEFT JOIN 
        (SELECT section_id, COUNT(*) AS NUMGRADES
        FROM grade
        GROUP BY section_id) t1
    ON e.section_id = t1.section_id) t1
ON sec.section_id = t1.section_id
WHERE NUMGRADES = 0
ORDER BY s.last_name, s.first_name;

SELECT TO_CHAR(start_date_time, 'HH:MMPM') AS SECTIME, COUNT(*)
FROM section
GROUP BY TO_CHAR(start_date_time, 'HH:MMPM');





























-- Author: Jacob Mann
-- Class: CS 2550
-- Instructor: Weidman
-- Date: 3/24/2022

--1.  Write a statement that displays student ID, the first and last name and 
--enrollment date and time of enrollment of the students that was the first to 
--enroll. List each student only once. Sort the list by student ID
SELECT DISTINCT s.student_id, s.first_name, s.last_name, TO_CHAR(e.enroll_date,
'Mon DD YYYY HH:MM AM') AS DATEENROLLED
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
WHERE TO_CHAR(e.enroll_date, 'Mon DD YYYY HH:MM AM') = 
        (SELECT TO_CHAR(MIN(enroll_date), 'Mon DD YYYY HH:MM AM')
        FROM enrollment)
ORDER BY s.student_id;

--2.  Show the course description, section number, section ID, section capacity
--and course cost of the sections with the lowest course cost and section
--capacity equal to or lower than the average section capacity. Arrange
--the list by capacity then section ID
SELECT c.description, c.cost, s.capacity, s.section_id
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
WHERE c.cost = (SELECT MIN(cost) FROM course)
AND s.capacity <= (SELECT AVG(capacity) FROM section)
ORDER BY s.capacity, s.section_id;

--3.  Select the course number, course description and total course capacity for
--each course. Show only those courses with a total course capacity less than
--the average capacity of all sections. Arrange the list by course description
--and then total course capacity
SELECT c.course_no, c.description, SUM(s.capacity) AS TOTAL_CAPACITY
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
GROUP BY c.course_no, c.description
HAVING SUM(s.capacity) < (SELECT AVG(capacity) FROM section)
ORDER BY c.description, TOTAL_CAPACITY;

--4.  Choose the most ambitious students by showing the student ID, first name
--and last name and the number of sections taken for those students enrolled
--in the most sections. Arrange the list by student last name then first name
SELECT s.student_id, s.first_name, s.last_name, COUNT(*) AS MOST_SECTIONS
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(*) = 
        (SELECT MAX(MOST_SECTIONS) 
        FROM    (SELECT s.student_id, s.first_name, s.last_name, 
                COUNT(*) AS MOST_SECTIONS
                FROM student s INNER JOIN enrollment e
                ON s.student_id = e.student_id
                GROUP BY s.student_id, s.first_name, s.last_name))
ORDER BY s.last_name, s.first_name;

--5.  Show the names of the students who live in the zip code which has the
--most students enrolled. Arrange the list alphabetically by last name then
--first name
SELECT s.student_id, s.first_name, s.last_name, s.zip
FROM student s INNER JOIN 
        (SELECT zip, COUNT(*) AS NUM
        FROM student
        GROUP BY zip) z
ON s.zip = z.zip 
WHERE z.NUM =
        (SELECT MAX(NUM) FROM 
                (SELECT zip, COUNT(*) AS NUM
                FROM student
                GROUP BY zip))
ORDER BY s.last_name, s.first_name;

--I didnt' do number 5 correctly, i realize now that not all the students 
--are enrolled, but when I connect the enrollment table, which I think filters
--out all the student that aren't enrolled, I end up with an output of 15,
--because two zip codes both have 8 enrolled students, im not sure what to do
--SELECT s.student_id, s.first_name, s.last_name, s.zip
--FROM student s INNER JOIN 
--        (SELECT zip, COUNT(*) AS NUM
--        FROM student s INNER JOIN enrollment e
--        ON s.student_id = e.student_id
--        GROUP BY zip
--        ORDER BY NUM) z
--ON s.zip = z.zip 
--INNER JOIN enrollment e
--ON s.student_id = e.student_id
--WHERE z.NUM =
--        (SELECT MAX(NUM) FROM 
--            (SELECT zip, COUNT(*) AS NUM
--            FROM student s INNER JOIN enrollment e
--            ON s.student_id = e.student_id
--            GROUP BY zip))
--ORDER BY s.zip;

--6.  Display  the course description,  the course number and grade type
--description of courses that use a Midterm.  Order by course description.
--List each course only once
SELECT DISTINCT c.description, c.course_no, g.grade_type_code
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
INNER JOIN grade_type_weight g
ON s.section_id = g.section_id
WHERE g.grade_type_code = 'MT'
ORDER BY c.description;

--7.  Show the first and last names of students who are not enrolled in any
--class. Arrange the list by last name then first name
SELECT s.first_name, s.last_name
FROM student s
WHERE s.student_id NOT IN (SELECT student_id FROM enrollment)
ORDER BY s.last_name, s.first_name;

--8.  Determine the first and last name, course description, section ID and
--numeric grade of the students who had the lowest Quiz (QZ) grade from all
--courses. Arrange the list by last name, first name and then course description
SELECT s.first_name, s.last_name, c.description AS COURSE_DESCRIPTION,
g.section_id, g.numeric_grade
FROM student s INNER JOIN enrollment e
ON s.student_id = e.student_id
INNER JOIN section sec
ON e.section_id = sec.section_id
INNER JOIN course c
ON sec.course_no = c.course_no
INNER JOIN grade g
ON e.student_id = g.student_id
AND e.section_id = g.section_id
WHERE g.grade_type_code = 'QZ'
AND g.numeric_grade = 
        (SELECT MIN(numeric_grade) 
        FROM grade 
        WHERE grade_type_code = 'QZ')
ORDER BY s.last_name, s.first_name, COURSE_DESCRIPTION;

--9.  Select the sections that are full by comparing section capacity to the
--number of students enrolled in the section. A section is full it the number
--of students enrolled meets or exceeds the capacity. Show the number of
--students enrolled, the capacity of the section and the section ID. Order by
--capacity in descending order then section ID
SELECT COUNT(*) AS ENROLLED, s.capacity, s.section_id
FROM section s INNER JOIN enrollment e
ON s.section_id = e.section_id
GROUP BY s.capacity, s.section_id
HAVING COUNT(*) >= s.capacity
ORDER BY s.capacity DESC, s.section_id;

--10.  Show the description, course number,  location and capacity of the
--cheapest courses. Arrange the list by location, description then capacity
SELECT c.description, c.course_no, s.location, s.capacity
FROM course c INNER JOIN section s
ON c.course_no = s.course_no
WHERE c.cost = (SELECT MIN(cost) FROM course)
ORDER BY s.location, s.capacity;









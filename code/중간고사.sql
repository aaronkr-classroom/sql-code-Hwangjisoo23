--1.테이블 생성
--2.조인문 사용하기
--3.SELECT문 사용하여 데이터 탐색하기

CREATE TABLE course
	(id INT NOT NULL,
	name VARCHAR (20) NOT NULL,
	teacher_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (teacher_id) REFERENCES teacher(id)
	);

INSERT INTO course
VALUES
	(1,'Datebase design', 1),
	(2,'Engilsh literature',2),
	(3,'Python programming',1);

INSERT INTO course VALUES(1,'Datebase design',1);
INSERT INTO course VALUES(2,'Engilsh literature',2);
INSERT INTO course VALUES(3,'Python programming',1);

CREATE TABLE student
	(id INT NOT NULL,
	 first_name VARCHAR(20) NOT NULL, 
     last_name VARCHAR(20) NOT NULL, 
     PRIMARY KEY (id)
	 );  

INSERT INTO student
VALUES
	(1,'Shreya','Bain'),
	(2,'Rianna','Foset'),
	(3,'Yosef','Naylor');
	
INSERT INTO student VALUES(1,'Shreya','Bain');
INSERT INTO student VALUES(2,'Rianna','Foset');
INSERT INTO student VALUES(3,'Yosef','Naylor');


CREATE TABLE teacher
(
    id INT NOT NULL,                 
    first_name VARCHAR(20) NOT NULL,  
    last_name VARCHAR(20) NOT NULL,   
    PRIMARY KEY (id)                  
	);

INSERT INTO teacher
VALUES
	(1,'Taylah','Booker'),
	(2,'Sarah-Louise','Blake');
	
INSERT INTO teacher VALUES(1,'Taylah','Booker'),
INSERT INTO teacher VALUES(2,'Sarah-Louise','Blake');


CREATE TABLE student_course
(
    student_id INT NOT NULL,         
    course_id INT NOT NULL,           
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id), 
    FOREIGN KEY (course_id) REFERENCES course(id)    
);

INSERT INTO student_course
VALUES
	(1,2),
	(1,3),
	(2,1),
	(2,2),
	(2,3),
	(3,1);

INSERT INTO student_course VALUES(1,2);
INSERT INTO student_course VALUES(1,3);
INSERT INTO student_course VALUES(2,1);
INSERT INTO student_course VALUES(2,2);
INSERT INTO student_course VALUES(2,3);
INSERT INTO student_course VALUES(3,1);

SELECT student.id, student.first_name, student.last_name, student_course.course_id
FROM student
JOIN student_course ON student.id = student_course.student_id;

SELECT course.id, course.name, teacher.first_name, teacher.last_name
FROM course
JOIN teacher ON course.teacher_id = teacher.id;

SELECT course.id, course.name, student_course.student_id
FROM course
JOIN student_course ON course.id = student_course.course_id;

SELECT student.first_name, student.last_name
FROM student
JOIN student_course ON student.id = student_course.student_id
JOIN course ON student_course.course_id = course.id
WHERE course.name = 'Database design';

SELECT course.name
FROM course
JOIN teacher ON course.teacher_id = teacher.id
WHERE teacher.first_name = 'Taylah' AND teacher.last_name = 'Booker';

SELECT first_name, last_name 
FROM student
WHERE last_name LIKE 'B%'
UNION
SELECT first_name, last_name 
FROM teacher
WHERE last_name LIKE 'B%';


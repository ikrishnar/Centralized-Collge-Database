create database CollegeDataBase ;

CREATE TABLE `departments` (
  `id` int(11)UNIQUE NOT NULL PRIMARY KEY,
  `name` varchar(30) NOT NULL,
  `hod_id` int(11) DEFAULT NULL
) ;



--
-- INSERING data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `hod_id`) VALUES
(1, 'Arts', 1),
(2, 'Commerce', 2),
(3, 'Science', 3);

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL PRIMARY KEY UNIQUE,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `department_id` int(11) NOT NULL,
  `phone` varchar(10) DEFAULT NULL
);

ALTER TABLE faculty
add column middle_name varchar(25) ;


ALTER TABLE faculty
add column full_name varchar(255) ;


-- #1 CASE no.1

UPDATE `faculty` set full_name=  Case

    When  middle_name is NULL 
    Then  concat(first_name ,' ',last_name) 
    Else  concat(first_name ,' ', middle_name ,' ', last_name)
  End  ;


select * from faculty;


 


INSERT INTO `faculty` (`id`, `first_name`, `last_name`, `department_id`, `phone`) VALUES
(1, 'Manisha', 'Marathe', 1, '9845167849'),
(2, 'Anil', 'Bhadgale', 1, '7785461895'),
(3, 'Vijayalakshmi', 'Kanade', 1, '8983547891'),
(4, 'Adityakumar', 'Dongare', 1, '9890451786'),
(5, 'Shubhangi', 'Dixit', 3, '9422185769'),
(6, 'Minal', 'Apsangi', 3, '7704159854'),
(7,'Smithesh', 'Kathwate', 2, '6309998881'),
(8, 'Shubham', 'Dange', 2, '9426789769'),
(9, 'Mayank', 'Agarwal', 2, '7704154567');


DROP Table students;
CREATE TABLE `students` (
  `roll_num` int(11) NOT NULL PRIMARY KEY UNIQUE,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `admission_date` date NOT NULL,
  `cgpa` decimal(3,1) NOT NULL
);


CREATE TABLE `electives`(
	`id` integer NOT NULL UNIQUE PRIMARY KEY,
    `department_id` integer ,
    `name` text,
    CONSTRAINT fk_electDp FOREIGN KEY (department_id)  
  REFERENCES departments(id)
    );
    	    

INSERT INTO `electives` (`id`,`department_id`,`name`) 
values (55,1,'Psychology'),
	   (56,1,'Archaeology'),
       (66,2,'Economics'),
       (67,2,'Accounts'),        
       (77,3,'Electronics'),
       (78,3,'Computer Science');

Alter table students add column elective_id integer;



INSERT INTO `students` (`roll_num`, `first_name`, `last_name`, `department_id`, `phone`, `admission_date`, `cgpa`,`elective_id`) VALUES
(170101, 'Vinod', 'Kamat', 1, '7474986413', '2017-08-01', 9.0,55),
(170102, 'Adwait', 'Bhope', 3, '8862451783', '2017-08-01', 8.3,77),
(170103, 'Aashay', 'Zanpure', 1, '9029742685', '2017-08-21', 9.8,56),
(170104, 'Atharva', 'Dhekne', 2, '7093458923', '2017-08-21', 9.5,66),
(170301, 'Rashmi', 'Mokashi', 3, '9552514865', '2017-08-01', 8.9,77),
(180101, 'Shivam', 'Rajput', 2, '7454875293', '2017-08-21', 8.8,66),
(180102, 'Sunanda', 'Somwase', 2, '9423165742', '2017-08-21', 9.2,67),
(180103, 'Sagar', 'Patil', 1, '9545791532', '2017-08-21', 9.5,55),
(180104, 'Shreya', 'Gore', 3, '7093458923', '2017-08-21', 9.7,78),
(190101, 'vikram', 'Kamat', 1, '7474566413', '2017-08-01', 9.0,55),
(190102, 'Aditya', 'Bhope', 3, '8862467883', '2017-08-01', 7.3,77),
(190103, 'Aasmay', 'Zanpure', 1, '9456742685', '2017-08-21', 9.8,55),
(190104, 'kritrva', 'Dhekne', 2, '7093458456', '2017-08-21', 9.5,66),
(190301, 'Raskoi', 'Mokashi', 3, '9552514965', '2017-08-01', 8.9,78),
(180105, 'Shikha', 'Rajput', 2, '7415486295', '2017-08-21', 7.8,67),
(180106, 'Sunita', 'Somwase', 2, '9424457424', '2017-08-21', 9.2,67),
(180107, 'Sakshit', 'Patil', 1, '9545789532', '2017-08-21', 6.5,55),
(180108, 'Shrivalli', 'Gore', 3, '7093459823', '2017-08-21', 9.7,78);




CREATE TABLE `subjects` (
  `id` int(11) NOT NULL PRIMARY KEY UNIQUE,
  `department_id` int(11) NOT NULL  ,
  `name` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL DEFAULT 1
);




INSERT INTO `subjects` (`id`, `department_id`,`name`, `faculty_id`) VALUES
(1, 3, 'English', 1),
(2, 3,'IT', 2),
(3, 3,'Maths', 2),
(4, 3,'Physics', 3),
(5, 3,'Chemistry', 4),
(6, 3,'Biology', 5),
(7, 2, 'Accounting', 1),
(8, 2,'Tax', 5),
(9, 2,'Law', 6),
(10, 1, 'History', 1),
(11, 1,'Politics', 5),
(12, 1,'Literature', 6);

CREATE TABLE `marks` (
  `id` int(11) NOT NULL UNIQUE PRIMARY KEY,
  `student_roll_num` int(11) NOT NULL DEFAULT 1,
  `subject_id` int(11) NOT NULL DEFAULT 1,
  `marks` int(11) NOT NULL
);



INSERT INTO `marks` (`id`, `student_roll_num`, `subject_id`, `marks`) VALUES
(1, 170101, 1, 80),
(2, 170101, 6, 70),
(3, 170101, 4, 90),
(4, 170101, 2, 80),
(5, 170102, 1, 80),
(6, 170102, 6, 80),
(7, 170102, 5, 90),
(8, 170102, 2, 80),
(9, 180101, 3, 70),
(10, 180102, 3, 73);


CREATE TABLE `coursefees`(
	`id` integer NOT NULL UNIQUE PRIMARY KEY,
    `department_id` integer ,
    	`fees` DOUBLE,

CONSTRAINT fk_department FOREIGN KEY (department_id)  
  REFERENCES departments(id)
);

INSERT INTO `coursefees` (`id`,`department_id`,`fees`) 
values (555,1,10000),
       (666,2,20000),
       (777,3,10000);





-- #2 STORED  PRocedure and Error handling

DELIMITER $$
Drop procedure if exists insert_faculty_tags ;
CREATE PROCEDURE insert_faculty_tags(IN id INT, IN first_name varchar(25),
IN last_name varchar(25),IN department_id INT,IN phone varchar(10))
BEGIN
-- ERROR CODE for handling duplicates
 DECLARE EXIT HANDLER FOR 1062 
 SELECT CONCAT('Data DUPLICATION  (',id,',',first_name,') FAculty information already exists') AS msg;
 -- insert a new record into insert_faculty_tags
 INSERT INTO `faculty` (`id`, `first_name`, `last_name`, `department_id`, `phone`) VALUES
(1, 'Manisha', 'Marathe', 1, '9845167849');
 -- return tag count for the id (faculty)
 SELECT COUNT(*) FROM faculty;
END$$
DELIMITER ;



CALL insert_faculty_tags(1, 'Manisha', 'Marathe', 1, '9845167849');







-- #3 CURSOR
DELIMITER $$
DROP PROCEDURE if exists createPhoneList;
CREATE PROCEDURE createPhoneList (
   INOUT phoneList varchar(4000)
)
BEGIN
   DECLARE finished INTEGER DEFAULT 0;
   DECLARE contact_no varchar(100) DEFAULT "";
   DECLARE f_name varchar(100) DEFAULT "";
   -- DECLARING cursor FOR FIRSTNAME & CONTACT NO
   DECLARE curPhone
       CURSOR FOR
           SELECT phone,first_name FROM students;
 
   -- DECLARING not found HANDLER
   DECLARE CONTINUE HANDLER
       FOR NOT FOUND SET finished = 1;
 
   OPEN curPhone;
 
   getPhone: LOOP
       FETCH curPhone INTO contact_no,f_name ;
       IF finished = 1 THEN
           LEAVE getPhone;
       END IF;
       -- CREATING CONTACT LIST OF STUDENTS
       SET phoneList = CONCAT(contact_no,"-",f_name,";",phoneList);
   END LOOP getPhone;
   CLOSE curPhone;
 
END$$
DELIMITER ;


 
SET @phoneList = "";
CALL createPhoneList(@phoneList);
SELECT @phoneList;



 
-- #4 TRIGGERS
CREATE TABLE students_old (
SerialNumber INT UNIQUE AUTO_INCREMENT,
roll_num INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department_id INT,
phone VARCHAR(10),
admission_date DATE,
cgpa DOUBLE,
deletedAt TIMESTAMP DEFAULT NOW()-- using time function 
);
 
 -- TRigger before Delete (with each row evaluation)
DELIMITER $$
CREATE TRIGGER before_student_delete
BEFORE DELETE ON students FOR EACH ROW
BEGIN
INSERT INTO students_old(roll_num,first_name,last_name,department_id,phone,cgpa)
VALUES(OLD.roll_num,OLD.first_name,OLD.last_name,OLD.department_id,OLD.phone,OLD.cgpa);
END$$
 
DELIMITER ;
 
 DELETE from students where  roll_num=170102;
 Select * from students_old;

 
 
/* #1 CASE no.2
DELIMITER //
DROP PROCEDURE IF EXISTS DisplayCGPA;
CREATE PROCEDURE DisplayCGPA(
IN rollNum INT(11) , OUT Total_marks VARCHAR(10), OUT Category VARCHAR(20)
)
BEGIN
SELECT SUM(m.marks)  INTO Total_marks
FROM marks m  WHERE m.student_roll_num=rollNum group by m.student_roll_num;
 
CASE Total_marks
	WHEN Total_marks > 360 THEN SELECT "ELITE" INTO Category;
	WHEN Total_marks <= 360 and Total_marks > 320  THEN SELECT "Distinction" INTO Category;
	WHEN Total_marks <= 320 and Total_marks > 280  THEN SELECT "First Class" INTO Category;
	WHEN Total_marks <= 280 and Total_marks > 240  THEN SELECT "Second Class" INTO Category;
	ELSE SELECT "elite" INTO Category;
END CASE;
END //
DELIMITER ;*/






-- #5 WHILE LOOP 
DELIMITER //
CREATE PROCEDURE faculty_info()
BEGIN
DECLARE inc INT;
	SET inc=1000;
WHILE inc<=1020 DO
	SELECT CONCAT(first_name, " ", last_name) AS Full_Name FROM faculty;
    SET inc=inc+1;
END WHILE;
END //
DELIMITER ;



 call faculty_info;

-- #6: If Else COnditon 
 

DELIMITER //
CREATE PROCEDURE GradeList(
IN rollNum INT(10), OUT TOTAL_MARKS INT(10), OUT Category VARCHAR(20)
)
BEGIN
SELECT sum(m.marks) as Total INTO TOTAL_MARKS
FROM marks m WHERE m.student_roll_num=rollNum group by m.student_roll_num;
 
IF TOTAL_MARKS >= 200 THEN
   SELECT "Pass" INTO Category;
ELSE
   SELECT "Fail" INTO Category;
END IF;
END //
DELIMITER ;
 
CALL GradeList(180101, @Total, @Category);
SELECT @Total AS TOTAL_MARKS, @Category AS Category;
 






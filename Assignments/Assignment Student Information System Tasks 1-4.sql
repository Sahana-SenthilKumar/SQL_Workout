show databases;
-- drop database SISDB;


-- TASK 1 

create database SISDB;

use SISDB;

create table Students(
	student_id char(4) primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    date_of_birth date not null,
    email varchar(255) not null,
    phone_number bigint not null
);

desc Students;

select * from Students;

create table Teacher(
	teacher_id char(4) primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
	email varchar(255) not null
);

desc Teacher;

select * from Teacher;

create table Courses(
	course_id  int not null primary key auto_increment,
    course_name varchar(255) not null,
    credits int not null,
    teacher_id char(4),
    constraint tid_fk foreign key(teacher_id) 
    references Teacher(teacher_id) 
    on delete set null on update cascade
) auto_increment = 101;

desc Courses;

select * from Courses;

create table Enrollments(
	enrollment_id  int not null primary key auto_increment,
    student_id char(4) not null,
    course_id int not null,
    enrollment_date date not null,
	constraint sid_fk foreign key(student_id) 
    references  Students(student_id) on delete cascade on update cascade,
    constraint cid_fk foreign key(course_id) 
    references Courses(course_id) on delete cascade on update cascade
);

desc Enrollments;

select * from Enrollments;

create table Payments(
	payment_id  int not null primary key auto_increment,
    student_id char(4) not null,
    amount decimal(10, 2) not null,
    payment_date date not null,
	constraint studentid_fk foreign key(student_id) 
    references  Students(student_id) on delete cascade on update cascade
) auto_increment = 1001;

desc Payments;

select * from Payments;

insert into Students 
values('S001', 'Joe', 'Dane', '2001-05-10', 'joe.dane@gmail.com', 7876543210),
('S002', 'Poppy', 'Loe', '2000-08-22', 'poppy.loe@gmail.com', 6123456780),
('S003', 'Red', 'Rue', '2002-01-15', 'red.rue@gmail.com', 8345612780),
('S004', 'Rumble', 'Honey', '1999-12-05', 'rumble.honey@gmail.com', 9988776655),
('S005', 'Luna', 'Belle', '2001-03-25', 'luna.belle@gmail.com', 4765432109),
('S006', 'Nova', 'Rae', '2000-09-17', 'nova.rae@gmail.com', 6887766554),
('S007', 'Wolf', 'Knox', '2001-11-30', 'wolf.knox@gmail.com', 1876512345),
('S008', 'Eira', 'Ash', '2002-02-10', 'eira.ash@gmail.com', 7212345678),
('S009', 'Liora', 'Vex', '2000-07-20', 'liora.vex@gmail.com', 8676678901),
('S010', 'Aziel', 'Noa', '1999-04-12', 'aziel.noa@gmail.com', 0124567890);

select * from Students;

insert into Teacher values
('T001', 'Sirris', 'Black', 'sirris.black@gmailmail.com'),
('T002', 'River', 'Alaric', 'river.alaric@gmailmail.com'),
('T003', 'Doren', 'Lore', 'doren.lore@gmailmail.com'),
('T004', 'Winter', 'Cairne', 'winter.cairne@gmailmail.com'),
('T005', 'Nyra', 'Skye', 'nyra.skye@gmailmail.com'),
('T006', 'Sylas', 'Wren', 'sylas.wren@gmailmail.com'),
('T007', 'Quinn', 'Fen', 'quinn.fen@gmailmail.com'),
('T008', 'Remy', 'Kade', 'remy.kade@gmailmail.com'),
('T009', 'Whitney', 'Serin', 'whitney.serin@gmailmail.com'),
('T010', 'Eden', 'Vyre', 'eden.vyre@gmailmail.com'),
('T011', 'Kylar', 'Ashen', 'kylar.ashen@gmailmail.com'),
('T012', 'Avery', 'Dren', 'avery.dren@gmailmail.com');

select * from Teacher;

insert into Courses(course_name, credits, teacher_id) 
values ('Introduction to Computer Science', 4, 'T001'),
('Modern English Literature', 3, 'T002'),
('Data Structures and Algorithms', 5, 'T001'),
('World History', 3, 'T003'),
('Fundamentals of Physics', 5, 'T004'),
('Creative Writing', 2, 'T002'),
('Calculus', 4, 'T005'),
('Principles of Economics', 3, 'T006'),
('Introduction to Psychology', 3, 'T007'),
('Environmental Science', 4, 'T008'),
('Art and Design Basics', 2, 'T009'),
('Sociology and Culture', 3, 'T010'),
('Linear Algebra', 5, 'T005'),
('Philosophy of Mind', 2, 'T011'),
('Web Development', 4, 'T012'),
('Film Studies and Analysis', 3, 'T003'),
('Music Theory', 2, 'T004'),
('Theatre and Performance', 3, 'T006'),
('Modern Political Thought', 3, 'T010'),
('Cultural Anthropology', 4, 'T011'),
('Ethics and Society', 1, 'T012');

select * from Courses;

insert into Enrollments(student_id, course_id, enrollment_date)
values('S004', 116, '2022-08-01'),
('S010', 121, '2022-08-01'),
('S001', 101, '2023-01-15'),
('S007', 120, '2023-08-01'),
('S002', 102, '2023-08-02'),
('S009', 118, '2023-08-02'),
('S006', 113, '2024-02-03'),
('S003', 105, '2024-08-01'),
('S008', 115, '2024-08-01'),
('S005', 112, '2024-08-03'),
('S004', 104, '2025-01-12'),
('S010', 114, '2025-01-12'),
('S001', 103, '2025-08-01'),
('S007', 110, '2025-08-02'),
('S002', 106, '2025-08-02'),
('S009', 102, '2025-08-04'),
('S006', 107, '2025-08-05'),
('S003', 113, '2025-08-05'),
('S008', 108, '2025-08-05'),
('S005', 109, '2025-08-06');

select * from Enrollments;

insert into Payments (student_id, amount, payment_date)
values('S004', 11000.00, '2022-08-05'),  
('S010', 9500.00, '2022-08-10'),  
('S001', 12000.00, '2023-01-20'),  
('S007', 11500.00, '2023-08-05'),  
('S002', 9800.00, '2023-08-08'),  
('S009', 10200.00, '2023-08-12'),  
('S006', 11800.00, '2024-02-05'),  
('S003', 9900.00, '2024-08-10'),  
('S008', 10150.00, '2024-08-12'),  
('S005', 9700.00, '2024-08-15'),  
('S004', 11300.00, '2025-01-20'),  
('S010', 9800.00, '2025-01-25'),  
('S001', 12200.00, '2025-08-01'),  
('S007', 11450.00, '2025-08-02'),  
('S002', 9850.00, '2025-08-04'),  
('S009', 10000.00, '2025-08-05'),  
('S006', 11900.00, '2025-08-07'),  
('S003', 9950.00, '2025-08-08'),  
('S008', 10300.00, '2025-08-09'),  
('S005', 9650.00, '2025-08-10');

select * from Payments;

-- TASK 2

insert into Students 
values('S011', 'John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890);

select * from Students;

set autocommit =off;

commit;

insert into Enrollments values( null ,'S011', 112, '2025-08-07');

select * from Enrollments;

commit;

update Teacher
set email = 'dr.wintercairne'
where teacher_id = 'T004';

select * from Teacher where teacher_id = 'T004';

-- rollback;

commit;

delete from Enrollments where student_id = 'S008' and course_id = 108;

select * from Enrollments;

commit;

update Courses
set teacher_id = 'T001'
where course_id = 115;  

select * from Courses;

commit;

delete from Students where student_id = 'S009';

select * from Students;

select * from Enrollments where student_id ='S009';

select * from Payments where payment_id =8;

update Payments 
set amount = 11275 where payment_id = 8;

select * from Payments where payment_id =8;

commit;


-- TASK 3

/*select * from Students 
join Payments
on Students.student_id = Payments.student_id;

select student_id, sum(amount) from Payments group by student_id;*/

-- Question 1

select Students.student_id, concat (Students.first_name," ",Students.last_name) as 'Student Name', sum(Payments.amount) 'Total Payment' from Students
join Payments
on Students.student_id = Payments.student_id 
group by Students.student_id;

select Students.student_id, concat (Students.first_name," ",Students.last_name) as 'Student Name', sum(Payments.amount) 'Total Payment' from Students
join Payments
on Students.student_id = Payments.student_id 
where Students.student_id = 'S004'
group by Students.student_id;

-- Question 2

Select Courses.course_id, Courses.course_name, count(Enrollments.student_id) 'Student Count' from Courses
join Enrollments
on Courses.course_id = Enrollments.course_id
group by Courses.course_id, Courses.course_name
order by Courses.course_id;

Select Courses.course_id, Courses.course_name, count(Enrollments.student_id) 'Student Count' from Courses
left join Enrollments
on Courses.course_id = Enrollments.course_id
group by Courses.course_id, Courses.course_name
order by Courses.course_id;

select * from Enrollments where course_id in(108, 111,117, 118, 119);

commit;

-- Question 3

insert into Students values 
('S012', "Camy", "Dove", "1999-07-15","camy.dove@gmail.com", 1524386790), 
('S013', "Lara", "Lin", "2003-08-25","lara.lin@gmail.com", 3774385770), 
('S014', "Daisy", "May", "2004-02-11","daisy.may@gmail.com", 5678382183);

select * from Students;

select * from Enrollments;

Select Students.student_id, concat (Students.first_name," ",Students.last_name) as 'Students Name', Enrollments.course_id 'Enrolled Courses'  from Students
left join Enrollments
on Students.student_id = Enrollments.student_id
where Enrollments.course_id is null;

Select concat (Students.first_name," ",Students.last_name) as 'Not Enrolled Students List' from Students
left join Enrollments
on Students.student_id = Enrollments.student_id
where Enrollments.student_id is null;

commit;

-- Question 4


Select s.first_name 'First Name', s.last_name 'Last Name', c.course_name 'Course Name' 
from Students as s
join Enrollments as e
on s.student_id = e.student_id
join Courses as c
on e.course_id = c.course_id
order by e.student_id;

Select s.first_name 'First Name', s.last_name 'Last Name', c.course_name 'Course Name' 
from Students as s
join Enrollments as e
on s.student_id = e.student_id
join Courses as c
on e.course_id = c.course_id;

-- Question 5

Select concat(t.first_name," ",t.last_name) 'Teacher Name', c.course_name 'Course Assigned'
from Teacher as t
join Courses as c
on t.teacher_id = c.teacher_id;

commit;

insert into Teacher 
values
('T013', 'Gwen', 'Skye', 'gwen.skye@gmail.com'),
('T014', 'Chrollo', 'Lucilfer', 'chrollo.lucilfer@gmail.com'),
('T015', 'Killua', 'Zoldyck', 'killua.zoldyck@gmail.com');

Select * from Teacher;

Select concat(t.first_name," ",t.last_name) 'Teacher Name', c.course_name 'Course Assigned'
from Teacher as t
left join Courses as c
on t.teacher_id = c.teacher_id
order by t.teacher.id;

-- Question 6



insert into Enrollments 
values ( null,'S005', 115, '2025-08-15'),
( null,'S002', 115, '2025-08-15'),
( null,'S010', 115, '2025-08-16'),
( null,'S007', 115, '2025-08-17');

select * from Enrollments;

Select c.course_name 'Course', concat(s.first_name, " ", s.last_name) 'Student List' , e.enrollment_date  'Enrollment Date'
from Students as s
join Enrollments as e
on s.student_id = e.student_id
join Courses as c
on e.course_id = c.course_id
where c.course_name = "Web Development";

commit;

-- Question 7

select * from payments order by student_id;

commit;

delete from Payments 
where student_id='S007';

select * from payments order by student_id;

select concat (Students.first_name," ",Students.last_name) as 'Payment Pending Students List'
from Students
left join Payments
on Students.student_id = Payments.student_id
where Payments.student_id is null;

select concat (Students.first_name," ",Students.last_name) as 'Payment Pending Students List', Payments.amount 'Amount Paid'
from Students
left join Payments
on Students.student_id = Payments.student_id
where Payments.student_id is null;

-- Question 8

Select concat(c.course_id," - ",c.course_name) 'Non Enrolled Courses'
from Courses c
left join Enrollments e
on c.course_id = e.course_id
where e.course_id is null;

-- Question 9

select distinct e1.student_id 'Student ID', concat (s.first_name," ",s.last_name)  'Students Enrolled in Multiple Course' from Enrollments e1
join  Enrollments e2
on e1.student_id = e2.student_id and e1.course_id != e2.course_id
join Students s
on e2.student_id = s.student_id
order by e1.student_id; 

-- Question 10

Select concat(t.first_name," ",t.last_name) 'Non Assigned Teacher'
from Teacher as t
left join Courses as c
on t.teacher_id = c.teacher_id
where c.teacher_id is null;

commit;

-- TASK 4

-- Question 1

select avg(Student_Count_per_Course) 'Average number of Students Enrolled'
from (select course_id, count(student_id) Student_Count_per_Course
from Enrollments
group by course_id) Enrollments_per_Course;
/*
What it calculates:
Average number of students only across courses that have at least one enrollment.

Using the same example:
Course A: 3 students

Course B: 2 students

Course C: 0 students → this course is excluded

AVG = (3 + 2) / 2 = 2.5
*/

select 
(Enrolled/Course) 'Average number of Students Enrolled'
from
(select 
(select count(*) from Enrollments) as Enrolled,
(select count(distinct course_id) from Courses) as Course
) Course_Enrollment;

select 
avg(Enrolled/Course) 'Average number of Students Enrolled'
from
(select 
(select count(*) from Enrollments) as Enrolled,
(select count(distinct course_id) from Courses) as Course
) Course_Enrollment;

-- above avg(Enrolled/Course)  and (Enrolled/Course) Both are same, give same result
/*
What it calculates:
Total number of enrollment records ÷ Total number of courses (regardless of whether those courses have enrollments or not).

Example:
If 3 courses exist and students enrolled like this:

Course A: 3 students

Course B: 2 students

Course C: 0 students

Then:

Enrolled = 5

Courses = 3

Average = 5 / 3 = 1.67
*/

-- With the answer below we address the above issue
select avg(Student_Count_per_Course) 'Average number of Students Enrolled'
from (select Courses.course_id, count(Enrollments.student_id) Student_Count_per_Course
from Enrollments
right join Courses
on Enrollments.course_id = Courses.course_id
group by course_id) Enrollments_per_Course;


select c.course_name, count(e.student_id)
from Courses c
left join Enrollments e 
on c.course_id = e.course_id
group by c.course_name;
				   

-- Question two


select max(Individual_Payment)
from (select student_id StudentID, sum(amount) Individual_Payment
from payments
group by student_id) Student_Total_Individual_Payment;

-- Not summing all payments from a Single Student 
select s.student_id  StudentID, concat(s.first_name," ",s.last_name) 'Student', p.amount Payment 
from Students s
join Payments p
on s.student_id = p.student_id
where p.amount = (select max(amount) from Payments);

-- Calculating the sum of all payments made by each Student and finding the max

select s.student_id StudentID, 
	   concat(s.first_name," ",s.last_name) 'Student',  
       Student_Total_Individual_Payment.Total_Amount 'Total Payment'
from Students s
join (select student_id, sum(amount) Total_Amount
	  from Payments
	  group by student_id) Student_Total_Individual_Payment
on s.student_id = Student_Total_Individual_Payment.student_id

where Student_Total_Individual_Payment.Total_Amount = (select max(Total_Amount)
											   from (select student_id , sum(amount) Total_Amount
											   from Payments
											   group by student_id) Student_Total_Individual_Payment);



-- Question 3

select course_id, count(*) 
from Enrollments
group by course_id;


select max(Course_count)
from (select course_id, count(*) Course_count
from Enrollments
group by course_id) Cousre_Enrollment;


select c.course_id 'Course ID',
       c.course_name 'Course Name',
       Cousre_Enrollment.Course_count 'Total_Enrollment'
from Courses c
join (select course_id, count(*) Course_count
	  from Enrollments
	  group by course_id) Cousre_Enrollment
on c.course_id = Cousre_Enrollment.course_id
where Cousre_Enrollment.Course_count = (select max(Course_count)
										from (select course_id, count(*) Course_count
										from Enrollments
										group by course_id) Cousre_Enrollment);
                                        

-- Question 4 

-- For each Course
select t.teacher_id 'Teacher ID',
       concat(t.first_name," ", t.last_name) 'Teacher Name',
       c.course_name 'Course',
       count(distinct e.enrollment_id) 'Enrollment Count',
       ifnull(SUM(p.amount),0) 'Total Payments'
from Teacher t
left join Courses c
	on  t.teacher_id = c.teacher_id
left join Enrollments e
	on c.course_id = e.course_id 
left join Payments p
	on e.student_id = p.student_id 
group by t.teacher_id, t.first_name, t.last_name, c.course_id, c.course_name 
order by t.teacher_id, c.course_id;

-- Total Payment of each Teacher (regardless of course)

select t.teacher_id 'Teacher ID',
       concat(t.first_name," ", t.last_name) 'Teacher Name',
       ifnull(SUM(p.amount),0) 'Total Payments'
from Teacher t
left join Courses c
	on  t.teacher_id = c.teacher_id
left join Enrollments e
	on c.course_id = e.course_id 
left join Payments p
	on e.student_id = p.student_id 
group by t.teacher_id
order by t.teacher_id;



-- Question  5


select count(*) from Courses;

select student_id, count(course_id)
from Enrollments
group by student_id;


select s.student_id StudentID, 
	   concat(s.first_name," ",s.last_name) 'Enrolled in all Courses',
       count(distinct e.course_id) 'Courses Enrolled'
from Students s
join Enrollments e
on s.student_id = e.student_id
group by s.student_id
having count(distinct e.course_id) = (select count(*) from Courses);



-- Question 6

Select teacher_id 'Teacher ID',
       concat(first_name," ", last_name) 'Teacher Name'
from Teacher
where teacher_id not in(Select distinct teacher_id 
						from Courses);
					
-- Using Correlated Subquery                    
Select teacher_id 'Teacher ID',
       concat(first_name," ", last_name) 'Teacher Name'
from Teacher 
where not exists (Select *
				  from Courses
                  where Teacher.teacher_id = Courses.teacher_id);
                  
                  
-- Question 7

select timestampdiff(year, '2004-07-15', current_date());

select student_id, timestampdiff(year, date_of_birth, current_date()) Age from Students;

Select avg(Student_Ages.Age) 'Average age'
from ( select student_id, timestampdiff(year, date_of_birth, current_date()) Age
       from Students) Student_Ages;
       
       
-- Question 8 

Select course_id 'Course ID',
       course_name 'Course Name'
from Courses
where course_id not in(Select distinct course_id 
						from Enrollments);
					
-- Using Correlated Subquery                    
Select course_id 'Course ID',
       course_name 'Course Name'
from Courses
where not exists (Select *
				  from Enrollments
                  where Courses.course_id  = Enrollments.course_id );


-- Question 9

Select * from payments;

Select s.student_id StudentID, 
	   concat(s.first_name," ",s.last_name) 'Enrolled in all Courses',
       c.course_id 'Course ID',
       c.course_name 'Course Name',
       sum(p.amount) 'Total Payment'
from Students s
join Enrollments e
	on s.student_id =  e.student_id
join Courses c
	on e.course_id = c.course_id
join Payments p
	on s.student_id =  p.student_id
group by s.student_id, c.course_id
order by s.student_id;


Select student_id StudentID, 
       course_id 'Course ID',
       (select sum(amount) 
        from Payments p
        where p.student_id = e.student_id) 'Total Payment'
from Enrollments e
order by student_id;



-- Question 10

select * from Students;
select * from Enrollments;
select * from Payments;

commit; 

insert into Enrollments values (null, 'S013', 112, '2026-01-08'),
								(null, 'S014', 112, '2026-01-08');
                                
insert into Payments values (null, 'S013', 9500, '2026-01-08'),
								(null, 'S014', 9500, '2026-01-19');
                                
select student_id, count(amount) Payment_Count
from Payments
group by student_id;

-- Correlated Subquery
Select s.student_id StudentID, 
       concat(s.first_name," ",s.last_name) 'Student Name'
from Students s
where exists (select p.student_id, count(amount) Payment_Count
from Payments p
where s.student_id = p.student_id
group by student_id
having Payment_Count > 1) ; -- Exists

Select student_id StudentID, 
       concat(first_name," ",last_name) 'Student Name'
from Students 
where  student_id in (select student_id
from Payments 
group by student_id
having count(*) > 1) ; 


-- Using join

Select s.student_id StudentID, 
       concat(s.first_name," ",s.last_name) 'Student Name',
       count(p.amount) 'Payment Count'
from Students s
join Payments p
on s.student_id = p.student_id
group by s.student_id
having count(p.amount) > 1
order by s.student_id;

-- Using join and subquery

Select s.student_id StudentID, 
       concat(s.first_name," ",s.last_name) 'Student Name',
       Student_Payment_Count.Payment_Count 'Payment Count'
from Students s
join (select student_id, count(amount) Payment_Count
	  from Payments 
	  group by student_id
      having Payment_Count> 1) Student_Payment_Count
on	s.student_id = Student_Payment_Count.student_id;


-- Question 11

Select s.student_id StudentID, 
       concat(s.first_name," ",s.last_name) 'Student Name',
       sum(p.amount) 'Total Payment'
from Students s
join Payments p
on s.student_id = p.student_id
group by s.student_id
order by s.student_id;



-- Question 12

Select c.course_id 'Course ID',
       c.course_name 'Course Name',
       count(e.student_id) 'Students Enrolled'
from Courses c
join Enrollments e
on c.course_id = e.course_id 
group by c.course_id, c.course_name
order by c.course_id;



-- Question 13 

Select s.student_id StudentID, 
       concat(s.first_name," ",s.last_name) 'Student Name',
       avg(p.amount) 'Average payment amount made by student'
from Students s
join Payments p
on s.student_id = p.student_id
group by s.student_id
order by s.student_id;














/* -- Drop Table

drop table Students;
drop table Teacher;
drop table Courses;
drop table Enrollments;
drop table Payments;  */


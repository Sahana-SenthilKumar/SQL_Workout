-- Coding Challenges: CareerHub, The Job Board

-- 1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”

create database CareerHub;

use CareerHub;


-- 2. Create tables for Companies, Jobs, Applicants and Applications.
-- 3. Define appropriate primary keys, foreign keys, and constraints.
-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.

/*
drop table if exists Applications;
drop table if exists Jobs;
drop table if exists Applicants;
drop table if exists Companies;
*/

create table Companies (
    CompanyID int auto_increment primary key,
    CompanyName varchar(255) not null,
    Location varchar(255) not null
);

create table Jobs (
    JobID int auto_increment primary key,
    CompanyID int not null,
    JobTitle varchar(255) not null,
    JobDescription text not null,
    JobLocation varchar(255) not null,
    Salary decimal(10,2) not null,
    JobType varchar(255) not null,
    PostedDate datetime not null,
    constraint cid_fk foreign key(CompanyID) references Companies(CompanyID) on delete cascade on update cascade
       
) auto_increment = 101;

create table Applicants (
    ApplicantID int auto_increment primary key,
    FirstName varchar(255) not null,
    LastName varchar(255) not null,
    Email varchar(255) not null unique,
    Phone varchar(255) not null unique,
    Resume text not null,
    Experience int not null default 0  -- Used in Q10 and Q20 so added to execute those question
) auto_increment = 1001;

create table Applications (
    ApplicationID int auto_increment primary key,
    JobID int,
    ApplicantID int not null,
    ApplicationDate datetime not null,
    CoverLetter text not null,
    constraint jid_fk foreign key(JobID) references Jobs(JobID) on delete set null on update cascade,
    constraint aid_fk foreign key(ApplicantID) references Applicants(ApplicantID) on delete cascade on update cascade
   
) auto_increment = 10001;


insert into Companies (CompanyName, Location) values
('TechNova Pvt Ltd', 'Bangalore'),
('DataWise Solutions', 'Chennai'),
('FinElite Corp', 'Mumbai'),
('CodeSphere Ltd', 'CityX');

insert into Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) values
(1, 'Software Developer', 'Develop and maintain web apps', 'Bangalore', 75000.00, 'Full-time', '2025-05-01 10:00:00'),
(1, 'QA Engineer', 'Manual and automated testing', 'Bangalore', 68000.00, 'Full-time', '2025-05-02 10:00:00'),
(2, 'Data Analyst', 'Analyze datasets and generate insights', 'Chennai', 62000.00, 'Contract', '2025-04-28 09:00:00'),
(2, 'Frontend Developer', 'React and HTML5 work', 'Chennai', 0.00, 'Part-time', '2025-05-10 12:00:00'),
(3, 'Backend Developer', 'Node.js and database work', 'Mumbai', 85000.00, 'Full-time', '2025-05-03 11:00:00'),
(4, 'Support Engineer', 'Help customers resolve issues', 'CityX', 50000.00, 'Full-time', '2025-05-05 14:00:00');


insert into Applicants (FirstName, LastName, Email, Phone, Resume, Experience) values
('Liam', 'Anderson', 'liam.anderson@example.com', '9990000001', 'Resume text', 2),
('Emily', 'Johnson', 'emily.johnson@example.com', '9990000002', 'Resume text', 3),
('Noah', 'Thompson', 'noah.thompson@example.com', '9990000003', 'Resume text', 4),
('Sophia', 'Martinez', 'sophia.martinez@example.com', '9990000004', 'Resume text', 1),
('Lucas', 'Wright', 'lucas.wright@example.com', '9990000005', 'Resume text', 5),
('Isabella', 'Walker', 'isabella.walker@example.com', '9990000006', 'Resume text', 3);

insert into Applications (JobID, ApplicantID, ApplicationDate, CoverLetter) values
(101, 1001, '2025-05-10 09:00:00', 'I am excited to apply for this role.'),
(101, 1002, '2025-05-11 10:00:00', 'This job suits my experience.'),
(102, 1003, '2025-05-12 11:00:00', 'Looking forward to working with your QA team.'),
(103, 1004, '2025-05-09 14:00:00', 'Data is my passion.'),
(105, 1005, '2025-05-10 16:00:00', 'I have backend experience.'),
(106, 1006, '2025-05-11 12:00:00', 'Support roles match my skills.'),
(103, 1002, '2025-05-12 17:00:00', 'I am also interested in data roles.');


-- 5.Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. 
-- Display the job title and the corresponding application count. 
-- Ensure that it lists all jobs, even if they have no applications.

Select j.JobTitle 'Job Title', count(a.ApplicationID) 'Application count'
from Jobs j
left join Applications a
on j.JobID = a.JobID
group by j.JobID, j.JobTitle
order by j.JobID;


-- 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. 
-- Allow parameters for the minimum and maximum salary values. 
-- Display the job title, company name, location, and salary for each matching job.

Select j.JobTitle 'Job Title', c.CompanyName 'Company', j.JobLocation 'Job Location', j.Salary 'Salary'
from Jobs j
join Companies c
	on j.CompanyID = c.CompanyID
where j.salary between 40000 and 70000;


-- 7. Write an SQL query that retrieves the job application history for a specific applicant. 
-- Allow a parameter for the ApplicantID.
-- And return a result set with the job titles, company names, and application dates for all the jobs the applicant has applied to.

select j.JobTitle 'Job Title', c.CompanyName 'Company', a.ApplicationDate 'Application Date'
from Applications a
join Jobs j
	on a.JobID = j.JobID
join Companies c
	on j.CompanyID = c.CompanyID
where a.ApplicantID = 1002;


-- 8. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table. 
-- Ensure that the query filters out jobs with a salary of zero.

Select c.CompanyName, avg(j.Salary) 'Average Salary Offered'
from Companies c
join Jobs j
	on c.CompanyID = j.CompanyID
where j.salary > 0
group by c.CompanyID;


-- 9. Write an SQL query to identify the company that has posted the most job listings. 
-- Display the company name along with the count of job listings they have posted. 
-- Handle ties if multiple companies have the same maximum count.

Select c.CompanyName 'Company', JobCount 'Job Offers'
from (select CompanyID, count(*) JobCount
	  from Jobs
	  group by CompanyID) CountTable
join Companies c 
	on c.CompanyID = CountTable.CompanyID
where CountTable.JobCount = (select max(JobCount)
							from (select CompanyID, count(*) JobCount
								  from Jobs
	                              group by CompanyID) CountTable);


-- 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.

select a.*
from Applicants a
join Applications ap
	on a.ApplicantID = ap.ApplicantID
join Jobs j
	on ap.JobID = j.JobID
join Companies c
	on j.CompanyID = c.CompanyID
where c.Location = 'CityX' and a.Experience >= 3;

select a.*
from Applicants a
join Applications ap
	on a.ApplicantID = ap.ApplicantID
join Jobs j
	on ap.JobID = j.JobID
where j.JobLocation = 'CityX' and a.Experience >= 3;


-- 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

select distinct JobTitle
from Jobs
where Salary between 60000 and 80000;


-- 12. Find the jobs that have not received any applications.

select * from Jobs 
where JobID not in(select distinct JobID from Applications);


-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.



Select a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', c.CompanyName 'Company', j.JobTitle 'Position'
from Applicants a
join Applications ap
	on a.ApplicantID = ap.ApplicantID
join Jobs j
	on ap.JobID = j.JobID
join Companies c
	on j.CompanyID = c.CompanyID
order by a.ApplicantID;


-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.

select c.CompanyName 'Company', count(*) as 'Job Posted'
from Companies c
left join Jobs j
	on c.CompanyID = j.CompanyID
group by c.CompanyID, c.CompanyName;


-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied.

Select a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', c.CompanyName, j.JobTitle 'Position'
from Applicants a
left join Applications ap
	on a.ApplicantID = ap.ApplicantID
left join Jobs j
	on ap.JobID = j.JobID
left join Companies c
	on j.CompanyID = c.CompanyID
order by a.ApplicantID;


-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

select distinct c.CompanyName 'Company'
from Companies c
join Jobs j
	on c.CompanyID = j.CompanyID
where j.Salary > (select round(avg(salary)) from Jobs);


-- 17. Display a list of applicants with their names and a concatenated string of their city and state.

alter table Applicants
add column City varchar(255) not null,
add column State varchar(255) not null;

update Applicants set City = 'Austin', State = 'Texas' where ApplicantID = 1001;
update Applicants set City = 'Chicago', State = 'Illinois' where ApplicantID = 1002;
update Applicants set City = 'Seattle', State = 'Washington' where ApplicantID = 1003;
update Applicants set City = 'New York', State = 'New York' where ApplicantID = 1004;
update Applicants set City = 'San Francisco', State = 'California' where ApplicantID = 1005;
update Applicants set City = 'Boston', State = 'Massachusetts' where ApplicantID = 1006;

select * from Applicants;

select ApplicantID 'Applicant ID', concat(FirstName," ",LastName) 'Name', concat(City,' ',State) 'Location'
from Applicants;


-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

select * from Jobs
where JobTitle Like '%Developer%' or JobTitle Like '%Engineer%';


-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.

insert into Applicants (FirstName, LastName, Email, Phone, Resume, Experience, City, State) values
('Tate', 'Ray', 'tate.ray@example.com', '7770000001', 'Resume text', 0, 'New York','New York'),
('Ciel', 'Lou', 'ciel.lou@example.com', '88880000001', 'Resume text', 1, 'New York','New York');
 
select a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', j.JobTitle
from Applicants a
left join Applications ap 
	on a.ApplicantID = ap.ApplicantID
left join Jobs j
	on ap.JobID = j.JobID

union

select a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', j.JobTitle
from Jobs j
left join Applications ap 
	on j.JobID = ap.JobID
left join Applicants a
	on ap.ApplicantID = a.ApplicantID;

-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience. For example: city=Chennai

-- Combination : Cross join
select a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', c.CompanyName 'Company'
from Applicants a
cross join Companies c
	on c.Location = 'Chennai'
where a.Experience > 2;

-- (or)

select distinct a.ApplicantID 'Applicant ID', concat(a.FirstName," ",a.LastName) 'Name', c.CompanyName 'Company'
from Applicants a
join Applications ap
	on a.ApplicantID = ap.ApplicantID
join Jobs j
	on ap.JobID = j.JobID
join Companies c
	on j.CompanyID = c.CompanyID
where a.Experience > 2 and c.Location = 'Chennai';




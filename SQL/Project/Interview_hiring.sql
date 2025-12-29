-- CREATE DATABASE
create database if not exists InterviewHiring;

-- USE DATABASE
use InterviewHiring;

-- CREATE TABLES
CREATE TABLE interviewers (
    interviewer_id INT AUTO_INCREMENT PRIMARY KEY,
    interviewer_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    experience_years INT NOT NULL CHECK (experience_years BETWEEN 0 AND 40)
) AUTO_INCREMENT=101;

CREATE TABLE candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_name VARCHAR(50) NOT NULL,
    primary_skill VARCHAR(50) NOT NULL,
    experience_years INT NOT NULL CHECK (experience_years BETWEEN 0 AND 30),
    source VARCHAR(30) NOT NULL CHECK (source IN ('Referral', 'LinkedIn', 'Naukri', 'Campus', 'Indeed', 'Glassdoor', 'Others'))
) AUTO_INCREMENT=201;

CREATE TABLE interview_rounds (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT NOT NULL,
    interviewer_id INT NOT NULL,
    round_name VARCHAR(30) NOT NULL CHECK (round_name IN ('Technical', 'Manager', 'HR')),
    interview_date DATE NOT NULL,
    score INT CHECK (score BETWEEN 0 AND 100),
    decision ENUM('PASS','FAIL') NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id) ON DELETE CASCADE,
    FOREIGN KEY (interviewer_id) REFERENCES interviewers(interviewer_id) ON DELETE RESTRICT
);

CREATE TABLE offers (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT NOT NULL UNIQUE,
    offered_salary INT NOT NULL CHECK (offered_salary >= 300000),
    offer_date DATE NOT NULL,
    offer_status ENUM('ACCEPTED','REJECTED','PENDING') NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id) ON DELETE CASCADE
);

-- INSERT DATA
INSERT INTO interviewers (interviewer_name, department, experience_years) VALUES
('Arjun Rao', 'Backend', 8), 
('Neha Sharma', 'Frontend', 6),
('Kiran Patel', 'Data', 7), 
('Pooja Mehta', 'QA', 5),
('Rohit Verma', 'Backend', 10),
('Sita Iyer', 'Frontend', 4),
('Vikram Singh', 'Data', 12),
('Aditi Rao', 'QA', 3),
('Sanjay Gupta', 'Backend', 15), 
('Ishita Kaur', 'Frontend', 5),
('Manoj Bajpayee', 'Data', 9), 
('Deepa Nair', 'QA', 7);

INSERT INTO candidates (candidate_name, primary_skill, experience_years, source) VALUES
('Amit', 'Java', 3, 'Referral'), 
('Sneha', 'React', 2, 'LinkedIn'),
('Rahul', 'Python', 4, 'Naukri'), 
('Priya', 'SQL', 5, 'Referral'),
('Vikas', 'Java', 1, 'Campus'), 
('Anjali', 'Python', 3, 'LinkedIn'),
('Suresh', 'React', 4, 'Referral'), 
('Meena', 'SQL', 2, 'Naukri'),
('Rohan', 'Python', 6, 'LinkedIn'), 
('Kavya', 'Java', 3, 'Referral'),
('Rajesh', 'Java', 4, 'Indeed'), 
('Simran', 'React', 3, 'Glassdoor'),
('Tanmay', 'Python', 2, 'LinkedIn'), 
('Priyanka', 'SQL', 6, 'Referral'),
('Gaurav', 'Java', 5, 'LinkedIn'), 
('Deepika', 'React', 1, 'Campus'),
('Varun', 'Python', 7, 'Referral'), 
('Kritika', 'SQL', 3, 'Indeed'),
('Abhishek', 'Java', 8, 'LinkedIn'), 
('Nisha', 'React', 4, 'Glassdoor'),
('Sameer', 'Python', 2, 'Campus'), 
('Riya', 'SQL', 5, 'Referral'),
('Kartik', 'Java', 3, 'LinkedIn'), 
('Shruti', 'React', 6, 'Naukri'),
('Aakash', 'Python', 4, 'Indeed'), 
('Pooja', 'SQL', 2, 'LinkedIn'),
('Mohit', 'Java', 5, 'Referral'), 
('Preeti', 'React', 3, 'Campus'),
('Siddharth', 'Python', 6, 'LinkedIn'), 
('Ananya', 'SQL', 4, 'Glassdoor'),
('Harsh', 'Java', 2, 'Naukri'), 
('Meghna', 'React', 7, 'Referral'),
('Yash', 'Python', 3, 'Indeed'), 
('Tanya', 'SQL', 5, 'LinkedIn'),
('Sahil', 'Java', 4, 'Referral'),
('Karan', 'Java', 5, 'LinkedIn'), 
('Lata', 'React', 3, 'Referral'),
('Nitin', 'Python', 4, 'Naukri'), 
('Suman', 'SQL', 2, 'Indeed'),
('Rahul', 'Java', 6, 'LinkedIn'), 
('Monica', 'React', 4, 'Glassdoor'),
('Dev', 'Python', 5, 'Referral'), 
('Pooja', 'SQL', 3, 'Campus'),
('Vijay', 'Java', 2, 'LinkedIn'), 
('Tara', 'React', 5, 'Naukri');

INSERT INTO interview_rounds (candidate_id, interviewer_id, round_name, interview_date, score, decision) VALUES
(202, 102, 'Technical', '2025-06-03', 30, 'FAIL'),
(203, 103, 'Technical', '2025-06-04', 88, 'PASS'), 
(203, 103, 'Manager', '2025-06-10', 85, 'PASS'), 
(203, 101, 'HR', '2025-06-15', 80, 'PASS'),
(204, 103, 'Technical', '2025-06-04', 90, 'PASS'), 
(204, 105, 'Manager', '2025-06-11', 72, 'PASS'), 
(204, 101, 'HR', '2025-06-18', 75, 'PASS'),
(205, 101, 'Technical', '2025-06-05', 45, 'FAIL'),
(206, 103, 'Technical', '2025-06-06', 92, 'PASS'), 
(206, 104, 'Manager', '2025-06-12', 48, 'FAIL'),
(207, 102, 'Technical', '2025-06-07', 85, 'PASS'), 
(207, 102, 'Manager', '2025-06-13', 83, 'PASS'), 
(207, 101, 'HR', '2025-06-20', 85, 'PASS'),
(209, 103, 'Technical', '2025-06-09', 95, 'PASS'), 
(209, 103, 'Manager', '2025-06-15', 91, 'PASS'), 
(209, 101, 'HR', '2025-06-22', 90, 'PASS'),
(211, 109, 'Technical', '2025-06-12', 88, 'PASS'), 
(211, 105, 'Manager', '2025-06-18', 82, 'PASS'), 
(211, 101, 'HR', '2025-06-25', 78, 'PASS'),
(214, 103, 'Technical', '2025-06-14', 80, 'PASS'), 
(214, 107, 'Manager', '2025-06-21', 78, 'PASS'), 
(214, 101, 'HR', '2025-06-28', 82, 'PASS'),
(217, 107, 'Technical', '2025-06-16', 95, 'PASS'), 
(217, 111, 'Manager', '2025-06-22', 90, 'PASS'), 
(217, 101, 'HR', '2025-06-30', 88, 'PASS'),
(218, 112, 'Technical', '2025-06-17', 77, 'PASS'), 
(218, 104, 'Manager', '2025-06-24', 76, 'PASS'), 
(218, 101, 'HR', '2025-07-02', 70, 'PASS'),
(219, 109, 'Technical', '2025-06-18', 94, 'PASS'), 
(219, 105, 'Manager', '2025-06-25', 88, 'PASS'), 
(219, 101, 'HR', '2025-07-03', 85, 'PASS'),
(220, 102, 'Technical', '2025-06-19', 70, 'PASS'), 
(220, 110, 'Manager', '2025-06-26', 85, 'PASS'), 
(220, 101, 'HR', '2025-07-04', 80, 'PASS'),
(222, 111, 'Technical', '2025-06-20', 88, 'PASS'), 
(222, 107, 'Manager', '2025-06-27', 85, 'PASS'), 
(222, 101, 'HR', '2025-07-05', 82, 'PASS'),
(223, 101, 'Technical', '2025-06-21', 81, 'PASS'), 
(223, 109, 'Manager', '2025-06-28', 76, 'PASS'), 
(223, 101, 'HR', '2025-07-06', 74, 'PASS'),
(224, 110, 'Technical', '2025-06-22', 89, 'PASS'), 
(224, 102, 'Manager', '2025-06-29', 84, 'PASS'), 
(224, 101, 'HR', '2025-07-07', 89, 'PASS'),
(227, 105, 'Technical', '2025-06-24', 79, 'PASS'), 
(227, 109, 'Manager', '2025-07-01', 81, 'PASS'), 
(227, 101, 'HR', '2025-07-08', 77, 'PASS'),
(228, 106, 'Technical', '2025-06-25', 92, 'PASS'), 
(228, 110, 'Manager', '2025-07-02', 88, 'PASS'), 
(228, 101, 'HR', '2025-07-09', 91, 'PASS'),
(229, 107, 'Technical', '2025-06-26', 89, 'PASS'), 
(229, 111, 'Manager', '2025-07-03', 81, 'PASS'), 
(229, 101, 'HR', '2025-07-10', 83, 'PASS'),
(232, 102, 'Technical', '2025-06-27', 85, 'PASS'), 
(232, 110, 'Manager', '2025-07-04', 82, 'PASS'), 
(232, 101, 'HR', '2025-07-12', 88, 'PASS'),
(233, 107, 'Technical', '2025-06-28', 90, 'PASS'), 
(233, 111, 'Manager', '2025-07-05', 86, 'PASS'), 
(233, 101, 'HR', '2025-07-13', 82, 'PASS'),
(234, 112, 'Technical', '2025-06-29', 72, 'PASS'), 
(234, 104, 'Manager', '2025-07-06', 75, 'PASS'), 
(234, 101, 'HR', '2025-07-14', 80, 'PASS'),
(235, 109, 'Technical', '2025-06-30', 88, 'PASS'), 
(235, 105, 'Manager', '2025-07-07', 84, 'PASS'), 
(235, 101, 'HR', '2025-07-15', 85, 'PASS'),
(236, 101, 'Technical', '2025-06-05', 40, 'FAIL'),
(237, 102, 'Technical', '2025-06-06', 35, 'FAIL'),
(238, 103, 'Technical', '2025-06-10', 42, 'FAIL'),
(239, 112, 'Technical', '2025-06-12', 25, 'FAIL'),
(240, 101, 'Technical', '2025-06-15', 75, 'PASS'), 
(240, 105, 'Manager', '2025-06-20', 45, 'FAIL'),
(241, 106, 'Technical', '2025-06-16', 82, 'PASS'), 
(241, 104, 'Manager', '2025-06-22', 50, 'FAIL'),
(242, 107, 'Technical', '2025-06-18', 78, 'PASS'), 
(242, 111, 'Manager', '2025-06-25', 38, 'FAIL'),
(243, 109, 'Technical', '2025-06-20', 88, 'PASS'), 
(243, 105, 'Manager', '2025-06-28', 82, 'PASS'), 
(243, 101, 'HR', '2025-07-05', 40, 'FAIL'),
(244, 101, 'Technical', '2025-06-21', 81, 'PASS'), 
(244, 109, 'Manager', '2025-07-02', 76, 'PASS'), 
(244, 101, 'HR', '2025-07-10', 45, 'FAIL'),
(245, 110, 'Technical', '2025-06-22', 89, 'PASS'), 
(245, 102, 'Manager', '2025-07-05', 84, 'PASS'), 
(245, 101, 'HR', '2025-07-12', 30, 'FAIL'),
(201,108,'Technical','2025-06-25',91,'FAIL'),
(210,112,'Technical','2025-07-01',33,'PASS'),
(210,108,'Manager','2025-07-07',25,'PASS'),
(210,102,'HR','2025-07-12',98,'FAIL'),
(225,104,'Technical','2025-06-20',85,'PASS'),
(225,103,'Manager','2025-06-27',92,'FAIL');

INSERT INTO offers (candidate_id, offered_salary, offer_date, offer_status) VALUES
(203, 900000, '2025-07-01', 'ACCEPTED'), 
(204, 850000, '2025-07-02', 'ACCEPTED'),
(207, 800000, '2025-07-03', 'REJECTED'), 
(209, 950000, '2025-07-04', 'ACCEPTED'),
(211, 1100000, '2025-07-05', 'ACCEPTED'), 
(214, 950000, '2025-07-06', 'ACCEPTED'),
(217, 1300000, '2025-07-07', 'REJECTED'), 
(218, 750000, '2025-07-08', 'ACCEPTED'),
(219, 1500000, '2025-07-09', 'ACCEPTED'), 
(220, 920000, '2025-07-10', 'ACCEPTED'),
(222, 1050000, '2025-07-11', 'ACCEPTED'), 
(223, 950000, '2025-07-12', 'REJECTED'),
(224, 1250000, '2025-07-13', 'ACCEPTED'),
(227, 1020000, '2025-07-14', 'ACCEPTED'), 
(228, 880000, '2025-07-15', 'ACCEPTED'),
(229, 1200000, '2025-07-16', 'ACCEPTED'), 
(232, 1150000, '2025-07-17', 'PENDING'),
(233, 1000000, '2025-07-18', 'ACCEPTED'), 
(234, 1080000, '2025-07-19', 'PENDING'),
(235, 980000, '2025-07-20', 'ACCEPTED');

-- SELECT TASKS with WHERE, AND, OR and BETWEEN
select candidate_name from candidates where experience_years between 3 and 6;

select * from interview_rounds where interview_date>'2025-06-15';

select * from interview_rounds where score<40;

-- IN OPERATOR
select candidate_name from candidates where source in ('LinkedIn','Referral');

-- LIKE OPERATOR
select candidate_name from candidates where candidate_name like 'A%';

select candidate_name from candidates where candidate_name like '%ra%';

-- ORDER BY & LIMIT
select * from offers order by offered_salary desc limit 5;

select * from interview_rounds order by interview_date desc limit 10;

select interviewer_name from interviewers order by experience_years desc limit 3;

select * from interview_rounds order by score limit 5;

-- AGGREGATE FUNCTIONS
select min(interview_date) as oldest_date, max(interview_date) as latest_date from interview_rounds;

select count(*) as total_candidates from candidates;

select avg(score) as avg_technical from interview_rounds where round_name='Technical';

select max(offered_salary) as max_salary from offers;

select min(score) as min_score from interview_rounds;

-- GROUP BY
select round_name,count(*) as total from interview_rounds group by round_name;

select offer_status,avg(offered_salary) as avg_offered_salary from offers group by offer_status;

select primary_skill,count(*) as total from candidates group by primary_skill;

-- HAVING
select source,count(*) as total from candidates group by source having count(*)>8;

select c.candidate_name from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id
group by c.candidate_id having sum(i.decision='PASS')=3;

select c.candidate_name from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id
group by c.candidate_id having sum(i.decision='FAIL')>=1;

-- EXISTS
select candidate_name from candidates c where exists(select 1 from offers o where c.candidate_id=o.candidate_id);

-- NOT EXISTS
select candidate_name from candidates c where not exists(select 1 from interview_rounds i where c.candidate_id=i.candidate_id);

-- IF CONDITIONS
select *,if(offered_salary>=1200000,'HIGH',if(offered_salary>=1000000,'MEDIUM','LOW')) as salary_range from offers;

select distinct(c.candidate_id),c.candidate_name, if(o.candidate_id is not null,'SELECTED','REJECTED') as final_decision from candidates c
left join interview_rounds i on c.candidate_id=i.candidate_id
left join offers o on o.candidate_id=i.candidate_id;

select *,if(experience_years<=2,'Fresher',if(experience_years<=5,'Mid','Senior')) as experience_range from candidates;

-- INNER JOIN
select i.interviewer_name,count(*) as total from interviewers i
join interview_rounds ir
on i.interviewer_id=ir.interviewer_id
group by i.interviewer_name;

select i.interviewer_name from interviewers i
join interview_rounds ir
on i.interviewer_id=ir.interviewer_id
group by i.interviewer_name having count(*)>5;

select c.primary_skill,avg(i.score) as avg_skill_score from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id
group by c.primary_skill having avg(i.score)>80;

select i.interviewer_name from interviewers i
join interview_rounds ir
on i.interviewer_id=ir.interviewer_id
group by i.interviewer_name having avg(ir.score)<60;

select c.candidate_name,i.round_name,i.interview_date,i.score,i.decision from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id;

-- LEFT JOIN
select c.candidate_name from candidates c
left join offers o
on c.candidate_id=o.candidate_id
where offer_status is null;

-- RIGHT JOIN
select i.interviewer_name,ir.candidate_id,ir.round_name,ir.interview_date,ir.score,ir.decision from interviewers i
right join interview_rounds ir
on i.interviewer_id=ir.interviewer_id;

-- FULL OUTER JOIN (LEFT JOIN UNION RIGHT JOIN)
select c.*,o.* from candidates c
left join offers o
on c.candidate_id=o.candidate_id
union
select c.*,o.* from candidates c
right join offers o
on c.candidate_id=o.candidate_id;

-- SELF JOIN
select i.interviewer_name,i2.interviewer_name from interviewers i
join interviewers i2
on i.interviewer_id!=i2.interviewer_id and i.department=i2.department;

-- UCASE()
select ucase(candidate_name) as upper_name from candidates;

-- SUBSTR()
select substr(interviewer_name,1,3) as first_three from interviewers;

-- LENGTH()
select candidate_name,length(candidate_name) as length from candidates;

-- REPLACE()
select candidate_name,replace(primary_skill,"Java","Core Java")as primary_skill from candidates;

-- DATEDIFF()
select c.candidate_name,
datediff(max(if(i.round_name='HR',i.interview_date,null)),min(if(i.round_name='Technical',i.interview_date,null))) as date_diff
from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id
group by candidate_name
having max(if(i.round_name='HR',i.interview_date,null)) is not null;

select distinct(c.candidate_name) from candidates c
join offers o on c.candidate_id=o.candidate_id
join interview_rounds i on o.candidate_id=i.candidate_id
where datediff(o.offer_date,(select max(interview_date) from interview_rounds i1 where i.candidate_id=i1.candidate_id group by i1.candidate_id))<=10;

-- DATE_FORMAT()
select * from  interview_rounds where date_format(interview_date,"%Y-%m")='2025-06';

select date_format(interview_date,"%Y-%m") as month,count(*) as total_interviews from interview_rounds group by month;

-- DAYNAME()
select * from interview_rounds where dayname(interview_date) in ('Saturday','Sunday');

-- SUBQUERY
select i.round_name,
(select count(*)
from interview_rounds i1
where i1.decision='PASS' and i.round_name=i1.round_name group by i1.round_name)/count(*)*100 as pass_percentage
from interview_rounds i
group by i.round_name;

select c.candidate_name,i.score from candidates c
join interview_rounds i
on c.candidate_id=i.candidate_id
where score>(select avg(i1.score) from interview_rounds i1 where i.candidate_id=i1.candidate_id); 

select i.interviewer_name from interviewers i
join interview_rounds ir on i.interviewer_id=ir.interviewer_id
join  offers o on ir.candidate_id=o.candidate_id
where offered_salary in (select max(offered_salary) from offers);

select i.interviewer_name,avg(ir.score) from interviewers i
join interview_rounds ir 
on i.interviewer_id=ir.interviewer_id
group by i.interviewer_id,i.interviewer_name,i.department
having avg(ir.score)<(select avg(ir2.score) from interview_rounds ir2 join interviewers i2 on i2.interviewer_id=ir2.interviewer_id where i2.department=i.department);

-- RANK()
select c.candidate_name, rank() over(order by o.offered_salary desc) as salary_rank from candidates c
join offers o
on c.candidate_id=o.candidate_id;

-- DENSE_RANK()
select i.interviewer_name, avg(ir.score) as avg_score, dense_rank() over(order by avg(ir.score) desc) as interview_avg_score from interviewers i
join interview_rounds ir
on i.interviewer_id=ir.interviewer_id
group by i.interviewer_name;

select candidate_name,offered_salary as ranked_salary from 
(select c.candidate_name,o.offered_salary, dense_rank() over (order by o.offered_salary desc) as ranked_salary from candidates c
join offers o
on c.candidate_id=o.candidate_id) t
where ranked_salary=2;

-- FUNCTION
DELIMITER //
create function salary_category(n int)
RETURNS varchar(20)
deterministic
BEGIN
	declare rang varchar(20);
	if n>=1200000 then set rang='HIGH';
    elseif n>=1000000 then set rang='MEDIUM';
    else set rang='LOW';
    end if;
    return rang;
END //
DELIMITER ;

select candidate_id,salary_category(offered_salary) as sal_range from offers;

-- PROCEDURE
DELIMITER //
create procedure score_id(in n int)
BEGIN
	select round_name,score from interview_rounds where candidate_id=n;
END //
DELIMITER ;

call score_id(219);

-- ALTER TABLE
alter table offers add salary_category ENUM('LOW','MEDIUM','HIGH');

-- UPDATE
update offers set salary_category =
if(offered_salary >= 1200000,'HIGH', if(offered_salary >= 1000000,'MEDIUM','LOW'));

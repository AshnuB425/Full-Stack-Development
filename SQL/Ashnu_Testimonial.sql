use ashnu;
create table worker(worker_id int primary key,first_name varchar(20),last_name varchar(20),salary int, joining_date datetime,department varchar(20));
create table bonus(worker_ref_id int,bonus_date datetime,bonus_amount int);
create table title(worker_ref_id int,worker_title varchar(20),affected_from datetime);
insert into worker values('001','Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
('002','Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
('003','Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
('004','Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
('005','Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
('006','Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
('007','Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
('008','Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
select* from worker;
insert into bonus values(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500);
select* from Bonus;
insert into title values(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00');
select* from title;

-- 1)
select first_name as WORKER_NAME from worker;

-- 2)
select ucase(first_name) as upper_name from worker;

-- 3)
select distinct(department) from worker;

-- 4)
select substr(first_name,1,3) as first_three from worker;

-- 5)
select length(substring_index(first_name,char(ascii('a')),1))+1 as first_index from worker where first_name='Amitabh';

-- 6)
select rtrim(first_name) as right_trim from worker;

-- 7)
select ltrim(department) as left_trim from worker;

-- 8)
select distinct(department),length(department) as length from worker;

-- 9)
select replace(first_name,"a","A") as replaced_name from worker;

-- 10)
select concat(first_name,' ',last_name) as complete_name from worker;

-- 11)
select * from worker order by first_name;

-- 12)
select * from worker order by first_name asc,department desc;

-- 13)
select * from worker where first_name in('Vipul','Satish');

-- 14)
select * from worker where first_name not in('Vipul','Satish');

-- 15)
select * from worker where department='Admin';

-- 16)
select * from worker where first_name like '%a%';

-- 17)
select * from worker where first_name like '%a';

-- 18)
select first_name from worker where first_name like '%h' and length(first_name)=6;

-- 19)
select * from worker where salary between 100000 and 500000;

-- 20)
select * from worker where joining_date between '2014-02-01 00:00:00' and '2014-02-28 23:59:59';

-- 21)
select count(*) as total from worker where department='Admin';

-- 22)
select first_name,last_name from worker where salary between 50000 and 100000;

-- 23)
select department,count(*) as total from worker group by department order by total desc;

-- 24)
select w.*,t.worker_title,t.affected_from from worker w join title t on w.worker_id=t.worker_ref_id where t.worker_title='Manager';

-- 25)
select worker_ref_id,bonus_date from bonus group by worker_ref_id,bonus_date having count(worker_ref_id)>1;

-- 26)
select * from worker where mod(worker_id,2)=1; 

-- 27)
select* from worker where mod(worker_id,2)=0;

-- 28)
select now() as current_date_time;

-- 29)
delimiter //
create procedure get_n_records(in n int)
BEGIN
	select * from worker limit n;
END //
delimiter ;
CALL get_n_records(10);

-- 30)
delimiter //
create procedure get_nth_salary(in n int)
BEGIN
	declare l int;
    set l=n-1;
	select distinct(salary) from worker order by salary desc limit 1 offset l;
END //
delimiter ;
call get_nth_salary(5);

-- 31)
select w.* from worker w join worker w2 on w.worker_id!=w2.worker_id and w.salary=w2.salary;

-- 32)
select max(salary) as second_highest from worker where salary<(select max(salary) from worker);

-- 33)
select * from worker where worker_id<=(select count(*)/2 from worker);

-- 34)
select department,count(*) as total from worker group by department having total<5;

-- 35)
select department,count(*) as total from worker group by department;

-- 36)
select * from worker order by worker_id desc limit 1;

-- 37)
select department,first_name,last_name,salary from worker where salary in (select max(salary) from worker group by department);

-- 38)
select * from worker order by salary desc limit 3;

-- 39)
select department,sum(salary) as total from worker group by department;

-- 40)
select first_name,last_name from worker where salary in (select max(salary) from worker);

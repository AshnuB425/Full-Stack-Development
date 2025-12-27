use ashnu;

-- 1)
select gender,count(*) as total from Passenger where distance>=600 group by gender;

-- 2)
select Passenger_name from Passenger where Passenger_name like "s%";

-- 3)
select distance from Passenger where distance>500;

-- 4)
select compartment,count(*) as total from Passenger group by compartment;

-- 5)
select count(*) as total from Passenger where boarding_station='Mumbai';

-- 6)
select Passenger_name,Boarding_station,Destination_station from Passenger where Category='Tatkal';

-- 7)
select Passenger_name from Passenger where Boarding_station in ('Bangalore','Chennai','Nagpur');

-- 8)
select boarding_station from Passenger order by Boarding_Station;

-- 9)
select min(price) as min_price from price where compartment='AC';

-- 10)
select max(price) as max_price from price where compartment='Non-AC';

-- 11)
select p.price from price p join passenger s on p.compartment=s.compartment and p.distance=s.distance where boarding_station='Chennai' and destination_station='Bangalore';

-- 12)
select count(*) as total from passenger where category='Tatkal';

-- 13)
select passenger_name,boarding_station from passenger where category='General';

-- 14)
select compartment,max(price) as max_price from price group by compartment;

-- 15)
select s.passenger_name,p.price from passenger s join price p on p.distance=s.distance and p.compartment=s.compartment where s.distance=700;

-- 16)
select passenger_name,length(passenger_name) from passenger where boarding_station='Hyderabad';

-- 17)
select gender,count(*) as total from passenger group by gender;

-- 18)
select concat(passenger_name,'-',if(gender='M','Male','Female'),'-',boarding_station) as passenger_details from passenger;

-- 19)
select s.passenger_name,p.price from passenger s join price p on p.distance=s.distance and p.compartment=s.compartment where s.passenger_name="Linda" and s.boarding_station='Mumbai' and s.destination_station='Goa';

-- 20)
select count(distinct(boarding_station)) as boarding_stations from passenger;

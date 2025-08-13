create table Bike_company
(
id int,
	Marital_status varchar(50),
    Gender varchar(50),
    Income varchar(50),
    Children int(50),
    Education varchar(50),
    Occupation varchar(50),
    Home_owner varchar(50),
    Cars int(50),
    Commute_dist varchar(50),
    Region varchar(50),
    Age int(50),
	Purchased_bike varchar(50)
)
;


Select *
from bike_company;

create table bike_comp_ws
like bike_company
;

Select *
from bike_comp_ws;

insert bike_comp_ws
select *
from bike_company
;

select *,
row_number() over (partition by id, marital_status, Gender, Income, Children, Education, Occupation, Home_owner, Cars, Commute_dist, Region, Age, Purchased_bike) As 'row_number'
from bike_comp_ws
;

delete
from bike_comp_ws
where row_num > 1;
;

-- Because there was no extra column for row_num, it wont create a partition for deletion . so if you want to delete create extra column every time a new column with a particular name.-- 


CREATE TABLE `bike_comp_ws1` (
  `id` int DEFAULT NULL,
  `Marital_status` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Income` varchar(50) DEFAULT NULL,
  `Children` int DEFAULT NULL,
  `Education` varchar(50) DEFAULT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `Home_owner` varchar(50) DEFAULT NULL,
  `Cars` int DEFAULT NULL,
  `Commute_dist` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Purchased_bike` varchar(50) DEFAULT NULL,
  `Row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from bike_comp_ws1; -- checked the columns

insert into bike_comp_ws1
select * ,
row_number() over (partition by id, marital_status, Gender, Income, Children, Education, Occupation, Home_owner, Cars, Commute_dist, Region, Age, Purchased_bike) As 'row_number'
from bike_comp_ws
;

select *
from bike_comp_ws1
where Row_num > 1;

delete 
from bike_comp_ws1
where Row_num > 1;

-- standardizing the data
select *
from bike_comp_ws1
;

select Marital_status
from bike_comp_ws1
group by Marital_status
;

update bike_comp_ws1
set Marital_status = 'Married'
where Marital_status like 'M'
;


update bike_comp_ws1
set Marital_status = 'Married'
where Marital_status like 'Male'
;

select Marital_status
from bike_comp_ws1
group by Marital_status
;

update bike_comp_ws1
set Marital_status = 'Single'
where Marital_status like 'S'
;

update bike_comp_ws1
set Gender = 'Female'
where Gender like 'F'
;

update bike_comp_ws1
set Gender = 'Male'
where Gender like 'M'
;


select *
from bike_comp_ws1
;

select Purchased_bike
from bike_comp_ws1
group by Purchased_bike
;

-- once all the columns are checked import data to excel by clicking on data ---> Import csv in excel








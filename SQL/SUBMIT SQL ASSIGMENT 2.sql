create database cartesian4;
use cartesian4;
create table Voucher(Voucher_Id varchar(100));
insert into Voucher values('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM');
select * from Voucher;
create table Customer(Customer_Id varchar(20));
insert into Customer values('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh');
create table output(Customer_Key varchar(20),Gift_Voucher_Key varchar(20));

 ;with cte 
 as(select *,row_number() over(order by Customer_Id) rr from Customer)
 ,cte2 as(select *,row_number() over(order by Voucher_Id) rr from Voucher)
 select Customer_Id Customer_Key,Voucher_Id Gift_Voucher_Key
 from cte c1 left
 join cte2 c2 on c1.rr=c2.rr


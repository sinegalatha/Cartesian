create database cartesian3;
use cartesian3;
create table output(bill_total int,Product_Id int);
create table outputx(Bills_Id int,Customer int,Product_Id int,Sale_Qty double,`Bill Amount` int,Bill_Date datetime);
INSERT INTO outputx (Bills_Id, Customer,Product_Id,Sale_Qty,`Bill Amount`,Bill_Date) select * from purchasehistory WHERE Bill_Date >= max(Bill_Date) - INTERVAL 30 day;
INSERT INTO output(bill_total, Product_Id) select sum(`Bill Amount`),Product_Id from outputx group by Product_Id;
create table output1(bill_total int,Product_Id int,Cat_Id int);
INSERT INTO output1 (bill_total, Product_Id, Cat_Id) select DISTINCT output.bill_total,output.Product_Id,productcatelogue.Cat_Id from productcatelogue inner join output on productcatelogue.Product_Id=output.Product_Id order by bill_total desc;
create table output2(bill_total int,Product_Id int,Cat_Id int,Sno int);
INSERT INTO output2 (bill_total, Product_Id, Cat_Id,Sno)
SELECT 
    bill_total, 
    Product_Id, 
    Cat_Id,
    ROW_NUMBER() OVER (PARTITION BY Cat_Id Order by bill_total DESC) AS Sno#
FROM output1;
select Cat_Id,Product_Id,Sno as Trending from output2 where Sno<=2;

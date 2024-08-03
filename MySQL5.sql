# How to create a database and table apply all attributes:

show databases;
create database company;
use company;
create table Merchants( EmpId int,EmpName varchar(30),Salary int,State varchar(30));
insert into Merchants values(1010,"Punkaj",56000,"Haryana");
show tables;
select*from Merchants;

# Where clause:

select*from Merchants where Salary>=50000;

# And :
select*from Merchants where Salary>=50000 and Salary<=40000;

# Or :
Select*from Merchants where Salary>=50000 or Salary<=40000;

# In :
select*from Merchants where Salary<=50000 and State in("UP","Haryana");

# Not In :
select*from Merchants where Salary<=50000 and State not in("UP","Haryana");

# Like : % , _
select*from Merchants where EmpName like '%a_';
select*from  Merchants where Empname like 'a%';
select*from Merchants where EmpName like '%n%';
select*from Merchants where State like '%y%';

# Not like :
select*from Merchants where State not like '%y%';

# Order by:
select*from Merchants order by State;
select*from Merchants order by State Desc;
select*from Merchants order by Salary;

# Order by Field :
select*from Merchants order by field(State,"Haryana","Delhi","UP");

# Limit:
select*from Merchants limit 2;
select*from Merchants order by salary desc limit 5 ;
select*from Merchants order by salary limit 3;

# Limit with offset and Order by:
select*from Merchants limit 2,5;
select*from Merchants order by Salary desc limit 3,8;

# Select Particular Column:
Select EmpName,Salary from Merchants;

# Between and Not between:
select*from Merchants where Salary between 60000 and 30000;
select*from Merchants where Salary not between 60000 and 30000;

# Alter:
#       It is used to change datatype and add or remove column in existing table .

# Add Column:
Alter table Merchants add column Department varchar(30);
select*from Merchants;

Alter table Merchants add column DeptId int after Department;

# Delete Column:
Alter table Merchants Drop Column DeptId,
Drop column Department;

# Change position:
Alter table Merchants Modify Department varchar(30) after Salary;
Alter table Merchants Modify Department varchar(30) first ;

# Change Datatype:
Alter table Merchants Modify EmpId varchar(30);
insert into Merchants values("1011","Bhoomika",49000,"UP");

# change column name in table:
Alter table Merchants change Department DeptName varchar(30);
Alter table Merchants drop column DeptName;

# Rename table:
Alter table Merchants rename Workers;
select*from Workers;
Alter table Workers rename Merchants;
select*from Merchants;

# If Clause:
Select*,
if(Salary>=50000,5000,0)Bonus from Merchants;

select*,Salary+5000 update_Salary from Merchants;
select*,if (Salary>=50000,5000,0)+Salary Salary_Bonus from Merchants;

# Case Clause:
Select*,
Case
when salary>=50000 then 5000
when salary>=30000 and salary<50000 then 3000
when salary>=20000 and salary<30000 then 1000
Else 0
End +Salary Salary_Bonus 
from Merchants;

# Update:
Update Merchants set Salary=
Case EmpId
when 1001 then 34000
when 1005 then 41000
End
where EmpId in(1001,1005);

Select*from Merchants;

# Aggregate function:
Select count(*) No_of_Employee from Merchants;
select sum(Salary) Total_Salary from Merchants;
Select max(Salary) Max_Salary from Merchants;
Select min(Salary) Min_Salary from Merchants;
Select avg(Salary) avg_Salary from Merchants; 

Select State,count(*) No_of_Employee,
Sum(Salary) Total_Salary,
Max(Salary) Max_Salary,
Min(Salary) Min_Salary,
Avg(Salary) Avg_Salary
from Merchants
Group by State;

# Group by:
select State, sum(Salary) Total_Salary 
from Merchants
Group by State;

# Group by with Having:
Select State,sum(Salary) Total_Salary
from Merchants
Group by State
having state in("UP","Haryana");

# Mod :
Select*from Merchants where Mod(Salary,2)=0;
Select*from Merchants where Mod(EmpId,2)<>0;

# Delete:
Delete from Merchants
Where Salary<=27000;

# Truncate:
Truncate table Merchants;

#Drop:
Drop table Merchants;

# Constrants:

show databases;
use Company;
create table Worker
(EmpId int Primary key Auto_increment,
Ename varchar(30) not null,
Deptname varchar(30) default 'Finance',
Salary int check(salary>=20000),
State varchar(30) unique);
Desc Worker;

insert into Worker(Ename,Salary)
values("Ritu",50000);
Select*from Worker;
insert into Worker(Ename,Salary)
values("Seema",18000);
insert into Worker(Ename,Salary)
values("Seema",28000);
insert into Worker(Ename,Salary,Deptname)
values("Divya",28000,"Sales");
insert into Worker(Ename,Salary,State)
values("Karan",35000,"Haryana");

# Delete
Delete from worker 
where EmpId=4;
select*from worker;

insert into Worker(Ename,Salary,Deptname,State)
values("Neha",28000,"IT","UP");

Delete from worker 
where EmpId=6;

Alter table worker 
auto_increment=4;

# Foreign key:

# Parent table:
create table Department
(DeptId int Primary key,
Deptname varchar(30));
Show tables;
Desc Department;

insert into Department values(1,"Finance"),
(2,"Sales"),(3,"IT");

Select*from Department;


create table Employee
(EmpID int,
EmpName varchar(30),
Saalry int,
DeptId int,
foreign key(DeptId) references Department(DeptId));

desc employee;

insert into Employee values(101,"Ankit",40000,2),
(102,"Riya",56000,1),(103,"Happy",37000,2);

Select*from Employee;

# Add and Remove constraints in existing table:
desc Merchants;
Select*from Merchants;
# Primary Key:
Alter table Merchants add primary key (EmpId);
Alter table Merchants drop primary key;
# Auto-increment:
Alter table Merchants Modify EmpId int auto_increment primary key;
Alter table Merchants drop primary key,change EmpId EmpId int;
# not null:
Alter table Merchants Modify EmpName varchar(30) not null;
Alter table Merchants Modify EmpName varchar(30);
# Default:
Alter table Merchants Alter State set default "UP";
Alter table Merchants Alter State Drop default;
# Unique:
Alter table Merchants modify EmpId int unique;
desc Merchants;
Alter table Merchants Drop index EmpId;
# Check:
Alter table Merchants Modify Salary int check (Salary>=20000);
Alter table Merchnats add check(Salary>+20000);

# Union All:
Select*from Merchants
Union All
Select*from Employee;
Select*from Merchants
Union
Select*from Employee;
Select EmpId,EmpName from Merchants
union
Select EmpId,EmpName from Employee;
Select*from Merchants where Salary>=50000 and Salary<=30000
union
Select*from Employee;
Select*from Merchants where Salary>=50000 or Salary<=30000
union
Select*from Employee;
Select*from Merchants where State in ("UP","Haryana")
union 
Select*from Employee;

Select*from Merchants where State not in("Haryana","UP")
union 
Select*from Employee;
Select*from Merchants where EmpName like 'a%'
union 
Select*from Employee where EmpName not like '%a_';

Alter table Merchants 
change EmpId Emp_Id int;
Alter table Merchants 
add column Department varchar(30);

Select*,if(Salary>=50000,5000,0)+Salary Salary_Bonus from Merchants
union
Select*,(Saalry+5000) Update_Salary from Employee;

# Join 
use Record1;
Select*from Employee E left join Department D 
on E.DeptId = D.DeptId;
Select*from Department D Right join Employee E
on D.DeptId=E.DeptId;

select D.EmpId,D.EmpName,D.Salary,
E.DeptName,L.LocationName Location
from Department D inner join Employee E
on D.DeptId=E.DeptId
inner join Location L
on D.LocationId=L.LocationId;

select D.EmpId,D.EmpName,D.Salary,
E.DeptName,L.LocationName Location
from Department D inner join Employee E
on D.DeptId=E.DeptId
inner join Location L
on D.LocationId=L.LocationId
where D.Salary>=30000;

select D.EmpId,D.EmpName,D.Salary,
E.DeptName,L.LocationName Location
from Department D inner join Employee E
on D.DeptId=E.DeptId
inner join Location L
on D.LocationId=L.LocationId;






























 





















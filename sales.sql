drop table Sales; 
create table Sales ( 
    id number(3),
    name varchar2(25),
    city varchar2(25),
    age number(3)
    );
    
insert into Sales values(1, 'Jim Smith', 'Cambridge', 51);
insert into Sales values(2, 'Tom Smith', 'Cambridge', 51);
insert into Sales values(3, 'Elane Moore', 'San Diego', 53);
insert into Sales values(4, 'John Doe', 'Worcester', 23);
insert into Sales values(5, 'Jane Doe', 'Worcester', 24);
insert into Sales values(6, 'Tom Jones', 'Boston', 41);
insert into Sales values(7, 'Mary Jones', 'Boston', 37);
insert into Sales values(8, 'Oscar Tam', 'Worcester', 17);
insert into Sales values(9, 'Ellen Brown', 'Cambridge', 21);
insert into Sales values(10, 'Art Johnson', 'Boston', 18);


update Sales 
set age = (age * 2) Where name = 'John Doe';

delete from Sales where age = 46;

select * from Sales;
    


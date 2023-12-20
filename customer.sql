drop table customer cascade constraint;
create table customer (
   customerID number(3),
   name varchar(25),
   city varchar(25),
   age number(3)
);
insert into customer values(1, 'Jim Smith', 'Cambridge', 51);
insert into customer values(2, 'Tom Smith', 'Cambridge', 51);
insert into customer values(3, 'Elane Moore', 'San Diego', 53);
insert into customer values(4, 'John Doe', 'Worcester', 23);
insert into customer values(5, 'Jane Doe', 'Worcester', 24);
insert into customer values(6, 'Tom Jones', 'Boston', 41);
insert into customer values(7, 'Mary Jones', 'Boston', 37);
insert into customer values(8, 'Oscar Tam', 'Worcester', 17);
insert into customer values(9, 'Ellen Brown', 'Cambridge', 21);
insert into customer values(10, 'Art Johnson', 'Boston', 18);
commit;

select *
from customer
where age < 25 OR age > 50;

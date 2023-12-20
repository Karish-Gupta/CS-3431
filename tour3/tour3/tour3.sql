drop table NewGuide;

Create table NewGuide (
    newGuideID number(2),
    firstName varchar2(15),
    lastName varchar2(20),
    driverLicense number(8) not null,
    title varchar2(15),
    salary number(7,2),
    licenseType varchar2(10),
    constraint NewGuideID_PK primary key (newGuideID),
    constraint NewDriverLicense_UQ unique (driverlicense),
    constraint NewLicenseType_Specific check (licenseType in ('land', 'sea', 'both'))
);
    
    
-- Part 3.1
select U.title, sum(U.salary)as SalarySum
from ((select G.title, G.salary from Guide G) 
union 
(select NG.title, NG.salary from NewGuide NG)) U
group by U.title;

    
    
-- Part 3.2

select C.firstname, C.lastname, count(L.LocationID) as Visits
from ReservedTour RT 
join Customer C on RT.customerID = C.customerID
join Location L on RT.tourID = L.tourID
group by C.firstname, C.lastname
having count(L.locationID) = (select max(Visits)
                            from (select C.customerID, count(L.locationID) as Visits
                                  from ReservedTour RT 
                                  join Customer C on RT.customerID = C.customerID
                                  join Location L on RT.tourID = L.tourID
                                  group by C.customerID));
                        


-- Part 3.3
drop table Stock;
drop table SFBook;
    
create table SFBook (
    ISBN number, 
    title varchar2(15),
    year number(4),
    price number,
    awardWinner varchar2(15),
    publisherName varchar2(15),
    constraint ISBN_PK primary key (ISBN)
    );
    
create table Stock (
    warehouseCode number,
    ISBN number,
    city varchar2(15),
    numberOfBooks number,
    constraint warehouseCode_PK primary key (warehouseCode),
    constraint ISBN_FK foreign key (ISBN) references SFBook (ISBN) on delete set null
    );  


select warehouseCode, city
from (select SF.ISBN, SF.publisherName, S.ISBN, S.warehouseCode, S.city, S.numberOfBooks
     from Stock S join SFBook SF on S.ISBN = SF.ISBN
     where SF.publisherName = 'Wiley' and S.numberOfBooks < 10) J;







    
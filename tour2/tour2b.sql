-- 2.1 
-- a.
select title, count(licensetype) as LicenseMismatches
from ReservedTour RT 
join Tour T on RT.tourID = T.tourID 
join Guide G on RT.guideID = G.guideID
where licensetype = 'land' and vehicletype = 'boat' 
or licensetype = 'sea' and vehicletype = 'car'
or licensetype = 'sea' and vehicletype = 'bus'
group by title;


-- b.
/* 
Using natual joins for this problem wil yeild a table with no data. This is becuase natural joins assume that any columns with the same name are to be joined, 
so columns that should not be joining the tables may be naturally joined. For example, ReservedTour and Tour both have price columns, 
however we are joining based on tourID NOT price. So the blind joining of columns is the reason we use theta joins, as this way we can specify the columns to join on.
*/


-- 2.2
update ReservedTour 
set price =
(select price from Tour where ReservedTour.tourID = Tour.tourID);

-- 2.3
select C.firstname, C.lastname, to_char(sum(T.price), '990.99') as TotalLandPrice
from ReservedTour RT 
join Customer C on RT.customerID = C.customerID 
join Tour T on RT.tourID = T.tourID
where vehicletype in ('bus', 'car')
group by C.firstname, C.lastname
order by to_char(sum(T.price), '990.99') desc, lastname, firstname;

-- 2.4
select T.vehicletype, L.locationtype, count(T.vehicletype) as Places
from Location L
join Tour T on L.tourID = T.tourID
group by T.vehicletype, L.locationtype
having count(T.vehicletype) > 1;


-- 2.5
select firstname || ' ' || lastname as Guidename, to_char(price * 1.10, '9,999.99') as TotalRevenue
from ReservedTour RT 
join Guide G on RT.guideID = G.guideID;




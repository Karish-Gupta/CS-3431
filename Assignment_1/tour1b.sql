--Part 2.a
Update Tour
set price = price - 100
where state in ('CA', 'NY') and price >= 100;

--Part 2.b
Select distinct * from ReservedTour natural join Guide natural join Tour
where tourname = ' Freedom Trail' or title = 'Junior Guide'
order by LastName;

--Part 2.c
Select traveldate,firstname ||' ' ||lastname as fullname, age, tourname
from ReservedTour
join Tour on ReservedTour.tourid = Tour.tourID
join Customer on ReservedTour.customerid = Customer.customerid
where age > 65 or vehicletype = 'boat'
order by tourname,fullname;

--Part 2.d
Select distinct tourname, firstname, lastname 
from ReservedTour
join Tour on ReservedTour.tourid = Tour.tourID
join Guide on reservedtour.guideid= guide.guideid
order by tourname;
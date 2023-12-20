drop table ReservedTour;
drop table Location;
drop table Customer;
drop table Tour;
drop table Guide;

drop sequence Reserved_Tour_seq;
drop sequence Customer_seq;
drop sequence Tour_seq;
drop sequence Guide_seq;

Create table Customer (
    customerID number(3),
    firstName varchar2(15),
    lastName varchar2(20),
    address varchar2(30),
    phone number(10),
    age number(3) not null,
    constraint CustomerID_PK primary key (customerID),
    constraint Phone_UQ unique (phone)
);

Create table Tour (
    tourID number(2),
    tourName varchar2(25),
    description varchar2(35),
    city varchar2(25),
    state char(2),
    vehicleType varchar2(10),
    price number(5,2),
    constraint TourID_PK primary key (tourID),
    constraint vehicle_check check (vehicleType in ('bus', 'car', 'boat'))
);

Create table Location (
    locationID char(3),
    locationName varchar2(40),
    locationType varchar2(15),
    address varchar2(40),
    tourID number(2),
    --constraint LocationID_PK primary key (locationID),
    constraint TourID_FK foreign key (tourID) references tour (tourID)on delete cascade
);

Create table Guide (
    guideID number(2),
    firstName varchar2(15),
    lastName varchar2(20),
    driverLicense number(8) not null,
    title varchar2(15),
    salary number(7,2),
    licenseType varchar2(10),
    constraint GuideID_PK primary key (guideID),
    constraint DriverLicense_UQ unique (driverlicense),
    constraint LicenseType_Specific check (licenseType in ('land', 'sea', 'both'))
);

Create table ReservedTour ( 
    reservedTourID number(3), 
    travelDate date,
    customerID number(3),
    tourID number(2),
    guideID number(2),
    price number(6,2),
    constraint ReservedTourID_PK primary key (reservedTourID),
    constraint Customer_FK foreign key (customerID) references Customer (customerID) on delete set null,
    constraint Tour_FK foreign key (tourID) references Tour (tourID) on delete set null,
    constraint Guide_FK foreign key (guideID) references Guide (guideID) on delete set null
    );
    
create sequence Reserved_Tour_seq start with 100 increment by 5;
create sequence Customer_seq start with 1;
create sequence Tour_seq start with 1;
create sequence Guide_seq start with 1;

-- Insert data Guide
Insert into Guide values (1, 'Emily', 'Williams', 74920983, 'Senior Guide', 24125.00, 'land');
Insert into Guide values (2, 'Ethan', 'Brown', 72930684, 'Guide', 30500.00, 'sea');
Insert into Guide values (3, 'Chloe', 'Jones', 50973848, 'Senior Guide', 27044.00, 'both');
Insert into Guide values (4, 'Ben', 'Miller', 58442323, 'Junior Guide', 32080.00, 'both');
Insert into Guide values (5, 'Mia', 'Davis', 56719583, 'Junior Guide', 49000.00, 'land');
Insert into Guide values (6, 'Noah', 'Garcia', 93291234, 'Guide', 22000.00, 'land');
Insert into Guide values (7, 'Liam', 'Rodriguez', 58799394, 'Junior Guide', 31750.00, 'sea');
Insert into Guide values (8, 'Mason', 'Wilson', 88314545, 'Senior Guide', 45000.00, 'land');
Insert into Guide values (9, 'Olivia', 'Smith', 82391452, 'Junior Guide', 25025.00, 'sea');
Insert into Guide values (10, 'Sofia', 'Johnson', 12930638, 'Guide', 47000.00, 'both');


-- Insert data for Tour
Insert into Tour values('1', 'Alcatraz',  'Alcatraz Island',  'San Francisco',  'CA',  'boat', 75.5);
Insert into Tour values('2', 'Magnificent Mile',  'Tour of Michigan Ave',  'Chicago',  'IL',  'bus', 22.75);
Insert into Tour values('3', 'Duck Tour',  'Aquatic tour of the Charles River',  'Boston',  'MA',  'boat', 53.99);
Insert into Tour values('4', 'Freedom Trail',  'Historic tour of Boston',  'Boston',  'MA',  'car', 34.25);
Insert into Tour values('5', 'NY Museums',  'Tour of NYC Museums',  'New York',  'NY',  'bus', 160.8);


-- Insert data for Customer
Insert into Customer values (1, 'Michael', 'Davis', '8711 Meadow St.', 2497873464, 67);
Insert into Customer values (2, 'Lisa', 'Ward', '17 Valley Drive', 9865553232, 20);
Insert into Customer values (3, 'Brian', 'Gray', '1212 8th St.', 4546667821, 29);
Insert into Customer values (4, 'Nicole', 'Myers', '9 Washington Court', 9864752346, 18);
Insert into Customer values (5, 'Kelly', 'Ross', '98 Lake Hill Drive', 8946557732, 26);
Insert into Customer values (6, 'Madison', 'Powell', '100 Main St.', 8915367188, 57);
Insert into Customer values (7, 'Ashley', 'Martin', '42 Oak St.', 1233753684, 73);
Insert into Customer values (8, 'Joshua', 'White', '1414 Cedar St.', 6428369619, 18);
Insert into Customer values (9, 'Tyler', 'Clark', '42 Elm Place', 1946825344, 22);
Insert into Customer values (10, 'Anna', 'Young', '657 Redondo Ave.', 7988641411, 25);
Insert into Customer values (11, 'Justin', 'Powell', '5 Jefferson Ave.', 2324648888, 17);
Insert into Customer values (12, 'Bruce', 'Allen', '143 Cambridge Ave.', 5082328798, 45);
Insert into Customer values (13, 'Rachel', 'Sanchez', '77 Massachusetts Ave.', 6174153059, 68);
Insert into Customer values (14, 'Dylan', 'Lee', '175 Forest St.', 2123043923, 19);
Insert into Customer values (15, 'Austin', 'Garcia', '35 Tremont St.', 7818914567, 82);


-- Insert data Location
Insert into Location values('AI1', 'San Francisco Pier 33',  'Historic',  'Pier 33 Alcatraz Landing',  1);
Insert into Location values('AI2', 'Alcatraz Ferry Terminal',  'Historic',  'Ferry Terminal',  1);
Insert into Location values('AI3', 'Agave Trail',  'Park',  'Alcatraz Agave Trail',  1);
Insert into Location values('MM1', 'Art Institute',  'Museum',  '111 S Michigan Avenue',  2);
Insert into Location values('MM2', 'Chicago Tribune',  'Historic',  '435 N Michigan Avenue',  2);
Insert into Location values('MM3', 'White Castle',  'Restaurant',  'S Wabash Avenue',  2);
Insert into Location values('DT1', 'Charles River',  'Historic',  '10 Mass Avenue',  3);
Insert into Location values('DT2', 'Salt and Pepper Bridge',  'Historic',  '100 Broadway',  3);
Insert into Location values('FT1', 'Boston Common',  'Park',  '139 Tremont Street',  4);
Insert into Location values('FT2', 'Kings Chapel',  'Historic',  '58 Tremont Street',  4);
Insert into Location values('FT3', 'Omni Parker House',  'Restaurant',  '60 School Street',  4);
Insert into Location values('FT4', 'Paul Revere House',  'Historic',  '19 North Square',  4);
Insert into Location values('FT5', 'Bunker Hill Monument',  'Historic',  'Monument Square',  4);
Insert into Location values('NY1', 'Metropolitan Museum of Art',  'Museum',  '1000 5th Ave',  5);
Insert into Location values('NY2', 'Museum of Modern Art',  'Museum',  '11 W 53rd St',  5);
Insert into Location values('NY3', 'New York Botanical Garden',  'Park',  '2900 Southern Boulevard',  5);
Insert into Location values('NY4', 'New Museum',  'Museum',  '235 Bowery',  5);


-- Insert data for ReservedTour
Insert into ReservedTour values (100, '6-Feb-18', 6, 1, 2, NULL);
Insert into ReservedTour values (105, '31-Aug-18', 14, 3, 5, NULL);
Insert into ReservedTour values (110, '10-Apr-19', 11, 4, 1, NULL);
Insert into ReservedTour values (115, '29-Jul-18', 7, 2, 4, NULL);
Insert into ReservedTour values (120, '15-Mar-18', 14, 3, 2, NULL);
Insert into ReservedTour values (125, '28-Feb-19', 12, 4, 6, NULL);
Insert into ReservedTour values (130, '3-Jun-18', 14, 4, 2, NULL);
Insert into ReservedTour values (135, '17-May-18', 5, 1, 10, NULL);
Insert into ReservedTour values (140, '11-Apr-19', 9, 5, 3, NULL);
Insert into ReservedTour values (145, '24-Nov-18', 13, 4, 9, NULL);
Insert into ReservedTour values (150, '3-Aug-18', 3, 5, 7, NULL);
Insert into ReservedTour values (155, '13-Dec-17', 2, 1, 7, NULL);
Insert into ReservedTour values (160, '9-Nov-17', 4, 5, 1, NULL);
Insert into ReservedTour values (165, '21-Jan-19', 10, 2, 10, NULL);
Insert into ReservedTour values (170, '11-Dec-17', 5, 1, 7, NULL);
Insert into ReservedTour values (175, '12-Aug-18', 1, 3, 5, NULL);
Insert into ReservedTour values (180, '22-Jun-18', 5, 3, 8, NULL);
Insert into ReservedTour values (185, '1-Feb-19', 8, 2, 9, NULL);
Insert into ReservedTour values (190, '15-Oct-17', 15, 4, 8, NULL);
Insert into ReservedTour values (195, '8-Mar-18', 4, 1, 3, NULL);

Select * from Customer;
Select * from Tour;
Select * from Guide;
Select * from Location;
Select * from ReservedTour;

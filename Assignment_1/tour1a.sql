drop table ReservedTour;
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
    lastname varchar2(20),
    address varchar2(30),
    phone number(10),
    age number(3),
    constraint CustomerID_PK primary key (customerID)
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
    
Create table Guide (
    guideID number(2),
    FirstName varchar2(15),
    LastName varchar2(20),
    driverLicense number(8)Not Null,
    Title varchar2(15),
    Salary number(7,2),
    constraint GuideID_PK primary key (guideID),
    constraint driverLicense_UQ unique (driverlicense)
    );
    
Create table ReservedTour (
    ReservedTourID number(3),
    travelDate date,
    customerID number(3),
    tourID number(2),
    guideID number(2),
    constraint ReservedTourID_PK primary key (ReservedTourID),
    constraint Customer_FK foreign key (customerID) references Customer (customerID) on delete set null,
    constraint Tour_FK foreign key (tourID) references Tour (tourID) on delete set null,
    constraint Guide_FK foreign key (guideID) references Guide (guideID) on delete set null
    );
  
create sequence Reserved_Tour_seq start with 100 increment by 5;
create sequence Customer_seq start with 1;
create sequence Tour_seq start with 1;
create sequence Guide_seq start with 1;


Insert into Customer values (Customer_seq.nextval, 'Michael', 'Davis', '8711 Meadow St.', '2497873464', 67);
Insert into Customer values (Customer_seq.nextval, 'Lisa', 'Ward', '17 Valley Drive', '9865553232', 20);
Insert into Customer values (Customer_seq.nextval, 'Brian', 'Gray', '1212 8th St.', '4546667821', 29);
Insert into Customer values (Customer_seq.nextval, 'Nicole', 'Myers', '9 Washington Court', '9864752346', 18);
Insert into Customer values (Customer_seq.nextval, 'Kelly', 'Ross', '98 Lake Hill Drive', '8946557732', 26);
Insert into Customer values (Customer_seq.nextval, 'Madison', 'Powell', '100 Main St.', '8915367188', 57);
Insert into Customer values (Customer_seq.nextval, 'Ashley', 'Martin', '42 Oak St.', '1233753684', 73);
Insert into Customer values (Customer_seq.nextval, 'Joshua', 'White', '1414 Cedar St.', '6428369619', 18);
Insert into Customer values (Customer_seq.nextval, 'Tyler', 'Clark', '42 Elm Place', '1946825344', 22);
Insert into Customer values (Customer_seq.nextval, 'Anna', 'Young', '657 Redondo Ave.', '7988641411', 25);
Insert into Customer values (Customer_seq.nextval, 'Justin', 'Powell', '5 Jefferson Ave.', '2324648888', 17);
Insert into Customer values (Customer_seq.nextval, 'Bruce', 'Allen', '143 Cambridge Ave.', '5082328798', 45);
Insert into Customer values (Customer_seq.nextval, 'Rachel', 'Sanchez', '77 Massachusetts Ave.', '6174153059', 68);
Insert into Customer values (Customer_seq.nextval, 'Dylan', 'Lee', '175 Forest St.', '2123043923', 19);
Insert into Customer values (Customer_seq.nextval, 'Austin', 'Garcia', '35 Tremont St.', '7818914567', 82);
     

Insert into Tour values (Tour_seq.nextval, 'Alcatraz', 'Alcatraz Island', 'San Francisco', 'CA', 'boat', 75.50);
Insert into Tour values (Tour_seq.nextval, 'Magnificent Mile', 'Tour of Michigan Ave', 'Chicago', 'IL', 'bus', 22.75);
Insert into Tour values (Tour_seq.nextval, 'Duck Tour', 'Aquatic tour of the Charles River', 'Boston', 'MA', 'boat', 53.99);
Insert into Tour values (Tour_seq.nextval, 'Freedom Trail', 'Historic tour of Boston', 'Boston', 'MA', 'car', 34.25);
Insert into Tour values (Tour_seq.nextval, 'NY Museums Tour', 'Tour of NYC Museums', 'New York', 'NY', 'bus', 160.80);
    

    
Insert into Guide values (Guide_seq.nextval, 'Emily', 'Williams', 74920983, 'Senior Guide', 24125);
Insert into Guide values (Guide_seq.nextval, 'Ethan', 'Brown', 72930684, 'Guide', 30500);
Insert into Guide values (Guide_seq.nextval, 'Chloe', 'Jones', 50973848, 'Senior Guide', 27044);
Insert into Guide values (Guide_seq.nextval, 'Ben', 'Miller', 58442323, 'Junior Guide', 32080);
Insert into Guide values (Guide_seq.nextval, 'Mia', 'Davis', 56719583, 'Junior Guide', 49000);
Insert into Guide values (Guide_seq.nextval, 'Noah', 'Garcia', 93291234, 'Guide', 22000);
Insert into Guide values (Guide_seq.nextval, 'Liam', 'Rodriguez', 58799394, 'Junior Guide', 31750);
Insert into Guide values (Guide_seq.nextval, 'Mason', 'Wilson', 88314545, 'Senior Guide', 45000);
Insert into Guide values (Guide_seq.nextval, 'Olivia', 'Smith', 82391452, 'Junior Guide', 25025);
Insert into Guide values (Guide_seq.nextval, 'Sofia', 'Johnson', 12930638, 'Guide', 47000);
    

   
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '6-Feb-18', 6, 1, 2);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '31-Aug-18', 14, 3, 5);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '10-Apr-19', 11, 4, 1);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '29-Jul-18', 7, 2, 4);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '15-Mar-18', 14, 3, 2);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '28-Feb-19', 12, 4, 6);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '3-Jun-18', 14, 4, 2);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '17-May-18', 5, 1, 10);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '11-Apr-19', 9, 5, 3);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '24-Nov-18', 13, 4, 9);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '3-Aug-18', 3, 5, 7);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '13-Dec-17', 2, 1, 7);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '9-Nov-17', 4, 5, 1);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '21-Jan-19', 10, 2, 10);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '11-Dec-17', 5, 1, 7);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '12-Aug-18', 1, 3, 5);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '22-Jun-18', 5, 3, 8);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '1-Feb-19', 8, 2, 9);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '15-Oct-17', 15, 4, 8);
Insert into ReservedTour values (Reserved_Tour_seq.nextval, '8-Mar-18', 4, 1, 3);

Select * from Tour;

Select * from Guide;

Select * from Customer;

Select * from ReservedTour;


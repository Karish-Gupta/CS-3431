drop table Path;
drop table Edge;
drop table Hallway;
drop table Office;
drop table PhoneExtensions;
drop table Titles;
drop table CompSciEmployee;
drop table Location;


create table Location (
    locationID varchar(4),
    locationName varchar2(25),
    locationtype varchar2(25),
    xCoordinate number(3),
    yCoordinate number(3),
    floor varchar2(1),
    constraint locationID_UQ unique (locationID),
    constraint Coordinates_UQ unique (floor, xCoordinate, yCoordinate)
    );
    
create table CompSciEmployee (
    accountName varchar2(25),
    firstName varchar2(25) Not Null,
    lastName varchar2(25) Not Null,
    officeLocationID varchar(4),
    constraint CompSciEmployeeAccountName_UQ unique (accountName)
    --constraint OfficeLocation_FK foreign key (officeLocationID) references Office (locationID)
    );
    
create table PhoneExtensions (
        phoneExtensions number(4),
        accountName varchar2(25),
        constraint PhoneExtensionAccountName_FK foreign key (accountName) references CompSciEmployee (accountName)
        );
        
create table Titles (
    titleName varchar2(50),
    acronym varchar2(15),
    accountName varchar2(25),
    constraint TitleAccountName_FK foreign key (accountName) references CompSciEmployee (accountName)
    );

create table Edge (
    startLocation varchar2(4),
    endLocation varchar2(4),
    edgeID number(3),
    constraint EdgeID_PK primary key (edgeID),
    constraint EdgeStartLocation foreign key (startLocation) references Location(locationID),
    constraint EdgeEndLocation foreign key (endLocation) references Location(locationID),
    constraint Edge_UQ unique (startLocation, endLocation)
);

create table Path (
    PathID number(3),
   edge_1 number(3) references Edge (edgeID),
   edge_2 number(3) references Edge (edgeID),
   edge_3 number(3) references Edge (edgeID),
   edge_4 number(3) references Edge (edgeID),
   edge_5 number(3) references Edge (edgeID),
   edge_6 number(3) references Edge (edgeID),
   edge_7 number(3) references Edge (edgeID),
   edge_8 number(3) references Edge (edgeID),
   edge_9 number(3) references Edge (edgeID),
   edge_10 number(3) references Edge (edgeID)
   );


create table Hallway(
    locationID varchar2(4),
    locationName varchar2(25),
    locationType varchar2(25),
    xCoordinate number(3),
    yCoordinate number(3), 
    description varchar2(25),
    constraint HallwayLocationID_FK foreign key (locationID) references Location(locationID)
    );


create table Office (
    locationID varchar2(4),
    locationName varchar2(25),
    locationType varchar2(25),
    xCoordinate number(3),
    yCoordinate number(3), 
    constraint OfficeLocationID_FK foreign key (locationID) references Location(locationID)
    );
    

-- insert Statements 
insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('307', 'FL307', 'Office', 900, 440, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('308', 'FL308', 'Office', 900, 335, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('311', 'FL311', 'Conference Room', 900, 375, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('312', 'FL312', 'Office', 945, 510, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('314', 'FL314', 'Office', 845, 660, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('316', 'FL316', 'Office', 845, 760, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('317', 'FL317', 'Office', 925, 670, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('318', 'FL318', 'Office', 950, 700, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('319', 'FL319', 'Office', 925, 735, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('320', 'FL320', 'Lecture Hall', 900, 920, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3E1', '3rd Floor Elevator', 'Elevator', 820, 415, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H1', 'FL3H1', 'Hallway', 790, 150, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H2', 'FL3H2', 'Hallway', 790, 340, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H3', 'FL3H3', 'Hallway', 790, 375, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H4', 'FL3H4', 'Hallway', 790, 420, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H5', 'FL3H5', 'Hallway', 790, 465, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H6', 'FL3H6', 'Hallway', 900, 465, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H7', 'FL3H7', 'Hallway', 900, 510, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H8', 'FL3H8', 'Hallway', 790, 660, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H9', 'FL3H9', 'Hallway', 790, 700, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H10', 'FL3H10', 'Hallway', 925, 700, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H11', 'FL3H11', 'Hallway', 790, 755, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H12', 'FL3H12', 'Hallway', 790, 925, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3H13', 'FL3H13', 'Hallway', 840, 920, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3S1', '3rd Floor Staircase 1', 'Staircase', 835, 340, '3');

insert into Location (locationID, locationName, locationType, xCoordinate, yCoordinate, floor)
values ('3S2', '3rd Floor Staircase 2', 'Staircase', 840, 965, '3');


-- insert values for CompSciEmployee
insert into CompSciEmployee values ('ruiz', 'Carolina', 'Ruiz', '232');
insert into CompSciEmployee values ('rich', 'Charles', 'Rich', 'B25b');
insert into CompSciEmployee values ('ccaron', 'Christine', 'Caron', '233');
insert into CompSciEmployee values ('cshue', 'Craig', 'Shue', '236');
insert into CompSciEmployee values ('cew', 'Craig', 'Wills', '234');
insert into CompSciEmployee values ('dd', 'Daniel', 'Dougherty', '231');
insert into CompSciEmployee values ('deselent', 'Douglas', 'Selent', '144');
insert into CompSciEmployee values ('rundenst', 'Elke', 'Rundensteiner', '135');
insert into CompSciEmployee values ('emmanuel', 'Emmanuel', 'Agu', '139');
insert into CompSciEmployee values ('heineman', 'George', 'Heineman', 'B20');
insert into CompSciEmployee values ('ghamel', 'Glynis', 'Hamel', '132');
insert into CompSciEmployee values ('lauer', 'Hugh', 'Lauer', '144');
insert into CompSciEmployee values ('jleveillee', 'John', 'Leveillee', '244');
insert into CompSciEmployee values ('josephbeck', 'Joseph', 'Beck', '138');
insert into CompSciEmployee values ('kfisler', 'Kathryn', 'Fisler', '130');
insert into CompSciEmployee values ('kven', 'Krishna', 'Venkatasubramanian', '137');
insert into CompSciEmployee values ('claypool', 'Mark', 'Claypool', 'B24');
insert into CompSciEmployee values ('hofri', 'Micha', 'Hofri', '133');
insert into CompSciEmployee values ('ciaraldi', 'Michael', 'Ciaraldi', '129');
insert into CompSciEmployee values ('mvoorhis', 'Michael', 'Voorhis', '245');
insert into CompSciEmployee values ('meltabakh', 'Mohamed', 'Eltabakh', '235');
insert into CompSciEmployee values ('nth', 'Neil', 'Heffernan', '237');
insert into CompSciEmployee values ('nkcaligiuri', 'Nicole', 'Caligiuri', '233');
insert into CompSciEmployee values ('rcane', 'Refie', 'Cane', '233');
insert into CompSciEmployee values ('tgannon', 'Thomas', 'Gannon', '243');
insert into CompSciEmployee values ('wwong2', 'Wilson', 'Wong', 'B19');



insert into PhoneExtensions (phoneExtensions, accountName)
values (5640, 'ruiz');

insert into PhoneExtensions (phoneExtensions, accountName)  
values (5945, 'rich');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5678, 'ccaron');

insert into PhoneExtensions (phoneExtensions, accountName)
values (4933, 'cshue');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5357,'cew');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5622,'cew');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5621, 'dd');

insert into PhoneExtensions (phoneExtensions, accountName) 
values (5493, 'deselent');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5815, 'rundenst');  

insert into PhoneExtensions (phoneExtensions, accountName)
values (5568, 'emmanuel');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5502, 'heineman'); 

insert into PhoneExtensions (phoneExtensions, accountName)
values (5252, 'ghamel');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5493, 'lauer');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5822, 'jleveillee');

insert into PhoneExtensions (phoneExtensions, accountName)  
values (6156, 'josephbeck');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5118, 'kfisler');

insert into PhoneExtensions (phoneExtensions, accountName)
values (6571, 'kven');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5409, 'claypool');

insert into PhoneExtensions (phoneExtensions, accountName) 
values (6911, 'hofri');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5117, 'ciaraldi'); 

insert into PhoneExtensions (phoneExtensions, accountName)  
values (5669,'mvoorhis');

insert into PhoneExtensions (phoneExtensions, accountName)  
values (5674, 'mvoorhis');

insert into PhoneExtensions (phoneExtensions, accountName)
values (6421, 'meltabakh');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5569, 'nth');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5357, 'nkcaligiuri');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5357, 'rcane');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5357, 'tgannon');

insert into PhoneExtensions (phoneExtensions, accountName)
values (5706, 'wwong2');


insert into Titles (titleName, acronym, accountName)
values ('Associate Professor', 'Assoc Prof', 'ruiz');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'rich');

insert into Titles (titleName, acronym, accountName)
values ('Administrative Assistant VI', 'Admin 6', 'ccaron');

insert into Titles (titleName, acronym, accountName) 
values ('Assistant Professor', 'Asst Prof', 'cshue');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'cew');

insert into Titles (titleName, acronym, accountName)
values ('Department Head', 'DeptHead', 'cew');

insert into Titles (titleName, acronym, accountName) 
values ('Professor', 'Prof', 'dd');

insert into Titles (titleName, acronym, accountName)
values ('Assistant Teaching Professor', 'Asst TProf', 'deselent');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'rundenst');

insert into Titles (titleName, acronym, accountName)
values ('Coordinator of Mobile Graphics Research Group', 'C-MGRG', 'emmanuel');

insert into Titles (titleName, acronym, accountName)
values ('Associate Professor', 'Assoc Prof', 'emmanuel');

insert into Titles (titleName, acronym, accountName)  
values ('Associate Professor', 'Assoc Prof', 'heineman'); 

insert into Titles (titleName, acronym, accountName)
values ('Senior Instructor', 'SrInst', 'ghamel');

insert into Titles (titleName, acronym, accountName)
values ('Teaching Professor', 'TProf', 'lauer');

insert into Titles (titleName, acronym, accountName)
values ('Lab Manager I', 'Lab1', 'jleveillee');

insert into Titles (titleName, acronym, accountName)
values ('Associate Professor', 'Assoc Prof', 'josephbeck');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'kfisler'); 

insert into Titles (titleName, acronym, accountName)  
values ('Assistant Professor', 'Asst Prof', 'kven');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'claypool');

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'hofri');

insert into Titles (titleName, acronym, accountName) 
values ('Senior Instructor', 'SrInst', 'ciaraldi');

insert into Titles (titleName, acronym, accountName)
values ('Lab Manager II', 'Lab2', 'mvoorhis');

insert into Titles (titleName, acronym, accountName)
values ('Associate Professor', 'Assoc Prof', 'meltabakh');

insert into Titles (titleName, acronym, accountName)
values ('Director of Learn Sciences and Technologies', 'Dir-LST', 'nth');  

insert into Titles (titleName, acronym, accountName)
values ('Professor', 'Prof', 'nth');  

insert into Titles (titleName, acronym, accountName) 
values ('Administrative Assistant V', 'Admin 5', 'nkcaligiuri');

insert into Titles (titleName, acronym, accountName)
values ('Graduate Admin Coordinator', 'GradAdmin', 'rcane'); 

insert into Titles (titleName, acronym, accountName)
values ('Adjunct Associate Professor', 'Adj Assoc Prof', 'tgannon');

insert into Titles (titleName, acronym, accountName)
values ('Assistant Professor', 'Asst Prof', 'wwong2');

drop sequence edgeID_seq;

create sequence edgeID_Seq
start with 1
increment by 1;

insert into Edge values ('3H1', '3H2', edgeID_Seq.nextval);

insert into Edge values ('3H2', '3H3', edgeID_Seq.nextval);

insert into Edge values ('3H3', '3H4', edgeID_Seq.nextval);

insert into Edge  values ('3H4', '3H5', edgeID_Seq.nextval);

insert into Edge values ('3H5', '3H6', edgeID_Seq.nextval);

insert into Edge values ('3H6', '3H7', edgeID_Seq.nextval);

insert into Edge values ('3H4', '3E1', edgeID_Seq.nextval);

insert into Edge  values ('3H2', '3S1', edgeID_Seq.nextval);

insert into Edge values ('3H8', '3H9', edgeID_Seq.nextval);

insert into Edge values ('3H9', '3H10', edgeID_Seq.nextval);

insert into Edge values ('3H9', '3H11', edgeID_Seq.nextval);  

insert into Edge values ('3H11', '3H12', edgeID_Seq.nextval);  

insert into Edge values ('3H12', '3H13', edgeID_Seq.nextval);

insert into Edge values ('3H13', '3S2', edgeID_Seq.nextval);

insert into Edge values ('3H3', '311', edgeID_Seq.nextval);

insert into Edge values ('311', '308', edgeID_Seq.nextval);

insert into Edge values ('3H6', '307', edgeID_Seq.nextval);

insert into Edge values ('3H7', '312', edgeID_Seq.nextval);

insert into Edge values ('3H8', '314', edgeID_Seq.nextval);

insert into Edge values ('3H10', '317', edgeID_Seq.nextval);

insert into Edge values ('3H10', '318', edgeID_Seq.nextval);

insert into Edge values ('3H10', '319', edgeID_Seq.nextval);

insert into Edge values ('3H11', '316', edgeID_Seq.nextval);

insert into Edge values ('3H13', '320', edgeID_Seq.nextval);

insert into Edge values ('3H5', '3H8', edgeID_Seq.nextval);

-- insert Edges other way
insert into Edge values ('3H2', '3H1', edgeID_Seq.nextval);

insert into Edge values ('3H3', '3H2', edgeID_Seq.nextval);

insert into Edge values ('3H4', '3H3', edgeID_Seq.nextval);

insert into Edge  values ('3H5', '3H4', edgeID_Seq.nextval);

insert into Edge values ('3H6', '3H5', edgeID_Seq.nextval);

insert into Edge values ('3H7', '3H6', edgeID_Seq.nextval);

insert into Edge values ('3E1', '3H4', edgeID_Seq.nextval);

insert into Edge  values ('3H1', '3S2', edgeID_Seq.nextval);

insert into Edge values ('3H9', '3H8', edgeID_Seq.nextval);

insert into Edge values ('3H10', '3H9', edgeID_Seq.nextval);

insert into Edge values ('3H11', '3H9', edgeID_Seq.nextval);  

insert into Edge values ('3H12', '3H11', edgeID_Seq.nextval);  

insert into Edge values ('3H13', '3H12', edgeID_Seq.nextval);

insert into Edge values ('3S2', '3H13', edgeID_Seq.nextval);

insert into Edge values ('311', '3H3', edgeID_Seq.nextval);

insert into Edge values ('308', '311', edgeID_Seq.nextval);

insert into Edge values ('307', '3H6', edgeID_Seq.nextval);

insert into Edge values ('312', '3H7', edgeID_Seq.nextval);

insert into Edge values ('314', '3H8', edgeID_Seq.nextval);

insert into Edge values ('317', '3H10', edgeID_Seq.nextval);

insert into Edge values ('318', '3H10', edgeID_Seq.nextval);

insert into Edge values ('319', '3H10', edgeID_Seq.nextval);

insert into Edge values ('316', '3H11', edgeID_Seq.nextval);

insert into Edge values ('320', '3H13', edgeID_Seq.nextval);

insert into Edge values ('3H8', '3H5', edgeID_Seq.nextval);

-- insert Hallways and Offices

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H1', 'FL3H1', 'Hallway', 790, 150, '3rd Floor Hallway 1');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H2', 'FL3H2', 'Hallway', 790, 340, '3rd Floor Hallway 2');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H3', 'FL3H3', 'Hallway', 790, 375, '3rd Floor Hallway 3');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H4', 'FL3H4', 'Hallway', 790, 420, '3rd Floor Hallway 4');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H5', 'FL3H5', 'Hallway', 790, 465, '3rd Floor Hallway 5');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H6', 'FL3H6', 'Hallway', 900, 465, '3rd Floor Hallway 6');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H7', 'FL3H7', 'Hallway', 900, 510, '3rd Floor Hallway 7');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H8', 'FL3H8', 'Hallway', 790, 660, '3rd Floor Hallway 8');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H9', 'FL3H9', 'Hallway', 790, 700, '3rd Floor Hallway 9');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H10', 'FL3H10', 'Hallway', 925, 700, '3rd Floor Hallway 10');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H11', 'FL3H11', 'Hallway', 790, 755, '3rd Floor Hallway 11');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H12', 'FL3H12', 'Hallway', 790, 925, '3rd Floor Hallway 12');

insert into Hallway (locationID, locationName, locationType, xCoordinate, yCoordinate, description)
values ('3H13', 'FL3H13', 'Hallway', 840, 920, '3rd Floor Hallway 13');

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('307', 'FL307', 'Office', 900, 440);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('308', 'FL308', 'Office', 900, 335);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('312', 'FL312', 'Office', 945, 510);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('314', 'FL314', 'Office', 845, 660);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('316', 'FL316', 'Office', 845, 760);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('317', 'FL317', 'Office', 925, 670);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('318', 'FL318', 'Office', 950, 700);

insert into Office (locationID, locationName, locationType, xCoordinate, yCoordinate)
values ('319', 'FL319', 'Office', 925, 735);

-- Creating PathID's with sequence
drop sequence PathID_seq;

create sequence PathID_Seq
start with 1
increment by 1;
-- Path insert Data

insert into Path values(PathID_seq.nextval, 32, 4, 25, 9, 11, 12, 13, 24, NULL, NUll);

insert into Path values(PathID_seq.nextval, 43, 31, 30, 25, 9, 10, 22, NULL, NULL, NULL);

insert into Path values(PathID_seq.nextval, 39, 38, 37, 36, 34, 50, 29, 28, 15, 16);
 
 

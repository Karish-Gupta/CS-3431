-- 1. No Lab Managers with view

create view OfficeStaffCounts as 
select o.officeID, count(*) as numStaff  
from Offices o join CSStaff s on o.officeID = s.officeID
group by o.officeID;

create view NonLabMgrCounts as
select s.officeID, count(*) as numNonLabMgr
from CSStaff s join CSStaffTitles t on s.accountName = t.accountName
where t.acronym != 'Lab1' and t.acronym != 'Lab2'  
group by s.officeID;

SELECT o.officeID, n.numNonLabMgr as NumNonLabMgrs
FROM OfficeStaffCounts o join NonLabMgrCounts n on o.officeID = n.officeID
WHERE o.numStaff > n.numNonLabMgr;

-- Number of Staff with procedure
create or replace procedure NumberOfStaff(officeid in varchar2)
is
  emp_count number;   
begin
    emp_count := 0;
    select count(*) into emp_count
    from CSStaff
    where officeid = NumberOfStaff.officeid;
    
    dbms_output.put_line('Number of staff at office ' || officeid || ': ' || emp_count);
end;
/

set serveroutput on;
execute NumberOfStaff('233');

-- No Same Locaions 1.
create or replace trigger NoSameLocations
before insert or update on Edges
for each row
declare
  edge_count number;
begin
  select count(*) into edge_count
  from Edges
  where startinglocationid = :new.startinglocationid
    and endinglocationid = :new.endinglocationid;
  
  if edge_count > 0 then
    raise_application_error(-20000, 'Duplicate edge locations');
  end if;
end;
/

-- Cross Floor Edge 2. 
create or replace trigger CrossFloorEdge
before insert or update on Edges
for each row
declare
  v_start_floor char(1);
  v_end_floor char(1);  
begin
  select mapFloor into v_start_floor
  from Locations
  where locationId = :new.startingLocationId;

  select mapFloor into v_end_floor
  from Locations
  where locationId = :new.endingLocationId;

  if v_start_floor != v_end_floor and
    not (:new.startingLocationId like '%E%' and :new.endingLocationId like '%E%') and 
    not (:new.startingLocationId like '%S%' and :new.endingLocationId like '%S%') then
    
    raise_application_error(-20001, 'Cannot add cross-floor edge');
  end if;
  
end;
/

-- Must Be Office 3.
create or replace trigger MustBeOffice
before insert or update on Offices
for each row
declare
  v_type varchar2(15);
begin
    select locationtype into v_type
    from locations
    where locationid = :new.officeid;
    
    if v_type != 'Office' then
      raise_application_error(-20002, 'Location is not an office'); 
    end if;
  
end;
/

-- Title Limit 4.
create or replace trigger TitleLimit
before insert or update on CSStaffTitles
begin
  for r in (select accountName, count(*) as title_count 
            from CSStaffTitles
            where acronym <> 'Lab1' or acronym <> 'Lab2'  
            group by accountName 
            having count(*) >= 3) loop
    raise_application_error(-20003, 'Professor ' || r.accountName || ' already has 3 titles');
  end loop;
end;
/


---NoSameLocations trigger---
insert into Edges (edgeid, startinglocationid, endinglocationid)
values ('2H1_2H2', '2H1', '2H2');

---CrossFloorEdge trigger---
insert into Edges (edgeid, startinglocationid, endinglocationid) 
values ('3H1_2H1', '3H1', '2H1');

---MustBeOffice trigger---
insert into Offices (officeId) values ('222');

insert into Offices (officeId) values ('233');

---TitleLimit trigger---
insert into CSStaffTitles (accountname, acronym) values ('cew', 'Dir-DS');
insert into CSStaffTitles (accountname, acronym) values ('cew', 'SrInst');
insert into CSStaffTitles (accountname, acronym) values ('cew', 'Dir-LST');

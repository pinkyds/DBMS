create table borrower(rollin int primary key,name varchar(20),dateofissue date,nameofbook varchar(20),status varchar(20));
desc borrower;
create table fine(rollno int,foreign key(rollno) references borrower(rollin),returndate date,amount int);
desc fine;
insert into borrower values(1,'abc','2017-08-01','SEPM','PEN')$
insert into borrower values(2,'xyz','2017-07-01','DBMS','PEN')$
insert into borrower values(3,'pqr','2017-08-15','DBMS','PEN')$

delimiter 
create procedure calc_fine_lib6(in roll int) 
begindeclare fine1 int;
declare noofdays int;
declare issuedate date;
declare exit handler for SQLEXCEPTION select'create table definition';
select dateofissue into issuedate from borrower where rollin=roll;
select datediff(curdate(),issuedate) into noofdays;
if noofdays>15 and noofdays<=30 thenset fine1=noofdays*5;
insert into fine values(roll,curdate(),fine1);
elseif noofdays>30 thenset fine1=((noofdays-30)*50) + 15*5;
insert into fine values(roll,curdate(),fine1);
elseinsert into fine values(roll,curdate(),0);
end if;
update borrower set status='return' where rollin=roll;
end $

call calc_fine_lib6(1)$
call calc_fine_lib6(2)$
call calc_fine_lib6(3)$

select * from fine$;
drop table fine$
call calc_fine_lib6(1)$

create table fine(rollno int,foreign key(rollno) references borrower(rollin),returndatedate,amount int)$
call calc_fine_lib6(1)$
select * from fine$

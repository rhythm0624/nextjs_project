-- created database
create database univdb;

-- create studentss table
create table studentss (
sid int primary key,
name varchar(50),
age int,
email varchar(50)
); 
-- CREATE using procedure
create procedure addst(
@sid int,
@name varchar(50),
@age int,
@email varchar(50)
)
AS
begin
insert into studentss(sid, name,age,email)
values (@sid,@name,@age,@email);
end;
go
exec addst 101, 'alok', 19,'aloksharma@gmail.com';
exec addst 102, 'shruti',23,'shruti@gmail.com';

--read using procedure
create procedure readst(
@sid int
)
as begin
select * from studentss 
where sid=@sid;
end;
exec readst 101;

-- update using procedure
create procedure updatest(
@sid int,
@name varchar(50),
@age int,
@email varchar(50)
)
as begin 
update studentss
set name=@name,
age=@age,
email=@email
where sid=@sid;
end;
exec updatest 101,'alok sharma', 24, 'alok01@gmail.com';

-- delete using procedure
create procedure deletest(
@sid int
)
as begin
delete from studentss
where sid=@sid;
end;
exec deletest 102;
--using output parameter
CREATE PROCEDURE getEmailById
(
    @sid INT,              
    @email VARCHAR(50) OUTPUT )   
AS
BEGIN
    SELECT @email = email 
    FROM studentss
    WHERE sid = @sid;
END;
GO
DECLARE @outEmail VARCHAR(50);

EXEC getEmailById 
        @sid = 101,
        @email = @outEmail OUTPUT;

SELECT @outEmail AS StudentEmail;

create procedure updatewithmsg(
@sid int,
@name varchar(50),
@age int,
@email varchar(50),
@msg varchar(50) output
)
as 
begin
update studentss
set name=@name,
age=@age,
email=@email
where sid=@sid;
if @@ROWCOUNT=1 
        SET @msg = 'Update successful';
    ELSE
        SET @msg = 'No record found';
END;
GO
declare @result varchar(50);
exec updatewithmsg 101,'alok sharma',24,'alok011@gmail.com',
@msg=@result output;
select @result;


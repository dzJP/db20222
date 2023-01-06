USE iths;

/* UNF */
drop table if exists UNF;
create table UNF (
	Id decimal(38,0) not null,
	Name varchar(26) not null,
	Grade varchar(11) not null,
	Hobbies varchar(25),
	City varchar(10) not null,
	School varchar(30) not null,
	HomePhone varchar(15),
	JobPhone varchar(25),
	MobilePhone1 varchar(15),
	MobilePhone2 varchar(15)
) engine=innodb;

load data infile '/var/lib/mysql-files/denormalized-data.csv'
into table UNF
character set latin1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

/* Student */

drop table if exists Student;
create table Student (
	StudentId int not null auto_increment,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
	constraint primary key (StudentId)
) engine=innodb;
insert into Student(StudentId, FirstName, LastName) select distinct Id, substring_index(Name, ' ', 1) as FirstName, substring_index(Name, ' ', -1) as LastName from UNF;

/* School */

drop table if exists School;
create table School (
SchoolId int not null auto_increment primary key,
School varchar(100) not null,
City varchar(100) not null
) engine=innodb;
insert into School (School, City) select distinct School, City from UNF;

/* StudentSchool */

drop table if exists StudentSchool;
create table StudentSchool as select distinct UNF.Id as StudentId, School.SchoolId from UNF inner join School using(School);
alter table StudentSchool modify column StudentId int;
alter table StudentSchool modify column SchoolId int;
alter table StudentSchool add primary key(StudentId, SchoolId);

/* Phone */
drop table if exists Phone;
create table Phone (
PhoneId int not null auto_increment,
StudentId int not null,
Type varchar(32),
Number varchar(32) not null,
constraint primary key(PhoneId)
) engine=innodb;

insert into Phone (StudentId, Type, Number) select Id as StudentId, "Home" as Type, HomePhone from UNF where HomePhone is not null and HomePhone != ''
union select Id as StudentId, "Job" as Type, JobPhone from UNF where JobPhone is not null and JobPhone !=''
union select Id as StudentId, "Mobile" as Type, MobilePhone1 from UNF where MobilePhone1 is not null and MobilePhone1 !=''
union select Id as StudentId, "Mobile" as Type, MobilePhone2 from UNF where MobilePhone2 is not null and MobilePhone2 !='';

/* StudentContactList view */
drop view if exists StudentContactList;
create view StudentContactList as select concat(FirstName, ' ', LastName) as Name, group_concat(Number) as Numbers from Phone join Student using(StudentId) group by StudentId;

/* Hobby */

drop table if exists Hobby;
create table Hobby (
HobbyId int not null auto_increment primary key,
Hobby varchar(230)
) engine=innodb;

insert into Hobby(Hobby) select distinct substring_index(Hobbies, ",", 1) as Hobby from UNF where Hobbies is not null and Hobbies != '' and Hobbies !="Nothing"
union select distinct trim(substring_index(substring_index(Hobbies, ",", -2), ",", -1)) as Hobby from UNF where Hobbies is not null and Hobbies != '' and Hobbies not like "%Nothing%"
union select distinct trim(substring_index(Hobbies, ",", -1)) as Hobby from UNF where Hobbies is not null and Hobbies != '' and Hobbies not like "%Nothing%";

/* StudentHobby */

drop table if exists StudentHobby;
create table StudentHobby (
StudentId int not null,
HobbyId int not null
) engine=innodb;

insert into StudentHobby select distinct Id as StudentId, HobbyId from UNF, Hobby where Hobbies like concat("%",Hobby.Hobby,"%");

/* Grade */

drop table if exists Grade;
DROP TABLE IF EXISTS Grade;
CREATE TABLE Grade (
    GradeId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    CONSTRAINT PRIMARY KEY (GradeId)
)  ENGINE=INNODB;

INSERT INTO Grade(Name) 
SELECT DISTINCT Grade FROM UNF;

ALTER TABLE Student ADD COLUMN GradeId INT NOT NULL;

/* Ofta kan komplicerade join i en update leda till att resultatet av join får skrivskydd */
/* Så just sådana här UPDATE satser kan kräva mycket slit */
UPDATE Student JOIN UNF ON (StudentID = Id) JOIN Grade ON Grade.Name = UNF.Grade 
SET  Student.GradeId =  Grade.GradeId;

/* Tänk på hur många rader du vill ha i resultatet, hitta tabellen med så många rader, lägg till nya tabeller med LEFT JOIN hela tiden, och du kommer att sluta med rätt antal rader */

/* GRUND TABELL */
SELECT StudentId as ID  FROM StudentSchool;

/* LEFT JOIN 1 */
SELECT StudentId as ID, Student.Name FROM StudentSchool 
LEFT JOIN Student USING (StudentId);

/* LEFT JOIN 2 */
SELECT StudentId as ID, Student.Name, Grade.Name AS Grade FROM StudentSchool
LEFT JOIN Student USING (StudentId)
LEFT JOIN Grade USING (GradeId);


/* LEFT JOIN 3 */
SELECT StudentId as ID, Student.Name, Grade.Name AS Grade, Hobbies FROM StudentSchool
LEFT JOIN Student USING (StudentId)
LEFT JOIN Grade USING (GradeId)
LEFT JOIN HobbiesList USING (StudentID);

/* LEFT JOIN 4 */
SELECT StudentId as ID, Student.Name, Grade.Name AS Grade, Hobbies, School.Name AS School, City FROM StudentSchool
LEFT JOIN Student USING (StudentId)
LEFT JOIN Grade USING (GradeId)
LEFT JOIN HobbiesList USING (StudentID)
LEFT JOIN School USING (SchoolId);

/* LEFT JOIN 5 */
SELECT StudentId as ID, Student.Name, Grade.Name AS Grade, Hobbies, School.Name AS School, City, Numbers FROM StudentSchool
LEFT JOIN Student USING (StudentId)
LEFT JOIN Grade USING (GradeId)
LEFT JOIN HobbiesList USING (StudentId)
LEFT JOIN School USING (SchoolId)
LEFT JOIN PhoneList USING (StudentId);


DROP VIEW IF EXISTS AVSLUT;
CREATE VIEW AVSLUT AS
SELECT StudentId as ID, Student.Name, Grade.Name AS Grade, Hobbies, School.Name AS School, City, Numbers FROM StudentSchool
LEFT JOIN Student USING (StudentId)
LEFT JOIN Grade USING (GradeId)
LEFT JOIN HobbiesList USING (StudentId)
LEFT JOIN School USING (SchoolId)
LEFT JOIN PhoneList USING (StudentId);

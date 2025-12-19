// Create database
create database universitydb;

//create course table
create table course(
courseId int primary key,                         // used primary key constraint
courseName varchar(50) not null unique            // used not null and unique constraint
);

// create student table
create table student(
SID int primary key,
name varchar(50) not null,
age int check (age>=16),                             // used check constraint
email varchar(50) unique,
courseId int,
constraint fk_student_course                           // used foreign key constarint
   foreign key (courseId) references course(courseId)
);
// inserting values in course table
insert into course(courseId, courseName)
values(101,'be.cse');
insert into course(courseId, courseName)
values(102,'bca');
insert into course(courseId, courseName)
values(103,'bba');
insert into course(courseId, courseName)
values(104,'design');

// inserting values in student table
insert into student(SID, name,age, email, courseId)
values(1, 'Tanya', 19, 'tanyasharma09@gmail.com', 102);
insert into student(SID, name,age, email, courseId)
values(2, 'namit', 17, 'namitgupta09@gmail.com', 101);
insert into student(SID, name,age, email, courseId)
values(3, 'shourya', 19, 'shouryasharma09@gmail.com', 102);
insert into student(SID, name,age, email, courseId)
values(5, 'navya', 19, 'navyaaggarwal@gmail.com', 103);
insert into student(SID, name,age, email, courseId)
values(6, 'pranav', 20, 'pranavsharma@gmail.com', 104);

select* from course;

select * from student;

select * from student
where courseId=102;

select* from student 
order by age asc;

update course
set courseName= 'btech'
where courseId =101;
select * from course;

select s.SID, s.name, s.age, c.courseName
from student s
join course c on s.courseId=c.courseId;

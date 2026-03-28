create database Quanlisinhvien;
use Quanlisinhvien;
create table Class(
ClassID int not null auto_increment primary key,
Classname varchar(60) not null,
Startdate Datetime not null,
Status bit);
create table Student(
StudentID int not null auto_increment primary key,
Studentname varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassId int not null,
FOREIGN KEY (ClassId) REFERENCES Class (ClassID));
create table Subject(
SubID int not null auto_increment primary key,
Subname varchar(30) not null,
Credit Tinyint not null default 1 check (Credit>=1),
Phone varchar(20),
Status bit default 1);
Create table Mark(
MarkID int not null auto_increment primary key,
SubID int not null,
StudentID int not null,
Mark float default 0 check (Mark between 0 and 100),
Examtimes Tinyint default 1,
Foreign key (SubID) references Subject(SubID),
Foreign key (StudentID) references Student(StudentID));

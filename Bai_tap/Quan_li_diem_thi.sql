create database Quan_li_diem_thi;
use Quan_li_diem_thi;
create table Hocsinh(
Mahs varchar(20) primary key,
Tenhs varchar(50),
Ngaysinh datetime,
Lop varchar(20),
GT varchar(20));
Create table Monhoc(
MaMH varchar(20) primary key,
TenMH varchar(50),
Magv varchar(20),
foreign key (Magv) references Giaovien(Magv));
create table Bangdiem(
Mahs varchar(20),
MaMH varchar(50),
Diemthi int,
ngayKT datetime,
primary key (Mahs, MaMH),
foreign key (Mahs) references Hocsinh(Mahs),
foreign key (MaMH) references Monhoc(MaMH));
create table Giaovien(
Magv varchar(20) primary key,
Tengv varchar(50),
sdt int);


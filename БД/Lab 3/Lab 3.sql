-- 2
USE [PAR_MyBase]
GO
--CREATE DATABASE [PAR_MyBase];

DROP table  �����, ��������, �������;



CREATE TABLE ��������(
	������� nchar(50) not null,
	��� nchar(50) not null,
	�������� nchar(50) not null,
	���� int not null,
	ID_�������� int primary key 
)

CREATE TABLE �������(
	 [�������� ��������] nchar(50) not null,
	 [���������] nchar(50) not null,
	 [���������� ���� � ����] int not null,
	 ������ money not null,
	 ID_�������� int primary key 
)

CREATE TABLE �����(
	[���� ��������] smalldatetime not null,
	[���� �����������] smalldatetime not null,
	[����� ��������] int foreign key references ��������(ID_��������),
	[����� ��������] int foreign key references �������(ID_��������),
	ID_������ int primary  key
)
 update ����� set ID_������ = 2 where ID_������ =2;

--3
USE PAR_MyBase

ALTER table �������� add pol nchar(1) default'�' check (pol in ('�','�'));

ALTER table �������� drop constraint [DF__��������__pol__72C60C4A];	
ALTER table �������� drop constraint [CK__��������__pol__73BA3083];
ALTER table �������� drop column pol;

--4
INSERT INTO ������� values('��������-�����', '12' , 1, 200, 1);

INSERT into �������� values('�������', '����', '�������������', 15, 1);

INSERT INTO ����� values('2002-10-03 00:00:00','2002-10-03 00:00:00', 1,1,1)
INSERT INTO ����� values('2002-10-03 00:00:00','2002-10-03 00:00:00', 1,1,2);

--5 
update ����� set [���� �����������] = '2002-10-03 12:00:00' where ID_������ = 1;

select * from [�����];

--6
select * from ����� where ID_������ between 2 and 3;
select * from �������� where ������� like '�%';
select * from ������� where ������ in (200.00,300.00);

--7 
--drop database [PAR_MyBase];

CREATE DATABASE [PAR_MyBase]
 ON  PRIMARY 
( NAME = N'PAR_MyBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAR_MyBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
filegroup FG1
( name = N'PAR_MyBase_fg1_1', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAR_MyBase_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'PAR_MyBase_fg1_2', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAR_MyBase_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)

LOG ON 
( NAME = N'PAR_MyBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PAR_MyBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )

CREATE TABLE ��������(
	������� nchar(50) not null,
	��� nchar(50) not null,
	�������� nchar(50) not null,
	���� int not null,
	ID_�������� int primary key 
)on FG1

CREATE TABLE �������(
	 [�������� ��������] nchar(50) not null,
	 [���������] nchar(50) not null,
	 [���������� ���� � ����] int not null,
	 ������ money not null,
	 ID_�������� int primary key 
)

CREATE TABLE �����(
	[���� ��������] smalldatetime not null,
	[���� �����������] smalldatetime not null,
	[����� ��������] int foreign key references ��������(ID_��������),
	[����� ��������] int foreign key references �������(ID_��������),
	ID_������ int primary  key
)go
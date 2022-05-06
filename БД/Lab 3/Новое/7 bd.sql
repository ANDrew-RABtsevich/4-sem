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
)

go
USE [PAR_MyBase]
GO

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

USE [���_�������]





--ALTER table ������ DROP column POL;

--ALTER table ������ ADD POL nchar(1) default '�' check (POL in('�','�'));





--DROP table ������;

ALTER table ������ ADD ����_����������� date;


CREATE table ������	
( ������������ nvarchar(50) primary key,
  ���� real unique not null,
  ���������� int
);

CREATE table ���������
( ������������_����� nvarchar(50) primary key,
  ����c nvarchar(50),
  ���������_���� nvarchar(20)
);

CREATE TABLE ������
(
  �����_������ int primary key,
  ������������_������ nvarchar(50) foreign key  references ������(������������),
  [���� �������] real,
  ���������� int,
  ����_�������� date,
  �������� nvarchar(50) foreign key references ���������(������������_�����)

);

SELECT * FROM ������;
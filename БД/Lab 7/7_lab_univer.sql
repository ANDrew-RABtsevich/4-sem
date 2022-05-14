use UNIVER
GO

--1�
CREATE VIEW [�������������]	AS SELECT
		TEACHER.TEACHER_NAME,TEACHER.GENDER,TEACHER.PULPIT
	FROM TEACHER;
GO
select * from [�������������];
--drop view [�������������];

--2�
CREATE VIEW [���������� ������]
	AS SELECT f.FACULTY_NAME,  count(*) [���-�� ������]
		FROM FACULTY f join PULPIT p
		on  f.FACULTY = p.FACULTY 
		group by f.FACULTY_NAME
GO
select * from [���������� ������];
--drop view [���������� ������];

--3�
CREATE VIEW [���������] 
	AS SELECT AUDITORIUM, AUDITORIUM_TYPE
		FROM AUDITORIUM where AUDITORIUM_TYPE like '��%'
GO
--drop view [���������];	
select * from ���������;

insert ��������� values('121-2', '��');
update ��������� set AUDITORIUM = '1212' where AUDITORIUM = '121';
delete from ��������� where AUDITORIUM = '1212';

--4�
CREATE VIEW [����������_���������] ([���],[������������ ���������],AUDITORIUM_TYPE)
	AS SELECT AUDITORIUM [���], AUDITORIUM_NAME[������������ ���������], AUDITORIUM_TYPE
	FROM AUDITORIUM WHERE  AUDITORIUM_TYPE like '��%' with check option ;
GO
--drop view [����������_���������];	 
select * from [����������_���������];

insert [����������_���������] values('121-22', ' ������ ���������', '��');
update [����������_���������] set [���] = '1212' where [���] = '121';
delete from [����������_���������] where  [���] = '121-22';

--5�
CREATE VIEW [����������]
	AS SELECT TOP(6) SUBJECT[���], SUBJECT_NAME[������������ ����������], PULPIT[��� �������]
	FROM SUBJECT
	ORDER BY SUBJECT.SUBJECT_NAME;
GO

--drop view [����������];	 
select * from [����������];	

--6�
ALTER VIEW [���������� ������] WITH SCHEMABINDING
	AS SELECT f.FACULTY_NAME,  count(*) [���-�� ������]
		FROM dbo.FACULTY f join dbo.PULPIT p
		on  f.FACULTY = p.FACULTY 
		group by f.FACULTY_NAME
GO

select * from [���������� ������];
--drop view [���������� ������];
delete from [���������� ������]  where  FACULTY_NAME = '���������-������������� ���������';
drop from [���������� ������] SCHEMABINDING;

--8�
create view ���������� as
select top(10) * from
		(select top(10) [DAY_NAME] ����,LESSON ����,IDGROUP, AUDITORIUM + [SUBJECT] t
		from TIMETABLE) ttbl
			pivot (max(t) for IDGROUP in ([3],[4],[5])) pvt
		order by ����
GO

select * from ����������;
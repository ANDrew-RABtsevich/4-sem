use [PAR_MyBase]
GO

--1�
CREATE VIEW [��������]	AS SELECT
		��������.ID_��������, ��������.���, ��������.����
	FROM ��������;
GO
select * from [��������];
--drop view [��������];

--2�
CREATE VIEW [���������� �������]
	AS SELECT v.ID_�������� ,  count(*) [���-�� �������]
		FROM [��������] v join [�����] z
		on  v.ID_�������� = z.ID_������ 
		group by v.ID_�������� 
GO
select * from [���������� �������];
--drop view [���������� �������];

--3�
CREATE VIEW [������� ���������] 
	AS SELECT ���, �������,��������,����, ID_��������
		FROM �������� where ������� like '�%'
GO
--drop view [������� ���������] ;	
select * from [������� ���������] ;

insert [������� ���������] (���, �������,��������,����, ID_��������) values('�����', '��������', '�������',2, 10);
update [������� ���������] set ��� = '�����2' where ��� = '�����';
delete from [������� ���������] where ID_�������� = '10';

--4�
CREATE VIEW [������� ���������2] 
	AS SELECT ���, �������, ��������, ����, ID_�������� [����� ��������]
		FROM �������� where ������� like '�%'  with check option ;
GO
--drop view [������� ���������2] ;	
select * from [������� ���������2] ;

insert [������� ���������2] (���, �������,��������,����, [����� ��������]) values('�����', '��������', '�������',2, 10);
update [������� ���������2] set ��� = '�����2' where ��� = '�����';
delete from [������� ���������2] where [����� ��������] = '10';

--5�
CREATE VIEW [��������]
	AS SELECT TOP(2) [ID_��������][���], [�������� ��������], [���������]
	FROM �������
	ORDER BY �������.[ID_��������] DESC;
GO


--drop view [��������];	 
select * from [��������];	

--6�
ALTER VIEW [���������� �������]  WITH SCHEMABINDING
	AS SELECT v.ID_�������� ,  count(*) [���-�� �������]
		FROM [dbo].[��������] v join [dbo].[�����] z
		on  v.ID_�������� = z.ID_������ 
		group by v.ID_�������� 
GO

select * from [���������� �������];
--drop view [���������� �������];
delete from [���������� �������]  where [ID_��������] = 3;



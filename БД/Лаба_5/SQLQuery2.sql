-- 1� �������

SELECT �������
	FROM ��������, �����, �������
	WHERE ��������.[ID_��������] = �����.[����� ��������] AND
	�������.ID_�������� = �����.ID_������ and �������.ID_�������� IN 
		(SELECT [ID_��������] FROM ������� WHERE([�������� ��������] LIKE '�����%'))

---- 2� �������
SELECT �������
	FROM �������� INNER JOIN �����
	ON ��������.[ID_��������] = �����.[����� ��������] INNER JOIN ������� 
	ON  �����.ID_������ = �������.ID_�������� and �������.ID_�������� IN 
		(SELECT [ID_��������] FROM ������� WHERE([�������� ��������] LIKE '�����%'))



---- 3� �������
SELECT �������
	FROM �������� INNER JOIN �����
	ON ��������.[ID_��������] = �����.[����� ��������] INNER JOIN ������� 
	ON �����.ID_������ = �������.ID_�������� WHERE([�������� ��������] LIKE '�����%')


---- 4� ������� 
SELECT [����� ��������],[����� ��������]
	FROM [�����] z
	WHERE [ID_������] = (select top (1) [ID_������] from  ����� zz
						where zz.[����� ��������]  = z.[����� ��������]  order by [���� �����������])

--5� �������
SELECT �������
	FROM [dbo].[��������]
	WHERE not exists (select * from [�����]
			where �����.[����� ��������] = ��������.ID_��������)

----6� ������� 
SELECT TOP 1
(SELECT AVG([������]) FROM �������
					where [�������� ��������] like '%�����%')[�����],

(SELECT AVG([������]) FROM �������
					where [�������� ��������] like '%��������%')[��������]

From �������

----7� ������� 
SELECT [�������� ��������], [���������]
	FROM [�������]
	WHERE [������] >= any 
--SELECT IDSTUDENT, NOTE
--	FROM PROGRESS 
--	WHERE NOTE >= ANY (SELECT NOTE FROM PROGRESS WHERE IDSTUDENT LIKE 2)		
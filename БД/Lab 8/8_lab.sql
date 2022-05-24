--1
use UNIVER
declare @ch char(10) = 'test',						
		@vch varchar(10) = 'tests',		
		@dt datetime,							
		@tm time(3),							
		@in int,								
		@sint smallint,							
		@tint tinyint,						
		@nm numeric(12,5)					

set @dt = '30/12/2013'
set @tm = '11:11:11'

select @sint = 1
select @in = (select avg([NOTE]) from [dbo].[PROGRESS])
select @nm = 111111.1111

print 'char:           ' + @ch
print 'varchar:        ' + @vch
print 'int:            ' + cast(@in as char)
print 'smallint:       ' + cast(@sint as char)
print 'numeric(12,5):  ' + cast(@nm as char)


--2�
DECLARE @all int = (SELECT sum(AUDITORIUM_CAPACITY) FROM AUDITORIUM), 
		@count int, @avg real, @count_less numeric(8,3);

IF @all>200
	
	BEGIN 
		SELECT @count = (select COUNT(*) from AUDITORIUM),
			   @avg = (select CAST(AVG(AUDITORIUM_CAPACITY) AS REAL) FROM AUDITORIUM)
		SET @count_less = (select cast(COUNT(*) as numeric(8,3)) from AUDITORIUM 
														where AUDITORIUM_CAPACITY > @avg)
		SELECT @all '����� ����������� ', @count '���������� ���������', @avg '������� ����������� ���������',
			   @count_less '������� ������ �������', ( @count_less / (@count) ) * 100 as ��������
	end

else print '������� ����� ����������� ' + cast(@x as varchar(11))


--3�
print '����� ������������ �����: ' +				CAST(@@ROWCOUNT as char)
print '������ SQL Server: ' +						CAST(@@VERSION as char)
print '��������� ������������� ��������: '+			CAST(@@SPID as char)
print '��� ��������� ������: ' +					CAST(@@ERROR as char)
print '��� �������: ' +								CAST(@@SERVERNAME as char)
print '������� ����������� ����������: ' +			CAST(@@TRANCOUNT as char)
print '�������� ���������� ���������� ����� : ' +	CAST(@@FETCH_STATUS as char)
print '������� ����������� ������� ���-������: ' +	CAST(@@NESTLEVEL as char)


--4�
declare @z numeric(5, 3), @t real, @x real
set @t = 1 set @x = 1.2		

if (@t > @x) set @z = sin(@t) * sin(@t)
else if (@t < @x) set @z = 4 * (@t + @x)
else set @z = 1 - exp(@x - 2)

print cast(@z as char)


DECLARE @��� varchar(50) = '�������� ������� ����������';
SET 
@��� = (  SELECT SUBSTRING(@���, 1, CHARINDEX(' ', @���)) +
		SUBSTRING(@���, CHARINDEX(' ', @���) + 1, 1) + '.' +
		SUBSTRING(@���, CHARINDEX(' ', @���, CHARINDEX(' ', @���) + 1) + 1, 1) + '.');
PRINT '�����������: ' + @���;


DECLARE @DATE INT = MONTH(getdate()) + 1;
	SELECT [IDSTUDENT],[NAME] ,[BDAY] FROM STUDENT WHERE MONTH([BDAY]) = @DATE;


SELECT TOP(1) [SUBJECT], [PDATE], DATENAME(DW, [PDATE])[���� ������] 
	FROM [PROGRESS] WHERE [SUBJECT] = '����';


--5�
DECLARE @AVG_NOTE FLOAT(4) = (SELECT AVG(CAST([NOTE] AS FLOAT(4))) AS FLOAT FROM [PROGRESS]), 
		@AVG_OAIP FLOAT(4) = (SELECT AVG(CAST([NOTE] AS FLOAT(4))) FROM [PROGRESS] WHERE SUBJECT = '����');
		--set @AVG_NOTE = 5;
IF @AVG_NOTE  >= @AVG_OAIP
	BEGIN
		PRINT '���. ��. ���� ��� �� �� ����: ' 
		PRINT @AVG_NOTE
		PRINT @AVG_OAIP
	END;
ELSE 
	BEGIN
		PRINT '���. ��.  �� ���� ��� �� �� ����: ' 
		PRINT @AVG_NOTE
		PRINT @AVG_OAIP
	END;

--6�
SELECT CASE 
	WHEN NOTE BETWEEN 8 AND 10 THEN '�������' 
	WHEN NOTE BETWEEN 6 AND 8 THEN '����'
	WHEN NOTE BETWEEN 4 AND 6 THEN '�� � ������'
	else '���������('
	end NOTE, COUNT(*) [���-��]
FROM PROGRESS
GROUP BY CASE 
	WHEN NOTE BETWEEN 8 AND 10 THEN '�������' 
	WHEN NOTE BETWEEN 6 AND 8 THEN '����'
	WHEN NOTE BETWEEN 4 AND 6 THEN '�� � ������'
	else '���������('
	end

--7�
CREATE TABLE #tb (
	ind int, random float, random2 float
);
--drop table #tb;

DECLARE @i int = 0;
WHILE (@i < 10)
	BEGIN
	INSERT #tb (ind, random, random2) VALUES 
			   (@i, rand() + @i, rand() +@i );
	SET @i += 1;
	END
SELECT *
FROM #tb;

--8e

DECLARE @i int = 0;
WHILE (@i < 10)
	BEGIN
	INSERT #tb (ind, random, random2) VALUES 
			   (@i, rand() + @i, rand() +@i );
	IF @i  != 8
	BEGIN 
		SET @i += 1;
	END;
	else
		begin
		SELECT * FROM #tb;
		return --- ������ �������  
		end;
	END
SELECT * FROM #tb;


--9�
BEGIN TRY
	UPDATE [PROGRESS] SET [PROGRESS].[NOTE] = '����' WHERE [PROGRESS].IDSTUDENT = 1
	SELECT * FROM [PROGRESS]
END TRY

BEGIN CATCH
	PRINT 'ERROR_NUMBER = ' + CAST(ERROR_NUMBER() AS varchar(10))
	PRINT 'ERROR_MESSAGE = ' + ERROR_MESSAGE()
	PRINT 'ERROR_LINE = ' + CAST(ERROR_LINE() AS varchar(10))
	PRINT 'ERROR_PROCEDURE = ' + CAST(ERROR_PROCEDURE() AS varchar(10))
	PRINT 'ERROR_SEVERITY = ' + CAST(ERROR_SEVERITY() AS varchar(10))
	PRINT 'ERROR_STATE = ' + CAST(ERROR_STATE() AS varchar(10))
END CATCH
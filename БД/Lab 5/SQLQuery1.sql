-- 1� �������
SELECT PULPIT_NAME
	FROM PULPIT, FACULTY
	WHERE FACULTY.FACULTY = PULPIT.FACULTY AND
	FACULTY.FACULTY IN 
		(SELECT FACULTY FROM PROFESSION WHERE(PROFESSION_NAME LIKE '%����������%'))


-- 2� �������
SELECT PULPIT_NAME 
	FROM PULPIT INNER JOIN FACULTY
	ON FACULTY.FACULTY = PULPIT.FACULTY AND
	FACULTY.FACULTY IN 
		(SELECT FACULTY FROM PROFESSION WHERE(PROFESSION_NAME LIKE '%����������%'))


-- 3� �������
SELECT PULPIT_NAME 
	FROM PULPIT INNER JOIN FACULTY
	ON FACULTY.FACULTY = PULPIT.FACULTY 
		INNER JOIN PROFESSION
		ON PROFESSION.FACULTY = FACULTY.FACULTY WHERE PROFESSION.PROFESSION_NAME LIKE '%����������%'
	--FACULTY.FACULTY IN 
	--	(SELECT FACULTY FROM PROFESSION WHERE(PROFESSION_NAME LIKE '%����������%'))


-- 4� �������
select AUDITORIUM_CAPACITY, AUDITORIUM_TYPE
	from AUDITORIUM 
	where AUDITORIUM_CAPACITY in (select top(8)	AUDITORIUM_CAPACITY from AUDITORIUM) order by AUDITORIUM_CAPACITY desc


--5� ������� exist
select distinct FACULTY_NAME
	from FACULTY, PULPIT
	where exists (select * from PULPIT)


--6� ������� 
select top(1) 

(select avg(NOTE) from PROGRESS
	where SUBJECT like '����') [����],
(select avg(NOTE) from PROGRESS
	where SUBJECT like '��') [��],
(select avg(NOTE) from PROGRESS
	where SUBJECT like '����') [����]

from PROGRESS


--7� ������� 
select NOTE, SUBJECT
	from PROGRESS
	where NOTE >= all(select NOTE from PROGRESS where SUBJECT like '�%')


--8� ������� 
select NOTE, SUBJECT
	from PROGRESS
	where NOTE > any(select NOTE from PROGRESS where SUBJECT like '�%')

--10� �������
SELECT DISTINCT E1.idstudent, 
                E1.NAME, 
                E1.BDAY, 
                E2.idstudent, 
                E2.NAME, 
                E2.BDAY
FROM   STUDENT E1, STUDENT E2 
WHERE  Day(E1.BDAY) = Day(E2.BDAY) 
       AND Month(E1.BDAY) = Month(E2.BDAY) 
       AND E1.idstudent < E2.idstudent
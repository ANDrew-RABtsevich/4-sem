use [PAR_MyBase]

--1�
SELECT	MAX([������]) [���� ������],
	    MIN([������]) [��� ������],
		AVG([������]) [������� ������],
		SUM([������]) [��� ������],
		COUNT([������]) [���������� ���������]

FROM [�������]

--2�
SELECT	�����.[����� ��������],
		MAX([������]) [���� ������],
	    MIN([������]) [��� ������],
		AVG([������]) [������� ������],
		SUM([������]) [��� ������],
		COUNT([������]) [���������� ���������]

FROM ����� inner join �������
	on �����.ID_������ = �������.ID_��������
	Group by �����.[����� ��������]

--3�	

SELECT * 
		FROM(SELECT 

			CASE 
				WHEN ���� between 0 and 12 THEN '0-12'
				WHEN ���� between 13 and 20 THEN  '13-20'
				WHEN ����  > 20 THEN  '>20'
			end [����], COUNT(*) [����������]		

			FROM  �������� GROUP BY
				CASE
					WHEN ���� between 0 and 12 THEN '0-12'
					WHEN ���� between 13 and 20 THEN  '13-20'
					WHEN ����  > 20 THEN  '>20'
				end ) as T
					
					ORDER BY CASE [����]
						when '0-12'  then 1
						when '13-20' then 2
						when '>20' then 3
						else 0
					end;

----- 4�

SELECT v.ID_��������,  ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� 
	GROUP BY v.ID_��������
	ORDER BY [�� ������]


SELECT v.ID_��������,  ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY v.ID_��������
	ORDER BY [�� ������]



----5e 
SELECT v.ID_��������, z.ID_������ , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY ROLLUP (v.ID_��������, z.ID_������)
	


----6�
SELECT v.ID_��������, z.ID_������ , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY CUBE (v.ID_��������, z.ID_������)

----7�
SELECT v.ID_��������, v.��� , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY  v.ID_��������, v.���
	
	UNION
	
SELECT v.ID_��������,  v.��� , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� = '����'
	GROUP BY v.ID_��������, v.���


SELECT  v.ID_�������� , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY   v.ID_��������
	
	UNION all
	
SELECT v.ID_��������, ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� = '����'
	GROUP BY v.ID_��������


----8� 
SELECT  v.ID_�������� , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY   v.ID_��������
	
	INTERSECT
	
SELECT v.ID_��������, ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� = '����'
	GROUP BY v.ID_��������


----9�
SELECT  v.ID_�������� , ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� in ('����', '����')
	GROUP BY   v.ID_��������
	
	EXCEPT
	
SELECT v.ID_��������, ROUND(AVG(CAST(m.������ AS FLOAT(4))),2) [�� ������]

FROM �������� v inner join ����� z
	on v.ID_�������� = z.[����� ��������] inner join ������� m
	on z.[����� ��������] = m.ID_�������� where v.��� = '����'
	GROUP BY v.ID_��������


----10�
SELECT v.����, v.���, (SELECT COUNT(*) FROM �������� v2 where v.��� = v2.��� and v2.���� in (12,15)) [���-�� �� �������]
	FROM �������� v
	GROUP BY v.����, v.���
	HAVING v.���� in (12,15)

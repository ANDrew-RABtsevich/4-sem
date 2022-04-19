-- ����������  �������, ���������� ������������ ������� ����� � �������������� �� �������� ���������� �������� ���� �������
SELECT  S.REP_OFFICE, oo.QTY
FROM SALESREPS S 
left join ORDERS oo
	on S.[EMPL_NUM]  = oo.REP where REP_OFFICE is not null
--group by S.REP_OFFICE
--order by [����������] 


-- ����� �����, � ������� ���� ������ � ������ � 01.01.2007 �� 01.01.2008
SELECT  DISTINCT  [REP_OFFICE]
FROM SALESREPS S 
inner join ORDERS oo
	on S.[EMPL_NUM]  = oo.REP where ORDER_DATE BETWEEN '01.01.2007' and '01.01.2008'
--1�
use [PAR_MyBase]
exec SP_HELPINDEX '�����'

--create index �� on �����([ID_������],[����� ��������]);
--drop index �� on �����;
select * from �����;
select * from ����� where ID_������ = 1;
checkpoint;  --�������� ��
DBCC DROPCLEANBUFFERS;  --�������� �������� ���

SELECT  OBJECT_NAME(T1.object_id) AS NameTable,
        T2.name AS IndexName,
        T1.avg_fragmentation_in_percent AS Fragmentation
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
LEFT JOIN sys.indexes AS T2 ON T1.object_id = T2.object_id AND T1.index_id = T2.index_id

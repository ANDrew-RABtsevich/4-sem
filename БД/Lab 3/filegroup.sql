--alter database [���_�������] add filegroup G1;


alter database [���_�������] add file
 (name = N'���_�������1', filename = N'C:\Users\ilya\Desktop\�����\��\����_3\�������� ������ ��� ��\���_�������.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%
  )  to filegroup G1;

alter database [���_�������] modify filegroup G1 default;

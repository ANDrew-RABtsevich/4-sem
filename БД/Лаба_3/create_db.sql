use master  
create database ���_�������_2 on primary
( name = N'���_�������_mdf', filename = N'C:\Users\ilya\Desktop\�����\��\����_3\��\���_�������R_mdf.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'���_�������_ndf', filename = N'C:\Users\ilya\Desktop\�����\��\����_3\��\���_�������R_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'���_�������_fg1_1', filename = N'C:\Users\ilya\Desktop\�����\��\����_3\��\���_�������R_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'���_�������_fg1_2', filename = N'C:\Users\ilya\Desktop\�����\��\����_3\��\���_�������R_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'���_�������_log', filename=N'C:\Users\ilya\Desktop\�����\��\����_3\��\���_�������R_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)

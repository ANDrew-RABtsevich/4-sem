USE PAR_MyBase

ALTER table �������� add pol nchar(1) default'�' check (pol in ('�','�'));

ALTER table �������� drop constraint [DF__��������__pol__72C60C4A];	
ALTER table �������� drop constraint [CK__��������__pol__73BA3083];
ALTER table �������� drop column pol;
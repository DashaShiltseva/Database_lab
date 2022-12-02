use University;
---������ ��� �������� ��������� ������� ����� ���������� ���� TABLE
DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT '�������� �����')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'������ ������� ') 
SELECT * FROM @mytable

--- ������ � �������������� �������� ����������� IF
DECLARE @a INT 
DECLARE @str CHAR(30)
SET @a = (SELECT COUNT(*) FROM kafedra) 
IF @a >10 BEGIN
SET @str = '���������� ������ ������ 10' SELECT @str
END ELSE BEGIN
SET @str = '���������� ������ = ' + str(@a) SELECT @str
END

---2 ������� � �������������� ����� WHILE;
DECLARE @b INT 
SET @b = 1 WHILE @b <100
BEGIN
PRINT @b -- ����� �� ����� �������� ���������� 
IF (@b>40) AND (@b<50)
BREAK --����� � ���������� 1-� ������� �� ������
ELSE
SET @b = @b+rand()*10 
CONTINUE
END
PRINT @b

---1 ������ ��� �������� ��������� �������;
IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

GO
CREATE FUNCTION dbo.ISOweek (@DATE date) RETURNS CHAR(15)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(15); 
SET @man= MONTH(@DATE)

IF (@man=1) SET @ISOweek='������'; 
IF (@man=2) SET @ISOweek='�������';
IF (@man=3) SET @ISOweek='����';
IF (@man=4) SET @ISOweek='������'; 
IF (@man=5) SET @ISOweek='���';
IF (@man=6) SET @ISOweek='����'; 
IF (@man=7) SET @ISOweek='����';
IF (@man=8) SET @ISOweek='������';
IF (@man=9) SET @ISOweek='��������'; 
IF (@man=10) SET @ISOweek='�������'; 
IF (@man=11) SET @ISOweek='������';
IF (@man=12) SET @ISOweek='�������';

RETURN(@ISOweek); 
END;

GO
SET DATEFIRST 1;
SELECT dbo.ISOweek('12.04.2004') AS '�����';

---������ ��� �������� �������, ������� ���������� ��������� ��������
go
CREATE FUNCTION KolMoreThan (@kol int)
RETURNS TABLE  
AS  
RETURN  
    SELECT name_kafedra, name_zaved, kol_prepods
    FROM Kafedra  
    WHERE kol_prepods > @kol
	go
select * from dbo.KolMoreThan(43)
go
---������ ��� �������� ��������� ��� ����������
CREATE PROCEDURE Count_name_fakulteta 
AS
Select count(name_fakulteta) from Kafedra
where name_fakulteta='���' 
Go
execute Count_name_fakulteta

---������ ��� �������� ��������� c ������� ����������
go
CREATE PROCEDURE Count_Kafedra @kol_prepods as Int
AS
Select count(name_kafedra) from Kafedra
WHERE corpus='3' and kol_prepods>=@kol_prepods
Go

exec Count_Kafedra 20
go

---������ ��� �������� ��������� c �������� ����������� � RETURN
CREATE PROCEDURE checkname @param int AS
IF (SELECT familiya FROM Students WHERE kod_studenta = @param)
= '��������'
RETURN 1 ELSE RETURN 2

DECLARE @return_status int
EXECUTE @return_status = checkname 91430062 SELECT 'Return Status' = @return_status 

---������ ��� �������� ��������� ���������� ������ � ������� ���� ������ UPDATE
go
CREATE PROCEDURE update_Teachers AS
UPDATE Teachers SET NameTeacher = '��������' 

exec update_Teachers
---������ ��� �������� ��������� ���������� ������ �� ������ ���� ������ SELECT;
go
CREATE PROCEDURE select_Teacher @h VARCHAR(255) AS
SELECT * FROM Teachers WHERE DOLGNOST=@h
go
EXEC select_Teacher @h='���������'
go
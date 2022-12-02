use University;
---запрос для создания временной таблицы через переменную типа TABLE
DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT 'Шильцева Дарья')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'Корбут Татьяна ') 
SELECT * FROM @mytable

--- запрос с использованием условной конструкции IF
DECLARE @a INT 
DECLARE @str CHAR(30)
SET @a = (SELECT COUNT(*) FROM kafedra) 
IF @a >10 BEGIN
SET @str = 'Количество кафедр больше 10' SELECT @str
END ELSE BEGIN
SET @str = 'Количество кафедр = ' + str(@a) SELECT @str
END

---2 запроса с использованием цикла WHILE;
DECLARE @b INT 
SET @b = 1 WHILE @b <100
BEGIN
PRINT @b -- вывод на экран значения переменной 
IF (@b>40) AND (@b<50)
BREAK --выход и выполнение 1-й команды за циклом
ELSE
SET @b = @b+rand()*10 
CONTINUE
END
PRINT @b

---1 запрос для создания скалярной функции;
IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

GO
CREATE FUNCTION dbo.ISOweek (@DATE date) RETURNS CHAR(15)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(15); 
SET @man= MONTH(@DATE)

IF (@man=1) SET @ISOweek='Январь'; 
IF (@man=2) SET @ISOweek='Февраль';
IF (@man=3) SET @ISOweek='Март';
IF (@man=4) SET @ISOweek='Апрель'; 
IF (@man=5) SET @ISOweek='Май';
IF (@man=6) SET @ISOweek='Июнь'; 
IF (@man=7) SET @ISOweek='Июль';
IF (@man=8) SET @ISOweek='Август';
IF (@man=9) SET @ISOweek='Сентябрь'; 
IF (@man=10) SET @ISOweek='Октябрь'; 
IF (@man=11) SET @ISOweek='Ноябрь';
IF (@man=12) SET @ISOweek='Декабрь';

RETURN(@ISOweek); 
END;

GO
SET DATEFIRST 1;
SELECT dbo.ISOweek('12.04.2004') AS 'Месяц';

---запрос для создания функции, которая возвращает табличное значение
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
---запрос для создания процедуры без параметров
CREATE PROCEDURE Count_name_fakulteta 
AS
Select count(name_fakulteta) from Kafedra
where name_fakulteta='ФКП' 
Go
execute Count_name_fakulteta

---запрос для создания процедуры c входным параметром
go
CREATE PROCEDURE Count_Kafedra @kol_prepods as Int
AS
Select count(name_kafedra) from Kafedra
WHERE corpus='3' and kol_prepods>=@kol_prepods
Go

exec Count_Kafedra 20
go

---запрос для создания процедуры c входными параметрами и RETURN
CREATE PROCEDURE checkname @param int AS
IF (SELECT familiya FROM Students WHERE kod_studenta = @param)
= 'Шильцева'
RETURN 1 ELSE RETURN 2

DECLARE @return_status int
EXECUTE @return_status = checkname 91430062 SELECT 'Return Status' = @return_status 

---запрос для создания процедуры обновления данных в таблице базы данных UPDATE
go
CREATE PROCEDURE update_Teachers AS
UPDATE Teachers SET NameTeacher = 'Шильцева' 

exec update_Teachers
---запрос для создания процедуры извлечения данных из таблиц базы данных SELECT;
go
CREATE PROCEDURE select_Teacher @h VARCHAR(255) AS
SELECT * FROM Teachers WHERE DOLGNOST=@h
go
EXEC select_Teacher @h='ассистент'
go
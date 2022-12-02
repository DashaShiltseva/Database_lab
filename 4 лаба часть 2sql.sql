------1
go
CREATE FUNCTION Calculator (@Opd1 bigint,
@Opd2 bigint,
@Oprt char(1) = '*') RETURNS bigint
AS BEGIN
DECLARE @Result bigint SET @Result =
CASE @Oprt
WHEN '+' THEN @Opd1 + @Opd2 WHEN '-' THEN @Opd1 - @Opd2
WHEN '*' THEN @Opd1 * @Opd2 WHEN '/' THEN @Opd1 / @Opd2 ELSE 0
END
Return @Result END
go
SELECT dbo.Calculator(4,5,'+' ),
dbo.Calculator(3,7, '*') - dbo.Calculator(64,4,'/')

------2
use University
go
CREATE FUNCTION dyn (@Sex varchar(255))
RETURNS Table AS
RETURN SELECT familiya,name_group,birth_date,sex FROM Students WHERE sex = @Sex
go
SELECT * FROM dyn ('ì')

------3
go
CREATE FUNCTION Parse (@String nvarchar (500))
RETURNS @tabl TABLE
(Number int IDENTITY (1,1) NOT NULL,
Substr nvarchar (30)) AS
BEGIN
DECLARE @Str1 nvarchar (500), @Pos int SET @Str1 = @String
WHILE 1>0 BEGIN
SET @Pos = CHARINDEX(' ', @Str1) IF @POS>0
BEGIN
INSERT INTO @tabl
VALUES (SUBSTRING (@Str1,1,@Pos)) END
ELSE BEGIN
INSERT INTO @tabl VALUES (@Str1) BREAK
END END RETURN END
go
DECLARE @TestString nvarchar(500)
Set @TestString = 'SQL Server 2019' SELECT * FROM Parse (@TestString)

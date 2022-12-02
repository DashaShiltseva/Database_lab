use University;
---запроса с использованием функции COUNT
SELECT COUNT(*) AS "К-во преподавателей"
FROM	Teachers;

----запрос с использованием функции SUM -Какая суммарная ставка всех ассистентов? 
SELECT SUM(Salary)
FROM Teachers
WHERE LOWER(DOLGNOST) = 'ассистент';

----запрос с использованием функций UPPER, LOWER
SELECT UPPER(NameTeacher) AS 'Все прописные'
FROM Teachers;

SELECT Lower(NameTeacher) AS 'Все прописные'
FROM Teachers;

----запроса с использованием временных функций
SELECT familiya, birth_date
FROM	Students
WHERE DATENAME(YEAR, birth_date)=2005;

----запроса с использованием группировки по одному столбцу
SELECT corpus AS 'Корпус', COUNT(*) AS "K-вo кафедр" FROM Kafedra
GROUP BY corpus;

----запроса на использование группировки по нескольким столбцам
select DOLGNOST,RISE , count (*)  as "Количество" from Teachers group by DOLGNOST,RISE;

----запроса с использованием условия отбора групп HAVING
select NameTeacher ,count (NameTeacher) as amount , avg (RISE) as avg_RISE from Teachers group by NameTeacher having avg(RISE) <300

----запроса с использованием фразы HAVING без фразы GROUP BY
SELECT MIN(Salary), MAX(Rise), SUM(Salary + Rise) 
FROM	Teachers
HAVING SUM(Salary + Rise) > 600;

----запроса с использованием сортировки по столбцу
SELECT NameTeacher FROM	Teachers
WHERE DOLGNOST ='ассистент' 
ORDER BY NameTeacher;

----запроса на добавление новых данных в таблицу
INSERT INTO Teachers(KOD_TEACHER,name_kafedra, NameTeacher, DOLGNOST, SALARY, RISE) 
VALUES(1500070, 'пикс', 'Ленин','старший преподаватель','1000','400');

----запроса на обновление существующих данных в таблице
UPDATE Teachers
SET SALARY = SALARY + SALARY * 0.02, RISE = RISE + RISE * 0.01;

----запроса на обновление существующих данных по результатам подзапроса во фразе WHERE
UPDATE Teachers
SET SALARY = SALARY * 1.5
WHERE name_kafedra = (SELECT name_kafedra FROM KAFEDRA WHERE name_kafedra = 'мед');

----запроса на удаление существующих данных
delete from Teachers where DOLGNOST='преподаватель';

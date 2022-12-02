Use University;
---3 простейших запроса с использованием операторов сравнени€
select * from Fakultet where corpus =  '3'

select * from Groups where year_admission > 2012

select * from Kafedra where kol_prepods >= 43

------3 запроса с использованием логических операторов
SELECT * FROM Vedomosty WHERE name_group = '914301' AND mark > 5

SELECT * FROM Students WHERE name_group = '914302' OR city= 'ћинск'

SELECT * FROM Kafedra WHERE NOT corpus =  '3'

---2 запроса на использование комбинации логических операторов
SELECT  * FROM Groups
WHERE  year_admission ='2019' AND
(kol_students < 24 OR course > 2);

SELECT  * FROM Fakultet
WHERE  room ='123' AND
( name_dekana ='ѕетров' OR corpus > 2);
 
---2 запроса на использование выражений над столбцами

SELECT NameTeacher AS '‘амили€ преподавател€', SALARY + RISE AS '«арплата преподавател€'
FROM Teachers WHERE SALARY + RISE IN (900, 1500);

SELECT NameTeacher, SALARY, SALARY + RISE AS '«арплата с надбавкой' FROM	Teachers
WHERE SALARY + RISE IN (SALARY + 100);

---2 запроса с проверкой на принадлежность диапозону значений
SELECT NameTeacher,SALARY FROM Teachers
WHERE SALARY BETWEEN 1000 AND 2000;

SELECT name_kafedra,kol_prepods FROM Kafedra
WHERE kol_prepods NOT BETWEEN 40 AND 60;

---2 запроса с проверкой на соответсвие шаблону
SELECT familiya FROM Students
WHERE UPPER(familiya) LIKE 'ћ%';

SELECT DOLGNOST FROM	Teachers
WHERE LOWER(DOLGNOST) LIKE '%старший%';

---2 запроса с проверкой на неопределенное значение
SELECT  * FROM	Fakultet
WHERE phone IS NULL;

SELECT  * FROM	Vedomosty
WHERE mark IS NULL;

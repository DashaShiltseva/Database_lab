Use University;
---3 ���������� ������� � �������������� ���������� ���������
select * from Fakultet where corpus =  '3'

select * from Groups where year_admission > 2012

select * from Kafedra where kol_prepods >= 43

------3 ������� � �������������� ���������� ����������
SELECT * FROM Vedomosty WHERE name_group = '914301' AND mark > 5

SELECT * FROM Students WHERE name_group = '914302' OR city= '�����'

SELECT * FROM Kafedra WHERE NOT corpus =  '3'

---2 ������� �� ������������� ���������� ���������� ����������
SELECT  * FROM Groups
WHERE  year_admission ='2019' AND
(kol_students < 24 OR course > 2);

SELECT  * FROM Fakultet
WHERE  room ='123' AND
( name_dekana ='������' OR corpus > 2);
 
---2 ������� �� ������������� ��������� ��� ���������

SELECT NameTeacher AS '������� �������������', SALARY + RISE AS '�������� �������������'
FROM Teachers WHERE SALARY + RISE IN (900, 1500);

SELECT NameTeacher, SALARY, SALARY + RISE AS '�������� � ���������' FROM	Teachers
WHERE SALARY + RISE IN (SALARY + 100);

---2 ������� � ��������� �� �������������� ��������� ��������
SELECT NameTeacher,SALARY FROM Teachers
WHERE SALARY BETWEEN 1000 AND 2000;

SELECT name_kafedra,kol_prepods FROM Kafedra
WHERE kol_prepods NOT BETWEEN 40 AND 60;

---2 ������� � ��������� �� ����������� �������
SELECT familiya FROM Students
WHERE UPPER(familiya) LIKE '�%';

SELECT DOLGNOST FROM	Teachers
WHERE LOWER(DOLGNOST) LIKE '%�������%';

---2 ������� � ��������� �� �������������� ��������
SELECT  * FROM	Fakultet
WHERE phone IS NULL;

SELECT  * FROM	Vedomosty
WHERE mark IS NULL;

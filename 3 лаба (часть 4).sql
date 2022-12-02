use University;
---������� � �������������� ������� COUNT
SELECT COUNT(*) AS "�-�� ��������������"
FROM	Teachers;

----������ � �������������� ������� SUM -����� ��������� ������ ���� �����������? 
SELECT SUM(Salary)
FROM Teachers
WHERE LOWER(DOLGNOST) = '���������';

----������ � �������������� ������� UPPER, LOWER
SELECT UPPER(NameTeacher) AS '��� ���������'
FROM Teachers;

SELECT Lower(NameTeacher) AS '��� ���������'
FROM Teachers;

----������� � �������������� ��������� �������
SELECT familiya, birth_date
FROM	Students
WHERE DATENAME(YEAR, birth_date)=2005;

----������� � �������������� ����������� �� ������ �������
SELECT corpus AS '������', COUNT(*) AS "K-�o ������" FROM Kafedra
GROUP BY corpus;

----������� �� ������������� ����������� �� ���������� ��������
select DOLGNOST,RISE , count (*)  as "����������" from Teachers group by DOLGNOST,RISE;

----������� � �������������� ������� ������ ����� HAVING
select NameTeacher ,count (NameTeacher) as amount , avg (RISE) as avg_RISE from Teachers group by NameTeacher having avg(RISE) <300

----������� � �������������� ����� HAVING ��� ����� GROUP BY
SELECT MIN(Salary), MAX(Rise), SUM(Salary + Rise) 
FROM	Teachers
HAVING SUM(Salary + Rise) > 600;

----������� � �������������� ���������� �� �������
SELECT NameTeacher FROM	Teachers
WHERE DOLGNOST ='���������' 
ORDER BY NameTeacher;

----������� �� ���������� ����� ������ � �������
INSERT INTO Teachers(KOD_TEACHER,name_kafedra, NameTeacher, DOLGNOST, SALARY, RISE) 
VALUES(1500070, '����', '�����','������� �������������','1000','400');

----������� �� ���������� ������������ ������ � �������
UPDATE Teachers
SET SALARY = SALARY + SALARY * 0.02, RISE = RISE + RISE * 0.01;

----������� �� ���������� ������������ ������ �� ����������� ���������� �� ����� WHERE
UPDATE Teachers
SET SALARY = SALARY * 1.5
WHERE name_kafedra = (SELECT name_kafedra FROM KAFEDRA WHERE name_kafedra = '���');

----������� �� �������� ������������ ������
delete from Teachers where DOLGNOST='�������������';

use University;
---2 ������� � �������������� ����������� ������������ ���� ������
SELECT Fakultet.name_fakulteta, Fakultet.name_dekana, Kafedra.name_zaved, Kafedra.name_kafedra
FROM	Fakultet, Kafedra;

SELECT Groups.name_group, Groups.course, Students.kod_studenta, Students.familiya
FROM	Groups, Students;

---3 ������� � �������������� ���������� ���� ������ �� ���������
select name_kafedra,name_dekana from Kafedra,Fakultet where Kafedra.name_fakulteta=Fakultet.name_fakulteta

select NameTeacher,name_zaved from Teachers,Kafedra where Kafedra.name_kafedra=Teachers.name_kafedra

select predmet,familiya from Vedomosty,Students where Vedomosty.student=Students.kod_studenta

---2 ������� � �������������� ���������� ���� ������ �� ��������� �������� ������
select Teachers.NameTeacher from Teachers,Kafedra where Teachers.name_kafedra=Kafedra.name_kafedra and Teachers.name_kafedra='����'

--������ � �������������� ���������� �� ���� ��������
SELECT Fakultet.name_fakulteta AS '���������',
Kafedra.name_kafedra AS '�������', NameTeacher AS '�������������' FROM	Fakultet JOIN Kafedra 
ON Fakultet.name_fakulteta = Kafedra.name_fakulteta JOIN Teachers
ON Kafedra.name_kafedra = Teachers.name_kafedra;

----������ � �������������� ������ �������� ����������
SELECT Kafedra.name_kafedra AS '�������� �������', Teachers.KOD_TEACHER AS '��� �������������' 
FROM  KAFEDRA LEFT OUTER JOIN Teachers
ON KAFEDRA.name_kafedra = Teachers.name_kafedra;

----������ �� ������������� ������� �������� ����������
SELECT Kafedra.name_kafedra AS '�������� �������', Teachers.KOD_TEACHER AS '��� �������������' 
FROM  KAFEDRA RIGHT OUTER JOIN Teachers
ON KAFEDRA.name_kafedra = Teachers.name_kafedra;

----������ � �������������� ������������� ���������� � �������� ������������
SELECT needed.name_kafedra
FROM Kafedra needed, Kafedra given
WHERE needed.corpus = given.corpus AND
given.name_kafedra = '����';



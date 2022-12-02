use University;
create table Teachers(
KOD_TEACHER int NOT NULL primary key, 
name_kafedra varchar(50) NULL, 
NAME_TEACHER varchar(50) NULL, 
DOLGNOST varchar(50) NULL,
SALARY int default 1000,
RISE int check (RISE>0),

);

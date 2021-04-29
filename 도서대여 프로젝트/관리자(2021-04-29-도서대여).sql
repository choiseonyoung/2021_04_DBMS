-- 프로젝트에서 사용할 TableSpace, User 생성

CREATE TABLESPACE RentBookDB
DATAFILE 'C:/oraclexe/data/rentbook.def'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER bookuser IDENTIFIED BY bookuser
DEFAULT TABLESPACE RentBookDB;
GRANT DBA TO bookuser;
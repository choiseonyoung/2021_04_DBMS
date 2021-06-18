CREATE DATABASE Score;
CREATE USER scUser@'%';

ALTER USER 'scUser'@'%'
identified WITH mysql_native_password BY '12345';
flush privileges;

DROP USER scUser;

USE Score;

CREATE TABLE tbl_student (
	st_num	CHAR(8) PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,
	st_dept	VARCHAR(20)	NOT NULL,
	st_grade	INT	NOT NULL,
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)
);

CREATE TABLE tbl_score (
	sc_seq	BIGINT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,
	sc_subject	VARCHAR(20)	NOT NULL,
	sc_score	INT	NOT NULL
);

ALTER TABLE tbl_score
ADD CONSTRAINT fk_stnum
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num);

SELECT
COUNT
FROM 

SELECT
T.st_num AS '학번',
T.st_name AS '이름',
T.st_dept AS '전공',
T.st_grade AS '학년',
COUNT(sc_subject) AS '응시과목',
FROM tbl_student T
	LEFT JOIN tbl_score C
		ON T.st_num = C.sc_stnum
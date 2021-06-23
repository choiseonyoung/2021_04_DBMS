CREATE DATABASE db_school;

USE db_school;

CREATE TABLE tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,
	st_dept	VARCHAR(20)	NOT NULL,
	st_grade	INT	NOT NULL,
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)
);

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel)
VALUES('2021001','홍길동','컴공과',3,'010-111-1234');

CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,
	sc_sbcode	CHAR(4) NOT NULL,
	sc_score	INT	NOT NULL
);
DROP TABLE tbl_score;

INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S001',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S002',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S003',90);
SELECT * FROM tbl_score;

CREATE TABLE tbl_subject (
	sb_code	CHAR(4),
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)
);

DROP TABLE tbl_subject;
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES('S001','데이터구조');
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES('S002','자바프로그래밍');
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES('S003','데이터베이스');
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES('S004','산학캡스톤디자인');
INSERT INTO tbl_subject(sb_code, sb_name)
VALUES('S005','알고리즘');

SELECT * FROM tbl_subject;

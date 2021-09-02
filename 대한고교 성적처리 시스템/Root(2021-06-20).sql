CREATE DATABASE Score;
USE Score;

CREATE TABLE tbl_student (
	st_num	BIGINT auto_increment PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,
	st_dept	VARCHAR(20)	NOT NULL,
	st_grade INT NOT NULL,
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)
);
DROP TABLE tbl_student;
SELECT * FROM tbl_student;

CREATE TABLE tbl_score (
	sc_seq	BIGINT auto_increment PRIMARY KEY,
	sc_stnum	BIGINT	NOT NULL,
	sc_sbcode	VARCHAR(20)	NOT NULL,
	sc_score	INT	NOT NULL
);
DROP TABLE tbl_score;
SELECT * FROM tbl_score;

ALTER TABLE tbl_student auto_increment = 20210001;

ALTER TABLE tbl_score
ADD CONSTRAINT fk_stnum
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num);

CREATE VIEW view_학생정보 AS
(
SELECT
st_num,
st_dept,
st_name,
st_grade,
sc_seq,
sc_subject,
sc_score
FROM tbl_student
	LEFT JOIN tbl_score
		ON tbl_student.st_num = tbl_score.sc_stnum
);
DROP VIEW view_학생정보;


CREATE VIEW view_성적정보 AS
(
SELECT
sc_seq,
sc_subject,
sc_score
FROM tbl_score
);
DROP VIEW view_성적정보;

CREATE VIEW view_학생리스트 AS
(
SELECT
T.st_num,
T.st_name,
T.st_dept,
T.st_grade,
COUNT(sc_subject) AS st_sub,
SUM(sc_score) AS st_sum,
AVG(sc_score) AS st_avg
FROM tbl_student T
	LEFT JOIN tbl_score C
		ON T.st_num = C.sc_stnum
);
DROP VIEW view_학생리스트;



INSERT INTO tbl_student(st_name, st_dept, st_grade, st_tel, st_addr)
VALUES ('서녕', '컴퓨터공학과', 5, '010-7777-7777', '광주광역시');

SELECT * FROM tbl_student;

INSERT INTO tbl_score(sc_stnum, sc_subject, sc_score)
VALUES (20210001, '자바프로그래밍', 100);

SELECT * FROM view_학생리스트;
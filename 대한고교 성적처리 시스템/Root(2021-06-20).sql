CREATE DATABASE Score;
USE Score;

CREATE TABLE tbl_student (
	st_num	CHAR(8) PRIMARY KEY,
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
	sc_stnum	CHAR(8)	NOT NULL,
	sc_subject	VARCHAR(20)	NOT NULL,
	sc_score	INT	NOT NULL
);
DROP TABLE tbl_score;
SELECT * FROM tbl_score;

ALTER TABLE tbl_score
ADD CONSTRAINT fk_stnum
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num);

CREATE VIEW view_학생정보 AS
(
SELECT
st_num AS '학번',
st_dept AS '전공',
st_name AS '이름',
st_grade AS '학년',
sc_seq AS 'No.',
sc_subject AS '과목명',
sc_score AS '점수'
FROM tbl_student
	LEFT JOIN tbl_score
		ON tbl_student.st_num = tbl_score.sc_stnum
);
DROP VIEW view_학생정보;

CREATE VIEW view_성적정보 AS
(
SELECT
sc_seq AS 'No.',
sc_subject AS '과목명',
sc_score AS '점수'
FROM tbl_score
);
DROP VIEW view_성적정보;

CREATE VIEW view_학생리스트 AS
(
SELECT
T.st_num AS '학번',
T.st_name AS '이름',
T.st_dept AS '전공',
T.st_grade AS '학년',
COUNT(V.과목명) AS '응시과목',
SUM(V.점수) AS '총점',
AVG(V.점수) AS '평균'
FROM tbl_student T
	LEFT JOIN view_학생정보 V
		ON T.st_num = V.학번
);
DROP VIEW view_학생리스트;

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel, st_addr)
VALUES ('20210620', '서녕', '컴퓨터공학과', 5, '010-7777-7777', '광주광역시');

INSERT INTO tbl_score(sc_stnum, sc_subject, sc_score)
VALUES ('20210620', '국어', 100);

SELECT * FROM view_학생리스트;
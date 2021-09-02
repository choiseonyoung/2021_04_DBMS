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
VALUES('20210001','홍길동','컴공과',3,'010-111-1234');

/*
TABLE에
	INSERT INTO ON DUPLICATE KEY UPDATE를 실행하기 위해서는
    PK 설정을 변경해야 한다
tbl_score는 두개의 컬럼을 기준으로 UPDATE, DELETE를 수행하는 문제가 발생한다
가장 좋은 설계는 UPDATE, DELETE를 수행할 때 한개의 컬럼으로 구성된 PK를 기준으로 수행하는 것이다.
*/
CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,
	sc_sbcode	CHAR(4) NOT NULL,
	sc_score	INT	NOT NULL,
    PRIMARY KEY(sc_stunum, sc_sbcode)
);

/*
PK는 그대로 살려두고
두개의 컬럼을 묶어 UNIQUE로 설정
두개 컬럼의 값이 동시에 같은 경운느 추가하지 말라는 제약조건 설정
*/
CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,
	sc_sbcode	CHAR(4) NOT NULL,
	sc_score	INT	NOT NULL,
    UNIQUE(sc_stnum, sc_sbcode)
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

DROP TABLE tbl_subjtbl_scoreect;
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
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;

-- 한 학생의 세과목의 점수를 개별적으로 INSERT 하기
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002','S001',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002','S002',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002','S003',90);

-- 한번의 INSERT 명령문으로 다수의 데이터 INSERT
-- BULK INSERT
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES ('2021002','S001',90),
('2021002','S002',70),
('2021002','S003',80),
('2021002','S004',50),
('2021002','S005',88);

SELECT * FROM tbl_score;
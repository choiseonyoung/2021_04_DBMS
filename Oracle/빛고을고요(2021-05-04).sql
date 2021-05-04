CREATE TABLE tbl_student (
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(10)	NOT NULL,
    st_tel	VARCHAR2(15),
    st_addr	nVARCHAR2(50),
    st_grade	NUMBER	NOT NULL,
    st_dpcode	CHAR(4)	NOT NULL
);
DROP TABLE tbl_student;

CREATE TABLE tbl_dept (
    dp_code	CHAR(4)		PRIMARY KEY,
    dp_name	nVARCHAR2(10)	NOT NULL,
    dp_pro	nVARCHAR2(10),
    dp_tel	VARCHAR2(5)
);
DROP TABLE tbl_dept;

CREATE TABLE tbl_subject (
    sb_code	CHAR(5)		PRIMARY KEY,
    sb_name	nVARCHAR2(20)	NOT NULL,
    sb_prof	nVARCHAR2(10)
);
DROP TABLE tbl_subject;

CREATE TABLE tbl_score (
    sc_seq	NUMBER		PRIMARY KEY,
    sc_stnum	CHAR(5)	NOT NULL,
    sc_sbcode	CHAR(5),
    sc_score	NUMBER
);
DROP TABLE tbl_score;
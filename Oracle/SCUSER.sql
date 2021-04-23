CREATE TABLE tbl_score (
    st_num CHAR(5),
    st_kor NUMBER,
    st_eng NUMBER,
    st_math NUMBER
);

INSERT INTO tbl_score(st_num, st_kor, st_eng, st_math)
VALUES('001', 100, 85, 92);

SELECT st_num, st_math
FROM tbl_score
WHERE st_kor > 90;

DROP TABLE tbl_score;

SELECT *
FROM tbl_score;

CREATE TABLE tbl_score (
    st_num CHAR(5) NOT NULL UNIQUE,
    st_kor NUMBER NOT NULL,
    st_eng NUMBER NOT NULL,
    st_math NUMBER NOT NULL
)
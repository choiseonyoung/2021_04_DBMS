CREATE TABLE tbl_score ( -- tbl : 실무에서도 쓰이는 접두사
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

DROP TABLE tbl_score;

-- 학생의 점수를 저장할 Table 생성하기
-- 학번, 국어, 영어, 수학 항목을 저장
-- 고정문자열 : CHAR (최대크기)
-- 가변문자열 : VARCHAR2 (최대크기) > 오라클에만 있음 다른 것들에선 다 CHAR
-- 한글가변문자열 : nVARCHAR2 (최대크기)
-- 숫자 : NUMBER (자릿수, 소수)

CREATE TABLE tbl_score (
    sc_num CHAR(5),
    sc_kor NUMBER,
    sc_eng NUMBER,
    sc_math NUMBER
);

-- CREATE로 작성한 컬럼의 순서대로 모든 데이터를 포함하여 INSERT 수행하기
-- 항상 CREATE로 작성한 컬럼의 순서를 기억해야 하고
--      순서가 바뀌면 전혀 엉뚱한 데이터가 INSERT 될 수 있다
-- 모든 컬럼에 데이터를 포함해야 한다.
INSERT INTO tbl_score
VALUES('00001', 90, 80, 70);

-- INSERT를 수행할 때 데이터 컬럼을 나열하면 순서를 몰라도 상관없고,
-- 필요한 컬럼만 데이터를 포함하여 수행할 수 있다
INSERT INTO tbl_score(sc_kor, sc_eng, sc_math, sc_num)
VALUES(90, 70, 80, '00002');
SELECT * FROM tbl_score;

-- 위에서 생성한 tbl_score는 중복된 학번의 점수가 INSERT 될 수 있다
-- 한 학생의 점수가 2중 3중으로 INSERT되어 엉뚱한 결과가 나타날 수 있다
-- 제약조건부여
-- 1. 학번은 중복될 수 없고 절대 NULL이어서는 안된다.
--      NOT NULL UNIQUE : PK 선언하는 것도 좋은 방법
-- 2. 점수가 없는 학생의 데이터는 이후에 연산을 수행할 때 문제를 일으킬 수 있기 때문에 NULL 값이 없도록 하자
DROP TABLE tbl_score;
CREATE TABLE tbl_score (
    sc_num CHAR(5) PRIMARY KEY,
    SC_KOR NUMBER NOT NULL,
    st_kor NUMBER NOT NULL,
    st_eng NUMBER NOT NULL,
    st_math NUMBER NOT NULL
);
CREATE TABLE tbl_score (
    sc_num CHAR(5),
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL,
    PRIMARY KEY (sc_num)
);

CREATE TABLE tbl_score (
    sc_num	CHAR(5)	PRIMARY KEY,
    sc_kor	NUMBER	NOT NULL,
    sc_eng	NUMBER	NOT NULL,
    sc_math	NUMBER	NOT NULL
);

-- 데이터를 보여줄 때 머릿글(컬럼제목)을 바꾸어서 보이기
-- AS(Alias, 별명)
SELECT * FROM tbl_score;

-- 국어점수가 90점 이상인 리스트
SELECT * FROM tbl_score
WHERE sc_kor >= 90;

SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학, sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score;

-- 총점이 250 이상인 학생만 보여라
SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학, sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) >= 250;

-- 총점이 150 이상이고 250이하인 학생만 보여라
SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학, sc_kor + sc_eng + sc_math AS 총점
FROM tbl_score
WHERE (sc_kor + sc_eng + sc_math) <= 250 AND (sc_kor + sc_eng + sc_math) >= 150;

-- SELECT를 사용하여 데이터를 조회하는데
-- 계산하는 컬럼도 있고 자꾸 문법이 복잡해 지려고 한다
-- SELECT 된 명령문을 VIEW 객체로 생성을 해둔다
-- VIEW는 사용법이 TABLE과 같다
--      단, 기본은 SELECT만 된다.

CREATE VIEW view_score
AS
(
    SELECT sc_num AS 학번, sc_kor AS 국어, sc_eng AS 영어, sc_math AS 수학, sc_kor + sc_eng + sc_math AS 총점
    FROM tbl_score
);

SELECT *
FROM view_score
WHERE 총점 >= 150 AND 총점 <= 250;

-- 영어 선생님에게 전체 학생의 정보를 보여줘야 한다
-- 다른 과목의 점수는 감추고 싶다
-- 보안적인 측면에서 사용자별로 보여줄 항목, 보이지 않을 항목을 선별하여 VIEW를 작성해두면
-- 불필요한 정보가 노출되는 것을 최소화할 수 있다
CREATE VIEW view_영어점수
AS
(
    SELECT sc_num AS 학번, sc_eng AS 영어
    FROM tbl_score
    WHERE 학번 >= 'SC0030'
);

CREATE VIEW view_1반학생
AS
(
    SELECT sc_num AS 학번, sc_eng AS 영어, sc_kor AS 국어, sc_math AS 수학
    FROM tbl_score
    WHERE sc_num >= 'S0010' AND sc_num <= 'S0020'
);
DROP VIEW view_1반학생;
SELECT * FROM view_1반학생;
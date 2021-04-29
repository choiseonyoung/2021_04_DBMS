CREATE TABLE tbl_books (
    bk_isbn	CHAR(13)		PRIMARY KEY,
    bk_comp	Nvarchar2(15)	NOT NULL	,
    bk_title	Nvarchar2(50)	NOT NULL	,
    bk_author	Nvarchar2(20)	NOT NULL	,
    bk_trans	Nvarchar2(10)		,
    bk_date	VARCHAR2(10)		,
    bk_pages	NUMBER		,
    bk_price	NUMBER		
);

DROP TABLE tbl_books;


-- ALTER TABLE : TABLE을 변경하는 명령
-- 만들어진 Table의 이름을 변경하기
ALTER TABLE tbl_books RENAME TO tbl_books_v2;

-- 이미 데이터가 담긴 테이블을 복제하기
-- 테이블 구조와 데이터를 복제하여 백업을 하는 용도
-- 일부 제약조건이 함께 복제되지 않는다
CREATE TABLE tbl_books AS SELECT * FROM tbl_books_v2;

-- TABLE을 복제한 후 오라클에서는 반드시 PK를 다시 설정해 주어야 한다

-- TABLE을 생성하고 데이터가 있는 상태에서 PK를 변경, 추가하는 경우에는
-- PK로 설정하려고 하는 컬럼의 데이터가 PK조건(유일성, NOT NULL)을 만족하지 않는 데이터가 있으면 명령이 실패한다
-- 대량의 데이터가 저장된 TABLE을 변경할 경우는 매우 신중하게 실행을 해야 한다.
-- 또한 미리 데이터 검증을 통하여 제약조건에 위배되는 데이터가 있는지 확인을 해야 한다.
ALTER TABLE tbl_books -- tbl_books table을 변경
ADD CONSTRAINT PK_ISBN -- 제약조건을 추가하는데 이름을 PK_ISBN
PRIMARY KEY(bk_isbn); -- bk_isbn 컬럼을 PK로 설정하겠다

-- 생성된 PK를 제거하기
ALTER TABLE tbl_books DROP PRIMARY KEY CASCADE;

/*
도서정보를 저장하기 위하여 tbl_books 테이블을 생성하고 도서정보를 import 했다
도서정보는 어플로 만들기 전에 사용하던 데이터인 관계로
데이터베이스의 규칙에 다소 어긋난 데이터가 있다

저자 항목(컬럼)을 보면 저자가 2명 이상인 데이터가 있고
또한 역자도 2명 이상인 경우가 있다

데이터를 저장할 컬럼을 크게 설정하여 입력(import)하는데는 문제가 없는데
저자나 역자를 기준으로 데이터를 여러가지 조건을 부여하여 조회를 하려고 하면 문제가 발생할 수 있다
특히 저자이름으로 GROUPPING을 하여 데이터를 조회해 보려고 하면 상당히 어려움을 겪을 수 있다
*/

DESC tbl_books;
-- 특정 컬럼의 이름을 변경
ALTER TABLE tbl_books -- tbl_books 테이블을 변경하라
RENAME COLUMN bk_author TO bk_author1; -- bk_author 컬럼을 bk_author1 으로

-- bk_author2라는 컬럼을 생성
-- 한글가변문자열2로 선언하고 NOT NULL로 설정하라
-- ALTER TABLE을 이용하여 컬럼을 축하는 경우에는
-- 사전에 제약조건 설정이 매우 까다롭다
-- 제약조건을 설정하려면
--  1. 컬럼을 아무런 제약조건 없이 추가한 후
--  2. 제약조건에 맞는 데이터를 입력한 후
--  3. 제약조건을 설정한다
ALTER TABLE tbl_books
ADD bk_author2 nVARCHAR2(50);









-- 도서의 저자 리스트를 저장할 TABLE 생성
CREATE TABLE tbl_book_author (
    ba_seq	NUMBER		PRIMARY KEY,
    ba_isbn	CHAR(13)	NOT NULL,
    ba_author	Nvarchar2(50)	NOT NULL
);

-- tbl_books 테이블의 데이터를 삭제하고
-- 제1정규화가 완료된 데이터로 다시 import
DELETE FROM tbl_books;
COMMIT;
SELECT * FROM tbl_books;







-- 정보처리기사
-- 제1정규화 : 원자성
-- 제2정규화 : 완전함수 종속성
-- 제3정규화 : 이행적함수 종속성

-- tbl_book_author에 데이터를 추가하려고 할 때
-- 9791162540572 이 도서에 저자를 추가하고 싶을 때
-- 테이블의 ba_seq 컬럼에는 이미 등록된 값이 아닌 새로운 숫자를 사용하여 데이터를 추가해야 한다
-- 데이터를 추가할 때마다 새로운 값이 무엇인지 알아야 하는 매우 불편한 상황이 만들어지고 말았다
INSERT INTO tbl_book_author(ba_seq, ba_isbn, ba_author)
VALUES( 35, '9791162540572', '홍길동');
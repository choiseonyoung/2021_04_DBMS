-- 현재 존재하는 DataBase 를 보여달라
SHOW databases;
-- 지금부터 MYSQL DataBase 를 사용하겠다
-- 사용자와 연관없이 기본적으로 사용할 DataBase 를 지정하여 사용할 준비
USE MYSQL;
-- 현재 접속한 Database(mysql)에 있는 모든 table을 보여달라
SHOW tables;
-- myDB라는 Database(데이터 저장소) 생성
CREATE DATABASE myDB;
-- 생성된 저장소 확인
SHOW DATABASES;

-- MySQL 에서는 사용할 DB를 open 하기
-- USE 명령을 사용하여 DB open
USE MyDB;
-- 현재 DB(MyDB)에 있는 모든 Table을 보여달라
SHOW TABLES;
CREATE TABLE tbl_test (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    tel VARCHAR(20),
    addr VARCHAR(125)
);
SHOW TABLES;
DESC tbl_test;

-- MySQL에서는 일련번호와 관련된 컬럼에 AUTO_INCREMENT 옵션을 설정하면
-- INSERT 할 때 값을 지정하지 않아도 자동으로 ID, SEQ 값을 생성하여 컬럼에 추가하여 준다.
INSERT INTO tbl_test(name, tel, addr)
VALUES('홍길동','010-111-1111','서울시');
SELECT * FROM tbl_test;
-- MySQL은 Linux 철학을 유지하고 있기 때문에 명령이 정상으로 수행되면 아무런 메시지도 보이지 않는다
CREATE TABLE tbl_books (
bk_isbn	CHAR(13)		PRIMARY KEY,
bk_comp	varchar(15)	NOT NULL,
bk_title	varchar(50)	NOT NULL,
bk_author	varchar(20)	NOT NULL,
bk_trans	varchar(10),
bk_date	VARCHAR(10),
bk_pages	INT,
bk_price	INT
);
SHOW TABLES;
DESC tbl_books;

DROP TABLE tbl_books;
SELECT * FROM tbl_books;

SELECT COUNT(*)
FROM tbl_books;

-- 도서 가격이 20000원 이인 데이터
SELECT *
FROM tbl_books
WHERE bk_price >= 20000;

-- 도서 가격이 만원 이상 2만원 이하
SELECT *
FROM tbl_books
WHERE bk_price BETWEEN 10000 AND 20000;

SELECT *
FROM tbl_books
WHERE bk_price >= 10000 AND bk_price <= 20000;

-- 도서명에 '왕' 문자열이 있는 데이터
SELECT *
FROM tbl_books
WHERE bk_title LIKE '%왕%';

-- Java 등 코딩에서 중간 문자열 검색
-- oracle '%' || '왕' || '%'
-- MySQL : CONCAT('%', '왕', '%')
SELECT *
FROM tbl_books
WHERE bk_title
LIKE CONCAT('%', '왕', '%');

-- 날짜 컬럼의 앞에 4글자만 보여라
SELECT LEFT(bk_date,4)
FROM tbl_books;

-- 발행일이 2018년인 도서들
SELECT *
FROM tbl_books
WHERE LEFT(bk_date,4) = '2018'; -- 날짜값에서 앞에 4글자만 뽑아 보여라
-- 전체 데이터를 날짜 순으로 보여라
SELECT *
FROM tbl_books
ORDER BY bk_date;alter

-- 도서명을 역순으로 정렬하여 보여라
SELECT *
FROM tbl_books
ORDER BY bk_title DESC;

-- 처음 3개의 데이터만 보여라
SELECT *
FROM tbl_books
LIMIT 3;

-- 4(0부터 시작하여 3번)번째 데이터부터 2개
-- 게시판 등 코딩에서 pagination을 구현할 때 사용하는 방법
SELECT *
FROM tbl_books
LIMIT 3, 2;

CREATE DATABASE BookRent;
USE BookRent;

CREATE TABLE tbl_books (
	bk_isbn	CHAR(13)		PRIMARY KEY,
	bk_title	varchar(125)	NOT NULL,
	bk_ccode	CHAR(5)	NOT NULL,
	bk_acode	CHAR(5)	NOT NULL,
	bk_date	VARCHAR(10)	,
	bk_price	INT,
	bk_pages	INT	
);

CREATE TABLE tbl_company (
	cp_code	CHAR(5)		PRIMARY KEY,
	cp_title	varchar(125)	NOT NULL,
	cp_ceo	varchar(20),
	cp_tel	VARCHAR(20),
	cp_addr	varchar(125),
	cp_genre	VARCHAR(10)
);

CREATE TABLE tbl_author (
	au_code	CHAR(5)	PRIMARY KEY,
	au_name	varchar(50)	NOT NULL,
	au_tel	VARCHAR(20),
	au_addr	varchar(125),
	au_genre varchar(30)		
);

CREATE TABLE tbl_buyer (
	bu_code	CHAR(5)	PRIMARY KEY,
	bu_name	VARCHAR(50)	NOT NULL,
	bu_birth INT NOT NULL,
	bu_tel VARCHAR(20),
    bu_addr	VARCHAR(125)
);

CREATE TABLE tbl_book_rent (
	br_seq	BIGINT	PRIMARY KEY AUTO_INCREMENT,
	br_sdate VARCHAR(10)	NOT NULL,
	br_isbn	VARCHAR(13)	NOT NULL,
	br_bcode CHAR(5)	NOT NULL,
	br_edate VARCHAR(10),
	br_price INT	
);

DROP TABLE tbl_author;
DROP TABLE tbl_book_rent;
DROP TABLE tbl_books;
DROP TABLE tbl_buyer;
DROP TABLE tbl_company;
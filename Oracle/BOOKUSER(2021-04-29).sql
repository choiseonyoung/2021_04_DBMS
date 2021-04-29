CREATE TABLE tbl_books(
    bk_isbn CHAR(13),
    bk_title nVARCHAR2(125) NOT NULL,
    bk_ccode CHAR(5) NOT NULL,
    bk_acode CHAR(5) NOT NULL,
    bk_date CHAR(10),
    bk_price NUMBER,
    bk_pages NUMBER
);

INSERT INTO tbl_books(bk_isbn, bk_title, bk_ccode, bk_acode, bk_price)
VALUES ('7297297297297', '랄ㄹㄹ랄라ㅏ라','41841', '72172', 100000);

SELECT *
FROM tbl_books;

DROP TABLE tbl_books;

CREATE TABLE tbl_company(
    cp_code CHAR(5) PRIMARY KEY,
    cp_title nVARCHAR2(125) NOT NULL,
    cp_ceo nVARCHAR2(20),
    cp_tel nVARCHAR2(125),
    cp_addr nVARCHAR2(125),
    cp_genre nVARCHAR2(30)
);

INSERT INTO tbl_company(cp_code, cp_title)
VALUES ('77777', 'ㅋㅎㅋㅎ');

SELECT *
FROM tbl_company;

DROP TABLE tbl_company;

CREATE TABLE tbl_author(
    au_code CHAR(5) PRIMARY KEY,
    au_name nVARCHAR2(50) NOT NULL,
    au_tel VARCHAR2(20),
    au_addr nVARCHAR2(125),
    au_genre nVARCHAR2(30)
);

INSERT INTO tbl_author(au_code, au_name, au_addr)
VALUES ('93821', '최선영', '아아아아아아');

SELECT *
FROM tbl_author;

DELETE FROM tbl_books;
DELETE FROM tbl_company;
DELETE FROM tbl_author;

SELECT 
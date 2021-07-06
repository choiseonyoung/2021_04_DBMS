USE myLibs;

CREATE TABLE tbl_gallery (
g_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
g_writer	VARCHAR(20)	NOT NULL,
g_date	VARCHAR(10)	NOT NULL,
g_time	VARCHAR(10)	NOT NULL,
g_subject	VARCHAR(50)	NOT NULL,
g_content	VARCHAR(1000)	NOT NULL,
g_image	VARCHAR(125)
);
SHOW TABLES;
DROP TABLE tbl_gallery;

CREATE TABLE tbl_files (
	file_seq	BIGINT	AUTO_INCREMENT PRIMARY KEY,
	file_gseq	BIGINT	NOT NULL,
	file_original	VARCHAR(125)	NOT NULL,
	file_upname	VARCHAR(125)	NOT NULL
);
SHOW TABLES;
DROP TABLE tbl_files;

SELECT * FROM tbl_gallery;

INSERT INTO tbl_gallery
(g_writer, g_date, g_time, g_subject, g_content)
VALUES
('choiseonyoung','2021-07-06' , '15:18:00','연습','진짜연습'); 

-- 현재 연결된 session에서 INSERT가 수행되고
-- 그 과정에서 AUTO_INCREMENT 컬럼이 변화가 있으면
-- 그 값을 알려주는 함수
SELECT LIST_INSERT_ID();
CREATE TABLE tbl_todo (
    td_seq	NUMBER		PRIMARY KEY,
    td_date	VARCHAR2(10)	NOT NULL,
    td_time	VARCHAR2(10)	NOT NULL,
    td_todo	VARCHAR2(125)	NOT NULL,
    td_place	VARCHAR2(125)
);
DROP TABLE tbl_todo;

SELECT * FROM tbl_todo;

CREATE SEQUENCE seq_todo
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE seq_todo;

INSERT INTO tbl_todo(td_seq, td_date, td_time, td_todo, td_place)
VALUES(seq_todo.NEXTVAL,'2021-05-25', '00:07:29', '공부하기 ^^', '집');

CREATE VIEW view_할일목록 AS (
    SELECT
        td_seq,
        td_todo,
        td_date,
        td_place
    FROM tbl_todo
);
DROP VIEW view_할일목록;

SELECT * FROM view_할일목록
DESC td_date;

SELECT * FROM tbl_todo
WHERE td_seq = 1;
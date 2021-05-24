CREATE TABLE tbl_todo_list (
    tl_seq	NUMBER		PRIMARY KEY,
    tl__date	VARCHAR2(10)	NOT NULL,
    tl_time	VARCHAR2(10)	NOT NULL,
    tl_todo	VARCHAR2(125)	NOT NULL,
    tl_place	VARCHAR2(125)
);


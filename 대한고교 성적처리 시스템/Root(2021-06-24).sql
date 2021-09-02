use score;

SELECT * FROM view_학생리스트;
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;

CREATE VIEW v_student AS
(
SELECT
st_num,
st_name,
st_dept,
st_grade
FROM tbl_student
);

CREATE VIEW v_list AS
(
SELECT
st_num,
st_name,
st_dept,
st_grade,
COUNT(sc_sbcode) AS sb_count,
SUM(sc_score) AS sb_sum,
AVG(sc_score) AS sb_avg
FROM tbl_student
	LEFT JOIN tbl_score
		ON st_num = sc_stnum
);
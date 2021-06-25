USE db_school;

/*
tbl_subject, tbl_score table을 가지고
각 학생의 성적 리스트를 출력해보기
과목 리스트를 출력하고, 각 과목의 성적이 입력된 학생의 리스트를 확인하기

학번을 조건으로 하여 한 학생의 성적입력 여부를 확인하기

학생의 점수가 입력된 과목과 입력되지 않은 과목을 확인하고 싶다
*/
-- subquery


/*
과목리스트를 전체 보여주고,
학생의 성적 table을 JOIN하여
학생의 점수가 있으면 점수를 보이고
없으면 null로 보여주는 JOIN SQL문

이 JOIN 명령문에 특정한 학번을 조건으로 부여하여 한 학생의 성적 여부를 조회하는 SQL 만들기

순수한 JOIN을 사용하여 한 학생의 성적을 조회하는데
학생의 성적이 tbl_score table에 있으면 점수를 보이고
없으면 NULL로 표현하기 위하여
WHERE 절에서 학번을 조건으로 부여하지 않고 JOIN문의 ON 절에 학번을 조건으로 부여
*/
SELECT SB.sb_code, SB.sb_name, SB.sb_prof, SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code
        AND SC.sc_stnum = '2021001' LIMIT 5;

USE db_school;

SELECT COUNT(*) FROM tbl_score
WHERE sc_stnum = '2021002';

SELECT * FROM tbl_score;
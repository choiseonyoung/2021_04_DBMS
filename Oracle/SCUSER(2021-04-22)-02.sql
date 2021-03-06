-- scuser 접속
SELECT * FROM tbl_student;

-- projection
-- 데이터 중에 필요한 컬럼만 나열하여 데이터를 보여라
SELECT stu_num, st_name, st_dept
FROM tbl_student;

-- projection
-- 보여지는 컬럼의 순서도 바꿀 수 있다
SELECT st_name, st_tel, st_dept
FROM tbl_student;

-- 이름이 '기은성'인 사람의 데이터 조회
-- 비록 한개의 데이터만 보여지지만
-- 이 데이터는 2개 이상 보여진다는 것을 항상 전제하자
-- 여기에서 보여지는 데이터는 모두가 LIST이다
--      List<VO> voList에 담아야 한다.
SELECT st_name, st_dept
FROM tbl_student
WHERE st_name = '기은성';

-- 학번이 'S0090'인 학생의 정보를 조회하라
-- 학번(st_num)은 PK로 설정(선언)되어 있기 때문에
-- 1개의 학번만 조회를 하면 이 데이터는 무조건 1개이거나 없다
-- 여기에서 출력되는 데이터는 VO다.
--      VO vo = new VO()에 담으면 된다.
SELECT st_num, st_name, st_dept
FROM tbl_student
WHERE st_num = 'S0090';

-- 학번이 S0090이거나 S0091인 학생을 보여라
SELECT *
FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091';

SELECT *
FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091' OR st_num = 'S0092';

SELECT *
FROM tbl_student
WHERE st_num IN('S0090', 'S0091', 'S0093', 'S0040', 'S0050');

-- DBMS에서는 char, varchar 타입의 문자열 데이터도 범위를 지정하여 조회할 수 있다.
-- 단, 모든 데이터의 길이가 같을 때
SELECT *
FROM tbl_student
WHERE st_num > 'S0090' AND st_num < 'S0099';

SELECT *
FROM tbl_student
WHERE st_name >= '기가가' AND st_name <= '기힣힣'; -- 다 글자수가 같아야 가능

-- st_num >= 'S0010' AND st_num <= 'S0019'
SELECT *
FROM tbl_student
WHERE st_num BETWEEN 'S0010' AND 'S0019'; -- 이퀄(=)이 있을 때만 됨

-- 이름이 '기'로 시작되는 모든 데이터를 조회
-- LIKE 조회 연산자는 가장 느리다
SELECT *
FROM tbl_student
WHERE st_name LIKE '기%';

-- Full Scan 검색
-- INDEX등의 검색 최적화 기능을 모두 사용하지 않는다
-- 이름에 '기'자가 들어있는 모든 사람
-- LIKE 중에서도 제일 느림
SELECT *
FROM tbl_student
WHERE st_name LIKE '%기%';

-- PRIMARY키를 이용한 조회가 가장 빠름 (인덱스가 있기 때문)

SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%';

-- 주소에 북 문자열이 포함된 모든 데이터를 보여달라
-- 조회된 데이터에서 주소 컬럼을 기준으로 오름차순 정렬하라
SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr; -- ASC(오름차순) 가나다순, ABC순, 12345순 -- ORDER BY는 WHERE문의 가장 마지막에 나옴

SELECT *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr DESC; -- DESCENDING(내림차순), 다나가, CBA, 54321
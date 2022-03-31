--51

select empno, ename, job, LOWER(job), INITCAP(job) from emp where deptno = 10;

select empno, ename, job, 
    CONCAT(empno, ename) ename1, 
    CONCAT(ename, empno) e_empno, 
    CONCAT(ename, job) e_job
from emp where deptno = 10;

-- SUBSTR(ename, 1, 1)에서 ename컬럼의 문자열에서 첫번째 위치부터 시작해서 
-- 1개의 문자열을 얻는다.
select empno, ename, job, sal, deptno from emp 
where SUBSTR(ename, 1, 1) > 'K' and SUBSTR(ename, 1, 1) < 'Y'
order by ename; 

select empno, ename, LENGTH(ename), sal, LENGTH(sal) from emp where deptno = 20;

--ename에 있는 문자열에서 'L'문자를 찾는데 1은 문자열의 처음부터 시작해 1은 몇번째 등장하는 search-string
select ename, 
    instr(ebame, 'L') e_null,
    instr(ebame, 'L', 1, 1) e_null,
    instr(ebame, 'L', 1, 2) e_null2,
    instr(ebame, 'L', 4, 1) e_nul41,
    instr(ebame, 'L', 4, 2) e_nul42 -- ename에서 'L'문자를 4번째 위치부터 시작해 검색하는데 'L'이 두번째로 등장하는 문자열은 존재하지 않음
from emp order by ename;

-- **AL32UTF8은 한글 한글자가 3byte로 설정되어 있다.**
select parameter, value from NLS_DATABASE_PARAMETERS where parameter = 'NLS_CHARACTSET';

-- dual은 오라클에서 제공하는 가상의 테이블이다.
-- 한글 1글자는 3byte로 설정되어 있다. 여기서 5는 '여'문자의 위치이다. 
-- 3은 '여'가 3byte이기 때문에 출력결과는 '여'가 된다.
select 
       substrB('I am here with you', 5, 3) 결과1, --'he'
       substr('나 여기 있어', 5, 3) 결과2, -- '있어'
       substrB('나 여기 있어', 5, 3) 결과3, -- '여'
       substrB('나 여기 있어', 5, 4) 결과4,  -- '여'
       substrB('나 여기 있어', 5, 5) 결과5, -- '여'
       substrB('나 여기 있어', 5, 6) 결과6 -- '여기' : 한글 2글자가 6byte이기 때문
from dual;

select ename, substr(ename, 1, 3), -- 첫번째 위치부터 3개의 문자열을 반환
              substr(ename, 3),    -- 3번째 위치부터 끝까지의 문자열을 반환( 뒷부분 생략됨.)
              substr(ename, -3, 2) -- 마지막 위치를 기준으로 해서 -3은 앞으로 3번째 문자열 부터 2개의 문자열을 반환
from emp where deptno = 10;
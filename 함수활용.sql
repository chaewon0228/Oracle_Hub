-- 59

-- 왼쪽부터 채워진다.
select ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*') from emp where deptno = 10;
-- 오른쪽부터 채워진다.
select ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*') from emp where deptno = 10;

select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20;
select ename, job, RTRIM(job, 'T'), sal, LTRIM(sal, 0) from emp where deptno = 10;

select TRIM(LEADING 'A' from 'AABDCADD') 결과1, -- 문자열 맨 앞에 있는 'A' 삭제
       TRIM('A' from 'AABDCADD') 결과2,         -- 문자열 맨 앞에 있는 'A'와 맨 뒤에 있는 'A'를 모두 삭제
       TRIM(TRAILING 'D' from 'AABDCADD') 결과3 -- 문자열 맨 뒤에 있는 'D' 삭제
from dual;

-- replace 함수
-- ename에 있는 데이터에서 문자열 'SC'가 있는 문자열을 '*?'로 변경
select ename, REPLACE(ename, 'SC', '*?') from emp where deptno = 20;

-- translate
-- ename에 있는 데이터에서 문자열 'S' 또는 'C'가 있는 문자를 
-- 'S'는 '*'로, 'C'는 '?'로 변경
select ename, TRANSLATE(ename, 'SC', '*?') 변경결과2 from emp where deptno = 20;

-- 사원 이름을 소문자로 바꾸는 것을 translate() 함수를 이용해서 작성하시오.
select ename, TRANSLATE(ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') from emp where deptno = 20; --X
-- lower함수를 이용해 작성
select ename, lower(ename) from emp where deptno = 20;

-- 63
select 
        ROUND(4567.678) 결과1, 
        ROUND(4567.678, 0) 결과2, 
        ROUND(4567.678, 2) 결과3, 
        ROUND(4567.678, -2) 결과4
from dual;

select 
        TRUNC(4567.678) 결과1, 
        TRUNC(4567.678, 0) 결과2, 
        TRUNC(4567.678, 2) 결과3, 
        TRUNC(4567.678, -2) 결과4
from dual;

select POWER(2,10) 결과1, CEIL(3.7) 결과2, FLOOR(3.7) 결과3 from dual;

select sal, MOD(sal, 30) from emp where deptno = 10;
select sal, SIGN(sal - 2975) from emp where deptno = 20;

-- 오라클의 날짜 포맷(형식) 조회
select value from NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT';

select sysdate from dual;

-- 날짜 형식을 변경할 때.
alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
commit;
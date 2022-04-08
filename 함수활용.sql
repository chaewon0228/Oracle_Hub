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

select systimestamp from dual;

-- hiredate+3은 입사일자의 날짜에 3을 더한 결과
-- hiredate+5/24는 입사일자의 시간에 5를 더한 결과
select ename, hiredate, hiredate+3, hiredate+5/24 from emp where deptno = 30;

-- 66
select ename, hiredate, sysdate, 
        sysdate-hiredate "Total Days", --현재날짜-입사일자 = 전체근무일수
        TRUNC((sysdate-hiredate)/7, 0) Weeks, --1주일 7일 이기 때문에 7로 나눔
        ROUND(MOD((sysdate-hiredate), 7), 0) Days -- mod는 나머지, 7로 나누면 나머지가 0~6까지 출력
from emp order by 4 desc;

select
    EXTRACT(day from sysdate) 일자, -- 현재 날짜에서 일을 반환
    EXTRACT(month from sysdate) 달,
    EXTRACT(year from sysdate) 년도
from dual;

select
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'HH24') CH, -- +09:00 9시간 빠르다, 문자형식 24시간으로 표현하는데 현재시간 출력
    EXTRACT(TIMEZONE_HOUR from SYSTIMESTAMP) ETZH, -- 대한민국의 타임존 시간은 9시간
    EXTRACT(HOUR from SYSTIMESTAMP) EH, -- 11-9(타임존 시간) = 2 출력
    EXTRACT(HOUR from CAST(SYSTIMESTAMP AS TIMESTAMP)) EHC
    -- systimestamp를 timestamp형식으로 형변환 후에 시간을 출력하면 정상적인 시간 출력
from dual;


select
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'HH24') H1,
    EXTRACT(HOUR from SYSTIMESTAMP) +
    + EXTRACT(TIMEZONE_HOUR from SYSTIMESTAMP) H2
from dual;

select ename, hiredate, 
    EXTRACT(YEAR from hiredate) "year",
    EXTRACT(MONTH from hiredate) "month",
    EXTRACT(DAY from hiredate) "day"
from emp;

 select ename, hiredate, sysdate, 
    months_between(sysdate, hiredate) m_between,
    -- 현재날짜에서 입사날짜 까지의 개월수
    trunc(months_between(sysdate, hiredate), 0) t_between
from emp where deptno = 10 order by m_between desc;

select ename, hiredate, 
    add_months(hiredate, 5) a_month --입사일자에서 5개월을 더한 결과 출력
from emp where deptno IN(10, 30) order by hiredate desc;

select ename, hiredate, 
    next_day(hiredate, 6) n_6, -- 입사일자 이후 돌아오는 금요일 날짜 출력
    next_day(hiredate, 7) n_7 -- 일사입자 이후 돌아오는 토요일 날짜 출력
from emp where deptno = 10 order by hiredate desc;


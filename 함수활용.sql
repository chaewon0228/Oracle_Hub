-- 59

-- ���ʺ��� ä������.
select ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*') from emp where deptno = 10;
-- �����ʺ��� ä������.
select ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*') from emp where deptno = 10;

select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1) from emp where deptno = 20;
select ename, job, RTRIM(job, 'T'), sal, LTRIM(sal, 0) from emp where deptno = 10;

select TRIM(LEADING 'A' from 'AABDCADD') ���1, -- ���ڿ� �� �տ� �ִ� 'A' ����
       TRIM('A' from 'AABDCADD') ���2,         -- ���ڿ� �� �տ� �ִ� 'A'�� �� �ڿ� �ִ� 'A'�� ��� ����
       TRIM(TRAILING 'D' from 'AABDCADD') ���3 -- ���ڿ� �� �ڿ� �ִ� 'D' ����
from dual;

-- replace �Լ�
-- ename�� �ִ� �����Ϳ��� ���ڿ� 'SC'�� �ִ� ���ڿ��� '*?'�� ����
select ename, REPLACE(ename, 'SC', '*?') from emp where deptno = 20;

-- translate
-- ename�� �ִ� �����Ϳ��� ���ڿ� 'S' �Ǵ� 'C'�� �ִ� ���ڸ� 
-- 'S'�� '*'��, 'C'�� '?'�� ����
select ename, TRANSLATE(ename, 'SC', '*?') ������2 from emp where deptno = 20;

-- ��� �̸��� �ҹ��ڷ� �ٲٴ� ���� translate() �Լ��� �̿��ؼ� �ۼ��Ͻÿ�.
select ename, TRANSLATE(ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') from emp where deptno = 20; --X
-- lower�Լ��� �̿��� �ۼ�
select ename, lower(ename) from emp where deptno = 20;

-- 63
select 
        ROUND(4567.678) ���1, 
        ROUND(4567.678, 0) ���2, 
        ROUND(4567.678, 2) ���3, 
        ROUND(4567.678, -2) ���4
from dual;

select 
        TRUNC(4567.678) ���1, 
        TRUNC(4567.678, 0) ���2, 
        TRUNC(4567.678, 2) ���3, 
        TRUNC(4567.678, -2) ���4
from dual;

select POWER(2,10) ���1, CEIL(3.7) ���2, FLOOR(3.7) ���3 from dual;

select sal, MOD(sal, 30) from emp where deptno = 10;
select sal, SIGN(sal - 2975) from emp where deptno = 20;

-- ����Ŭ�� ��¥ ����(����) ��ȸ
select value from NLS_SESSION_PARAMETERS where parameter = 'NLS_DATE_FORMAT';

select sysdate from dual;

-- ��¥ ������ ������ ��.
alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
commit;

select systimestamp from dual;

-- hiredate+3�� �Ի������� ��¥�� 3�� ���� ���
-- hiredate+5/24�� �Ի������� �ð��� 5�� ���� ���
select ename, hiredate, hiredate+3, hiredate+5/24 from emp where deptno = 30;

-- 66
select ename, hiredate, sysdate, 
        sysdate-hiredate "Total Days", --���糯¥-�Ի����� = ��ü�ٹ��ϼ�
        TRUNC((sysdate-hiredate)/7, 0) Weeks, --1���� 7�� �̱� ������ 7�� ����
        ROUND(MOD((sysdate-hiredate), 7), 0) Days -- mod�� ������, 7�� ������ �������� 0~6���� ���
from emp order by 4 desc;

select
    EXTRACT(day from sysdate) ����, -- ���� ��¥���� ���� ��ȯ
    EXTRACT(month from sysdate) ��,
    EXTRACT(year from sysdate) �⵵
from dual;

select
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'HH24') CH, -- +09:00 9�ð� ������, �������� 24�ð����� ǥ���ϴµ� ����ð� ���
    EXTRACT(TIMEZONE_HOUR from SYSTIMESTAMP) ETZH, -- ���ѹα��� Ÿ���� �ð��� 9�ð�
    EXTRACT(HOUR from SYSTIMESTAMP) EH, -- 11-9(Ÿ���� �ð�) = 2 ���
    EXTRACT(HOUR from CAST(SYSTIMESTAMP AS TIMESTAMP)) EHC
    -- systimestamp�� timestamp�������� ����ȯ �Ŀ� �ð��� ����ϸ� �������� �ð� ���
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
    -- ���糯¥���� �Ի糯¥ ������ ������
    trunc(months_between(sysdate, hiredate), 0) t_between
from emp where deptno = 10 order by m_between desc;

select ename, hiredate, 
    add_months(hiredate, 5) a_month --�Ի����ڿ��� 5������ ���� ��� ���
from emp where deptno IN(10, 30) order by hiredate desc;

select ename, hiredate, 
    next_day(hiredate, 6) n_6, -- �Ի����� ���� ���ƿ��� �ݿ��� ��¥ ���
    next_day(hiredate, 7) n_7 -- �ϻ����� ���� ���ƿ��� ����� ��¥ ���
from emp where deptno = 10 order by hiredate desc;


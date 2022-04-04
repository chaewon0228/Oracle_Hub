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
--51

select empno, ename, job, LOWER(job), INITCAP(job) from emp where deptno = 10;

select empno, ename, job, 
    CONCAT(empno, ename) ename1, 
    CONCAT(ename, empno) e_empno, 
    CONCAT(ename, job) e_job
from emp where deptno = 10;

-- SUBSTR(ename, 1, 1)���� ename�÷��� ���ڿ����� ù��° ��ġ���� �����ؼ� 
-- 1���� ���ڿ��� ��´�.
select empno, ename, job, sal, deptno from emp 
where SUBSTR(ename, 1, 1) > 'K' and SUBSTR(ename, 1, 1) < 'Y'
order by ename; 

select empno, ename, LENGTH(ename), sal, LENGTH(sal) from emp where deptno = 20;

--ename�� �ִ� ���ڿ����� 'L'���ڸ� ã�µ� 1�� ���ڿ��� ó������ ������ 1�� ���° �����ϴ� search-string
select ename, 
    instr(ebame, 'L') e_null,
    instr(ebame, 'L', 1, 1) e_null,
    instr(ebame, 'L', 1, 2) e_null2,
    instr(ebame, 'L', 4, 1) e_nul41,
    instr(ebame, 'L', 4, 2) e_nul42 -- ename���� 'L'���ڸ� 4��° ��ġ���� ������ �˻��ϴµ� 'L'�� �ι�°�� �����ϴ� ���ڿ��� �������� ����
from emp order by ename;

-- **AL32UTF8�� �ѱ� �ѱ��ڰ� 3byte�� �����Ǿ� �ִ�.**
select parameter, value from NLS_DATABASE_PARAMETERS where parameter = 'NLS_CHARACTSET';

-- dual�� ����Ŭ���� �����ϴ� ������ ���̺��̴�.
-- �ѱ� 1���ڴ� 3byte�� �����Ǿ� �ִ�. ���⼭ 5�� '��'������ ��ġ�̴�. 
-- 3�� '��'�� 3byte�̱� ������ ��°���� '��'�� �ȴ�.
select 
       substrB('I am here with you', 5, 3) ���1, --'he'
       substr('�� ���� �־�', 5, 3) ���2, -- '�־�'
       substrB('�� ���� �־�', 5, 3) ���3, -- '��'
       substrB('�� ���� �־�', 5, 4) ���4,  -- '��'
       substrB('�� ���� �־�', 5, 5) ���5, -- '��'
       substrB('�� ���� �־�', 5, 6) ���6 -- '����' : �ѱ� 2���ڰ� 6byte�̱� ����
from dual;

select ename, substr(ename, 1, 3), -- ù��° ��ġ���� 3���� ���ڿ��� ��ȯ
              substr(ename, 3),    -- 3��° ��ġ���� �������� ���ڿ��� ��ȯ( �޺κ� ������.)
              substr(ename, -3, 2) -- ������ ��ġ�� �������� �ؼ� -3�� ������ 3��° ���ڿ� ���� 2���� ���ڿ��� ��ȯ
from emp where deptno = 10;
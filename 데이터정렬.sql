-- �Ի����ڰ� ���� ����� ���� �������� ����
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate;

-- �ֱٿ� �Ի��� ��¥ ������ ����
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate DESC; 

-- select ���� ���� �÷��� ������ �������� ��밡��
select empno, ename, job, sal, deptno from emp order by hiredate;

--deptno�÷� �������� ��������, sal �÷� �������� ��������
--deptno asc ����
select empno, ename, job, deptno, sal from emp order by deptno, sal DESC;

-- 4�� select ���� 4��° �÷�, 5�� 5��° �÷��� ��Ÿ����.
select empno, ename, job, sal, hiredate, deptno from emp order by 4, 5 DECS;

-- �������ε� ������ �������� ��밡��
select ename, sal, sal*12 ANN_SAL from emp order by ANN_SAL; 

select DISTINCT deptno, job from emp order by job;
select DISTINCT deptno, job from emp order by deptno;
-- error : select���� distinct�� ����ϸ� select���� �ִ� �÷��� ���
select DISTINCT deptno, job from emp order by empno;

select DISTINCT job, sal+comm from emp order by 2;
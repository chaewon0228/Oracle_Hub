--34
select empno, ename, job, sal from emp where job = 'MANAGER'; -- ��ҹ��ڸ� �����Ѵ�.

-- emp ���̺�κ��� �� �྿ �о whre �������� ���� ��쿡 select ���� �ִ� �÷��� ȭ�鿡 ����Ѵ�.
select empno, ename, job, sal from emp where sal >= 3000; 

-- �Ʒ� �� ���� ����� �����ϴ�.
select empno, ename, job, sal, deptno from emp where deptno = 30;
select empno, ename, job, sal, deptno from emp where deptno != 30;
select empno, ename, job, sal, deptno from emp where deptno ^= 30;

--36

-- sal���� 1300���� ũ�� sal ���� 1700���� ���� ��� true;
select ename, job, sal, deptno from emp where sal BETWEEN 1300 AND 1700;

-- detween ������ ���� ���ڴ� and �������� ũ�Ⱑ �۾ƾ� �Ѵ�.!
-- select ename, job, sal, deptno from emp where sal BETWEEN 1700 AND 1300;

--empno ���� 7902 || 7788 || 7566�� �� ���
select empno, ename, job, sal, hiredate from emp where empno IN(7902, 7788, 7566);
select empno, ename, job, sal, hiredate from emp where empno = 7902 or empno = 7788 or empno = 7566;

-- ename�� 2��° ���ڰ� A�� �� ��� / ù ���ڴ� ��� ���ڰ� �� �� �ִ�.( _ ) / %�� 0�� �̻�
select ename, sal, job from emp where ename like '_A%';

-- ename�� A�� �����ϸ� true���� ����
select ename, sal, job from emp where ename like '%A%';

-- null�� '=' ����ϸ� �ȵȴ�.
select empno, ename, job, sal, comm, deptno from emp where comm IS NULL;

-- �տ� �ִ� ������ ���� �Ѵ�.  1.(sal >= 2800)  2. job = 'MANAGER'
select empno, ename, job, sal, deptno from emp where sal >= 2800 and job = 'MANAGER';
select empno, ename, job, sal, deptno from emp where sal >= 2800 or job = 'MANAGER';

-- 'MANAGER', 'CLERK', 'ANALYST' ������ �����͸� ���
select empno, ename, job, sal, deptno from emp where job in ('MANAGER', 'CLERK', 'ANALYST');
select empno, ename, job, sal, deptno from emp where job NOT in ('MANAGER', 'CLERK', 'ANALYST');

-- sal ���� 1000���� �۰� 3000���� ū ������
select empno, ename, job, sal, deptno from emp where sal not between 1000 and 3000;

-- ù ���ڰ� A�� ������
select empno, ename, job, sal, deptno from emp where ename like 'A%';
select empno, ename, job, sal, deptno from emp where ename not like 'A%';

select empno, ename, job, sal, comm from emp where comm is null;
-- is not null�̴�.
select empno, ename, job, sal, comm from emp where comm is not null;

-- NVL(comm, 0)�� comm ���� null�̸� 0������ �ٲٴ� �Լ��̴�.
select empno, ename, job, sal, comm from emp where (NVL(comm, 0) = 0);

--43
select empno, ename, job, sal from emp where sal > 1500 and job = 'PRESIDENT' or job = 'SALESMAN'; 

select empno, ename, job, sal from emp where sal > 1500 and (job = 'PRESIDENT' or job = 'SALESMAN'); 

select empno, ename, job, sal from emp where sal > 1500 and job IN('PRESIDENT, 'SALESMAN'); 

select ename as name, sal ����, sal*12 "Annual Salary" from emp; 

select ename ���1, 'Abc' ���2, sal ���3, 500 ���4 from emp;

select ename || ':' || empno || ':' || job "�̸� ��� ����" from emp;

select ename || ' is a ' || job AS "Employees Details" from emp;

select ename || ' : 1 Year salary = ' || sal*12 Monthly from emp;

-- �ߺ� �� ���� : distinct

select ALL job from emp;
-- �μ���ȣ�̸鼭 ������ ������ �ߺ��� ����
select distinct deptno, job from emp;

-- rowid�� ����Ŭ���� �����ϴ� ������ ��� ���� �������ִ� ��
-- rownum�� �Ϸù�ȣ�� �ο����ִ� �÷����� 1�� �����Ѵ�.
select rowid, rownum, ename, sal from emp;


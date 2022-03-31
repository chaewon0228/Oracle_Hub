--34
select empno, ename, job, sal from emp where job = 'MANAGER'; -- 대소문자를 구분한다.

-- emp 테이블로부터 한 행씩 읽어서 whre 조건절이 참일 경우에 select 문에 있는 컬럼을 화면에 출력한다.
select empno, ename, job, sal from emp where sal >= 3000; 

-- 아래 세 개의 결과는 동일하다.
select empno, ename, job, sal, deptno from emp where deptno = 30;
select empno, ename, job, sal, deptno from emp where deptno != 30;
select empno, ename, job, sal, deptno from emp where deptno ^= 30;

--36

-- sal값이 1300보다 크고 sal 값이 1700보다 작은 경우 true;
select ename, job, sal, deptno from emp where sal BETWEEN 1300 AND 1700;

-- detween 다음에 오는 숫자는 and 다음보다 크기가 작아야 한다.!
-- select ename, job, sal, deptno from emp where sal BETWEEN 1700 AND 1300;

--empno 값이 7902 || 7788 || 7566인 값 출력
select empno, ename, job, sal, hiredate from emp where empno IN(7902, 7788, 7566);
select empno, ename, job, sal, hiredate from emp where empno = 7902 or empno = 7788 or empno = 7566;

-- ename의 2번째 글자가 A인 값 출력 / 첫 글자는 모든 문자가 올 수 있다.( _ ) / %는 0개 이상
select ename, sal, job from emp where ename like '_A%';

-- ename에 A만 존재하면 true값을 가짐
select ename, sal, job from emp where ename like '%A%';

-- null은 '=' 사용하면 안된다.
select empno, ename, job, sal, comm, deptno from emp where comm IS NULL;

-- 앞에 있는 연산을 먼저 한다.  1.(sal >= 2800)  2. job = 'MANAGER'
select empno, ename, job, sal, deptno from emp where sal >= 2800 and job = 'MANAGER';
select empno, ename, job, sal, deptno from emp where sal >= 2800 or job = 'MANAGER';

-- 'MANAGER', 'CLERK', 'ANALYST' 포함한 데이터를 출력
select empno, ename, job, sal, deptno from emp where job in ('MANAGER', 'CLERK', 'ANALYST');
select empno, ename, job, sal, deptno from emp where job NOT in ('MANAGER', 'CLERK', 'ANALYST');

-- sal 값이 1000보다 작고 3000보다 큰 데이터
select empno, ename, job, sal, deptno from emp where sal not between 1000 and 3000;

-- 첫 글자가 A인 데이터
select empno, ename, job, sal, deptno from emp where ename like 'A%';
select empno, ename, job, sal, deptno from emp where ename not like 'A%';

select empno, ename, job, sal, comm from emp where comm is null;
-- is not null이다.
select empno, ename, job, sal, comm from emp where comm is not null;

-- NVL(comm, 0)은 comm 값이 null이면 0값으로 바꾸는 함수이다.
select empno, ename, job, sal, comm from emp where (NVL(comm, 0) = 0);

--43
select empno, ename, job, sal from emp where sal > 1500 and job = 'PRESIDENT' or job = 'SALESMAN'; 

select empno, ename, job, sal from emp where sal > 1500 and (job = 'PRESIDENT' or job = 'SALESMAN'); 

select empno, ename, job, sal from emp where sal > 1500 and job IN('PRESIDENT, 'SALESMAN'); 
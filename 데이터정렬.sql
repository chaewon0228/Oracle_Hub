-- 입사일자가 빠른 사원이 먼저 나오도록 정렬
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate;

-- 최근에 입사한 날짜 순으로 정렬
select empno, ename, job, sal, hiredate, deptno from emp order by hiredate DESC; 

-- select 절에 없는 컬럼도 정렬의 기준으로 사용가능
select empno, ename, job, sal, deptno from emp order by hiredate;

--deptno컬럼 기준으로 오름차순, sal 컬럼 기준으로 내림차순
--deptno asc 생략
select empno, ename, job, deptno, sal from emp order by deptno, sal DESC;

-- 4는 select 절의 4번째 컬럼, 5는 5번째 컬럼을 나타낸다.
select empno, ename, job, sal, hiredate, deptno from emp order by 4, 5 DECS;

-- 별명으로도 정렬의 기준으로 사용가능
select ename, sal, sal*12 ANN_SAL from emp order by ANN_SAL; 

select DISTINCT deptno, job from emp order by job;
select DISTINCT deptno, job from emp order by deptno;
-- error : select절에 distinct를 사용하면 select절에 있는 컬럼만 사용
select DISTINCT deptno, job from emp order by empno;

select DISTINCT job, sal+comm from emp order by 2;
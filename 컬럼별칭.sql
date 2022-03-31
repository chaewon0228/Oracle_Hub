
select ename as name, sal 월급, sal*12 "Annual Salary" from emp; 

select ename 결과1, 'Abc' 결과2, sal 결과3, 500 결과4 from emp;

select ename || ':' || empno || ':' || job "이름 사번 업무" from emp;

select ename || ' is a ' || job AS "Employees Details" from emp;

select ename || ' : 1 Year salary = ' || sal*12 Monthly from emp;

-- 중복 행 제거 : distinct

select ALL job from emp;
-- 부서번호이면서 업무가 동일한 중복을 제거
select distinct deptno, job from emp;

-- rowid는 오라클에서 제공하는 것으로 모든 행을 구별해주는 열
-- rownum은 일련번호를 부여해주는 컬럼으로 1씩 증가한다.
select rowid, rownum, ename, sal from emp;


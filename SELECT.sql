SELECT ENAME, JOB, HIREDATE, EMPNO FROM EMP;
SELECT DISTINCT JOB FROM EMP;
SELECT ENAME||','||JOB FROM EMP;
SELECT EMPNO||','||ENAME||','||JOB||','||MGR||','||HIREDATE||','||SAL||','||COMM||','||DEPTNO AS THE_OUTPUT FROM EMP;
SELECT ENAME FROM EMP WHERE SAL > 2850;
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7900;
SELECT ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 2850; --!1500 & 2850
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO IN(10, 30) ORDER BY ENAME;
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE LIKE '%1981'; --ENAME, HIREDATE HIRED IN 1981
SELECT ENAME, JOB FROM EMP WHERE MGR IS NULL;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > 0;
SELECT * FROM EMP ORDER BY SAL DESC, COMM DESC;
SELECT ENAME FROM EMP WHERE ENAME LIKE '__A%';
SELECT ENAME FROM EMP WHERE ENAME LIKE '%R%R' OR ENAME LIKE '%A%A' AND DEPTNO = 30 OR MGR = 7788;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > SAL + 0.05 * SAL;
SELECT SYSDATE FROM DUAL;
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6), 'MONDAY') AS REVIEW_DATE FROM EMP;
SELECT ENAME, MONTHS_BETWEEN(SYSDATE, HIREDATE) FROM EMP;
SELECT ENAME||' earns '||SAL||' monthly but wants '||SAL * 3 AS DREAM_SALARY FROM EMP;
SELECT INITCAP(ENAME), LENGTH(ENAME) FROM EMP WHERE ENAME LIKE 'J%' OR ENAME LIKE 'A%' OR ENAME LIKE 'M%';
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'DAY') FROM EMP;
SELECT E.ENAME, D.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 30;
SELECT EMP.ENAME, DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.ENAME LIKE '%A%';
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';


-- SELECT ENAME, EMPNO, 
-- TEST QUERIES
SELECT ENAME,HIREDATE FROM EMP where TO_CHAR(HIREDATE,'YY')='81'; -- FOR EMP HIRED IN 1981
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT ENAME, SAL, SAL * 3 AS DREAM_SALARY FROM EMP;
SELECT D.DEPTNO, E.ENAME, E.JOB FROM EMP E, DEPT D WHERE E.EMPNO = D.DEPTNO AND D.DNAME = 'SALES';
SELECT E.ENAME, D.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT ENAME, DEPTNO, DNAME FROM EMP NATURAL JOIN DEPT;
SELECT
SELECT
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    COMM,
    DEPTNO
FROM
    EMP
WHERE
    EMPNO = NUMBER(4);

    DEPTNO,
    DNAME,
    LOC
FROM
    DEPT
SELECT E1.ENAME, E1.EMPNO, E2.EMPNO, E2.ENAME FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO; 
SELECT E1.ENAME, E1.EMPNO, E2.EMPNO, E2.ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;
/*31*/SELECT COUNT(DISTINCT MGR) AS ONLY_MGR FROM EMP;
/*34*/SELECT EMPNO, ENAME FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP); 
/*28*/SELECT ENAME, RPAD('*', SAL/100, '*') AS SALARY FROM EMP;
/*29*/SELECT MAX(SAL), MIN(SAL), SUM(SAL), AVG(SAL) FROM EMP;
SELECT COUNT((SELECT JOB FROM EMP GROUP BY JOB))FROM EMP;
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;
SELECT EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

/*33*/SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');
/*34*/SELECT EMPNO, ENAME FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);
/*35*/SELECT DISTINCT E1.ENAME, E1.EMPNO FROM EMP E1, EMP E2 WHERE E1.DEPTNO = E2.DEPTNO AND E2.ENAME LIKE '%T%';
/*36*/SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
/*37*/SELECT D.DEPTNO, E.ENAME, E.JOB FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.DNAME = 'SALES';

/*32 . Query to display the Department Name, Location Name, No. of Employees and the
average salary for all employees in that department.*/
SELECT D.DNAME, D.LOC, COUNT(E.DEPTNO) AS "NO. OF EMP", ROUND(AVG(E.SAL), 2) AS SALARY FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO GROUP BY D.DNAME, D.LOC, E.DEPTNO;

/*30. Query to display the number of employees performing the same Job type functions*/
SELECT JOB,COUNT(*) FROM EMP GROUP BY JOB; --DONE

/*27. Query to display Name, Department No. And Salary of any employee whose
department No. and salary matches both the department no. And the salary of any
employee who eans a commission.*/
SELECT E1.ENAME, E1.DEPTNO, E1.SAL FROM EMP E1, EMP E2 WHERE E1.SAL = E2.SAL AND E2.COMM IS NOT NULL;
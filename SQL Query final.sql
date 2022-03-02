CREATE database dbms;
USE dbms;

 CREATE TABLE department
(
  Dno int NOT NULL,
  Dname varchar(50) DEFAULT NULL,
  Location varchar(50) DEFAULT NULL,
  PRIMARY KEY (Dno)
);

 INSERT INTO department VALUES
(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operation','Boston'),
(50,'Marketing','New Delhi');


CREATE TABLE employee
 (
  Eno char(3) NOT NULL,
  Ename varchar(50) NOT NULL,
  Job_type varchar(50) NOT NULL,
  Manager char(3) DEFAULT NULL,
  Hire_date date NOT NULL,
  Dno int DEFAULT NULL,
  Commission decimal(10,2) DEFAULT NULL,
  Salary decimal(7,2) NOT NULL,
  PRIMARY KEY (Eno),
  CONSTRAINT Dno FOREIGN KEY (Dno) REFERENCES department (Dno),
  CONSTRAINT Manager FOREIGN KEY (Manager) REFERENCES employee (Eno)
)

 

INSERT INTO employee VALUES 
('736','Smith','Clerk','790','1981-12-17',20,0.00,1000.00),
('749','Allan','Sales_man','769','1981-02-20',30,300.00,2000.00),
('752','Ward','Sales_man','769','1981-02-22',30,500.00,1300.00),
('756','Jones','Manager','783','1981-04-02',20,0.00,2300.00),
('765','Martin','Sales_man','784','1981-04-22',30,1400.00,1250.00),
('769','Blake','Manager','783','1981-05-01',30,0.00,2870.00),
('778','Clark','Manager','783','1981-06-09',10,0.00,2900.00),
('783','King','President',NULL,'1981-11-17',10,0.00,2950.00),
('784','Turner','Sales_man','769','1981-09-08',30,0.00,1450.00),
('787','Adams','Clerk','778','1983-01-12',20,0.00,1150.00),
('788','Scott','Analyst','756','1982-12-09',20,0.00,2850.00),
('790','James','Clerk','769','1981-12-03',30,0.00,950.00),
('792','Ford','Analyst','756','1981-12-03',20,0.00,2600.00),
('793','Miller','Clerk','788','1982-01-23',40,0.00,1300.00);


SELECT Eno, Ename, Job_type, Hire_date FROM employee;

SELECT CONCAT(Ename, ',', Job_type) AS Name_Job FROM employee;

SELECT CONCAT(Eno , ', ', Ename, ',', Job_type, ', ',Manager, ',' ,Hire_date, ',' ,Dno, ',' ,Commission, ',' ,Salary) AS THE_OUTPUT FROM employee;

SELECT Ename, Salary FROM employee WHERE ( Salary + Commission ) > 2850;

SELECT Ename,Dno FROM employee WHERE Eno='790';

SELECT Ename,Salary FROM employee WHERE Salary NOT BETWEEN 1500 AND 2850;

SELECT Ename FROM employee WHERE Ename LIKE '__A%';

SELECT GETDATE();

SELECT Ename,12 *  (YEAR(getdate())-YEAR(Hire_date)) + (MONTH(getdate())-MONTH(Hire_date)) AS MONTHS FROM employee;

SELECT Ename, datediff(mm, Hire_date, getdate()) as 'month difference' from employee;

SELECT Ename, Hire_date, DAY(Hire_date) AS WEEK_DAY FROM employee;

SELECT Ename, Hire_date, datepart(dw, Hire_date) from employee; /* 21 */

SELECT Ename,Dname FROM employee AS e,department as d WHERE Ename LIKE '%A%' AND Dno=d.Dno; /* 24 */

SELECT Ename,Dname from employee, department where Ename like '%a%'; /* 24 */

SELECT Ename,REPEAT ('*',(Salary/100)) AS SALARY_IN_STAR FROM employee; /* 28 */

select Ename, replicate('*', salary/100) from employee; /* 28 */

select a.Ename, a.Dno, a.Salary from employee as a join employee as b on a.Dno=b.Dno where a.Dno=b.Dno and a.Salary=b.Salary and a.Commission is NULL and b.Commission is NOT NULL;  /* 27 */

SELECT Ename,Dno,Salary FROM employee WHERE (Dno,Salary) JOIN (SELECT Dno,Salary FROM employee WHERE Commission>0);  /* 27 */










/* 9 */ SELECT Ename,Hire_date FROM EMPLOYEE WHERE Hire_date LIKE '1981%';  
/* 10 */ SELECT Ename,Job_type FROM employee WHERE Manager is NULL;  
/* 11 */ SELECT Ename,Salary,Commission FROM employee WHERE Commission > 0.00;  
/* 12 */ SELECT * FROM employee ORDER BY Salary DESC,Commission DESC;
/* 13 */ SELECT Ename FROM employee WHERE Ename LIKE '__A%';
/* 14 */ SELECT Ename,Dno,Manager FROM employee WHERE Ename LIKE '%A%A%' OR Ename LIKE '%R%R%' AND Dno=30 OR Manager='778';
/* 15 */ SELECT Ename,Salary,Commission FROM employee WHERE Commission > (Salary+Salary*0.05);
/* 16 */ SELECT GETDATE();
/* 17 */ /* No Need To Write */
/* 18 */ SELECT Ename,12 *  (YEAR(GETDATE())-YEAR(Hire_date)) + (MONTH(GETDATE())-MONTH(Hire_date)) AS MONTHS FROM employee;
/* 19 */ SELECT CONCAT(Ename,' earns ',Salary,' monthly but wants ',3*Salary) AS DREAMY_SALARY FROM employee;
/* 20 */ SELECT CONCAT( UPPER(SUBSTRING(Ename,1,1)) , LOWER(SUBSTRING(Ename,2,50))) AS NAME,LEN(Ename) AS LENGTH  FROM employee WHERE Ename LIKE 'J%' OR Ename LIKE 'A%' OR Ename LIKE 'M%';
/* 21 */ SELECT Ename, Hire_date, datepart(dw, Hire_date) from employee;
/* 22 */ SELECT e.Ename,d.Dname,e.Dno FROM employee AS e,department AS d WHERE e.Dno=d.Dno;
/* 23 */ SELECT DISTINCT Job_type FROM employee WHERE Dno=30; 
/* 24 */ SELECT e.Ename,d.Dname FROM employee AS e,department as d WHERE e.Ename LIKE '%A%' AND e.Dno=d.Dno;
/* 25 */ SELECT e.Ename,e.Job_type,e.Dno,d.Dname FROM employee AS e,department as d WHERE e.Dno=d.Dno AND d.Location='Dallas';
/* 26 */ SELECT e.Ename,e.Eno,d.Ename,d.Eno FROM employee AS e LEFT OUTER JOIN employee as d ON e.Eno=d.Manager;
/* 27 */  
/* 28 */ select Ename, replicate('*', salary/100) from employee;
/* 29 */ SELECT MAX(Salary) as max ,MIN(Salary) as min,SUM(Salary) as sum,AVG(Salary) as average FROM employee;
/* 30 */ SELECT job_type,COUNT(*) FROM employee GROUP BY Job_type;
/* 31 */ SELECT COUNT(DISTINCT Manager) as only_manager FROM employee;
/* 32 */ SELECT d.Dname,d.Location,AVG(e.Salary),COUNT(*) FROM employee AS e,department AS d WHERE d.Dno=e.Dno GROUP BY d.Dname;
/* 33 */ SELECT Ename,Hire_date FROM employee WHERE Dno=(SELECT Dno FROM employee WHERE Ename='Blake');  
/* 34 */ SELECT Eno,Ename FROM employee WHERE Salary > (Select AVG(Salary) FROM employee);
/* 35 */ SELECT e.Eno,e.Ename FROM employee AS e ,employee as d WHERE e.Manager=d.Eno AND d.Ename LIKE '%T%';
/* 36 */ SELECT Ename,Salary FROM employee WHERE Manager=(SELECT Eno FROM employee WHERE Ename='King');
/* 37 */ SELECT e.Dno,e.Ename,e.Job_type FROM employee AS e,department as d WHERE d.Dno=e.Dno AND d.Dname='Sales';

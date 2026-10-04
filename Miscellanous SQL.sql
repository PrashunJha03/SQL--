-- SECTION A

CREATE DATABASE DAC_DBT;
USE DAC_DBT;

create table dept(
	deptcode VARCHAR(15) PRIMARY KEY, 
	deptname VARCHAR(60), 
	budget INT
    );
    
    
create table grade(
	gradecode varchar(15), 
    gradelevel varchar(30), 
	gradedescription varchar(60),
	basic integer,
    PRIMARY KEY(gradecode,gradelevel)
    );
    
    
create table desig(
	desigcode varchar(15) PRIMARY KEY, 
    designame varchar(15)
    );
    
    
create table emp(
	empcode varchar(15) PRIMARY KEY, 
    empname varchar(60), 
    deptcode varchar(15),
    birthdate date  not null, 
    joindate date  not null, 
    sex char(1) check (sex in ('M', 'F', 'T')),
    desigcode varchar(15), 
    supcode varchar(15), 
    gradecode varchar(15),
    gradelevel varchar(30), 
	basicpay integer
    );
    
    
create table salary(
	empcode varchar(15), 
    salmonth date not null , 
    basic DECIMAL(10,2), 
    allow DECIMAL(10,2), 
    deduct DECIMAL(10,2),
    PRIMARY KEY(empcode, salmonth)
    );


create table history(
	empcode varchar(15) , 
	changedate date not null , 
    desigcode varchar(15) , 
    gradecode varchar(15) , 
    gradelevel varchar(30) , 
	basicpay DECIMAL(10,2),
    PRIMARY KEY(empcode, changedate, desigcode, gradecode, gradelevel)
    );
    
    
ALTER TABLE emp 
	ADD FOREIGN KEY (deptcode) REFERENCES dept(deptcode),
    ADD FOREIGN KEY (desigcode) REFERENCES desig(desigcode),
    ADD FOREIGN KEY (supcode) REFERENCES emp(empcode),
    ADD FOREIGN KEY (gradecode, gradelevel) REFERENCES grade(gradecode, gradelevel);
    
    
ALTER TABLE history
    add foreign key (empcode) references emp (empcode),
    add foreign key (desigcode) references desig(desigcode),
    add foreign key (gradecode, gradelevel) references grade(gradecode, gradelevel);
    
    
ALTER TABLE salary 
	add foreign key (empcode) references emp(empcode);
    
    
INSERT INTO DEPT VALUES
	('ACCT', 'Accounts', 19),
    ('PRCH', 'Purchase', 25),
    ('SALE', 'Sales', 39),
    ('STOR', 'Stores', 33),
    ('FACL', 'Facilities', 42),
    ('PERS', 'Personal', 12);
    
    
INSERT INTO GRADE VALUES
	('GC1',  'GL1', 'GC-GL-1',   25000),
    ('GC4',  'GL1', 'GC-4-GL-1', 21000),
    ('GC4',  'GL4', 'GC-4-GL-4', 15000),
    ('GC6',  'GL1', 'GC-6-GL-1', 13000),
    ('GC6',  'GL2', 'GC-6-GL-2', 11000),
    ('GC12', 'GL1', 'GC-12-GL-1', 9000),
    ('GC12', 'GL2', 'GC-12-GL-2', 8500),
    ('GC12', 'GL3', 'GC-12-GL-3', 8000),
    ('GC15', 'GL1', 'GC-15-GL-1', 7000),
    ('GC15', 'GL2', 'GC-15-GL-2', 6500),
    ('GC15', 'GL3', 'GC-15-GL-3', 6000),
    ('GC20', 'GL1', 'GC-20-GL-1', 3500),
    ('GC20', 'GL2', 'GC-20-GL-2', 3000),
    ('GC20', 'GL3', 'GC-20-GL-3', 2500),
    ('GC20', 'GL4', 'GC-20-GL-4', 2000);
    
    
INSERT INTO DESIG VALUES
	('CLRK', 'Clerk'),
    ('SLMN', 'Sales Man'),
    ('MNGR', 'Manager'),
    ('SPRV', 'Supervisor'),
    ('PRES', 'Personal');
    
    
INSERT INTO emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay) VALUES
	('7839', 'Reddy',  'ACCT', '1959-12-12', '1981-07-17', 'M', 'PRES',  null,  'GC1', 'GL1', 32000),
    ('7566', 'Jain',   'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2', 12400),
    ('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1', 14700),
    ('7782', 'Menon',  'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2', 12400),
    ('7902', 'Naik',   'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2', 11800),
    ('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2', 12600),
    ('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2', 12200),
    ('7844', 'Singh',  'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
    ('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2', 12000),
    ('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
    ('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
    ('7934', 'Kaul',   'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
    ('7369', 'Shah',   'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12200),
    ('7876', 'Patil',  'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
    ('7999', 'Sinha',  'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1', 14600),
    ('7939', 'Rai',    'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
    ('7192', 'John',   'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12300),
    ('9902', 'Ahmad',  'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
    ('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2', 12400),
    ('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2', 12400); 
	
    
INSERT INTO salary(empcode,salmonth,basic,allow,deduct) value
	('7839','2011-12-01',30000, 3000, 1200),
    ('7839', '2012-01-01', 32000, 3200, 1250),
    ('7839', '2012-02-01', 32000, 3200, 1250),
    ('7566', '2011-12-01', 12000, 600,   400),
    ('7566', '2012-01-01', 12400, 1240,  550),
    ('7566', '2012-02-01', 12400, 1240,  550),
    ('7698', '2011-12-01', 13900, 800,   500),
    ('7698', '2012-01-01', 14700, 1470,  650),
    ('7698', '2012-02-01', 14700, 1470,  650),
    ('7782', '2011-12-01', 11800, 600,   500),
    ('7782', '2012-01-01', 12400, 1240,  550),
    ('7782', '2012-02-01', 12400, 1240,  550),
    ('7902', '2011-12-01', 11200, 600,   450),
    ('7902', '2012-01-01', 11800, 1180,  550),
    ('7902', '2012-02-01', 11800, 1180,  550),
    ('7654', '2011-12-01', 11900, 700,   500),
    ('7654', '2012-01-01', 12600, 1260,  550),
    ('7654', '2012-02-01', 12600, 1260,  550),
    ('7521', '2011-12-01', 11400,  800,  500),
    ('7521', '2012-01-01', 12200, 1220,  550),
    ('7521', '2012-02-01', 12200, 1220,  550),
    ('7844', '2011-12-01', 13400,  900,  600),
    ('7844', '2012-01-01', 14300, 1430,  650),
    ('7844', '2012-02-01', 14300, 1430,  650),
    ('7900', '2011-12-01', 11500,  500,  300),
    ('7900', '2012-01-01', 12000, 1200,  550),
    ('7900', '2012-02-01', 12000, 1200,  550),
    ('7788', '2011-12-01', 11300,  600,  450),
    ('7788', '2012-01-01', 11900, 1190,  550),
    ('7788', '2012-02-01', 11900, 1190,  550),
    ('7499', '2011-12-01', 13400,  800,  550),
    ('7499', '2012-01-01', 14200, 1420,  650),
    ('7499', '2012-02-01', 14200, 1420,  650),
    ('7934', '2011-12-01', 11450,  500,  250),
    ('7934', '2012-01-01', 11950, 1195,  550),
    ('7934', '2012-02-01', 11950, 1195,  550),
    ('7369', '2011-12-01', 11600,  600,  450),
    ('7369', '2012-01-01', 12200, 1220,  550),
    ('7369', '2012-02-01', 12200, 1220,  550),
    ('7876', '2011-12-01', 11700,  600,  500),
	('7876', '2012-01-01', 12300, 1230,  550),
    ('7876', '2012-02-01', 12300, 1230,  550),
    ('7999', '2011-12-01', 13950,  650,  600),
    ('7999', '2012-01-01', 14600, 1460,  650),
    ('7999', '2012-02-01', 14600, 1460,  650),
    ('7939', '2011-12-01', 11100,  700,  400),
    ('7939', '2012-01-01', 11800, 1180,  550),
    ('7939', '2012-02-01', 11800, 1180,  550),
    ('7192', '2011-12-01', 11700,  600,  500),
    ('7192', '2012-01-01', 12300, 1230,  550),
    ('7192', '2012-02-01', 12300, 1230,  550),
    ('9902', '2011-12-01', 13400,  800,  500),
    ('9902', '2012-01-01', 14200, 1420,  650),
    ('9902', '2012-02-01', 14200, 1420,  650),
    ('7802', '2011-12-01',  11900,  500,  300),
    ('7802', '2012-01-01',  12400, 1240,  550),
    ('7802', '2012-02-01',  12400, 1240,  550),
    ('6569', '2011-12-01', 11800,  600,  400),
	('6569', '2012-01-01', 12400, 1240,  550);
    
    
INSERT INTO history(empcode,changedate,desigcode,gradecode,gradelevel,basicpay) values 
	( '7839', '1981-09-17',  'CLRK', 'GC15','GL1',  7000),
    ( '7839', '1985-12-31', 'SLMN', 'GC12','GL3',  8000),
    ( '7839', '1988-12-31',  'SPRV', 'GC12','GL2',  8500),
    ( '7839', '1990-12-31',  'MNGR', 'GC12','GL1',  9000),
    ( '7839', '1994-12-31',  'CLRK', 'GC6', 'GL2', 11000),
    ( '7839', '1998-12-31',  'SLMN', 'GC6', 'GL1', 13000),
    ( '7839', '2001-12-31',  'SPRV', 'GC4', 'GL4', 15000),
    ( '7839', '2006-12-31',  'MNGR', 'GC4', 'GL1', 21000),
    ( '7839', '2011-12-31',  'PRES', 'GC1', 'GL1', 25000),
    ( '7566', '1981-04-02',  'CLRK', 'GC12','GL3',  8000),
    ( '7566', '1991-12-31',  'SLMN', 'GC12','GL2',  8500),
    ( '7566', '2001-12-31',  'SPRV', 'GC12','GL1',  9000),
    ( '7566', '2011-12-31',  'MNGR', 'GC6', 'GL2', 11000),
    ( '7698', '1981-05-01',  'CLRK', 'GC12','GL3',  8000),
    ( '7698', '1991-05-01',  'SLMN', 'GC12','GL2',  8500),
    ( '7698', '2001-05-01',  'MNGR', 'GC12','GL1',  9000),
    ( '7698', '2006-05-01',  'SPRV', 'GC6', 'GL2', 11000),
	( '7698', '2011-05-01',  'MNGR', 'GC6', 'GL1', 13000),
    ( '7782', '1981-06-09',  'CLRK', 'GC12','GL3',  8000),( '7782', '1991-06-09',  'SLMN', 'GC12','GL2',  8500),( '7782', '2001-06-09',  'SPRV', 'GC12','GL1',  9000),( '7782', '2011-06-09',  'MNGR', 'GC6', 'GL2', 11000),( '7902', '1981-12-03',  'CLRK', 'GC12','GL3',  8000),( '7902', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),( '7902', '2001-12-03',  'SPRV', 'GC12','GL1',  9000),( '7902', '2011-12-03',  'MNGR', 'GC6', 'GL2', 11000),( '7654', '1981-09-28',  'SLMN', 'GC12','GL3',  8000),( '7654', '1991-09-28',  'SLMN', 'GC12','GL2',  8500),( '7654', '2001-09-28',  'SLMN', 'GC12','GL1',  9000),( '7654', '2011-09-28',  'SLMN', 'GC6', 'GL2', 11000),( '7521', '1981-02-22',  'CLRK', 'GC12','GL3',  8000),( '7521', '1991-02-22',  'SLMN', 'GC12','GL2',  8500),( '7521', '2001-02-22',  'SPRV', 'GC12','GL1',  9000),( '7521', '2011-02-22',  'MNGR', 'GC6', 'GL2', 11000),( '7844', '1981-09-08',  'SLMN', 'GC12','GL3',  8000),( '7844', '1991-09-08',  'SLMN', 'GC12','GL2',  8500),( '7844', '2001-09-08',  'SLMN', 'GC12','GL1',  9000),( '7844', '2006-09-08',  'SLMN', 'GC6', 'GL2', 11000),( '7844', '2011-09-08',  'SLMN', 'GC6', 'GL1', 13000),( '7900', '1981-12-03',  'SLMN', 'GC12','GL3',  8000),( '7900', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),( '7900', '2001-12-03',  'CLRK', 'GC12','GL1',  9000),( '7900', '2011-12-03',  'CLRK', 'GC6', 'GL2', 11000),( '7788', '1982-12-09',  'SLMN', 'GC12','GL3',  8000),( '7788', '1992-12-09',  'CLRK', 'GC12','GL2',  8500),( '7788', '2002-12-09',  'MNGR', 'GC12','GL1',  9000),( '7788', '2012-12-09',  'SPRV', 'GC6', 'GL2', 11000),( '7499', '1981-02-20',  'SLMN', 'GC12','GL3',  8000),( '7499', '1991-02-20',  'SLMN', 'GC12','GL2',  8500),( '7499', '2001-02-20',  'SLMN', 'GC12','GL1',  9000),( '7499', '2006-02-20',  'SLMN', 'GC6', 'GL2', 11000),( '7499', '2011-02-20',  'SLMN', 'GC6', 'GL1', 13000),( '7934', '1982-01-23',  'SLMN', 'GC12','GL3',  8000),( '7934', '1992-01-23',  'SLMN', 'GC12','GL2',  8500),( '7934', '2002-01-23',  'CLRK', 'GC12','GL1',  9000),( '7934', '2012-01-23',  'CLRK', 'GC6', 'GL2', 11000),( '7369', '1983-12-17',  'SLMN', 'GC12','GL3',  8000),( '7369', '1993-12-17',  'SLMN', 'GC12','GL2',  8500),
	( '7369', '2003-12-17',  'CLRK', 'GC12','GL1',  9000),( '7369', '2006-12-17',  'CLRK', 'GC6', 'GL2', 11000);
    
    
    
    
    
    
    -- SECTION 2

--     1. List the name, employee code and designation of each employee of the office
	SELECT E.EMPNAME, E.EMPCODE, D.DESIGNAME
    FROM EMP E
    JOIN DESIG D
	ON E.DESIGCODE = D.DESIGCODE;
    

--     2. List all the departments and the budgets
	SELECT DEPTNAME, BUDGET FROM DEPT ;


--     3. List the employees and their respective department names
	SELECT E.EMPNAME, D.DEPTNAME
    FROM EMP AS E
    JOIN DEPT D 
    ON E.DEPTCODE = D.DEPTCODE;


--     4. List the employees who are not having any superior to work under
	SELECT EMPNAME FROM EMP
    WHERE SUPCODE IS NULL;


--     5. List the employees who are working directly under superior most employee of theoffice. (Assume the superior most employee is the employee who does not have asupervisor)
	SELECT EMPNAME FROM EMP
    WHERE SUPCODE IS NULL;


--     6. List the employee(s) who is senior most in the office
	SELECT EMPNAME FROM EMP 
    WHERE SUPCODE IS NULL;

--     7. List the employees who will retire from the office next.
	SELECT empcode, empname, birthdate
	FROM emp
	WHERE birthdate = (SELECT MIN(birthdate) FROM emp);

--     8. List the departments with the respective department managers
	SELECT D.DEPTNAME, E.EMPNAME
    FROM DEPT D
    JOIN EMP E
    ON D.DEPTCODE = E.DEPTCODE
    WHERE E.DESIGCODE = 'MNGR';

--     9. List the employees who work as ‘manager’ to at least one department.
	SELECT EMPNAME FROM EMP
    WHERE DESIGCODE = 'MNGR';

--     10. List the number of employees working for either ‘accounts’ or ‘personal’ or‘purchase’ departments
	SELECT COUNT(*)
    FROM EMP 
    WHERE DEPTCODE IN ('ACCT', 'PERS', 'PRCH');

--     11. List the employees working for ‘accounts’ or ‘personal’ department
	SELECT EMPNAME
    FROM EMP
    WHERE DEPTCODE IN ('ACCT','PERS');


--     12. List the employees working for ‘accounts’ and ‘personal’ department
	SELECT EMPNAME
    FROM EMP
    WHERE DEPTCODE = 'ACCT' AND DEPTCODE = 'PERS';


--     13. List the employees working for ‘accounts’ but not for ‘personal’ department
	SELECT EMPNAME
    FROM EMP
    WHERE DEPTCODE = 'ACCT';


--     14. List the youngest employee of the office
	SELECT EMPNAME , BIRTHDATE
    FROM EMP
    WHERE BIRTHDATE = (SELECT MAX(BIRTHDATE) FROM EMP);


--     15. List the employees who are drawingbasic pay not equal to 12400.
	SELECT EMPNAME, BASICPAY
    FROM EMP
    WHERE BASICPAY != 12400;
    

--     16. List the employees who are drawing basic salary between 11000 and 12000.
	SELECT E.EMPNAME, S.BASIC
    FROM EMP E
    JOIN SALARY S
	ON E.EMPCODE = S.EMPCODE
    WHERE BASIC between 11000 AND 12000;

--     17. List the employees who are drawing basic salary not between 11000 and 12000
	SELECT E.EMPNAME, S.BASIC
    FROM EMP E
    JOIN SALARY S
	ON E.EMPCODE = S.EMPCODE
    WHERE BASIC NOT between 11000 AND 12000;



--     18. List the employees who got salary allowance between Rs.1000 to Rs.1500 in themonth of January 2012.
	SELECT E.EMPNAME, S.ALLOW
    FROM EMP E
    JOIN SALARY S
	ON E.EMPCODE = S.EMPCODE
    WHERE ALLOW between 1000 AND 1500 AND SALMONTH = '2012-01-01';


--     19. List the employees whose name ends with ‘i’ or ‘y’.
	SELECT EMPNAME FROM EMP 
    WHERE EMPNAME LIKE ('%I') OR EMPNAME LIKE ('%Y');


-- 20. List the employees who have atleast 25 years of experience 
	SELECT empname, joindate
	FROM emp
	WHERE joindate <= '1997-10-02';


-- 21. List the ‘Salesmen’ who have minimum 30 to 20 years of experience 
	SELECT empname, joindate
	FROM emp
	WHERE desigcode = 'SLMN'
	AND joindate BETWEEN '1992-10-02' AND '2006-10-02';


-- 22. List the basic salary and half of the basic salary for each employee. 
	SELECT EMPNAME, BASICPAY, BASICPAY / 2
    FROM EMP;
    


-- 23. List the employees and the latest take-home-pay of each employee. (Hint: Take- 
-- home-pay = basic + allowance - deductions) 
	SELECT e.empname, s.basic + s.allow - s.deduct AS take_home_pay
	FROM emp e
	JOIN salary s
	ON e.empcode = s.empcode
	WHERE s.salmonth = '2012-02-01';


-- 24. List the employees and the latest take-home-pay of each employee of ‘Accounts’ 
-- department. 
	SELECT e.empname, s.basic + s.allow - s.deduct AS take_home_pay
	FROM emp e
	JOIN salary s
	ON e.empcode = s.empcode
	WHERE s.salmonth = '2012-02-01' AND DEPTCODE = 'ACCT';


-- 25. List employees and their respective ages. 
-- 26. List all the ‘Accounts’ department employees, first ordered by their age and then 
-- by their names. 
-- 27. List the number of employees directly reporting to ‘Reddy’ 
-- 28. List the employees who have atleast one person working under him/her and the 
-- number of their subordinates. List the employee with highest number of 
-- subordinates first, next the person with next highest number of subordinates and 
-- so on. 
-- 29. List the employees who have minimum 3 employees working under him/her. 
-- 30. List the minimum and maximum salaries drawn in each grade code. 
-- 31. List the employees with names of their supervisors (Hint: Use Join). 
-- 32. List the number of officers reporting to each supervisor having more than 3 
-- people working under them 
-- 33. List the employees who have not got any promotion till now. 
-- 34. List the employee with maximum number of promotions. Also list the number of 
-- promotions that he/she got. 
-- 35. List the employees who got promoted in the year 1991. 
-- 36. List the department budget and the total salary drawn (by the employees of this department). 
-- 37. Display the employee names in full uppercase. 
-- 38. List all the employees drawing salary higher than the salary drawn by ‘Jain’ 
-- 39. List all the employees who have higher salary than all the employees who draw 
-- salary in the range of 11000 to 12000. 
-- 40. List all the employees who have greater than average pay. Display the result in the 
-- increasing order of the salary. 
-- 41. List the employees who draws highest salary 
-- 42. List all the employees other than the employees who draw highest salary 
-- 43. List the employees who draw highest salary in each department 
-- 44. List the employee(s) getting second highest salary 
-- 45.List the employee(s) who are getting fifth highest salary. 
-- 46. List the female employee who draws the highest salary higher than any other 
-- female employee 
	select empname, basicpay
    from emp where sex = 'F'
    and basicpay = (select max(basicpay)
    from emp
    where sex = 'F');



-- 47. List the department name of the female employee who draws the highest salary 
-- higher than any other female employee 
	select empname, basicpay, deptname
    from emp where sex = 'F'
    and basicpay = (select max(basicpay)
    from emp
    where sex = 'F')


-- 48. List the department manager of the department, in which the female employee 
-- who draws the highest salary higher than any other female employee works in 
-- 49. List all male employees who draw salary greater than atleast on female employee 
-- 50. List the departments in which average salary of employees is more than average 
-- salary of the company 
-- 51. List the employees drawing salary lesser than the average salary of employees 
-- working for ‘accounts’ department 
	select empname, basicpay
    from emp
    where basicpay < (
		select avg(basicpay) 
        from emp
        where deptcode = 'ACCT'
        );



-- Section -3
-- Views Practice questions: 
-- 1. Write a view to compute the employee age of the organization 
	CREATE VIEW employee_age AS
		SELECT empcode, empname,
       TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
		FROM emp;


-- 2. Write a view to compute the employee experience with the organization 
-- 3. Write a view that computes the employee pay for the current month for all the 
-- employees. Hint: Compute the employee pay as the Basic+Allowance-Deduction 
-- 4. List the employees who are older than their supervisors. Hint: Use views to 
-- implement employee age 
-- 5. Write a view to display the total number of employees in each department 
-- 6. Write a view to display the total number of employees in the organization 
-- 7. Use the views in Qn No 5 & Qn No 6, to display the percentage of employees in 
-- each department 
-- Section -4
-- Index and temporary tables 
-- 1. Create  emp_index on table emp on the field birthdate. 
	create INDEX emp_index
    on emp(birthdate);



-- 2. Create unique index dept_index on table dept on the field deptname. 
	create unique index dept_index
    on dept(deptname);


-- 3. Create students table, with filed id, name, age, gender, index on id  
	create table students(
    id int,
    name varchar(40),
    age int,
    gender char(1)
    );
    
    create index id_index
    on students(id);


-- 4. Drop index of table emp 
	drop index emp_index on emp; 


-- 5. Find all the index of table dept
	show index from dept;

 
-- 6. Create a temporary table student with field  with filed id, name, age, gender 
	create temporary table students(
    id int,
    name varchar(40),
    age int,
    gender char(1)
    );

select * from students;

-- 7. Logout from session and login again to check if temporary table exists. 
	show tables;


-- 8. Create a temporary table test 
	create temporary table test(
    id int,
    name varchar(30)
    );


-- 9. Drop temporary table test
	drop temporary table test;






delimiter //
create procedure getempdetails(in empno int)
begin
select empname from emp where empno = empcode;
end //
delimiter ;

call getempdetails(7782);




delimiter //
create procedure getemp(in empno int, out dept varchar(15))
begin 
select deptcode into dept from emp where empcode = empno;
end //
delimiter ;

call getemp(7782, @dept);

select @dept;




delimiter //
create function getEmpSal( empno int )
returns int
deterministic
begin
declare sal int default 0 ;
select basicpay into sal from emp where empcode = empno;
return sal;
end //

delimiter ;

select getEmpSal(7782);






DELIMITER //

CREATE PROCEDURE showEmployees()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE ename VARCHAR(60);

    DECLARE emp_cursor CURSOR FOR
        SELECT empname FROM emp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO ename;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT ename;
    END LOOP;

    CLOSE emp_cursor;
END //

DELIMITER ;

CALL showEmployees();





DELIMITER //

CREATE PROCEDURE showEmp()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE n VARCHAR(60);
    DECLARE s INT;

    DECLARE c CURSOR FOR
        SELECT empname, basicpay FROM emp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN c;

    LOOP1: LOOP
        FETCH c INTO n, s;

        IF done = 1 THEN
            LEAVE LOOP1;
        END IF;

        SELECT n, s;
    END LOOP;

    CLOSE c;
END //

DELIMITER ;

CALL showEmp();

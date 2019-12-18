---------------------------------------------
---------------------------------------------

-- 2
-- Updating columns in member column.
-- Member wants to update his phone number and address.
UPDATE member
SET
    phone = '9818173627',
    address = 'Jawalakhel'
WHERE
    memberid = 11;
/

-- 3
-- Simple select statements.
-- a: Query to display employees who are Branch Managers who earn more than 26000. 

SELECT
    branchid,
    employeeid,
    empfirstname
    || ' '
    || emplastname AS "Name",
    salary
FROM
    employee
WHERE
    ( salary > 26000
      AND jobid = 'BR_MG' )
ORDER BY
    salary DESC;

-- b: Query to display employee information and the branch information of where they work.

SELECT
    empfirstname
    || ' '
    || emplastname AS "Name",
    empphone,
    branchname,
    branchlocation
FROM
    employee
    JOIN branch USING ( branchid );

-- c: Outer join to get information about branch locations that have no employee:
-- Since an employee must always have a branch, an outer left join will generate the same result as an inner join.
-- Below is a outer right join and full outer join, which similarly generate the same output in contrast.
-- Right Outer join

SELECT
    empfirstname
    || ' '
    || emplastname AS "Name",
    empphone,
    branchname,
    branchlocation
FROM
    employee right
    JOIN branch USING ( branchid );

-- Full Outer join

SELECT
    empfirstname
    || ' '
    || emplastname AS "Name",
    empphone,
    branchname,
    branchlocation
FROM
    employee
    FULL OUTER JOIN branch USING ( branchid );

-- 4 More select statements
-- a: Grouping of highest salary received by an employee in each job.

SELECT
    jobid,
    jobtitle,
    MAX(salary) AS "Highest Job Salary"
FROM
    employee
    JOIN job USING ( jobid )
GROUP BY
    jobid,
    jobtitle
ORDER BY
    MAX(salary) DESC;

-- b: Modification of above query to display only highest paid salary in a job that is more than 15,000.

SELECT
    jobid,
    jobtitle,
    MAX(salary) AS "Highest Job Salary"
FROM
    employee
    JOIN job USING ( jobid )
GROUP BY
    jobid,
    jobtitle
HAVING
    MAX(salary) > 15000
ORDER BY
    MAX(salary) DESC;

-- c: Query that displays the employee that processed the purchase and the exact day and time 
-- of when the purchase occured.

SELECT
    substr(empfirstname, 1, 1)
    || ' '
    || emplastname AS "Employee Name",
    purchaseid,
    to_char(purchasedate, 'Day" of" DD Month YYYY - HH24:MI:SS') AS "Purchase Date"
FROM
    employee
    JOIN purchase USING ( employeeid );

-- d: Query that displays the employee who has the highest salary in each job and the job position.
SELECT
    substr(empfirstname, 1, 1)
    || ' '
    || emplastname AS "Employee Name",
    salary,
    jobtitle
FROM
    employee
    JOIN job USING ( jobid )
WHERE
    ( jobid,
      salary ) IN (
        SELECT
            jobid,
            MAX(salary)
        FROM
            employee
        GROUP BY
            jobid
    );
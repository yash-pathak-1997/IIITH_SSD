SELECT 
	concat(e.Fname, " ", e.Minit, " ", e.Lname) as 'Full Name', 
    d.Mgr_ssn as 'ssn', 
    d.Dnumber as 'Dept. Id', 
    d.Dname as 'Dept. Name' 
from COMPANY.EMPLOYEE e
INNER JOIN COMPANY.DEPARTMENT d
ON e.Ssn = d.Mgr_ssn
INNER JOIN (SELECT w.Essn, e.Dno, sum(w.Hours) FROM COMPANY.WORKS_ON w
	INNER JOIN COMPANY.EMPLOYEE e
	ON e.Ssn = w.Essn
	GROUP BY Essn
	HAVING sum(Hours) < 40) f
ON f.Dno = d.Dnumber;

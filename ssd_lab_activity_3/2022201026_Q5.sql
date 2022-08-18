SELECT d.Essn as 'Manager ssn', y.Dnumber as 'Dept. Id', count(*) as 'Number of Dependents'
FROM COMPANY.DEPENDENT d
INNER JOIN (SELECT l.Dnumber, d.Mgr_ssn, count(*) FROM COMPANY.DEPT_LOCATIONS l
	INNER JOIN COMPANY.DEPARTMENT d
	ON l.Dnumber = d.Dnumber
	GROUP BY l.Dnumber, d.Mgr_ssn
	HAVING count(*) >= 2) y
ON y.Mgr_ssn = d.Essn
GROUP BY d.Essn, y.Dnumber;
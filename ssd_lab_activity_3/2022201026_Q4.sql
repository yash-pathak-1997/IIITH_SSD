SELECT l.Dnumber as 'Dept. Id', y.Dname as 'Dept. Name', count(*) as 'Number of locations'
FROM COMPANY.DEPT_LOCATIONS l
INNER JOIN (SELECT count(*) as 'female count', d1.Essn, d2.Dname, d2.Dnumber FROM COMPANY.DEPENDENT d1
	INNER JOIN COMPANY.DEPARTMENT d2
    ON d1.Essn = d2.Mgr_ssn
	WHERE d1.Sex = 'F'
	GROUP BY d1.Essn, d2.Dname, d2.Dnumber
    HAVING count(*) >= 2) y
ON l.Dnumber = y.Dnumber
GROUP BY l.Dnumber, y.Dname;

SELECT 
	w.Essn as 'Manager ssn', 
    count(w.Pno) as 'Number of projects' 
FROM COMPANY.WORKS_ON w
INNER JOIN (SELECT p.Pname, p.Dnum, d.Dname, d.Mgr_ssn FROM COMPANY.PROJECT p
	INNER JOIN COMPANY.DEPARTMENT d
	ON d.Dnumber = p.Dnum
	WHERE Pname = 'productY') y
ON y.Mgr_ssn = w.Essn
GROUP BY w.Essn;

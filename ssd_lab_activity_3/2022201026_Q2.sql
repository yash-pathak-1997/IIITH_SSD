SELECT 
	concat(e.Fname, " ", e.Minit, " ", e.Lname) as 'Full Name', 
    e.Ssn as 'ssn', 
    e.Dno as 'Dept. Id',
    f.count as 'Dept. Number of employees'
from COMPANY.EMPLOYEE e
INNER JOIN (SELECT count(distinct Ssn) as count,  Super_ssn
	FROM COMPANY.EMPLOYEE
	WHERE Super_ssn is not null
	GROUP BY Super_ssn) f
ON f.Super_ssn = e.Ssn
ORDER BY f.count asc;




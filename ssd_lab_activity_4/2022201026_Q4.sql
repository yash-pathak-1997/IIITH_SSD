-- Drop Procedure If Exists
DROP PROCEDURE IF EXISTS CUSTOMER_DB.get_cust_details_by_code;

-- Create Temp table
CREATE TABLE IF NOT EXISTS CUSTOMER_DB.`customer_details`(
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` varchar(35) DEFAULT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` decimal(10,0) DEFAULT NULL
);

-- Truncate temp table
TRUNCATE TABLE CUSTOMER_DB.`customer_details`;

-- PROCEDURE
DELIMITER &&  
CREATE PROCEDURE CUSTOMER_DB.get_cust_details_by_code (IN code_val varchar(20))  
BEGIN  
	DECLARE is_complete INT DEFAULT 0;
    DECLARE c_name varchar(40);
    DECLARE c_city varchar(35);
    DECLARE c_country varchar(20);
    DECLARE c_grade decimal(10,0);
    -- Cursor
    DECLARE ex_cursor CURSOR FOR SELECT CUST_NAME, CUST_CITY, CUST_COUNTRY, GRADE  FROM CUSTOMER_DB.`customer` WHERE AGENT_CODE LIKE CONCAT(code_val , '%');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_complete = 1;
    
    OPEN ex_cursor;
    label1: LOOP
    IF is_complete = 1 THEN
    LEAVE label1;
    END IF;
    FETCH ex_cursor INTO c_name, c_city, c_country, c_grade;
    
    IF NOT is_complete = 1 THEN
    INSERT INTO CUSTOMER_DB.customer_details VALUES (c_name, c_city, c_country, c_grade);
    
    END IF;
    END LOOP;
    
    CLOSE ex_cursor;
END &&  
DELIMITER ;

CALL CUSTOMER_DB.get_cust_details_by_code('A00');

SELECT * FROM CUSTOMER_DB.`customer_details`;

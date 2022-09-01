DROP PROCEDURE IF EXISTS get_name_by_cust_city;
    
DELIMITER &&  
CREATE PROCEDURE get_name_by_cust_city (IN city_name varchar(35))  
BEGIN  
	SELECT CUST_NAME FROM CUSTOMER_DB.customer
		WHERE LOWER(TRIM(WORKING_AREA)) = LOWER(TRIM(city_name));   
END &&  
DELIMITER ;

CALL get_name_by_cust_city('Bangalore');
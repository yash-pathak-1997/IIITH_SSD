DROP PROCEDURE IF EXISTS get_cust_details_by_amt;
    
DELIMITER &&  
CREATE PROCEDURE get_cust_details_by_amt()  
BEGIN  
	SELECT CUST_NAME, GRADE FROM CUSTOMER_DB.customer
		WHERE (OPENING_AMT + RECEIVE_AMT) > 10000;
END &&  
DELIMITER ;

CALL get_cust_details_by_amt();
    DROP PROCEDURE IF EXISTS add_numbers;
    
    DELIMITER &&  
    CREATE PROCEDURE add_numbers (IN a1 INT, IN a2 INT, OUT sum_a INT)  
    BEGIN  
        SELECT (a1+a2) INTO sum_a;   
    END &&  
    DELIMITER ;
    
    CALL add_numbers(120,135,@sum_a);
    
    SELECT @sum_a;
    

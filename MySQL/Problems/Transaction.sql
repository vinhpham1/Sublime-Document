#mysql transaction - roll back on any exception
DELIMITER $$

CREATE PROCEDURE `sp_fail`()
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
    INSERT INTO `tablea` (`date`) VALUES (NOW());
    INSERT INTO `tableb` (`date`) VALUES (NOW());
    INSERT INTO `tablec` (`date`) VALUES (NOW()); -- FAIL
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;
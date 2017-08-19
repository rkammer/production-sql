DELIMITER //
CREATE PROCEDURE production_state_delete(
    IN production_state_production_id    INT,
    IN production_state_state_code       CHAR(2),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    DELETE
      FROM production_state
     WHERE production_id = production_state_id
       AND state_code    = production_state_state_code;

    COMMIT;
END //
DELIMITER ;
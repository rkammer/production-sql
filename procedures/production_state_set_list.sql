DELIMITER //
CREATE PROCEDURE production_state_set_list(
    IN production_state_production_id    INT,
    IN production_state_state_code       CHAR(2),
    IN production_state_created_by       VARCHAR(30),
    IN production_state_updated_by       VARCHAR(30),
    IN production_state_status           VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_state
     WHERE production_id = production_state_production_id
       AND state_code    = production_state_state_code;

    IF (ROW_EXISTS = 0) THEN

        INSERT INTO production_state
        (
            production_id,
            state_code,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_state_production_id,
            production_state_state_code,
            production_state_created_by,
            production_state_updated_by,
            'CREATED'
        );

        COMMIT;

    END IF;

END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE production_state_set_list(
    IN production_state_production_id    INT,
    IN production_state_state_code       CHAR(2),
    IN production_state_created_by       VARCHAR(30),
    IN production_state_updated_by       VARCHAR(30),
    IN production_state_status           VARCHAR(30),
    OUT return_value                     INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

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

    SET return_value = 0;

     COMMIT;
END //
DELIMITER ;
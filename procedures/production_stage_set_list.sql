DELIMITER //
CREATE PROCEDURE production_stage_set_list(
    IN  production_stage_id                   INTEGER,
    IN  production_stage_name                 VARCHAR(50),
    IN  production_stage_created_by           VARCHAR(30),
    IN  production_stage_updated_by           VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_stage
     WHERE id = production_stage_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_stage
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_stage_name,
            production_stage_created_by,
            production_stage_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_stage
           SET name               =    production_stage_name,
               updated_by         =    production_stage_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    production_stage_id;
        SET return_value = production_stage_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
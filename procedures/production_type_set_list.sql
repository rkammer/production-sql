DELIMITER //
CREATE PROCEDURE production_type_set_list(
    IN  production_type_id           INTEGER,
    IN  production_type_name         VARCHAR(50),
    IN  production_type_created_by   VARCHAR(30),
    IN  production_type_updated_by   VARCHAR(30),
    OUT return_value                 INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_type
     WHERE id = production_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_type
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_type_name,
            production_type_created_by,
            production_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_type
           SET name       = production_type_name,
               updated_by = production_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_type_id;

         SET return_value = production_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE production_length_set_list(
    IN  production_length_id           INTEGER,
    IN  production_length_name         VARCHAR(50),
    IN  production_length_created_by   VARCHAR(30),
    IN  production_length_updated_by   VARCHAR(30),
    OUT return_value                   INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_length
     WHERE id = production_length_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_length
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_length_name,
            production_length_logo_path,
            production_length_created_by,
            production_length_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_length
           SET name       = production_length_name,
               updated_by = production_length_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_length_id;

         SET return_value = production_length_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
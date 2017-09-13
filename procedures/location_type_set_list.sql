DELIMITER //
CREATE PROCEDURE location_type_set_list(
    IN location_type_id            INT,
    IN location_type_name          VARCHAR(50),
    IN location_type_created_by    VARCHAR(30),
    IN location_type_updated_by    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM location_type
     WHERE id = location_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO location_type
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            location_type_name,
            location_type_created_by,
            location_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE location_type
           SET name               =    location_type_name,
               updated_by         =    location_type_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    location_type_id;
        SET return_value = location_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
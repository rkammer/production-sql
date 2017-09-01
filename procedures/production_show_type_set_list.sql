DELIMITER //
CREATE PROCEDURE production_show_type_set_list(
     IN production_show_type_id            INT,
     IN production_show_type_name          VARCHAR(50),
     IN production_show_type_created_by    VARCHAR(30),
     IN production_show_type_updated_by    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_show_type
     WHERE id = production_show_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_show_type
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_show_type_name,
            production_show_type_created_by,
            production_show_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_show_type
           SET name               =    production_show_type_name,
               updated_by         =    production_show_type_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    production_show_type_id;
        SET return_value = production_show_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE business_type_set_list(
    IN  business_type_id           INTEGER,
    IN  business_type_name         VARCHAR(50),
    IN  business_type_created_by   VARCHAR(30),
    IN  business_type_updated_by   VARCHAR(30),
    OUT return_value               INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM business_type
     WHERE id = business_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO business_type_id
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            business_type_name,
            business_type_created_by,
            business_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE business_type
           SET name          =    business_type_name,
               updated_by    =    business_type_updated_by,
               status        =    'UPDATED'
         WHERE id            =    business_type_id;

         SET return_value = business_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
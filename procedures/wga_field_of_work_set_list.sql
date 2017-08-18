DELIMITER //
CREATE PROCEDURE wga_field_of_work_set_list(
    IN wga_field_of_work_id            INT,
    IN wga_field_of_work_code          CHAR(1),
    IN wga_field_of_work_title         VARCHAR(50),
    IN wga_field_of_work_created_by    VARCHAR(30),
    IN wga_field_of_work_updated_by    VARCHAR(30),
    IN wga_field_of_work_status        VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_field_of_work
     WHERE id = wga_field_of_work_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_field_of_work
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_field_of_work_code,
            wga_field_of_work_title,
            wga_field_of_work_created_by,
            wga_field_of_work_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_field_of_work
           SET code               =  wga_field_of_work_code,
               title              =  wga_field_of_work_title,
               created            =  wga_field_of_work_created,
               created_by         =  wga_field_of_work_created_by,
               updated            =  wga_field_of_work_updated,
               updated_by         =  wga_field_of_work_updated_by,
               status             =  'UPDATED'
         WHERE id                 =  wga_field_of_work_id;

        SET return_value = wga_field_of_work_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
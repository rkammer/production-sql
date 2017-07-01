DELIMITER //
CREATE PROCEDURE field_work_set_list(
    INOUT field_work_id              INTEGER,
    IN    field_work_abreviation     CHAR(2),
    IN    field_work_name            CHAR(50),
    IN    field_work_created_by      VARCHAR(30),
    IN    field_work_updated_by      VARCHAR(30),
    IN    field_work_status          VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM field_work
     WHERE id = field_work_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO field_work
        (
            abreviation,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            field_work_abreviation,
            field_work_name,
            field_work_created_by,
            field_work_updated_by,
            'CREATED'
        );

        SET field_work_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE field_work
           SET abreviation   = abreviation,
               name          = name,
               updated_by    = updated_by,
               status        = 'UPDATED'
         WHERE id            = field_work_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
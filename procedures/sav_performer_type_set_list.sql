DELIMITER //
CREATE PROCEDURE sav_performer_type_set_list(
    IN sav_performer_type_id            INT,
    IN sav_performer_type_code          CHAR(3),
    IN sav_performer_type_title         VARCHAR(50),
    IN sav_performer_type_created_by    VARCHAR(30),
    IN sav_performer_type_updated_by    VARCHAR(30),
    IN sav_performer_type_status        VARCHAR(30),
    OUT return_value                INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_performer_type
     WHERE id = sav_performer_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_performer_type
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_performer_type_id,
            sav_performer_type_code,
            sav_performer_type_title,
            sav_performer_type_created_by,
            sav_performer_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_performer_type
           SET code       = sav_performer_type_code,
               title      = sav_performer_type_title,
               created_by = sav_performer_type_created_by,
               updated_by = sav_performer_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = sav_performer_type_id;

        SET return_value  = sav_performer_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
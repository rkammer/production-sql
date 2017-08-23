DELIMITER //
CREATE PROCEDURE sav_role_set_list(
    IN sav_role_id            INT,
    IN sav_role_code          CHAR(10),
    IN sav_role_title         VARCHAR(50),
    IN sav_role_created_by    VARCHAR(30),
    IN sav_role_updated_by    VARCHAR(30),
    OUT return_value          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_role
     WHERE id = sav_role_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_role
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_role_code,
            sav_role_title,
            sav_role_created_by,
            sav_role_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_role
           SET code       = sav_role_code,
               title      = sav_role_title,
               created_by = sav_role_created_by,
               updated_by = sav_role_updated_by,
               status     = 'UPDATED'
         WHERE id                 =    sav_role_id;
        SET return_value = sav_role_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
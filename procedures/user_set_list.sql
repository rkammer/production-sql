DELIMITER //
CREATE PROCEDURE user_set_list(
    IN user_id              VARCHAR(50),
    IN user_email           VARCHAR(100),
    IN user_first_name      VARCHAR(50),
    IN user_middle_name     VARCHAR(50),
    IN user_last_name       VARCHAR(50),
    IN user_suffix          VARCHAR(50),
    IN user_address         VARCHAR(100),
    IN user_city            VARCHAR(100),
    IN user_state_code      CHAR(2),
    IN user_phone           VARCHAR(20),
    IN user_website         VARCHAR(100),
    IN user_picture_path    VARCHAR(120),
    IN user_created_by      VARCHAR(30),
    IN user_updated_by      VARCHAR(30),
    IN user_status          VARCHAR(30),
    OUT return_value        INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM user
     WHERE user_id = user_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO user
        (
            user_id,
            email,
            first_name,
            middle_name,
            last_name,
            suffix,
            address,
            city,
            state_code,
            phone,
            website,
            picture_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            user_id,
            user_email,
            user_first_name,
            user_middle_name,
            user_last_name,
            user_suffix,
            user_address,
            user_city,
            user_state_code,
            user_phone,
            user_website,
            user_picture_path,
            user_created_by,
            user_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE user
           SET email              =    user_email,
               first_name         =    user_first_name,
               middle_name        =    user_middle_name,
               last_name          =    user_last_name,
               suffix             =    user_suffix,
               address            =    user_address,
               city               =    user_city,
               state_code         =    user_state_code,
               phone              =    user_phone,
               website            =    user_website,
               picture_path       =    user_picture_path,
               created_by         =    user_created_by,
               updated_by         =    user_updated_by,
               status             =    'UPDATED'
         WHERE user_id            =    user_id;
        SET return_value = user_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
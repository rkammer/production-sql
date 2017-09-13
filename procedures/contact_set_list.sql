DELIMITER //
CREATE PROCEDURE contact_set_list(
    IN contact_id              INT,
    IN contact_first_name      VARCHAR(50),
    IN contact_middle_name     VARCHAR(50),
    IN contact_last_name       VARCHAR(50),
    IN contact_suffix          VARCHAR(50),
    IN contact_address         VARCHAR(100),
    IN contact_city            VARCHAR(100),
    IN contact_state_code      CHAR(2),
    IN contact_phone           VARCHAR(20),
    IN contact_email           VARCHAR(100),
    IN contact_ssn             VARCHAR(11),
    IN contact_website         VARCHAR(100),
    IN contact_picture_path    VARCHAR(120),
    IN contact_created_by      VARCHAR(30),
    IN contact_updated_by      VARCHAR(30),
    OUT return_value           INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM contact
     WHERE id = contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO contact
        (
            first_name,
            middle_name,
            last_name,
            suffix,
            address,
            city,
            state_code,
            phone,
            email,
            ssn,
            website,
            picture_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            contact_first_name,
            contact_middle_name,
            contact_last_name,
            contact_suffix,
            contact_address,
            contact_city,
            contact_state_code,
            contact_phone,
            contact_email,
            contact_ssn,
            contact_website,
            contact_picture_path,
            contact_created_by,
            contact_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE contact
           SET first_name   = contact_first_name,
               middle_name  = contact_middle_name,
               last_name    = contact_last_name,
               suffix       = contact_suffix,
               address      = contact_address,
               city         = contact_city,
               state_code   = contact_state_code,
               phone        = contact_phone,
               email        = contact_email,
               ssn          = contact_ssn,
               website      = contact_website,
               picture_path = contact_picture_path,
               created_by   = contact_created_by,
               updated_by   = contact_updated_by,
               status       = 'UPDATED'
         WHERE id           = contact_id;

         SET return_value = contact_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
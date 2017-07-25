DELIMITER //
CREATE PROCEDURE contact_set_list(
    IN  contact_id                   INTEGER,
    IN  contact_name                 VARCHAR(100),
    IN  contact_address              VARCHAR(100),
    IN  contact_city                 VARCHAR(100),
    IN  contact_state_code           CHAR(2),
    IN  contact_phone                VARCHAR(20),
    IN  contact_email                VARCHAR(100),
    IN  contact_website              VARCHAR(100),
    IN  contact_picture_path         VARCHAR(120),
    IN  contact_created_by           VARCHAR(30),
    IN  contact_updated_by           VARCHAR(30),
    IN  contact_status               VARCHAR(30),
    OUT return_value                 INTEGER
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
            name,
            address,
            city,
            state_code,
            phone,
            email,
            website,
            picture_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            contact_name,
            contact_address,
            contact_city,
            contact_state_code,
            contact_phone,
            contact_email,
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
           SET name         = name,
               address      = address,
               city         = city,
               state_code   = state_code,
               phone        = phone,
               email        = email,
               website      = website,
               picture_path = picture_path,
               created_by   = created_by,
               updated_by   = updated_by,
               status       = 'UPDATED'
         WHERE id           = contact_id;

         SET return_value = contact_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
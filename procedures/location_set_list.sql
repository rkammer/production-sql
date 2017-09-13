DELIMITER //
CREATE PROCEDURE location_set_list(
    IN location_id                 INT,
    IN location_name               VARCHAR(50),
    IN location_location_type_id   INT,
    IN location_address            VARCHAR(100),
    IN location_city               VARCHAR(100),
    IN location_state_code         CHAR(2),
    IN location_zipcode            VARCHAR(10),
    IN location_phone              VARCHAR(20),
    IN location_latitude           DOUBLE,
    IN location_longitude          DOUBLE,
    IN location_contact_city       VARCHAR(100),
    IN location_contact_state_code CHAR(2),
    IN location_contact_zipcode    VARCHAR(10),
    IN location_contact_phone      VARCHAR(20),
    IN location_contact_email      VARCHAR(100),
    IN location_contact_website    VARCHAR(100),
    IN location_created_by         VARCHAR(30),
    IN location_updated_by         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM location
     WHERE id = location_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO location
        (
            name,
            location_type_id,
            address,
            city,
            state_code,
            zipcode,
            phone,
            latitude,
            longitude,
            contact_city,
            contact_state_code,
            contact_zipcode,
            contact_phone,
            contact_email,
            contact_website,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            location_name,
            location_location_type_id,
            location_address,
            location_city,
            location_state_code,
            location_zipcode,
            location_phone,
            location_latitude,
            location_longitude,
            location_contact_city,
            location_contact_state_code,
            location_contact_zipcode,
            location_contact_phone,
            location_contact_email,
            location_contact_website,
            location_created_by,
            location_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE location
           SET name               = location_name,
               location_type_id   = location_location_type_id,
               address            = location_address,
               city               = location_city,
               state_code         = location_state_code,
               zipcode            = location_zipcode,
               phone              = location_phone,
               latitude           = location_latitude,
               longitude          = location_longitude,
               contact_city       = location_contact_city,
               contact_state_code = location_contact_state_code,
               contact_zipcode    = location_contact_zipcode,
               contact_phone      = location_contact_phone,
               contact_email      = location_contact_email,
               contact_website    = location_contact_website,
               created_by         = location_created_by,
               updated_by         = location_updated_by,
               status             = 'UPDATED'
         WHERE id                 = location_id;
        SET return_value = location_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
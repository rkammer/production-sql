DELIMITER //
CREATE PROCEDURE network_set_list(
    IN  network_id                 INTEGER,
    IN  network_name               VARCHAR(50),
    IN  network_media_company_id   INTEGER,
    IN  network_business_group_id  INTEGER,
    IN  network_logo_path          VARCHAR(120),
    IN  network_created_by         VARCHAR(30),
    IN  network_updated_by         VARCHAR(30),
    OUT return_value               INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM network
     WHERE id = network_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO network
        (
            media_company_id,
            business_group_id,
            name,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            network_media_company_id,
            network_business_group_id,
            network_name,
            network_logo_path,
            network_created_by,
            network_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE network
           SET media_company_id  = network_media_company_id,
               business_group_id = network_business_group_id,
               name              = network_name,
               logo_path         = network_logo_path,
               updated_by        = network_updated_by,
               status            = 'UPDATED'
         WHERE id                = network_id;

         SET return_value = network_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
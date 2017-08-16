DELIMITER //
CREATE PROCEDURE production_contact_set_list(
    IN production_contact_production_id      INT,
    IN production_contact_contact_id         INT,
    IN production_contact_contact_role_id    INT,
    IN production_contact_created_by         VARCHAR(30),
    IN production_contact_updated_by         VARCHAR(30),
    IN production_contact_status             VARCHAR(30),
    OUT return_value                         INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_contact
     WHERE production_id = production_contact_production_id
       AND contact_id    = production_contact_contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_contact
        (
            production_id,
            contact_id,
            contact_role_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_contact_production_id,
            production_contact_contact_id,
            production_contact_contact_role_id,
            production_contact_created_by,
            production_contact_updated_by,
            'CREATED'
        );

        SET return_value = 0;
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_contact
           SET contact_role_id = production_contact_contact_role_id,
               created_by      = production_contact_created_by,
               updated_by      = production_contact_updated_by,
               status          = 'UPDATED'
         WHERE production_id   = production_contact_production_id
           AND contact_id      = production_contact_contact_id;

        SET return_value = 0;
     END IF;

     COMMIT;
END //
DELIMITER ;
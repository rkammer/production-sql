DELIMITER //
CREATE PROCEDURE company_contact_set_list(
    IN company_contact_company_id  INTEGER,
    IN company_contact_contact_id  INTEGER,
    IN company_contact_created_by  VARCHAR(30),
    IN company_contact_updated_by  VARCHAR(30),
    IN company_contact_status      VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM company_contact
     WHERE company_id = company_contact_company_id
       AND contact_id = company_contact_contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO company_contact
        (
            company_id,
            contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            company_contact_company_id,
            company_contact_contact_id,
            company_contact_created_by,
            company_contact_updated_by,
            'CREATED'
        );
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company_contact
           SET created_by   =   company_contact_created_by,
               updated_by   =   company_contact_updated_by,
               status       =   'UPDATED'
         WHERE company_id   = company_contact_company_id
           AND contact_id   = company_contact_contact_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
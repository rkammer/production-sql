DELIMITER //
CREATE PROCEDURE company_set_list(
    INOUT company_id           INTEGER,
    IN    company_name         VARCHAR(50),
    IN    company_address      VARCHAR(100),
    IN    company_city         VARCHAR(100),
    IN    company_state_code   CHAR(2),
    IN    company_phone        VARCHAR(20),
    IN    company_website      VARCHAR(100),
    IN    company_logo_path    VARCHAR(120),
    IN    company_created_by   VARCHAR(30),
    IN    company_updated_by   VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM company
     WHERE id = company_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO company
        (
            name,
            address,
            city,
            state_code,
            phone,
            website,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            company_name,
            company_address,
            company_city,
            company_state_code,
            company_phone,
            company_website,
            company_logo_path,
            company_created_by,
            company_updated_by,
            'CREATED'
        );

        SET company_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company
           SET name          =    company_name,
               address       =    company_address,
               city          =    company_city,
               state_code    =    company_state_code,
               phone         =    company_phone,
               website       =    company_website,
               logo_path     =    company_logo_path,
               updated_by    =    company_updated_by,
               status        =    'UPDATED'
         WHERE id            =    company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
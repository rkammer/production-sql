DELIMITER //
CREATE PROCEDURE company_set_list(
    IN  company_id                   INTEGER,
    IN  company_name                 VARCHAR(50),
    IN  company_address              VARCHAR(100),
    IN  company_city                 VARCHAR(100),
    IN  company_state_code           CHAR(2),
    IN  company_zipcode              VARCHAR(9),
    IN  company_phone                VARCHAR(20),
    IN  company_faxnumber            VARCHAR(20),
    IN  company_email                VARCHAR(100),
    IN  company_website              VARCHAR(100),
    IN  company_logo_path            VARCHAR(120),
    IN  company_media_company        CHAR(1),
    IN  company_production_company   CHAR(1),
    IN  company_payroll_company      CHAR(1),
    IN  company_created_by           VARCHAR(30),
    IN  company_updated_by           VARCHAR(30),
    OUT return_value                 INTEGER
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
            zipcode,
            phone,
            faxnumber,
            email,
            website,
            logo_path,
            media_company,
            production_company,
            payroll_company,
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
            company_zipcode,
            company_phone,
            company_faxnumber,
            company_email,
            company_website,
            company_logo_path,
            company_media_company,
            company_production_company,
            company_payroll_company,
            company_created_by,
            company_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company
           SET name               =    company_name,
               address            =    company_address,
               city               =    company_city,
               state_code         =    company_state_code,
               zipcode            =    company_zipcode,
               phone              =    company_phone,
               faxnumber          =    company_faxnumber,
               email              =    company_email,
               website            =    company_website,
               logo_path          =    company_logo_path,
               media_company      =    company_media_company,
               production_company =    company_production_company,
               payroll_company    =    company_payroll_company,
               updated_by         =    company_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    company_id;

         SET return_value = company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
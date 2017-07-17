DELIMITER //
CREATE PROCEDURE dga_quartely_earning_set_list(
    INOUT dga_quartely_earning_id                   INTEGER,
    IN    dga_quartely_earning_quarterly            VARCHAR(10),
    IN    dga_quartely_earning_year                 YEAR,
    IN    dga_quartely_earning_company_id           INTEGER,
    IN    dga_quartely_earning_contact_id           INTEGER,
    IN    dga_quartely_earning_prepared_by          VARCHAR(50),
    IN    dga_quartely_earning_phone                VARCHAR(20),
    IN    dga_quartely_earning_created_by           VARCHAR(30),
    IN    dga_quartely_earning_updated_by           VARCHAR(30),
    IN    dga_quartely_earning_status               VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quartely_earning
     WHERE id = dga_quartely_earning_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quartely_earning
        (
            quarterly,
            year,
            company_id,
            contact_id,
            prepared_by,
            phone,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_quartely_earning_quarterly,
            dga_quartely_earning_year,
            dga_quartely_earning_company_id,
            dga_quartely_earning_contact_id,
            dga_quartely_earning_prepared_by,
            dga_quartely_earning_phone,
            dga_quartely_earning_created_by,
            dga_quartely_earning_updated_by,
            'CREATED'
        );

        SET dga_quartely_earning_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quartely_earning
           SET quarterly   = dga_quartely_earning_quarterly,
               year        = dga_quartely_earning_year,
               company_id  = dga_quartely_earning_company_id,
               contact_id  = dga_quartely_earning_contact_id,
               prepared_by = dga_quartely_earning_prepared_by,
               phone       = dga_quartely_earning_phone,
               created_by  = dga_quartely_earning_created_by,
               updated_by  = dga_quartely_earning_updated_by,
               status      = 'UPDATED'
         WHERE id          = dga_quartely_earning_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
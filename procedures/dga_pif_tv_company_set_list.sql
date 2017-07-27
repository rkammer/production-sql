DELIMITER //
CREATE PROCEDURE dga_pif_tv_company_set_list(
    IN dga_pif_tv_company_id              INT,
    IN dga_pif_tv_company_dga_pif_tv_id   INT,
    IN dga_pif_tv_company_company_name    VARCHAR(50),
    IN dga_pif_tv_company_company_phone   VARCHAR(20),
    IN dga_pif_tv_company_created_by      VARCHAR(30),
    IN dga_pif_tv_company_updated_by      VARCHAR(30),
    OUT return_value                      INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_pif_tv_company
     WHERE id = dga_pif_tv_company_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_pif_tv_company
        (
            dga_pif_tv_id,
            company_name,
            company_phone,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_pif_tv_company_dga_pif_tv_id,
            dga_pif_tv_company_company_name,
            dga_pif_tv_company_company_phone,
            dga_pif_tv_company_created_by,
            dga_pif_tv_company_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_pif_tv_company
           SET dga_pif_tv_id = dga_pif_tv_company_dga_pif_tv_id,
               company_name  = dga_pif_tv_company_company_name,
               company_phone = dga_pif_tv_company_company_phone,
               created_by    = dga_pif_tv_company_created_by,
               updated_by    = dga_pif_tv_company_updated_by,
               status        = 'UPDATED'
         WHERE id            =    dga_pif_tv_company_id;

        SET return_value = dga_pif_tv_company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
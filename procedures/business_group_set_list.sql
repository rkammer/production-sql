DELIMITER //
CREATE PROCEDURE business_group_set_list(
    IN business_group_id            INT,
    IN business_group_name          VARCHAR(50),
    IN business_group_company_id    INT,
    IN business_group_created_by    VARCHAR(30),
    IN business_group_updated_by    VARCHAR(30),
    IN business_group_status        VARCHAR(30),
    OUT return_value                INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM business_group
     WHERE id = business_group_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO business_group
        (
            name,
            company_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            business_group_name,
            business_group_company_id,
            business_group_created,
            business_group_created_by,
            business_group_updated,
            business_group_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE business_group
           SET name         =  business_group_name,
               company_id   =  business_group_company_id,
               created_by   =  business_group_created_by,
               updated_by   =  business_group_updated_by,
               status       =  'UPDATED'
         WHERE id           =  business_group_id;

        SET return_value = business_group_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
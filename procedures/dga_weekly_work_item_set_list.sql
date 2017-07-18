DELIMITER //
CREATE PROCEDURE dga_weekly_work_item_set_list(
    INOUT dga_weekly_work_item_id                          INTEGER,
    IN    dga_weekly_work_item_dga_weekly_work_id          INTEGER,
    IN    dga_weekly_work_item_name                        VARCHAR(50),
    IN    dga_weekly_work_item_ssn                         VARCHAR(11),
    IN    dga_weekly_work_item_category                    VARCHAR(30),
    IN    dga_weekly_work_item_created_by                  VARCHAR(30),
    IN    dga_weekly_work_item_updated_by                  VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_weekly_work_item
     WHERE id = dga_weekly_work_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_weekly_work_item
        (
            dga_weekly_work_id,
            name,
            ssn,
            category,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_weekly_work_item_dga_weekly_work_id,
            dga_weekly_work_item_name,
            dga_weekly_work_item_ssn,
            dga_weekly_work_item_category,
            dga_weekly_work_item_created_by,
            dga_weekly_work_item_updated_by,
            'CREATED'
        );

        SET dga_weekly_work_item_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_weekly_work_item
           SET dga_weekly_work_id  =  dga_weekly_work_item_dga_weekly_work_id,
               name                =  dga_weekly_work_item_name,
               ssn                 =  dga_weekly_work_item_ssn,
               category            =  dga_weekly_work_item_category,
               updated_by          =  dga_weekly_work_item_updated_by,
               status              =  'UPDATED'
         WHERE id                  =  dga_weekly_work_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
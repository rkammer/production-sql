DELIMITER //
CREATE PROCEDURE wga_deal_type_set_list(
    IN wga_deal_type_id          INT,
    IN wga_deal_type_code        CHAR(2),
    IN wga_deal_type_title       VARCHAR(30),
    IN wga_deal_type_created_by  VARCHAR(30),
    IN wga_deal_type_updated_by  VARCHAR(30),
    IN wga_deal_type_status      VARCHAR(30),
    OUT return_value             INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_deal_type
     WHERE id = wga_deal_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_deal_type
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_deal_type_code,
            wga_deal_type_title,
            wga_deal_type_created,
            wga_deal_type_created_by,
            wga_deal_type_updated,
            wga_deal_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_deal_type
           SET code       = wga_deal_type_code,
               title      = wga_deal_type_title,
               created    = wga_deal_type_created,
               created_by = wga_deal_type_created_by,
               updated    = wga_deal_type_updated,
               updated_by = wga_deal_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = wga_deal_type_id;
        SET return_value = wga_deal_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
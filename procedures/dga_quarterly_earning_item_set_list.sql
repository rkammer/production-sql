DELIMITER //
CREATE PROCEDURE dga_quartely_earning_item_set_list(
    IN  dga_quartely_earning_item_id                          INTEGER,
    IN  dga_quartely_earning_item_dga_quarterly_earning_id    INTEGER,
    IN  dga_quartely_earning_item_name                        VARCHAR(50),
    IN  dga_quartely_earning_item_ssn                         VARCHAR(11),
    IN  dga_quartely_earning_item_category                    VARCHAR(30),
    IN  dga_quartely_earning_item_production_id               INTEGER,
    IN  dga_quartely_earning_item_earnings                    NUMERIC(15,2),
    IN  dga_quartely_earning_item_created_by                  VARCHAR(30),
    IN  dga_quartely_earning_item_updated_by                  VARCHAR(30),
    OUT return_value                                          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quartely_earning_item
     WHERE id = dga_quartely_earning_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quartely_earning_item
        (
            dga_quarterly_earning_id,
            name,
            ssn,
            category,
            production_id,
            earnings,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_quartely_earning_item_dga_quarterly_earning_id,
            dga_quartely_earning_item_name,
            dga_quartely_earning_item_ssn,
            dga_quartely_earning_item_category,
            dga_quartely_earning_item_production_id,
            dga_quartely_earning_item_earnings,
            dga_quartely_earning_item_created_by,
            dga_quartely_earning_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quartely_earning_item
           SET dga_quarterly_earning_id =   dga_quartely_earning_item_dga_quarterly_earning_id,
               name                     =   dga_quartely_earning_item_name,
               ssn                      =   dga_quartely_earning_item_ssn,
               category                 =   dga_quartely_earning_item_category,
               production_id            =   dga_quartely_earning_item_production_id,
               earnings                 =   dga_quartely_earning_item_earnings,
               updated_by               =   dga_quartely_earning_item_updated_by,
               status                   =   'UPDATED'
         WHERE id                       =   dga_quartely_earning_item_id;
     END IF;

     SET return_value = dga_quartely_earning_item_id;

     COMMIT;
END //
DELIMITER ;
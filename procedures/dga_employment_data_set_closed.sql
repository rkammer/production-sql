DELIMITER //
CREATE PROCEDURE dga_employment_data_set_closed_set_closed(
    IN dga_employment_data_set_closed_id                   INTEGER,
    IN dga_employment_data_set_closed_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_employment_data
       SET status     = 'CLOSED',
           updated_by = dga_employment_data_set_closed_updated_by
     WHERE id         = dga_employment_data_set_closed_id;

     COMMIT;
END //
DELIMITER ;
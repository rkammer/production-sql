DELIMITER //
CREATE PROCEDURE dga_quarterly_earning_set_closed(
    IN dga_quarterly_earning_id          INTEGER,
    IN dga_quarterly_earning_updated_by  VARCHAR(30)
)
BEGIN

    UPDATE dga_quarterly_earning
       SET status     = 'CLOSED',
           updated_by = dga_quarterly_earning_updated_by
     WHERE id = dga_quarterly_earning_id;
     COMMIT;

     UPDATE dga_quarterly_earning_item
       SET status     = 'CLOSED',
           updated_by = dga_quarterly_earning_updated_by
     WHERE dga_quarterly_earning_id = dga_quarterly_earning_id
       AND status != 'DELETED';
     COMMIT;

END //
DELIMITER ;
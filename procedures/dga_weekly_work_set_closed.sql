DELIMITER //
CREATE PROCEDURE dga_weekly_work_set_closed(
    IN dga_weekly_work_item_id          INTEGER,
    IN dga_weekly_work_item_updated_by  VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    UPDATE dga_weekly_work
       SET status     = 'CLOSED',
           updated_by = dga_weekly_work_item_updated_by
     WHERE id         = dga_weekly_work_item_id;

    UPDATE dga_weekly_work_item
       SET status     = 'CLOSED',
           updated_by = dga_weekly_work_item_updated_by
     WHERE id         = dga_weekly_work_item_id
       AND status    != 'DELETED';

     COMMIT;
END //
DELIMITER ;
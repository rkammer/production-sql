DELIMITER //
CREATE PROCEDURE dga_stage_manager_deal_memo_set_closed(
    IN dga_stage_manager_deal_memo_id                   INTEGER,
    IN dga_stage_manager_deal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_stage_manager_deal_memo
       SET status     = 'CLOSED',
           updated_by = dga_stage_manager_deal_memo_updated_by
     WHERE id         = dga_stage_manager_deal_memo_id;
     COMMIT;

END //
DELIMITER ;
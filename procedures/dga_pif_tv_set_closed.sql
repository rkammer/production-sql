DELIMITER //
CREATE PROCEDURE dga_pif_tv_set_closed(
    IN dga_pif_tv_id          INTEGER,
    IN dga_pif_tv_updated_by  VARCHAR(30)
)
BEGIN

    UPDATE dga_pif_tv
       SET status     = 'CLOSED',
           updated_by = dga_pif_tv_updated_by
     WHERE id = dga_pif_tv_id;
     COMMIT;

     UPDATE dga_pif_tv_company
       SET status     = 'CLOSED',
           updated_by = dga_pif_tv_updated_by
     WHERE dga_pif_tv_id = dga_pif_tv_id
       AND status != 'DELETED';
     COMMIT;

END //
DELIMITER ;
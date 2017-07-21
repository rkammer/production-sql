DELIMITER //
CREATE PROCEDURE wga_work_list_set_closed(
    IN wga_work_list_id                INT,
    IN wga_work_list_updated_by        VARCHAR(30)
)
BEGIN

    UPDATE wga_work_list
       SET updated_by     = wga_work_list_updated_by,
           status         = 'CLOSED'
     WHERE id             = wga_work_list_id;

     COMMIT;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE wga_work_item_set_list(
    IN wga_work_list_item_id                  INT,
    IN wga_work_list_item_wga_work_list_id    INT,
    IN wga_work_list_item_contact_id          INT,
    IN wga_work_list_item_episode_id          INT,
    IN wga_work_list_item_deal_type_id        INT,
    IN wga_work_list_item_field_of_work_id    INT,
    IN wga_work_list_item_date_start          DATE,
    IN wga_work_list_item_date_end            DATE,
    IN wga_work_list_item_additional_data     VARCHAR(100),
    IN wga_work_list_item_created_by          VARCHAR(30),
    IN wga_work_list_item_updated_by          VARCHAR(30),
    IN wga_work_list_item_status              VARCHAR(30),
    OUT return_value                          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_work_item
     WHERE id = wga_work_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_work_item
        (
            wga_work_list_id,
            contact_id,
            episode_id,
            deal_type_id,
            field_of_work_id,
            date_start,
            date_end,
            additional_data,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_work_list_item_wga_work_list_id,
            wga_work_list_item_contact_id,
            wga_work_list_item_episode_id,
            wga_work_list_item_deal_type_id,
            wga_work_list_item_field_of_work_id,
            wga_work_list_item_date_start,
            wga_work_list_item_date_end,
            wga_work_list_item_additional_data,
            wga_work_list_item_created_by,
            wga_work_list_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_work_item
           SET wga_work_list_id   = wga_work_list_item_wga_work_list_id,
               contact_id         = wga_work_list_item_contact_id,
               episode_id         = wga_work_list_item_episode_id,
               deal_type_id       = wga_work_list_item_deal_type_id,
               field_of_work_id   = wga_work_list_item_field_of_work_id,
               date_start         = wga_work_list_item_date_start,
               date_end           = wga_work_list_item_date_end,
               additional_data    = wga_work_list_item_additional_data,
               created_by         = wga_work_list_item_created_by,
               updated_by         = wga_work_list_item_updated_by,
               status             = 'UPDATED'
         WHERE id                 = wga_work_item_id;

        SET return_value = wga_work_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
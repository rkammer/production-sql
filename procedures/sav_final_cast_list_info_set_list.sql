DELIMITER //
CREATE PROCEDURE sav_final_cast_list_info_set_list(
    IN sav_final_cast_list_info_id                        INT,
    IN sav_final_cast_list_info_date_filled               DATE,
    IN sav_final_cast_list_info_production_id             INT,
    IN sav_final_cast_list_info_shooting_location         VARCHAR(400),
    IN sav_final_cast_list_info_production_company_id     INT,
    IN sav_final_cast_list_info_start_date                DATE,
    IN sav_final_cast_list_info_end_date                  DATE,
    IN sav_final_cast_list_info_federal_id                VARCHAR(50),
    IN sav_final_cast_list_info_state_id                  VARCHAR(50),
    IN sav_final_cast_list_info_picture_id                VARCHAR(50),
    IN sav_final_cast_list_info_distribuitor_id           VARCHAR(50),
    IN sav_final_cast_list_info_sav_production_type_id    INT,
    IN sav_final_cast_list_info_created_by                VARCHAR(30),
    IN sav_final_cast_list_info_updated_by                VARCHAR(30),
    IN sav_final_cast_list_info_status                    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_final_cast_list_info
     WHERE id = sav_final_cast_list_info_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_final_cast_list_info
        (
            date_filled,
            production_id,
            shooting_location,
            production_company_id,
            start_date,
            end_date,
            federal_id,
            state_id,
            picture_id,
            distribuitor_id,
            sav_production_type_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_final_cast_list_info_date_filled,
            sav_final_cast_list_info_production_id,
            sav_final_cast_list_info_shooting_location,
            sav_final_cast_list_info_production_company_id,
            sav_final_cast_list_info_start_date,
            sav_final_cast_list_info_end_date,
            sav_final_cast_list_info_federal_id,
            sav_final_cast_list_info_state_id,
            sav_final_cast_list_info_picture_id,
            sav_final_cast_list_info_distribuitor_id,
            sav_final_cast_list_info_sav_production_type_id,
            sav_final_cast_list_info_created_by,
            sav_final_cast_list_info_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_final_cast_list_info
           SET date_filled            = sav_final_cast_list_info_date_filled,
               production_id          = sav_final_cast_list_info_production_id,
               shooting_location      = sav_final_cast_list_info_shooting_location,
               production_company_id  = sav_final_cast_list_info_production_company_id,
               start_date             = sav_final_cast_list_info_start_date,
               end_date               = sav_final_cast_list_info_end_date,
               federal_id             = sav_final_cast_list_info_federal_id,
               state_id               = sav_final_cast_list_info_state_id,
               picture_id             = sav_final_cast_list_info_picture_id,
               distribuitor_id        = sav_final_cast_list_info_distribuitor_id,
               sav_production_type_id = sav_final_cast_list_info_sav_production_type_id,
               created_by             = sav_final_cast_list_info_created_by,
               updated_by             = sav_final_cast_list_info_updated_by,
               status                 = 'UPDATED'
         WHERE id                     = sav_final_cast_list_info_id;

        SET return_value = sav_final_cast_list_info_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
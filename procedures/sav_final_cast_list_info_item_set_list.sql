DELIMITER //
CREATE PROCEDURE sav_final_cast_list_info_item_set_list(
    IN sav_final_cast_list_info_item_id                             INT,
    IN sav_final_cast_list_info_item_sav_final_cast_list_info_id    INT,
    IN sav_final_cast_list_info_item_production_id                  INT,
    IN sav_final_cast_list_info_item_contact_id                     INT,
    IN sav_final_cast_list_info_item_loan_out_corp                  VARCHAR(50),
    IN sav_final_cast_list_info_item_federal_id                     VARCHAR(30),
    IN sav_final_cast_list_info_item_days_number                    INT,
    IN sav_final_cast_list_info_item_weeks_number                   INT,
    IN sav_final_cast_list_info_item_start_date                     DATE,
    IN sav_final_cast_list_info_item_end_date                       DATE,
    IN sav_final_cast_list_info_item_contract_type                  CHAR(1),
    IN sav_final_cast_list_info_item_sav_performer_type_id          INT,
    IN sav_final_cast_list_info_item_salary_total_gross             DECIMAL,
    IN sav_final_cast_list_info_item_salary_base                    DECIMAL,
    IN sav_final_cast_list_info_item_units_type                     INT,
    IN sav_final_cast_list_info_item_units_salary                   INT,
    IN sav_final_cast_list_info_item_units_total                    INT,
    IN sav_final_cast_list_info_item_created_by                     VARCHAR(30),
    IN sav_final_cast_list_info_item_updated_by                     VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_final_cast_list_info_item
     WHERE id = sav_final_cast_list_info_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_final_cast_list_info_item
        (
            sav_final_cast_list_info_id,
            production_id,
            contact_id,
            loan_out_corp,
            federal_id,
            days_number,
            weeks_number,
            start_date,
            end_date,
            contract_type,
            sav_performer_type_id,
            salary_total_gross,
            salary_base,
            units_type,
            units_salary,
            units_total,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_final_cast_list_info_item_sav_final_cast_list_info_id,
            sav_final_cast_list_info_item_production_id,
            sav_final_cast_list_info_item_contact_id,
            sav_final_cast_list_info_item_loan_out_corp,
            sav_final_cast_list_info_item_federal_id,
            sav_final_cast_list_info_item_days_number,
            sav_final_cast_list_info_item_weeks_number,
            sav_final_cast_list_info_item_start_date,
            sav_final_cast_list_info_item_end_date,
            sav_final_cast_list_info_item_contract_type,
            sav_final_cast_list_info_item_sav_performer_type_id,
            sav_final_cast_list_info_item_salary_total_gross,
            sav_final_cast_list_info_item_salary_base,
            sav_final_cast_list_info_item_units_type,
            sav_final_cast_list_info_item_units_salary,
            sav_final_cast_list_info_item_units_total,
            sav_final_cast_list_info_item_created_by,
            sav_final_cast_list_info_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_final_cast_list_info_item
           SET sav_final_cast_list_info_id = sav_final_cast_list_info_item_sav_final_cast_list_info_id,
               production_id               = sav_final_cast_list_info_item_production_id,
               contact_id                  = sav_final_cast_list_info_item_contact_id,
               loan_out_corp               = sav_final_cast_list_info_item_loan_out_corp,
               federal_id                  = sav_final_cast_list_info_item_federal_id,
               days_number                 = sav_final_cast_list_info_item_days_number,
               weeks_number                = sav_final_cast_list_info_item_weeks_number,
               start_date                  = sav_final_cast_list_info_item_start_date,
               end_date                    = sav_final_cast_list_info_item_end_date,
               contract_type               = sav_final_cast_list_info_item_contract_type,
               sav_performer_type_id       = sav_final_cast_list_info_item_sav_performer_type_id,
               salary_total_gross          = sav_final_cast_list_info_item_salary_total_gross,
               salary_base                 = sav_final_cast_list_info_item_salary_base,
               units_type                  = sav_final_cast_list_info_item_units_type,
               units_salary                = sav_final_cast_list_info_item_units_salary,
               units_total                 = sav_final_cast_list_info_item_units_total,
               created_by                  = sav_final_cast_list_info_item_created_by,
               updated_by                  = sav_final_cast_list_info_item_updated_by,
               status                      = 'UPDATED'
         WHERE id                 =    sav_final_cast_list_info_item_id;
        SET return_value = sav_final_cast_list_info_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
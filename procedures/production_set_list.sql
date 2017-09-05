DELIMITER //
CREATE PROCEDURE production_set_list(
    IN production_id                               INT,
    IN production_title                            VARCHAR(50),
    IN production_media_company_id                 INT,
    IN production_business_group_id                INT,
    IN production_network_id                       INT,
    -- IN production_pilot                            CHAR(1),
    IN production_production_show_type_id          INT,
    IN production_production_stage_id              INT,
    IN production_season_number                    INT,
    IN production_episodes_number                  INT,
    -- IN production_budget                           DECIMAL,
    IN production_tax_incentive                    CHAR(1),
    IN production_gross_budget                     DECIMAL,
    IN production_net_budget                       DECIMAL,
    IN production_writing_start_date               DATE,
    IN production_writing_end_date                 DATE,
    IN production_pre_production_start_date        DATE,
    IN production_pre_production_end_date          DATE,
    IN production_photography_start_date           DATE,
    IN production_photography_end_date             DATE,
    IN production_post_production_start_date       DATE,
    IN production_post_production_end_date         DATE,
    IN production_network_production_start_date    DATE,
    IN production_network_production_end_date      DATE,
    IN production_production_length_id             INT,
    IN production_production_type_id               INT,
    IN production_production_company_id            INT,
    IN production_payroll_company_id               INT,
    IN production_logo_path                        VARCHAR(120),
    IN production_created_by                       VARCHAR(30),
    IN production_updated_by                       VARCHAR(30),
    IN production_status                           VARCHAR(30),
    OUT return_value                               INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production
     WHERE id = production_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production
        (
            title,
            media_company_id,
            business_group_id,
            network_id,
            -- pilot,
            production_show_type_id,
            production_stage_id,
            season_number,
            episodes_number,
            -- budget,
            tax_incentive,
            gross_budget,
            net_budget,
            writing_start_date,
            writing_end_date,
            pre_production_start_date,
            pre_production_end_date,
            photography_start_date,
            photography_end_date,
            post_production_start_date,
            post_production_end_date,
            network_production_start_date,
            network_production_end_date,
            production_length_id,
            production_type_id,
            production_company_id,
            payroll_company_id,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_title,
            production_media_company_id,
            production_business_group_id,
            production_network_id,
            -- production_pilot,
            production_production_show_type_id,
            production_production_stage_id,
            production_season_number,
            production_episodes_number,
            -- production_budget,
            production_tax_incentive,
            production_gross_budget,
            production_net_budget,
            production_writing_start_date,
            production_writing_end_date,
            production_pre_production_start_date,
            production_pre_production_end_date,
            production_photography_start_date,
            production_photography_end_date,
            production_post_production_start_date,
            production_post_production_end_date,
            production_network_production_start_date,
            production_network_production_end_date,
            production_production_length_id,
            production_production_type_id,
            production_production_company_id,
            production_payroll_company_id,
            production_logo_path,
            production_created_by,
            production_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production
           SET title                         = production_title,
               media_company_id              = production_media_company_id,
               business_group_id             = production_business_group_id,
               network_id                    = production_network_id,
            --    pilot                         = production_pilot,
               production_show_type_id       = production_production_show_type_id,
               production_stage_id           = production_production_stage_id,
               season_number                 = production_season_number,
               episodes_number               = production_episodes_number,
            --    budget                        = production_budget,
               tax_incentive                 = production_tax_incentive,
               gross_budget                  = production_gross_budget,
               net_budget                    = production_net_budget,
               writing_start_date            = production_writing_start_date,
               writing_end_date              = production_writing_end_date,
               pre_production_start_date     = production_pre_production_start_date,
               pre_production_end_date       = production_pre_production_end_date,
               photography_start_date        = production_photography_start_date,
               photography_end_date          = production_photography_end_date,
               post_production_start_date    = production_post_production_start_date,
               post_production_end_date      = production_post_production_end_date,
               network_production_start_date = production_network_production_start_date,
               network_production_end_date   = production_network_production_end_date,
               production_length_id          = production_production_length_id,
               production_type_id            = production_production_type_id,
               production_company_id         = production_production_company_id,
               payroll_company_id            = production_payroll_company_id,
               logo_path                     = production_logo_path,
               created_by                    = production_created_by,
               updated_by                    = production_updated_by,
               status                        = 'UPDATED'
         WHERE id                            = production_id;

         SET return_value = production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
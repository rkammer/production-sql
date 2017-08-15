DELIMITER //
CREATE PROCEDURE dga_upm_deal_memo_set_list(
    IN dga_upm_deal_memo_id                                              INT,
    IN dga_upm_deal_memo_contact_id                                      INT,
    IN dga_upm_deal_memo_ssn                                             VARCHAR(11),
    IN dga_upm_deal_memo_loanout                                         VARCHAR(30),
    IN dga_upm_deal_memo_fid                                             VARCHAR(30),
    IN dga_upm_deal_memo_category_unit_production_manager                CHAR(1),
    IN dga_upm_deal_memo_category_additional_second_assistant_director   CHAR(1),
    IN dga_upm_deal_memo_category_first_assistant_director               CHAR(1),
    IN dga_upm_deal_memo_category_associate_director                     CHAR(1),
    IN dga_upm_deal_memo_category_key_second_assistant_director          CHAR(1),
    IN dga_upm_deal_memo_category_associate_director_line_cut            CHAR(1),
    IN dga_upm_deal_memo_category_second_assistant_director              CHAR(1),
    IN dga_upm_deal_memo_salary_studio                                   DECIMAL,
    IN dga_upm_deal_memo_salary_studio_period_id                         INT,
    IN dga_upm_deal_memo_salary_location                                 DECIMAL,
    IN dga_upm_deal_memo_salary_location_period_id                       INT,
    IN dga_upm_deal_memo_start_date                                      DATE,
    IN dga_upm_deal_memo_guaranteed_period_1                             CHAR(1),
    IN dga_upm_deal_memo_guaranteed_period_3                             CHAR(1),
    IN dga_upm_deal_memo_guaranteed_period_7                             CHAR(1),
    IN dga_upm_deal_memo_production_id                                   INT,
    IN dga_upm_deal_memo_episode_id                                      INT,
    IN dga_upm_deal_memo_type_production_feature                         CHAR(1),
    IN dga_upm_deal_memo_type_production_multi_camera_prime_time         CHAR(1),
    IN dga_upm_deal_memo_type_production_single_camera                   CHAR(1),
    IN dga_upm_deal_memo_type_production_other_television                CHAR(1),
    IN dga_upm_deal_memo_project_info_30_lower                           CHAR(1),
    IN dga_upm_deal_memo_project_info_30_between                         CHAR(1),
    IN dga_upm_deal_memo_project_info_30_higher                          CHAR(1),
    IN dga_upm_deal_memo_project_info_60_lower                           CHAR(1),
    IN dga_upm_deal_memo_project_info_60_between                         CHAR(1),
    IN dga_upm_deal_memo_project_info_60_higher                          CHAR(1),
    IN dga_upm_deal_memo_project_info_120_lower                          CHAR(1),
    IN dga_upm_deal_memo_project_info_120_between                        CHAR(1),
    IN dga_upm_deal_memo_project_info_120_higher                         CHAR(1),
    IN dga_upm_deal_memo_location_studio                                 CHAR(1),
    IN dga_upm_deal_memo_location_distant                                CHAR(1),
    IN dga_upm_deal_memo_location_distant_specific                       VARCHAR(50),
    IN dga_upm_deal_memo_location_both                                   CHAR(1),
    IN dga_upm_deal_memo_location_both_specific                          VARCHAR(50),
    IN dga_upm_deal_memo_other_conditions                                VARCHAR(50),
    IN dga_upm_deal_memo_employer_name                                   VARCHAR(50),
    IN dga_upm_deal_memo_employee_name                                   VARCHAR(50),
    IN dga_upm_deal_memo_employee_date                                   DATE,
    IN dga_upm_deal_memo_signatory                                       VARCHAR(50),
    IN dga_upm_deal_memo_signatory_by                                    VARCHAR(50),
    IN dga_upm_deal_memo_signatory_date                                  DATE,
    IN dga_upm_deal_memo_created_by                                      VARCHAR(30),
    IN dga_upm_deal_memo_updated_by                                      VARCHAR(30),
    IN dga_upm_deal_memo_status                                          VARCHAR(30),
    OUT return_value                                                     INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_upm_deal_memo
     WHERE id = dga_upm_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_upm_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            category_unit_production_manager,
            category_additional_second_assistant_director,
            category_first_assistant_director,
            category_associate_director,
            category_key_second_assistant_director,
            category_associate_director_line_cut,
            category_second_assistant_director,
            salary_studio,
            salary_studio_period_id,
            salary_location,
            salary_location_period_id,
            start_date,
            guaranteed_period_1,
            guaranteed_period_3,
            guaranteed_period_7,
            production_id,
            episode_id,
            type_production_feature,
            type_production_multi_camera_prime_time,
            type_production_single_camera,
            type_production_other_television,
            project_info_30_lower,
            project_info_30_between,
            project_info_30_higher,
            project_info_60_lower,
            project_info_60_between,
            project_info_60_higher,
            project_info_120_lower,
            project_info_120_between,
            project_info_120_higher,
            location_studio,
            location_distant,
            location_distant_specific,
            location_both,
            location_both_specific,
            other_conditions,
            employer_name,
            employee_name,
            employee_date,
            signatory,
            signatory_by,
            signatory_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_upm_deal_memo_contact_id,
            dga_upm_deal_memo_ssn,
            dga_upm_deal_memo_loanout,
            dga_upm_deal_memo_fid,
            dga_upm_deal_memo_category_unit_production_manager,
            dga_upm_deal_memo_category_additional_second_assistant_director,
            dga_upm_deal_memo_category_first_assistant_director,
            dga_upm_deal_memo_category_associate_director,
            dga_upm_deal_memo_category_key_second_assistant_director,
            dga_upm_deal_memo_category_associate_director_line_cut,
            dga_upm_deal_memo_category_second_assistant_director,
            dga_upm_deal_memo_salary_studio,
            dga_upm_deal_memo_salary_studio_period_id,
            dga_upm_deal_memo_salary_location,
            dga_upm_deal_memo_salary_location_period_id,
            dga_upm_deal_memo_start_date,
            dga_upm_deal_memo_guaranteed_period_1,
            dga_upm_deal_memo_guaranteed_period_3,
            dga_upm_deal_memo_guaranteed_period_7,
            dga_upm_deal_memo_production_id,
            dga_upm_deal_memo_episode_id,
            dga_upm_deal_memo_type_production_feature,
            dga_upm_deal_memo_type_production_multi_camera_prime_time,
            dga_upm_deal_memo_type_production_single_camera,
            dga_upm_deal_memo_type_production_other_television,
            dga_upm_deal_memo_project_info_30_lower,
            dga_upm_deal_memo_project_info_30_between,
            dga_upm_deal_memo_project_info_30_higher,
            dga_upm_deal_memo_project_info_60_lower,
            dga_upm_deal_memo_project_info_60_between,
            dga_upm_deal_memo_project_info_60_higher,
            dga_upm_deal_memo_project_info_120_lower,
            dga_upm_deal_memo_project_info_120_between,
            dga_upm_deal_memo_project_info_120_higher,
            dga_upm_deal_memo_location_studio,
            dga_upm_deal_memo_location_distant,
            dga_upm_deal_memo_location_distant_specific,
            dga_upm_deal_memo_location_both,
            dga_upm_deal_memo_location_both_specific,
            dga_upm_deal_memo_other_conditions,
            dga_upm_deal_memo_employer_name,
            dga_upm_deal_memo_employee_name,
            dga_upm_deal_memo_employee_date,
            dga_upm_deal_memo_signatory,
            dga_upm_deal_memo_signatory_by,
            dga_upm_deal_memo_signatory_date,
            dga_upm_deal_memo_created_by,
            dga_upm_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_upm_deal_memo
           SET contact_id                                    = dga_upm_deal_memo_contact_id,
               ssn                                           = dga_upm_deal_memo_ssn,
               loanout                                       = dga_upm_deal_memo_loanout,
               fid                                           = dga_upm_deal_memo_fid,
               category_unit_production_manager              = dga_upm_deal_memo_category_unit_production_manager,
               category_additional_second_assistant_director = dga_upm_deal_memo_category_additional_second_assistant_director,
               category_first_assistant_director             = dga_upm_deal_memo_category_first_assistant_director,
               category_associate_director                   = dga_upm_deal_memo_category_associate_director,
               category_key_second_assistant_director        = dga_upm_deal_memo_category_key_second_assistant_director,
               category_associate_director_line_cut          = dga_upm_deal_memo_category_associate_director_line_cut,
               category_second_assistant_director            = dga_upm_deal_memo_category_second_assistant_director,
               salary_studio                                 = dga_upm_deal_memo_salary_studio,
               salary_studio_period_id                       = dga_upm_deal_memo_salary_studio_period_id,
               salary_location                               = dga_upm_deal_memo_salary_location,
               salary_location_period_id                     = dga_upm_deal_memo_salary_location_period_id,
               start_date                                    = dga_upm_deal_memo_start_date,
               guaranteed_period_1                           = dga_upm_deal_memo_guaranteed_period_1,
               guaranteed_period_3                           = dga_upm_deal_memo_guaranteed_period_3,
               guaranteed_period_7                           = dga_upm_deal_memo_guaranteed_period_7,
               production_id                                 = dga_upm_deal_memo_production_id,
               episode_id                                    = dga_upm_deal_memo_episode_id,
               type_production_feature                       = dga_upm_deal_memo_type_production_feature,
               type_production_multi_camera_prime_time       = dga_upm_deal_memo_type_production_multi_camera_prime_time,
               type_production_single_camera                 = dga_upm_deal_memo_type_production_single_camera,
               type_production_other_television              = dga_upm_deal_memo_type_production_other_television,
               project_info_30_lower                         = dga_upm_deal_memo_project_info_30_lower,
               project_info_30_between                       = dga_upm_deal_memo_project_info_30_between,
               project_info_30_higher                        = dga_upm_deal_memo_project_info_30_higher,
               project_info_60_lower                         = dga_upm_deal_memo_project_info_60_lower,
               project_info_60_between                       = dga_upm_deal_memo_project_info_60_between,
               project_info_60_higher                        = dga_upm_deal_memo_project_info_60_higher,
               project_info_120_lower                        = dga_upm_deal_memo_project_info_120_lower,
               project_info_120_between                      = dga_upm_deal_memo_project_info_120_between,
               project_info_120_higher                       = dga_upm_deal_memo_project_info_120_higher,
               location_studio                               = dga_upm_deal_memo_location_studio,
               location_distant                              = dga_upm_deal_memo_location_distant,
               location_distant_specific                     = dga_upm_deal_memo_location_distant_specific,
               location_both                                 = dga_upm_deal_memo_location_both,
               location_both_specific                        = dga_upm_deal_memo_location_both_specific,
               other_conditions                              = dga_upm_deal_memo_other_conditions,
               employer_name                                 = dga_upm_deal_memo_employer_name,
               employee_name                                 = dga_upm_deal_memo_employee_name,
               employee_date                                 = dga_upm_deal_memo_employee_date,
               signatory                                     = dga_upm_deal_memo_signatory,
               signatory_by                                  = dga_upm_deal_memo_signatory_by,
               signatory_date                                = dga_upm_deal_memo_signatory_date,
               created_by                                    = dga_upm_deal_memo_created_by,
               updated_by                                    = dga_upm_deal_memo_updated_by,
               status                                        = 'UPDATED'
         WHERE id                 =    dga_upm_deal_memo_id;
        SET return_value = dga_upm_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
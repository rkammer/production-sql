DELIMITER //
CREATE PROCEDURE dga_director_deal_memo_set_list(
    IN  dga_director_deal_memo_id                                 INT,
    IN  dga_director_deal_memo_contact_id                         INT,
    IN  dga_director_deal_memo_ssn                                VARCHAR(11),
    IN  dga_director_deal_memo_loanout                            VARCHAR(30),
    IN  dga_director_deal_memo_fid                                VARCHAR(30),
    IN  dga_director_deal_memo_salary                             DECIMAL,
    IN  dga_director_deal_memo_salary_period_id                   INT,
    IN  dga_director_deal_memo_aditional_time                     DECIMAL,
    IN  dga_director_deal_memo_aditional_time_period_id           INT,
    IN  dga_director_deal_memo_start_date                         DATE,
    IN  dga_director_deal_memo_guaranteed                         INT,
    IN  dga_director_deal_memo_guaranteed_period_id               INT,
    IN  dga_director_deal_memo_dga_covered                        CHAR(1),
    IN  dga_director_deal_memo_addition_terms                     VARCHAR(1024),
    IN  dga_director_deal_memo_production_id                      INT,
    IN  dga_director_deal_memo_episode_id                         INT,
    IN  dga_director_deal_memo_episode_specific_length            VARCHAR(50),
    IN  dga_director_deal_memo_segment                            CHAR(1),
    IN  dga_director_deal_memo_segment_specific_length            VARCHAR(50),
    IN  dga_director_deal_memo_pilot                              CHAR(1),
    IN  dga_director_deal_memo_dramatic_basic_cable_budget        DECIMAL,
    IN  dga_director_deal_memo_television_license_director        CHAR(1),
    IN  dga_director_deal_memo_television_license_budget          CHAR(1),
    IN  dga_director_deal_memo_produced_for_network               CHAR(1),
    IN  dga_director_deal_memo_produced_for_non_network           CHAR(1),
    IN  dga_director_deal_memo_produced_for_basic_cable           CHAR(1),
    IN  dga_director_deal_memo_produced_for_pay_tv                CHAR(1),
    IN  dga_director_deal_memo_produced_for_home_video            CHAR(1),
    IN  dga_director_deal_memo_show_type_dramatic                 CHAR(1),
    IN  dga_director_deal_memo_show_type_quiz_game                CHAR(1),
    IN  dga_director_deal_memo_show_type_variety                  CHAR(1),
    IN  dga_director_deal_memo_show_type_news_and_commentary      CHAR(1),
    IN  dga_director_deal_memo_show_type_local_freelance          CHAR(1),
    IN  dga_director_deal_memo_show_type_local_all_other          CHAR(1),
    IN  dga_director_deal_memo_show_type_sports_event             CHAR(1),
    IN  dga_director_deal_memo_show_type_sports_event_name        VARCHAR(50),
    IN  dga_director_deal_memo_show_type_series_after_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_series_prior_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_special                  CHAR(1),
    IN  dga_director_deal_memo_show_type_movie_mini_series        CHAR(1),
    IN  dga_director_deal_memo_show_type_strip                    CHAR(1),
    IN  dga_director_deal_memo_show_type_other                    CHAR(1),
    IN  dga_director_deal_memo_show_type_other_name               VARCHAR(50),
    IN  dga_director_deal_memo_show_type_high_budget              CHAR(1),
    IN  dga_director_deal_memo_show_type_low_budget               CHAR(1),
    IN  dga_director_deal_memo_show_type_prime_time               CHAR(1),
    IN  dga_director_deal_memo_show_type_non_prime_time           CHAR(1),
    IN  dga_director_deal_memo_show_type_live_broadcast           CHAR(1),
    IN  dga_director_deal_memo_employer_name                      VARCHAR(50),
    IN  dga_director_deal_memo_employee_name                      VARCHAR(50),
    IN  dga_director_deal_memo_employee_date                      DATE,
    IN  dga_director_deal_memo_signatory                          VARCHAR(50),
    IN  dga_director_deal_memo_signatory_by                       VARCHAR(50),
    IN  dga_director_deal_memo_signatory_date                     DATE,
    IN  dga_director_deal_memo_created_by                         VARCHAR(30),
    IN  dga_director_deal_memo_updated_by                         VARCHAR(30),
    IN  dga_director_deal_memo_status                             VARCHAR(30),
    OUT return_value                                              INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_director_deal_memo
     WHERE id = dga_director_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_director_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            salary,
            salary_period_id,
            aditional_time,
            aditional_time_period_id,
            start_date,
            guaranteed,
            guaranteed_period_id,
            dga_covered,
            addition_terms,
            production_id,
            episode_id,
            episode_specific_length,
            segment,
            segment_specific_length,
            pilot,
            dramatic_basic_cable_budget,
            television_license_director,
            television_license_budget,
            produced_for_network,
            produced_for_non_network,
            produced_for_basic_cable,
            produced_for_pay_tv,
            produced_for_home_video,
            show_type_dramatic,
            show_type_quiz_game,
            show_type_variety,
            show_type_news_and_commentary,
            show_type_local_freelance,
            show_type_local_all_other,
            show_type_sports_event,
            show_type_sports_event_name,
            show_type_series_after_02102002,
            show_type_series_prior_02102002,
            show_type_special,
            show_type_movie_mini_series,
            show_type_strip,
            show_type_other,
            show_type_other_name,
            show_type_high_budget,
            show_type_low_budget,
            show_type_prime_time,
            show_type_non_prime_time,
            show_type_live_broadcast,
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
            dga_director_deal_memo_contact_id,
            dga_director_deal_memo_ssn,
            dga_director_deal_memo_loanout,
            dga_director_deal_memo_fid,
            dga_director_deal_memo_salary,
            dga_director_deal_memo_salary_period_id,
            dga_director_deal_memo_aditional_time,
            dga_director_deal_memo_aditional_time_period_id,
            dga_director_deal_memo_start_date,
            dga_director_deal_memo_guaranteed,
            dga_director_deal_memo_guaranteed_period_id,
            dga_director_deal_memo_dga_covered,
            dga_director_deal_memo_addition_terms,
            dga_director_deal_memo_production_id,
            dga_director_deal_memo_episode_id,
            dga_director_deal_memo_episode_specific_length,
            dga_director_deal_memo_segment,
            dga_director_deal_memo_segment_specific_length,
            dga_director_deal_memo_pilot,
            dga_director_deal_memo_dramatic_basic_cable_budget,
            dga_director_deal_memo_television_license_director,
            dga_director_deal_memo_television_license_budget,
            dga_director_deal_memo_produced_for_network,
            dga_director_deal_memo_produced_for_non_network,
            dga_director_deal_memo_produced_for_basic_cable,
            dga_director_deal_memo_produced_for_pay_tv,
            dga_director_deal_memo_produced_for_home_video,
            dga_director_deal_memo_show_type_dramatic,
            dga_director_deal_memo_show_type_quiz_game,
            dga_director_deal_memo_show_type_variety,
            dga_director_deal_memo_show_type_news_and_commentary,
            dga_director_deal_memo_show_type_local_freelance,
            dga_director_deal_memo_show_type_local_all_other,
            dga_director_deal_memo_show_type_sports_event,
            dga_director_deal_memo_show_type_sports_event_name,
            dga_director_deal_memo_show_type_series_after_02102002,
            dga_director_deal_memo_show_type_series_prior_02102002,
            dga_director_deal_memo_show_type_special,
            dga_director_deal_memo_show_type_movie_mini_series,
            dga_director_deal_memo_show_type_strip,
            dga_director_deal_memo_show_type_other,
            dga_director_deal_memo_show_type_other_name,
            dga_director_deal_memo_show_type_high_budget,
            dga_director_deal_memo_show_type_low_budget,
            dga_director_deal_memo_show_type_prime_time,
            dga_director_deal_memo_show_type_non_prime_time,
            dga_director_deal_memo_show_type_live_broadcast,
            dga_director_deal_memo_employer_name,
            dga_director_deal_memo_employee_name,
            dga_director_deal_memo_employee_date,
            dga_director_deal_memo_signatory,
            dga_director_deal_memo_signatory_by,
            dga_director_deal_memo_signatory_date,
            dga_director_deal_memo_created_by,
            dga_director_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_director_deal_memo
           SET contact_id                      = dga_director_deal_memo_contact_id,
               ssn                             = dga_director_deal_memo_ssn,
               loanout                         = dga_director_deal_memo_loanout,
               fid                             = dga_director_deal_memo_fid,
               salary                          = dga_director_deal_memo_salary,
               salary_period_id                = dga_director_deal_memo_salary_period_id,
               aditional_time                  = dga_director_deal_memo_aditional_time,
               aditional_time_period_id        = dga_director_deal_memo_aditional_time_period_id,
               start_date                      = dga_director_deal_memo_start_date,
               guaranteed                      = dga_director_deal_memo_guaranteed,
               guaranteed_period_id            = dga_director_deal_memo_guaranteed_period_id,
               dga_covered                     = dga_director_deal_memo_dga_covered,
               addition_terms                  = dga_director_deal_memo_addition_terms,
               production_id                   = dga_director_deal_memo_production_id,
               episode_id                      = dga_director_deal_memo_episode_id,
               episode_specific_length         = dga_director_deal_memo_episode_specific_length,
               segment                         = dga_director_deal_memo_segment,
               segment_specific_length         = dga_director_deal_memo_segment_specific_length,
               pilot                           = dga_director_deal_memo_pilot,
               dramatic_basic_cable_budget     = dga_director_deal_memo_dramatic_basic_cable_budget,
               television_license_director     = dga_director_deal_memo_television_license_director,
               television_license_budget       = dga_director_deal_memo_television_license_budget,
               produced_for_network            = dga_director_deal_memo_produced_for_network,
               produced_for_non_network        = dga_director_deal_memo_produced_for_non_network,
               produced_for_basic_cable        = dga_director_deal_memo_produced_for_basic_cable,
               produced_for_pay_tv             = dga_director_deal_memo_produced_for_pay_tv,
               produced_for_home_video         = dga_director_deal_memo_produced_for_home_video,
               show_type_dramatic              = dga_director_deal_memo_show_type_dramatic,
               show_type_quiz_game             = dga_director_deal_memo_show_type_quiz_game,
               show_type_variety               = dga_director_deal_memo_show_type_variety,
               show_type_news_and_commentary   = dga_director_deal_memo_show_type_news_and_commentary,
               show_type_local_freelance       = dga_director_deal_memo_show_type_local_freelance,
               show_type_local_all_other       = dga_director_deal_memo_show_type_local_all_other,
               show_type_sports_event          = dga_director_deal_memo_show_type_sports_event,
               show_type_sports_event_name     = dga_director_deal_memo_show_type_sports_event_name,
               show_type_series_after_02102002 = dga_director_deal_memo_show_type_series_after_02102002,
               show_type_series_prior_02102002 = dga_director_deal_memo_show_type_series_prior_02102002,
               show_type_special               = dga_director_deal_memo_show_type_special,
               show_type_movie_mini_series     = dga_director_deal_memo_show_type_movie_mini_series,
               show_type_strip                 = dga_director_deal_memo_show_type_strip,
               show_type_other                 = dga_director_deal_memo_show_type_other,
               show_type_other_name            = dga_director_deal_memo_show_type_other_name,
               show_type_high_budget           = dga_director_deal_memo_show_type_high_budget,
               show_type_low_budget            = dga_director_deal_memo_show_type_low_budget,
               show_type_prime_time            = dga_director_deal_memo_show_type_prime_time,
               show_type_non_prime_time        = dga_director_deal_memo_show_type_non_prime_time,
               show_type_live_broadcast        = dga_director_deal_memo_show_type_live_broadcast,
               employer_name                   = dga_director_deal_memo_employer_name,
               employee_name                   = dga_director_deal_memo_employee_name,
               employee_date                   = dga_director_deal_memo_employee_date,
               signatory                       = dga_director_deal_memo_signatory,
               signatory_by                    = dga_director_deal_memo_signatory_by,
               signatory_date                  = dga_director_deal_memo_signatory_date,
               created_by                      = dga_director_deal_memo_created_by,
               updated_by                      = dga_director_deal_memo_updated_by,
               status                          = dga_director_deal_memo_status
         WHERE id                              = dga_director_deal_memo_id;

         SET return_value = dga_director_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
CREATE OR REPLACE VIEW dga_director_scripted_deal_memo_get_list(
    dga_director_scripted_deal_memo_id,
    dga_director_scripted_deal_memo_contact_id,
    dga_director_scripted_deal_memo_contact_first_name,
    dga_director_scripted_deal_memo_contact_middle_name,
    dga_director_scripted_deal_memo_contact_last_name,
    dga_director_scripted_deal_memo_contact_suffix,
    dga_director_scripted_deal_memo_contact_full_name,
    dga_director_scripted_deal_memo_contact_address,
    dga_director_scripted_deal_memo_contact_city,
    dga_director_scripted_deal_memo_contact_state_code,
    dga_director_scripted_deal_memo_contact_state_name,
    dga_director_scripted_deal_memo_contact_phone,
    dga_director_scripted_deal_memo_contact_email,
    dga_director_scripted_deal_memo_ssn,
    dga_director_scripted_deal_memo_loanout,
    dga_director_scripted_deal_memo_fid,
    dga_director_scripted_deal_memo_salary,
    dga_director_scripted_deal_memo_salary_period_id,
    dga_director_scripted_deal_memo_salary_period_name,
    dga_director_scripted_deal_memo_salary_period_period,
    dga_director_scripted_deal_memo_salary_period_plural,
    dga_director_scripted_deal_memo_aditional_time,
    dga_director_scripted_deal_memo_aditional_time_period_id,
    dga_director_scripted_deal_memo_aditional_time_period_name,
    dga_director_scripted_deal_memo_aditional_time_period_period,
    dga_director_scripted_deal_memo_aditional_time_period_plural,
    dga_director_scripted_deal_memo_start_date,
    dga_director_scripted_deal_memo_guaranteed,
    dga_director_scripted_deal_memo_guaranteed_period_id,
    dga_director_scripted_deal_memo_guaranteed_period_name,
    dga_director_scripted_deal_memo_guaranteed_period_period,
    dga_director_scripted_deal_memo_guaranteed_period_plural,
    dga_director_scripted_deal_memo_dga_covered,
    dga_director_scripted_deal_memo_addition_terms,
    dga_director_scripted_deal_memo_production_id,
    dga_director_scripted_deal_memo_production_title,
    dga_director_scripted_deal_memo_project_number,
    dga_director_scripted_deal_memo_episode_id,
    dga_director_scripted_deal_memo_episode_title,
    dga_director_scripted_deal_memo_episode_episode_number,
    dga_director_scripted_deal_memo_episode_episode_abreviation,
    dga_director_scripted_deal_memo_episode_specific_length,
    dga_director_scripted_deal_memo_segment,
    dga_director_scripted_deal_memo_segment_specific_length,
    dga_director_scripted_deal_memo_length_30,
    dga_director_scripted_deal_memo_length_60,
    dga_director_scripted_deal_memo_length_90,
    dga_director_scripted_deal_memo_length_120,
    dga_director_scripted_deal_memo_length_other,
    dga_director_scripted_deal_memo_pilot,
    dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
    dga_director_scripted_deal_memo_type_production_multi_camera,
    dga_director_scripted_deal_memo_type_production_single_camera,
    dga_director_scripted_deal_memo_produced_for_network,
    dga_director_scripted_deal_memo_produced_for_non_network,
    dga_director_scripted_deal_memo_produced_for_basic_cable,
    dga_director_scripted_deal_memo_produced_for_pay_tv,
    dga_director_scripted_deal_memo_produced_for_home_video,
    dga_director_scripted_deal_memo_produced_non_network_prime_time,
    dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
    dga_director_scripted_deal_memo_project_budget_more,
    dga_director_scripted_deal_memo_project_budget_less,
    dga_director_scripted_deal_memo_second_unit_director,
    dga_director_scripted_deal_memo_segment_applicable,
    dga_director_scripted_deal_memo_individual_final_cut_authority,
    dga_director_scripted_deal_memo_other_conditions,
    dga_director_scripted_deal_memo_employer_name,
    dga_director_scripted_deal_memo_employee_name,
    dga_director_scripted_deal_memo_employee_date,
    dga_director_scripted_deal_memo_signatory,
    dga_director_scripted_deal_memo_signatory_by,
    dga_director_scripted_deal_memo_signatory_date,
    dga_director_scripted_deal_memo_created,
    dga_director_scripted_deal_memo_created_by,
    dga_director_scripted_deal_memo_updated,
    dga_director_scripted_deal_memo_updated_by,
    dga_director_scripted_deal_memo_status
) AS
    SELECT dga_director_scripted_deal_memo.id                                                                       AS dga_director_scripted_deal_memo_id,
           dga_director_scripted_deal_memo.contact_id                                                               AS dga_director_scripted_deal_memo_contact_id,
        --    contact.name                                                                                             AS dga_director_scripted_deal_memo_contact_name,
           contact.first_name                                                                                       AS dga_director_scripted_deal_memo_contact_first_name,
           contact.middle_name                                                                                      AS dga_director_scripted_deal_memo_contact_middle_name,
           contact.last_name                                                                                        AS dga_director_scripted_deal_memo_contact_last_name,
           contact.suffix                                                                                           AS dga_director_scripted_deal_memo_contact_suffix,
           contact_get_full_name(contact.id)                                                                        AS dga_director_scripted_deal_memo_contact_full_name,
           contact.address                                                                                          AS dga_director_scripted_deal_memo_contact_address,
           contact.city                                                                                             AS dga_director_scripted_deal_memo_contact_city,
           contact.state_code                                                                                       AS dga_director_scripted_deal_memo_contact_state_code,
           state.name                                                                                               AS dga_director_scripted_deal_memo_contact_state_name,
           contact.phone                                                                                            AS dga_director_scripted_deal_memo_contact_phone,
           contact.email                                                                                            AS dga_director_scripted_deal_memo_contact_email,
           dga_director_scripted_deal_memo.ssn                                                                      AS dga_director_scripted_deal_memo_ssn,
           dga_director_scripted_deal_memo.loanout                                                                  AS dga_director_scripted_deal_memo_loanout,
           dga_director_scripted_deal_memo.fid                                                                      AS dga_director_scripted_deal_memo_fid,
           dga_director_scripted_deal_memo.salary                                                                   AS dga_director_scripted_deal_memo_salary,
           dga_director_scripted_deal_memo.salary_period_id                                                         AS dga_director_scripted_deal_memo_salary_period_id,
           salary_period.name                                                                                       AS dga_director_scripted_deal_memo_salary_period_name,
           salary_period.period                                                                                     AS dga_director_scripted_deal_memo_salary_period_period,
           salary_period.plural                                                                                     AS dga_director_scripted_deal_memo_salary_period_plural,
           dga_director_scripted_deal_memo.aditional_time                                                           AS dga_director_scripted_deal_memo_aditional_time,
           dga_director_scripted_deal_memo.aditional_time_period_id                                                 AS dga_director_scripted_deal_memo_aditional_time_period_id,
           aditional_time_period.name                                                                               AS dga_director_scripted_deal_memo_aditional_time_period_name,
           aditional_time_period.period                                                                             AS dga_director_scripted_deal_memo_aditional_time_period_period,
           aditional_time_period.plural                                                                             AS dga_director_scripted_deal_memo_aditional_time_period_plural,
           DATE_FORMAT(dga_director_scripted_deal_memo.start_date,'%m/%d/%Y')                                       AS dga_director_scripted_deal_memo_start_date,
           dga_director_scripted_deal_memo.guaranteed                                                               AS dga_director_scripted_deal_memo_guaranteed,
           dga_director_scripted_deal_memo.guaranteed_period_id                                                     AS dga_director_scripted_deal_memo_guaranteed_period_id,
           guaranteed_period.name                                                                                   AS dga_director_scripted_deal_memo_guaranteed_period_name,
           guaranteed_period.period                                                                                 AS dga_director_scripted_deal_memo_guaranteed_period_period,
           guaranteed_period.plural                                                                                 AS dga_director_scripted_deal_memo_guaranteed_period_plural,
           dga_director_scripted_deal_memo.dga_covered                                                              AS dga_director_scripted_deal_memo_dga_covered,
           dga_director_scripted_deal_memo.addition_terms                                                           AS dga_director_scripted_deal_memo_addition_terms,
           dga_director_scripted_deal_memo.production_id                                                            AS dga_director_scripted_deal_memo_production_id,
           production.title                                                                                         AS dga_director_scripted_deal_memo_production_title,
           dga_director_scripted_deal_memo.project_number                                                           AS dga_director_scripted_deal_memo_project_number,
           dga_director_scripted_deal_memo.episode_id                                                               AS dga_director_scripted_deal_memo_episode_id,
           episode.title                                                                                            AS dga_director_scripted_deal_memo_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                                       AS dga_director_scripted_deal_memo_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))                   AS dga_director_scripted_deal_memo_episode_episode_abreviation,
           dga_director_scripted_deal_memo.episode_specific_length                                                  AS dga_director_scripted_deal_memo_episode_specific_length,
           dga_director_scripted_deal_memo.segment                                                                  AS dga_director_scripted_deal_memo_segment,
           dga_director_scripted_deal_memo.segment_specific_length                                                  AS dga_director_scripted_deal_memo_segment_specific_length,
           dga_director_scripted_deal_memo.length_30                                                                AS dga_director_scripted_deal_memo_length_30,
           dga_director_scripted_deal_memo.length_60                                                                AS dga_director_scripted_deal_memo_length_60,
           dga_director_scripted_deal_memo.length_90                                                                AS dga_director_scripted_deal_memo_length_90,
           dga_director_scripted_deal_memo.length_120                                                               AS dga_director_scripted_deal_memo_length_120,
           dga_director_scripted_deal_memo.length_other                                                             AS dga_director_scripted_deal_memo_length_other,
           dga_director_scripted_deal_memo.pilot                                                                    AS dga_director_scripted_deal_memo_pilot,
           dga_director_scripted_deal_memo.dramatic_basic_cable_budget                                              AS dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
           dga_director_scripted_deal_memo.type_production_multi_camera                                             AS dga_director_scripted_deal_memo_type_production_multi_camera,
           dga_director_scripted_deal_memo.type_production_single_camera                                            AS dga_director_scripted_deal_memo_type_production_single_camera,
        --    dga_director_scripted_deal_memo.television_license_director                                              AS dga_director_scripted_deal_memo_television_license_director,
        --    dga_director_scripted_deal_memo.television_license_budget                                                AS dga_director_scripted_deal_memo_television_license_budget,
           dga_director_scripted_deal_memo.produced_for_network                                                     AS dga_director_scripted_deal_memo_produced_for_network,
           dga_director_scripted_deal_memo.produced_for_non_network                                                 AS dga_director_scripted_deal_memo_produced_for_non_network,
           dga_director_scripted_deal_memo.produced_for_basic_cable                                                 AS dga_director_scripted_deal_memo_produced_for_basic_cable,
           dga_director_scripted_deal_memo.produced_for_pay_tv                                                      AS dga_director_scripted_deal_memo_produced_for_pay_tv,
           dga_director_scripted_deal_memo.produced_for_home_video                                                  AS dga_director_scripted_deal_memo_produced_for_home_video,
           dga_director_scripted_deal_memo.produced_non_network_prime_time                                          AS dga_director_scripted_deal_memo_produced_non_network_prime_time,
           dga_director_scripted_deal_memo.produced_non_network_non_prime_time                                      AS dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
           dga_director_scripted_deal_memo.project_budget_more                                                      AS dga_director_scripted_deal_memo_project_budget_more,
           dga_director_scripted_deal_memo.project_budget_less                                                      AS dga_director_scripted_deal_memo_project_budget_less,
           dga_director_scripted_deal_memo.second_unit_director                                                     AS dga_director_scripted_deal_memo_second_unit_director,
           dga_director_scripted_deal_memo.segment_applicable                                                       AS dga_director_scripted_deal_memo_segment_applicable,
           dga_director_scripted_deal_memo.individual_final_cut_authority                                           AS dga_director_scripted_deal_memo_individual_final_cut_authority,
           dga_director_scripted_deal_memo.other_conditions                                                         AS dga_director_scripted_deal_memo_other_conditions,
           dga_director_scripted_deal_memo.employer_name                                                            AS dga_director_scripted_deal_memo_employer_name,
           dga_director_scripted_deal_memo.employee_name                                                            AS dga_director_scripted_deal_memo_employee_name,
           DATE_FORMAT(dga_director_scripted_deal_memo.employee_date,'%m/%d/%Y %H:%i:%S')                           AS dga_director_scripted_deal_memo_employee_date,
           dga_director_scripted_deal_memo.signatory                                                                AS dga_director_scripted_deal_memo_signatory,
           dga_director_scripted_deal_memo.signatory_by                                                             AS dga_director_scripted_deal_memo_signatory_by,
           DATE_FORMAT(dga_director_scripted_deal_memo.signatory_date,'%m/%d/%Y %H:%i:%S')                          AS dga_director_scripted_deal_memo_signatory_date,
           DATE_FORMAT(dga_director_scripted_deal_memo.created,'%m/%d/%Y %H:%i:%S')                                 AS dga_director_scripted_deal_memo_created,
           dga_director_scripted_deal_memo.created_by                                                               AS dga_director_scripted_deal_memo_created_by,
           DATE_FORMAT(dga_director_scripted_deal_memo.updated,'%m/%d/%Y %H:%i:%S')                                 AS dga_director_scripted_deal_memo_updated,
           dga_director_scripted_deal_memo.updated_by                                                               AS dga_director_scripted_deal_memo_updated_by,
           dga_director_scripted_deal_memo.status                                                                   AS dga_director_scripted_deal_memo_status
      FROM dga_director_scripted_deal_memo AS dga_director_scripted_deal_memo INNER JOIN contact    AS contact               ON contact.id               = dga_director_scripted_deal_memo.contact_id
                                                                              LEFT  JOIN state      AS state                 ON state.code               = contact.state_code
                                                                              LEFT  JOIN period     AS salary_period         ON salary_period.id         = dga_director_scripted_deal_memo.salary_period_id
                                                                              LEFT  JOIN period     AS aditional_time_period ON aditional_time_period.id = dga_director_scripted_deal_memo.aditional_time_period_id
                                                                              LEFT  JOIN period     AS guaranteed_period     ON guaranteed_period.id     = dga_director_scripted_deal_memo.guaranteed_period_id
                                                                              INNER JOIN production AS production            ON production.id            = dga_director_scripted_deal_memo.production_id
                                                                              INNER JOIN episode    AS episode               ON episode.id               = dga_director_scripted_deal_memo.episode_id
                                                                              INNER JOIN season     AS season                ON episode.season_id        = season.id;
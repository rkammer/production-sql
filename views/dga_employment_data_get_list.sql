CREATE OR REPLACE VIEW dga_employment_data_get_list(
    dga_employment_data_id,
    dga_employment_data_report_date,
    dga_employment_data_prepared_by,
    dga_employment_data_quarter,
    dga_employment_data_year,
    dga_employment_data_company_id,
    dga_employment_data_company_name,
    dga_employment_data_company_address,
    dga_employment_data_company_city,
    dga_employment_data_company_state_code,
    dga_employment_data_company_phone,
    dga_employment_data_company_website,
    dga_employment_data_production_id,
    dga_employment_data_production_title,
    dga_employment_data_director_name,
    dga_employment_data_director_first_number,
    dga_employment_data_director_gender,
    dga_employment_data_director_caucasion,
    dga_employment_data_director_afro_american,
    dga_employment_data_director_latino,
    dga_employment_data_director_asian,
    dga_employment_data_director_native,
    dga_employment_data_director_unknown,
    dga_employment_data_unit_production_name,
    dga_employment_data_unit_production_gender,
    dga_employment_data_unit_production_caucasion,
    dga_employment_data_unit_production_afro_american,
    dga_employment_data_unit_production_latino,
    dga_employment_data_unit_production_asian,
    dga_employment_data_unit_production_native,
    dga_employment_data_unit_production_unknown,
    dga_employment_data_first_assistant_name,
    dga_employment_data_first_assistant_gender,
    dga_employment_data_first_assistant_caucasion,
    dga_employment_data_first_assistant_afro_american,
    dga_employment_data_first_assistant_latino,
    dga_employment_data_first_assistant_asian,
    dga_employment_data_first_assistant_native,
    dga_employment_data_first_assistant_unknown,
    dga_employment_data_second_assistant_name,
    dga_employment_data_second_assistant_gender,
    dga_employment_data_second_assistant_caucasion,
    dga_employment_data_second_assistant_afro_american,
    dga_employment_data_second_assistant_latino,
    dga_employment_data_second_assistant_asian,
    dga_employment_data_second_assistant_native,
    dga_employment_data_second_assistant_unknown,
    dga_employment_data_technical_coordinator_name,
    dga_employment_data_technical_coordinator_gender,
    dga_employment_data_technical_coordinator_caucasion,
    dga_employment_data_technical_coordinator_afro_american,
    dga_employment_data_technical_coordinator_latino,
    dga_employment_data_technical_coordinator_asian,
    dga_employment_data_technical_coordinator_native,
    dga_employment_data_technical_coordinator_unknown,
    dga_employment_data_associate_director_name,
    dga_employment_data_associate_director_gender,
    dga_employment_data_associate_director_caucasion,
    dga_employment_data_associate_director_afro_american,
    dga_employment_data_associate_director_latino,
    dga_employment_data_associate_director_asian,
    dga_employment_data_associate_director_native,
    dga_employment_data_associate_director_unknown,
    dga_employment_data_stage_manager_name,
    dga_employment_data_stage_manager_gender,
    dga_employment_data_stage_manager_caucasion,
    dga_employment_data_stage_manager_afro_american,
    dga_employment_data_stage_manager_latino,
    dga_employment_data_stage_manager_asian,
    dga_employment_data_stage_manager_native,
    dga_employment_data_stage_manager_unknown,
    dga_employment_data_created,
    dga_employment_data_created_by,
    dga_employment_data_updated,
    dga_employment_data_updated_by,
    dga_employment_data_status
) AS
    SELECT dga_employment_data.id                                                             AS dga_employment_data_id,
           DATE_FORMAT(dga_employment_data.report_date,'%m/%d/%Y')                            AS dga_employment_data_report_date,
           dga_employment_data.prepared_by                                                    AS dga_employment_data_prepared_by,
           dga_employment_data.quarter                                                        AS dga_employment_data_quarter,
           dga_employment_data.year                                                           AS dga_employment_data_year,
           dga_employment_data.company_id                                                     AS dga_employment_data_company_id,
           company.name                                                                       AS dga_employment_data_company_name,
           company.address                                                                    AS dga_employment_data_company_address,
           company.city                                                                       AS dga_employment_data_company_city,
           company.state_code                                                                 AS dga_employment_data_company_state_code,
           company.phone                                                                      AS dga_employment_data_company_phone,
           company.website                                                                    AS dga_employment_data_company_website,
           dga_employment_data.production_id                                                  AS dga_employment_data_production_id,
           production.title                                                                   AS dga_employment_data_production_title,
           dga_employment_data.director_name                                                  AS dga_employment_data_director_name,
           dga_employment_data.director_first_number                                          AS dga_employment_data_director_first_number,
           dga_employment_data.director_gender                                                AS dga_employment_data_director_gender,
           dga_employment_data.director_caucasion                                             AS dga_employment_data_director_caucasion,
           dga_employment_data.director_afro_american                                         AS dga_employment_data_director_afro_american,
           dga_employment_data.director_latino                                                AS dga_employment_data_director_latino,
           dga_employment_data.director_asian                                                 AS dga_employment_data_director_asian,
           dga_employment_data.director_native                                                AS dga_employment_data_director_native,
           dga_employment_data.director_unknown                                               AS dga_employment_data_director_unknown,
           dga_employment_data.unit_production_name                                           AS dga_employment_data_unit_production_name,
           dga_employment_data.unit_production_gender                                         AS dga_employment_data_unit_production_gender,
           dga_employment_data.unit_production_caucasion                                      AS dga_employment_data_unit_production_caucasion,
           dga_employment_data.unit_production_afro_american                                  AS dga_employment_data_unit_production_afro_american,
           dga_employment_data.unit_production_latino                                         AS dga_employment_data_unit_production_latino,
           dga_employment_data.unit_production_asian                                          AS dga_employment_data_unit_production_asian,
           dga_employment_data.unit_production_native                                         AS dga_employment_data_unit_production_native,
           dga_employment_data.unit_production_unknown                                        AS dga_employment_data_unit_production_unknown,
           dga_employment_data.first_assistant_name                                           AS dga_employment_data_first_assistant_name,
           dga_employment_data.first_assistant_gender                                         AS dga_employment_data_first_assistant_gender,
           dga_employment_data.first_assistant_caucasion                                      AS dga_employment_data_first_assistant_caucasion,
           dga_employment_data.first_assistant_afro_american                                  AS dga_employment_data_first_assistant_afro_american,
           dga_employment_data.first_assistant_latino                                         AS dga_employment_data_first_assistant_latino,
           dga_employment_data.first_assistant_asian                                          AS dga_employment_data_first_assistant_asian,
           dga_employment_data.first_assistant_native                                         AS dga_employment_data_first_assistant_native,
           dga_employment_data.first_assistant_unknown                                        AS dga_employment_data_first_assistant_unknown,
           dga_employment_data.second_assistant_name                                          AS dga_employment_data_second_assistant_name,
           dga_employment_data.second_assistant_gender                                        AS dga_employment_data_second_assistant_gender,
           dga_employment_data.second_assistant_caucasion                                     AS dga_employment_data_second_assistant_caucasion,
           dga_employment_data.second_assistant_afro_american                                 AS dga_employment_data_second_assistant_afro_american,
           dga_employment_data.second_assistant_latino                                        AS dga_employment_data_second_assistant_latino,
           dga_employment_data.second_assistant_asian                                         AS dga_employment_data_second_assistant_asian,
           dga_employment_data.second_assistant_native                                        AS dga_employment_data_second_assistant_native,
           dga_employment_data.second_assistant_unknown                                       AS dga_employment_data_second_assistant_unknown,
           dga_employment_data.technical_coordinator_name                                     AS dga_employment_data_technical_coordinator_name,
           dga_employment_data.technical_coordinator_gender                                   AS dga_employment_data_technical_coordinator_gender,
           dga_employment_data.technical_coordinator_caucasion                                AS dga_employment_data_technical_coordinator_caucasion,
           dga_employment_data.technical_coordinator_afro_american                            AS dga_employment_data_technical_coordinator_afro_american,
           dga_employment_data.technical_coordinator_latino                                   AS dga_employment_data_technical_coordinator_latino,
           dga_employment_data.technical_coordinator_asian                                    AS dga_employment_data_technical_coordinator_asian,
           dga_employment_data.technical_coordinator_native                                   AS dga_employment_data_technical_coordinator_native,
           dga_employment_data.technical_coordinator_unknown                                  AS dga_employment_data_technical_coordinator_unknown,
           dga_employment_data.associate_director_name                                        AS dga_employment_data_associate_director_name,
           dga_employment_data.associate_director_gender                                      AS dga_employment_data_associate_director_gender,
           dga_employment_data.associate_director_caucasion                                   AS dga_employment_data_associate_director_caucasion,
           dga_employment_data.associate_director_afro_american                               AS dga_employment_data_associate_director_afro_american,
           dga_employment_data.associate_director_latino                                      AS dga_employment_data_associate_director_latino,
           dga_employment_data.associate_director_asian                                       AS dga_employment_data_associate_director_asian,
           dga_employment_data.associate_director_native                                      AS dga_employment_data_associate_director_native,
           dga_employment_data.associate_director_unknown                                     AS dga_employment_data_associate_director_unknown,
           dga_employment_data.stage_manager_name                                             AS dga_employment_data_stage_manager_name,
           dga_employment_data.stage_manager_gender                                           AS dga_employment_data_stage_manager_gender,
           dga_employment_data.stage_manager_caucasion                                        AS dga_employment_data_stage_manager_caucasion,
           dga_employment_data.stage_manager_afro_american                                    AS dga_employment_data_stage_manager_afro_american,
           dga_employment_data.stage_manager_latino                                           AS dga_employment_data_stage_manager_latino,
           dga_employment_data.stage_manager_asian                                            AS dga_employment_data_stage_manager_asian,
           dga_employment_data.stage_manager_native                                           AS dga_employment_data_stage_manager_native,
           dga_employment_data.stage_manager_unknown                                          AS dga_employment_data_stage_manager_unknown,
           DATE_FORMAT(dga_employment_data.created,'%m/%d/%Y %H:%i:%S')                       AS dga_employment_data_created,
           dga_employment_data.created_by                                                     AS dga_employment_data_created_by,
           DATE_FORMAT(dga_employment_data.updated,'%m/%d/%Y %H:%i:%S')                       AS dga_employment_data_updated,
           dga_employment_data.updated_by                                                     AS dga_employment_data_updated_by,
           dga_employment_data.status                                                         AS dga_employment_data_status
      FROM dga_employment_data AS dga_employment_data INNER JOIN company    AS company    ON company.id    =  dga_employment_data.company_id
                                                      INNER JOIN production AS production ON production.id = dga_employment_data.production_id;
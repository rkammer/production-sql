CREATE OR REPLACE VIEW production_get_list(
    production_id,
    production_title,
    production_media_company_id,
    production_media_company_name,
    production_business_group_id,
    production_business_group_name,
    production_network_id,
    production_network_name,
    production_pilot,
    production_production_stage_id,
    production_production_stage_name,
    production_season_number,
    production_episodes_number,
    production_budget,
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
    production_production_length_name,
    production_production_type_id,
    production_production_type_name,
    production_production_company_id,
    production_production_company_name,
    production_payroll_company_id,
    production_payroll_name,
    production_logo_path,
    production_created,
    production_created_by,
    production_updated,
    production_updated_by,
    production_status
) AS
    SELECT production.id                                                       AS production_id,
           production.title                                                    AS production_title,
           production.media_company_id                                         AS production_media_company_id,
           media_company.name                                                  AS production_media_company_name,
           production.business_group_id                                        AS production_business_group_id,
           business_group.name                                                 AS production_business_group_name,
           production.network_id                                               AS production_network_id,
           network.name                                                        AS production_network_name,
           production.pilot                                                    AS production_pilot,
           production.production_stage_id                                      AS production_production_stage_id,
           production_stage.name                                               AS production_production_stage_name,
           production.season_number                                            AS production_season_number,
           production.episodes_number                                          AS production_episodes_number,
           production.budget                                                   AS production_budget,
           production.writing_start_date                                       AS production_writing_start_date,
           production.writing_end_date                                         AS production_writing_end_date,
           DATE_FORMAT(production.pre_production_start_date,    '%m/%d/%Y')    AS production_pre_production_start_date,
           DATE_FORMAT(production.pre_production_end_date,      '%m/%d/%Y')    AS production_pre_production_end_date,
           DATE_FORMAT(production.photography_start_date,       '%m/%d/%Y')    AS production_photography_start_date,
           DATE_FORMAT(production.photography_end_date,         '%m/%d/%Y')    AS production_photography_end_date,
           DATE_FORMAT(production.post_production_start_date,   '%m/%d/%Y')    AS production_post_production_start_date,
           DATE_FORMAT(production.post_production_end_date,     '%m/%d/%Y')    AS production_post_production_end_date,
           DATE_FORMAT(production.network_production_start_date,'%m/%d/%Y')    AS production_network_production_start_date,
           DATE_FORMAT(production.network_production_end_date,  '%m/%d/%Y')    AS production_network_production_end_date,
           production.production_length_id                                     AS production_production_length_id,
           production_length.name                                              AS production_production_length_name,
           production.production_type_id                                       AS production_production_type_id,
           production_type.name                                                AS production_production_type_name,
           production.production_company_id                                    AS production_production_company_id,
           production_company.name                                             AS production_production_company_name,
           production.payroll_company_id                                       AS production_payroll_company_id,
           payroll_company.name                                                AS production_payroll_name,
           production.logo_path                                                AS production_logo_path,
           DATE_FORMAT(production.created,'%m/%d/%Y %H:%i:%S')                 AS production_created,
           production.created_by                                               AS production_created_by,
           DATE_FORMAT(production.updated,'%m/%d/%Y %H:%i:%S')                 AS production_updated,
           production.updated_by                                               AS production_updated_by,
           production.status                                                   AS production_status
      FROM production AS production INNER JOIN network             AS network            ON network.id             =   production.network_id
                                    INNER JOIN production_length   AS production_length  ON production_length.id   =   production.production_length_id
                                    INNER JOIN production_type     AS production_type    ON production_type.id     =   production.production_type_id
                                    INNER JOIN company             AS production_company ON production_company.id  =   production.production_company_id
                                    INNER JOIN company             AS payroll_company    ON payroll_company.id     =   production.payroll_company_id
                                    INNER JOIN company             AS media_company      ON media_company.id       =   production.media_company_id
                                    INNER JOIN business_group      AS business_group     ON business_group.id      =   production.business_group_id
                                    INNER JOIN production_stage    AS production_stage   ON production_stage.id    =   production.production_stage_id;

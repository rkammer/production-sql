CREATE OR REPLACE VIEW season_get_list(
    season_id,
    season_title,
    season_season_number,
    season_media_company_id,
    season_media_company_name,
    season_business_group_id,
    season_business_group_name,
    season_network_id,
    season_network_name,
    season_production_id,
    season_production_title,
    season_budget,
    season_production_production_length_id,
    season_production_production_length_name,
    -- season_production_network_id,
    -- season_production_network_name,
    season_production_production_type_id,
    season_production_production_type_name,
    season_writing_start_date,
    season_writing_end_date,
    season_pre_production_start_date,
    season_pre_production_end_date,
    season_photography_start_date,
    season_photography_end_date,
    season_post_production_start_date,
    season_post_production_end_date,
    season_network_production_start_date,
    season_network_production_end_date,
    season_logo_path,
    season_created,
    season_created_by,
    season_updated,
    season_updated_by,
    season_status
) AS
    SELECT season.id                                                               AS season_id,
           season.title                                                            AS season_title,
           LPAD(season.season_number, 2, 0)                                        AS season_season_number,
           season.media_company_id                                                 AS season_media_company_id,
           media_company.name                                                      AS season_media_company_name,
           season.business_group_id                                                AS season_business_group_id,
           business_group.name                                                     AS season_business_group_name,
           season.network_id                                                       AS season_network_id,
           network.name                                                            AS season_network_name,
           season.production_id                                                    AS season_production_id,
           production.title                                                        AS season_production_title,
           season.budget                                                           AS season_budget,
           production.production_length_id                                         AS season_production_production_length_id,
           production_length.name                                                  AS season_production_production_length_name,
        --    production.network_id                                                   AS season_production_network_id,
        --    network.name                                                            AS season_production_network_name,
           production.production_type_id                                           AS season_production_production_type_id,
           production_type.name                                                    AS season_production_production_type_name,
           DATE_FORMAT(season.writing_start_date,           '%m/%d/%Y')            AS season_writing_start_date,
           DATE_FORMAT(season.writing_end_date,             '%m/%d/%Y')            AS season_writing_end_date,
           DATE_FORMAT(season.pre_production_start_date,    '%m/%d/%Y')            AS season_pre_production_start_date,
           DATE_FORMAT(season.pre_production_end_date,      '%m/%d/%Y')            AS season_pre_production_end_date,
           DATE_FORMAT(season.photography_start_date,       '%m/%d/%Y')            AS season_photography_start_date,
           DATE_FORMAT(season.photography_end_date,         '%m/%d/%Y')            AS season_photography_end_date,
           DATE_FORMAT(season.post_production_start_date,   '%m/%d/%Y')            AS season_post_production_start_date,
           DATE_FORMAT(season.post_production_end_date,     '%m/%d/%Y')            AS season_post_production_end_date,
           DATE_FORMAT(season.network_production_start_date,'%m/%d/%Y')            AS season_network_production_start_date,
           DATE_FORMAT(season.network_production_end_date,  '%m/%d/%Y')            AS season_network_production_end_date,
           season.logo_path                                                        AS season_logo_path,
           DATE_FORMAT(season.created,'%m/%d/%Y %H:%i:%S')                         AS season_created,
           season.created_by                                                       AS season_created_by,
           DATE_FORMAT(season.updated,'%m/%d/%Y %H:%i:%S')                         AS season_updated,
           season.updated_by                                                       AS season_updated_by,
           season.status                                                           AS season_status
      FROM season AS season INNER JOIN production          AS production         ON production.id = season.production_id
                            -- INNER JOIN network             AS network            ON network.id             =   production.network_id
                            INNER JOIN production_length   AS production_length  ON production_length.id   =   production.production_length_id
                            INNER JOIN production_type     AS production_type    ON production_type.id     =   production.production_type_id
                            INNER JOIN company             AS media_company      ON media_company.id       =   season.media_company_id
                            INNER JOIN business_group      AS business_group     ON business_group.id      =   season.business_group_id
                            INNER JOIN network             AS network            ON network.id             =   season.network_id;


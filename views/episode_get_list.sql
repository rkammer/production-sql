CREATE OR REPLACE VIEW episode_get_list(
    episode_id,
    episode_title,
    episode_episode_number,
    episode_episode_abbreviation,
    episode_media_company_id,
    episode_media_company_name,
    episode_business_group_id,
    episode_business_group_name,
    episode_network_id,
    episode_network_name,
    episode_production_id,
    episode_production_title,
    episode_season_id,
    episode_season_title,
    episode_budget,
    episode_writing_start_date,
    episode_writing_end_date,
    episode_pre_production_start_date,
    episode_pre_production_end_date,
    episode_photography_start_date,
    episode_photography_end_date,
    episode_post_production_start_date,
    episode_post_production_end_date,
    episode_network_production_start_date,
    episode_network_production_end_date,
    episode_created,
    episode_created_by,
    episode_updated,
    episode_updated_by,
    episode_status
) AS
    SELECT episode.id                                                                               AS episode_id,
           episode.title                                                                            AS episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS episode_episode_abbreviation,
           episode.media_company_id                                                                 AS episode_media_company_id,
           media_company.name                                                                       AS episode_media_company_name,
           episode.business_group_id                                                                AS episode_business_group_id,
           business_group.name                                                                      AS episode_business_group_name,
           episode.network_id                                                                       AS episode_network_id,
           network.name                                                                             AS episode_network_name,
           episode.production_id                                                                    AS episode_production_id,
           production.title                                                                         AS episode_production_title,
           episode.season_id                                                                        AS episode_season_id,
           season.title                                                                             AS episode_season_title,
           episode.budget                                                                           AS episode_budget,
           DATE_FORMAT(episode.writing_start_date,            '%m/%d/%Y')                           AS episode_writing_start_date,
           DATE_FORMAT(episode.writing_end_date,              '%m/%d/%Y')                           AS episode_writing_end_date,
           DATE_FORMAT(episode.pre_production_start_date,     '%m/%d/%Y')                           AS episode_pre_production_start_date,
           DATE_FORMAT(episode.pre_production_end_date,       '%m/%d/%Y')                           AS episode_pre_production_end_date,
           DATE_FORMAT(episode.photography_start_date,        '%m/%d/%Y')                           AS episode_photography_start_date,
           DATE_FORMAT(episode.photography_end_date,          '%m/%d/%Y')                           AS episode_photography_end_date,
           DATE_FORMAT(episode.post_production_start_date,    '%m/%d/%Y')                           AS episode_post_production_start_date,
           DATE_FORMAT(episode.post_production_end_date,      '%m/%d/%Y')                           AS episode_post_production_end_date,
           DATE_FORMAT(episode.network_production_start_date, '%m/%d/%Y')                           AS episode_network_production_start_date,
           DATE_FORMAT(episode.network_production_end_date,   '%m/%d/%Y')                           AS episode_network_production_end_date,
           DATE_FORMAT(episode.created,                       '%m/%d/%Y %H:%i:%S')                  AS episode_created,
           episode.created_by                                                                       AS episode_created_by,
           DATE_FORMAT(episode.updated,                       '%m/%d/%Y %H:%i:%S')                  AS episode_updated,
           episode.updated_by                                                                       AS episode_updated_by,
           episode.status                                                                           AS episode_status
      FROM episode AS episode INNER JOIN company        AS media_company  ON media_company.id  = episode.media_company_id
                              INNER JOIN business_group AS business_group ON business_group.id = episode.business_group_id
                              INNER JOIN network        AS network        ON network.id        = episode.network_id
                              INNER JOIN production     AS production     ON production.id     = episode.production_id
                              INNER JOIN season         AS season         ON season.id         = episode.season_id;
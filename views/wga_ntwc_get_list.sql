CREATE OR REPLACE VIEW wga_ntwc_get_list(
    wga_ntwc_id,
    wga_ntwc_production_id,
    wga_ntwc_production_title,
    wga_ntwc_production_number,
    wga_ntwc_episode_id,
    wga_ntwc_episode_title,
    wga_ntwc_episode_episode_number,
    wga_ntwc_episode_episode_abbreviation,
    wga_ntwc_pilot,
    wga_ntwc_pilot_network_id,
    wga_ntwc_pilot_network_name,
    wga_ntwc_pilot_production_lenght_id,
    wga_ntwc_pilot_production_lenght_name,
    wga_ntwc_executive_producer_contact_id,
    wga_ntwc_director_contact_id,
    wga_ntwc_story_editor_contact_id,
    wga_ntwc_other_executive_producer_contact_id,
    wga_ntwc_producer_contact_id,
    wga_ntwc_supervising_producer_contact_id,
    wga_ntwc_sent_to_writers,
    wga_ntwc_protest_communicated,
    wga_ntwc_by_contact_id,
    wga_ntwc_created,
    wga_ntwc_created_by,
    wga_ntwc_updated,
    wga_ntwc_updated_by,
    wga_ntwc_status
) AS
    SELECT wga_ntwc.id                                                                              AS wga_ntwc_id,
           wga_ntwc.production_id                                                                   AS wga_ntwc_production_id,
           production.title                                                                         AS wga_ntwc_production_title,
           wga_ntwc.production_number                                                               AS wga_ntwc_production_number,
           wga_ntwc.episode_id                                                                      AS wga_ntwc_episode_id,
           episode.title                                                                            AS wga_ntwc_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS wga_ntwc_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS wga_ntwc_episode_episode_abbreviation,
           wga_ntwc.pilot                                                                           AS wga_ntwc_pilot,
           wga_ntwc.pilot_network_id                                                                AS wga_ntwc_pilot_network_id,
           network.name                                                                             AS wga_ntwc_pilot_network_name,
           wga_ntwc.pilot_production_lenght_id                                                      AS wga_ntwc_pilot_production_lenght_id,
           production_lenght.name                                                                   AS wga_ntwc_pilot_production_lenght_name,
           wga_ntwc.executive_producer_contact_id                                                   AS wga_ntwc_executive_producer_contact_id,
           wga_ntwc.director_contact_id                                                             AS wga_ntwc_director_contact_id,
           wga_ntwc.story_editor_contact_id                                                         AS wga_ntwc_story_editor_contact_id,
           wga_ntwc.other_executive_producer_contact_id                                             AS wga_ntwc_other_executive_producer_contact_id,
           wga_ntwc.producer_contact_id                                                             AS wga_ntwc_producer_contact_id,
           wga_ntwc.supervising_producer_contact_id                                                 AS wga_ntwc_supervising_producer_contact_id,
           DATE_FORMAT(wga_ntwc.sent_to_writers,      '%m/%d/%Y')                                   AS wga_ntwc_sent_to_writers,
           DATE_FORMAT(wga_ntwc.protest_communicated, '%m/%d/%Y')                                   AS wga_ntwc_protest_communicated,
           wga_ntwc.by_contact_id                                                                   AS wga_ntwc_by_contact_id,
           DATE_FORMAT(wga_ntwc.created, '%m/%d/%Y %H:%i:%S')                                       AS wga_ntwc_created,
           wga_ntwc.created_by                                                                      AS wga_ntwc_created_by,
           DATE_FORMAT(wga_ntwc.updated, '%m/%d/%Y %H:%i:%S')                                       AS wga_ntwc_updated,
           wga_ntwc.updated_by                                                                      AS wga_ntwc_updated_by,
           wga_ntwc.status                                                                          AS wga_ntwc_status
      FROM wga_ntwc AS wga_ntwc INNER JOIN production        AS production        ON production.id        = wga_ntwc.production_id
                                INNER JOIN episode           AS episode           ON episode.id           = wga_ntwc.episode_id
                                INNER JOIN season            AS season            ON season.id            = episode.season_id
                                LEFT  JOIN network           AS network           ON network.id           = wga_ntwc.pilot_network_id
                                LEFT  JOIN production_length AS production_length ON production_length.id = wga_ntwc.pilot_production_lenght_id
                                ;
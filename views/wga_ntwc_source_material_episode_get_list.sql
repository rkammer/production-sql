CREATE OR REPLACE VIEW wga_ntwc_source_material_episode_get_list(
    wga_ntwc_source_material_episode_id,
    wga_ntwc_source_material_episode_wga_ntwc_id,
    wga_ntwc_source_material_episode_name,
    wga_ntwc_source_material_episode_created,
    wga_ntwc_source_material_episode_created_by,
    wga_ntwc_source_material_episode_updated,
    wga_ntwc_source_material_episode_updated_by,
    wga_ntwc_source_material_episode_status
) AS
    SELECT wga_ntwc_source_material_episode.id                                            AS wga_ntwc_source_material_episode_id,
           wga_ntwc_source_material_episode.wga_ntwc_id                                   AS wga_ntwc_source_material_episode_wga_ntwc_id,
           wga_ntwc_source_material_episode.name                                          AS wga_ntwc_source_material_episode_name,
           DATE_FORMAT(wga_ntwc_source_material_episode.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_episode_created,
           wga_ntwc_source_material_episode.created_by                                    AS wga_ntwc_source_material_episode_created_by,
           DATE_FORMAT(wga_ntwc_source_material_episode.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_episode_updated,
           wga_ntwc_source_material_episode.updated_by                                    AS wga_ntwc_source_material_episode_updated_by,
           wga_ntwc_source_material_episode.status                                        AS wga_ntwc_source_material_episode_status
      FROM wga_ntwc_source_material_episode AS wga_ntwc_source_material_episode;
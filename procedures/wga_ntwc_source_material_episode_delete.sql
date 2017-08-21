DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_episode_delete(
    IN  wga_ntwc_source_material_episode_id INTEGER
)
BEGIN
    DELETE
      FROM wga_ntwc_source_material_episode
     WHERE id = wga_ntwc_source_material_episode_id;

    COMMIT;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_episode_set_list(
    IN wga_ntwc_source_material_episode_id             INT,
    IN wga_ntwc_source_material_episode_wga_ntwc_id    INT,
    IN wga_ntwc_source_material_episode_name           VARCHAR(50),
    IN wga_ntwc_source_material_episode_created_by     VARCHAR(30),
    IN wga_ntwc_source_material_episode_updated_by     VARCHAR(30),
    IN wga_ntwc_source_material_episode_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc_source_material_episode
     WHERE id = wga_ntwc_source_material_episode_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc_source_material_episode
        (
            wga_ntwc_id,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_source_material_episode_wga_ntwc_id,
            wga_ntwc_source_material_episode_name,
            wga_ntwc_source_material_episode_created_by,
            wga_ntwc_source_material_episode_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc_source_material_episode
           SET name        = wga_ntwc_source_material_episode_name,
               created_by  = wga_ntwc_source_material_episode_created_by,
               updated_by  = wga_ntwc_source_material_episode_updated_by,
               status      = 'UPDATED'
         WHERE id          = wga_ntwc_source_material_episode_id
           AND wga_ntwc_id = wga_ntwc_source_material_episode_wga_ntwc_id;

        SET return_value = wga_ntwc_source_material_episode_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
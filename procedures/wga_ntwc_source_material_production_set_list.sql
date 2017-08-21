DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_production_set_list(
    IN wga_ntwc_source_material_production_id             INT,
    IN wga_ntwc_source_material_production_wga_ntwc_id    INT,
    IN wga_ntwc_source_material_production_name           VARCHAR(50),
    IN wga_ntwc_source_material_production_created_by     VARCHAR(30),
    IN wga_ntwc_source_material_production_updated_by     VARCHAR(30),
    IN wga_ntwc_source_material_production_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc_source_material_production
     WHERE id = wga_ntwc_source_material_production_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc_source_material_production
        (
            wga_ntwc_id,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_source_material_production_wga_ntwc_id,
            wga_ntwc_source_material_production_name,
            wga_ntwc_source_material_production_created_by,
            wga_ntwc_source_material_production_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc_source_material_production
           SET wga_ntwc_id = wga_ntwc_source_material_production_wga_ntwc_id,
               name        = wga_ntwc_source_material_production_name,
               created_by  = wga_ntwc_source_material_production_created_by,
               updated_by  = wga_ntwc_source_material_production_updated_by,
               status      = 'UPDATED'
         WHERE id          = wga_ntwc_source_material_production_id;

        SET return_value = wga_ntwc_source_material_production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
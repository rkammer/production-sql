DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_production_delete(
    IN  wga_ntwc_source_material_production_id INTEGER
)
BEGIN
    DELETE
      FROM wga_ntwc_source_material_production
     WHERE id = wga_ntwc_source_material_production_id;

    COMMIT;
END //
DELIMITER ;
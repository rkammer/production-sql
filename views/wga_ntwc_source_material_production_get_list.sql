CREATE OR REPLACE VIEW wga_ntwc_source_material_production_get_list(
    wga_ntwc_source_material_production_id,
    wga_ntwc_source_material_production_wga_ntwc_id,
    wga_ntwc_source_material_production_name,
    wga_ntwc_source_material_production_created,
    wga_ntwc_source_material_production_created_by,
    wga_ntwc_source_material_production_updated,
    wga_ntwc_source_material_production_updated_by,
    wga_ntwc_source_material_production_status
) AS
    SELECT wga_ntwc_source_material_production.id                                            AS wga_ntwc_source_material_production_id,
           wga_ntwc_source_material_production.wga_ntwc_id                                   AS wga_ntwc_source_material_production_wga_ntwc_id,
           wga_ntwc_source_material_production.name                                          AS wga_ntwc_source_material_production_name,
           DATE_FORMAT(wga_ntwc_source_material_production.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_production_created,
           wga_ntwc_source_material_production.created_by                                    AS wga_ntwc_source_material_production_created_by,
           DATE_FORMAT(wga_ntwc_source_material_production.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_production_updated,
           wga_ntwc_source_material_production.updated_by                                    AS wga_ntwc_source_material_production_updated_by,
           wga_ntwc_source_material_production.status                                        AS wga_ntwc_source_material_production_status
      FROM wga_ntwc_source_material_production AS wga_ntwc_source_material_production;
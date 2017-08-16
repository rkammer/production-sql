CREATE OR REPLACE VIEW production_stage_get_list(
    production_stage_id,
    production_stage_name,
    production_stage_created,
    production_stage_created_by,
    production_stage_updated,
    production_stage_updated_by,
    production_stage_status
) AS
    SELECT production_stage.id                                            AS production_stage_id,
           production_stage.name                                          AS production_stage_name,
           DATE_FORMAT(production_stage.created,'%m/%d/%Y %H:%i:%S')      AS production_stage_created,
           production_stage.created_by                                    AS production_stage_created_by,
           DATE_FORMAT(production_stage.updated,'%m/%d/%Y %H:%i:%S')      AS production_stage_updated,
           production_stage.updated_by                                    AS production_stage_updated_by,
           production_stage.status                                        AS production_stage_status
      FROM production_stage AS production_stage;
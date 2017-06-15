CREATE OR REPLACE VIEW production_type_get_list(
    production_type_id,
    production_type_name,
    production_type_logo_path,
    production_type_created,
    production_type_created_by,
    production_type_updated,
    production_type_updated_by,
    production_type_status
) AS
    SELECT production_type.id                                            AS production_type_id,
           production_type.name                                          AS production_type_name,
           production_type.logo_path                                     AS production_type_logo_path,
           production_type.created                                       AS production_type_created,
           DATE_FORMAT(production_type.created_by,'%m/%d/%Y %H:%i:%S')   AS production_type_created_by,
           production_type.updated                                       AS production_type_updated,
           DATE_FORMAT(production_type.updated_by,'%m/%d/%Y %H:%i:%S')   AS production_type_updated_by,
           production_type.status                                        AS production_type_status
      FROM production_type                                               AS production_type;
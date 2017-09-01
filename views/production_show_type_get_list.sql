CREATE OR REPLACE VIEW production_show_type_get_list(
    production_show_type_id,
    production_show_type_name,
    production_show_type_created,
    production_show_type_created_by,
    production_show_type_updated,
    production_show_type_updated_by,
    production_show_type_status
) AS
    SELECT production_show_type.id                                       AS production_show_type_id,
           production_show_type.name                                     AS production_show_type_name,
           DATE_FORMAT(production_show_type.created,'%m/%d/%Y %H:%i:%S') AS production_show_type_created,
           production_show_type.created_by                               AS production_show_type_created_by,
           DATE_FORMAT(production_show_type.updated,'%m/%d/%Y %H:%i:%S') AS production_show_type_updated,
           production_show_type.updated_by                               AS production_show_type_updated_by,
           production_show_type.status                                   AS production_show_type_status
      FROM production_show_type AS production_show_type;
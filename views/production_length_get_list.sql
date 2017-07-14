CREATE OR REPLACE VIEW production_length_get_list(
    production_length_id,
    production_length_name,
    production_length_created,
    production_length_created_by,
    production_length_updated,
    production_length_updated_by,
    production_length_status
) AS
    SELECT production_length.id                                            AS production_length_id,
           production_length.name                                          AS production_length_name,
           DATE_FORMAT(production_length.created,'%m/%d/%Y %H:%i:%S')      AS production_length_created,
           production_length.created_by                                    AS production_length_created_by,
           DATE_FORMAT(production_length.updated,'%m/%d/%Y %H:%i:%S')      AS production_length_updated,
           production_length.updated_by                                    AS production_length_updated_by,
           production_length.status                                        AS production_length_status
      FROM production_length                                               AS production_length;
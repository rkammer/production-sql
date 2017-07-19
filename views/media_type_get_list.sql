CREATE OR REPLACE VIEW media_type_get_list(
    media_type_id,
    media_type_name,
    media_type_created,
    media_type_created_by,
    media_type_updated,
    media_type_updated_by,
    media_type_status
) AS
    SELECT media_type.id                                            AS media_type_id,
           media_type.name                                          AS media_type_name,
           DATE_FORMAT(media_type.created,'%m/%d/%Y %H:%i:%S')      AS media_type_created,
           media_type.created_by                                    AS media_type_created_by,
           DATE_FORMAT(media_type.updated,'%m/%d/%Y %H:%i:%S')      AS media_type_updated,
           media_type.updated_by                                    AS media_type_updated_by,
           media_type.status                                        AS media_type_status
      FROM media_type AS media_type;
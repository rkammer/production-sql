CREATE OR REPLACE VIEW location_type_get_list(
    location_type_id,
    location_type_name,
    location_type_created,
    location_type_created_by,
    location_type_updated,
    location_type_updated_by,
    location_type_status
) AS
    SELECT location_type.id                                          AS location_type_id,
           location_type.name                                        AS location_type_name,
           DATE_FORMAT(location_type.created,'%m/%d/%Y %H:%i:%S')    AS location_type_created,
           location_type.created_by                                  AS location_type_created_by,
           DATE_FORMAT(location_type.updated,'%m/%d/%Y %H:%i:%S')    AS location_type_updated,
           location_type.updated_by                                  AS location_type_updated_by,
           location_type.status                                      AS location_type_status
      FROM location_type AS location_type;
CREATE OR REPLACE VIEW business_type_get_list(
    business_type_id,
    business_type_name,
    business_type_created,
    business_type_created_by,
    business_type_updated,
    business_type_updated_by,
    business_type_status
) AS
    SELECT business_type.id                                            AS business_type_id,
           business_type.name                                          AS business_type_name,
           business_type.created                                       AS business_type_created,
           DATE_FORMAT(business_type.created_by,'%m/%d/%Y %H:%i:%S')   AS business_type_created_by,
           business_type.updated                                       AS business_type_updated,
           DATE_FORMAT(business_type.updated_by,'%m/%d/%Y %H:%i:%S')   AS business_type_updated_by,
           business_type.status                                        AS business_type_status
      FROM business_type AS business_type;
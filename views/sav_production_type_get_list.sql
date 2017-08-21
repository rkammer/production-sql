CREATE OR REPLACE VIEW sav_production_type_get_list(
    sav_production_type_id,
    sav_production_type_code,
    sav_production_type_title,
    sav_production_type_full_title,
    sav_production_type_created,
    sav_production_type_created_by,
    sav_production_type_updated,
    sav_production_type_updated_by,
    sav_production_type_status
) AS
    SELECT sav_production_type.id                                          AS sav_production_type_id,
           sav_production_type.code                                        AS sav_production_type_code,
           sav_production_type.title                                       AS sav_production_type_title,
           CASE WHEN TRIM(sav_production_type.code) IS NULL
                  OR TRIM(sav_production_type.code) = '' THEN
                  sav_production_type.title
           ELSE
                CONCAT(TRIM(sav_production_type.code), ' - ',TRIM(sav_production_type.title))
           END                                                             AS sav_production_type_full_title,
           DATE_FORMAT(sav_production_type.created,'%m/%d/%Y %H:%i:%S')    AS sav_production_type_created,
           sav_production_type.created_by                                  AS sav_production_type_created_by,
           DATE_FORMAT(sav_production_type.updated,'%m/%d/%Y %H:%i:%S')    AS sav_production_type_updated,
           sav_production_type.updated_by                                  AS sav_production_type_updated_by,
           sav_production_type.status                                      AS sav_production_type_status
      FROM sav_production_type AS sav_production_type;
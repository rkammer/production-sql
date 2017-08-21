CREATE OR REPLACE VIEW sav_performer_type_get_list(
    sav_performer_type_id,
    sav_performer_type_code,
    sav_performer_type_title,
    sav_performer_type_full_title,
    sav_performer_type_created,
    sav_performer_type_created_by,
    sav_performer_type_updated,
    sav_performer_type_updated_by,
    sav_performer_type_status
) AS
    SELECT sav_performer_type.id                                                      AS sav_performer_type_id,
           sav_performer_type.code                                                    AS sav_performer_type_code,
           sav_performer_type.title                                                   AS sav_performer_type_title,
           CONCAT(TRIM(sav_performer_type.code),' - ',TRIM(sav_performer_type.title)) AS sav_performer_type_full_title,
           DATE_FORMAT(sav_performer_type.created,'%m/%d/%Y %H:%i:%S')                AS sav_performer_type_created,
           sav_performer_type.created_by                                              AS sav_performer_type_created_by,
           DATE_FORMAT(sav_performer_type.updated,'%m/%d/%Y %H:%i:%S')                AS sav_performer_type_updated,
           sav_performer_type.updated_by                                              AS sav_performer_type_updated_by,
           sav_performer_type.status                                                  AS sav_performer_type_status
      FROM sav_performer_type AS sav_performer_type;
CREATE OR REPLACE VIEW sav_role_get_list(
    sav_role_id,
    sav_role_code,
    sav_role_title,
    sav_role_full_title,
    sav_role_created,
    sav_role_created_by,
    sav_role_updated,
    sav_role_updated_by,
    sav_role_status
) AS
    SELECT sav_role.id                                               AS sav_role_id,
           sav_role.code                                             AS sav_role_code,
           sav_role.title                                            AS sav_role_title,
           CONCAT(TRIM(sav_role.code), ' - ', TRIM(sav_role.title))  AS sav_role_full_title,
           DATE_FORMAT(sav_role.created,'%m/%d/%Y %H:%i:%S')         AS sav_role_created,
           sav_role.created_by                                       AS sav_role_created_by,
           DATE_FORMAT(sav_role.updated,'%m/%d/%Y %H:%i:%S')         AS sav_role_updated,
           sav_role.updated_by                                       AS sav_role_updated_by,
           sav_role.status                                           AS sav_role_status
      FROM sav_role AS sav_role;
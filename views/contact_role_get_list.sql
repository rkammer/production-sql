CREATE OR REPLACE VIEW contact_role_get_list(
    contact_role_id,
    contact_role_name,
    contact_role_created,
    contact_role_created_by,
    contact_role_updated,
    contact_role_updated_by,
    contact_role_status
) AS
    SELECT contact_role.id                                            AS contact_role_id,
           contact_role.name                                          AS contact_role_name,
           DATE_FORMAT(contact_role.created,'%m/%d/%Y %H:%i:%S')      AS contact_role_created,
           contact_role.created_by                                    AS contact_role_created_by,
           DATE_FORMAT(contact_role.updated,'%m/%d/%Y %H:%i:%S')      AS contact_role_updated,
           contact_role.updated_by                                    AS contact_role_updated_by,
           contact_role.status                                        AS contact_role_status
      FROM contact_role AS contact_role;
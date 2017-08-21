CREATE OR REPLACE VIEW production_contact_get_list(
    production_contact_production_id,
    production_contact_production_title,
    production_contact_contact_id,
    production_contact_contact_name,
    production_contact_contact_phone,
    production_contact_contact_email,
    production_contact_contact_role_id,
    production_contact_contact_role_name,
    production_contact_created,
    production_contact_created_by,
    production_contact_updated,
    production_contact_updated_by,
    production_contact_status
) AS
    SELECT production_contact.production_id                            AS production_contact_production_id,
           production.title                                            AS production_contact_production_title,
           production_contact.contact_id                               AS production_contact_contact_id,
           contact_get_full_name(contact.id)                           AS production_contact_contact_name,
           contact.phone                                               AS production_contact_contact_phone,
           contact.email                                               AS production_contact_contact_email,
           production_contact.contact_role_id                          AS production_contact_contact_role_id,
           contact_role.name                                           AS production_contact_contact_role_name,
           DATE_FORMAT(production_contact.created,'%m/%d/%Y %H:%i:%S') AS production_contact_created,
           production_contact.created_by                               AS production_contact_created_by,
           DATE_FORMAT(production_contact.updated,'%m/%d/%Y %H:%i:%S') AS production_contact_updated,
           production_contact.updated_by                               AS production_contact_updated_by,
           production_contact.status                                   AS production_contact_status
      FROM production_contact AS production_contact INNER JOIN production   AS production   ON production.id   = production_contact.production_id
                                                    INNER JOIN contact      AS contact      ON contact.id      = production_contact.contact_id
                                                    INNER JOIN contact_role AS contact_role ON contact_role.id = production_contact.contact_role_id;
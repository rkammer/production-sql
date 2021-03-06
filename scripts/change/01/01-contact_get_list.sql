DROP VIEW contact_get_list;

CREATE OR REPLACE VIEW contact_get_list(
    contact_id,
    contact_first_name,
    contact_middle_name,
    contact_last_name,
    contact_suffix,
    contact_full_name,
    contact_address,
    contact_city,
    contact_state_code,
    contact_state_name,
    contact_zipcode,
    contact_phone,
    contact_email,
    contact_ssn,
    contact_website,
    contact_picture_path,
    contact_created,
    contact_created_by,
    contact_updated,
    contact_updated_by,
    contact_status
) AS
    SELECT contact.id                                             AS contact_id,
           contact.first_name                                     AS contact_first_name,
           contact.middle_name                                    AS contact_middle_name,
           contact.last_name                                      AS contact_last_name,
           contact.suffix                                         AS contact_suffix,
           contact_get_full_name(contact.id)                      AS contact_full_name,
           contact.address                                        AS contact_address,
           contact.city                                           AS contact_city,
           contact.state_code                                     AS contact_state_code,
           state.name                                             AS contact_state_name,
           contact.zipcode                                        AS contact_zipcode,
           contact.phone                                          AS contact_phone,
           contact.email                                          AS contact_email,
           contact.ssn                                            AS contact_ssn,
           contact.website                                        AS contact_website,
           contact.picture_path                                   AS contact_picture_path,
           DATE_FORMAT(contact.created,'%m/%d/%Y %H:%i:%S')       AS contact_created,
           contact.created_by                                     AS contact_created_by,
           DATE_FORMAT(contact.updated,'%m/%d/%Y %H:%i:%S')       AS contact_updated,
           contact.updated_by                                     AS contact_updated_by,
           contact.status                                         AS contact_status
     FROM contact as contact LEFT  JOIN state AS state ON state.code = contact.state_code;
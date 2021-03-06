CREATE OR REPLACE VIEW company_contact_get_list(
    company_contact_company_id,
    -- company_contact_company_name,
    contact_contact_first_name,
    contact_contact_middle_name,
    contact_contact_last_name,
    contact_contact_suffix,
    contact_contact_full_name,
    company_contact_contact_id,
    company_contact_contact_name,
    company_contact_created,
    company_contact_created_by,
    company_contact_updated,
    company_contact_updated_by,
    company_contact_status
) AS
    SELECT company_contact.company_id                                  AS company_contact_company_id,
           company.name                                                AS company_contact_company_name,
           company_contact.contact_id                                  AS company_contact_contact_id,
        --    contact.name                                                AS company_contact_contact_name,
           contact.first_name                                          AS contact_contact_first_name,
           contact.middle_name                                         AS contact_contact_middle_name,
           contact.last_name                                           AS contact_contact_last_name,
           contact.suffix                                              AS contact_contact_suffix,
           contact_get_full_name(contact.id)                           AS contact_contact_full_name,
           DATE_FORMAT(company_contact.created,'%m/%d/%Y %H:%i:%S')    AS company_contact_created,
           company_contact.created_by                                  AS company_contact_created_by,
           DATE_FORMAT(company_contact.updated,'%m/%d/%Y %H:%i:%S')    AS company_contact_updated,
           company_contact.updated_by                                  AS company_contact_updated_by,
           company_contact.status                                      AS company_contact_status
      FROM company_contact AS company_contact INNER JOIN company on company.id = company_contact.company_id
                                              INNER JOIN contact on contact.id = company_contact.contact_id;
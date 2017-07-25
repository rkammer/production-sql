CREATE OR REPLACE VIEW wga_work_list_get_list(
    wga_work_list_id,
    wga_work_list_company_id,
    wga_work_list_company_number,
    wga_work_list_company_name,
    wga_work_list_company_address,
    wga_work_list_company_city,
    wga_work_list_company_state_code,
    wga_work_list_company_state_name,
    wga_work_list_company_phone,
    wga_work_list_company_website,
    wga_work_list_week_ending,
    wga_work_list_contact_id,
    -- wga_work_list_contact_name,
    wga_work_list_contact_first_name,
    wga_work_list_contact_middle_name,
    wga_work_list_contact_last_name,
    wga_work_list_contact_suffix,
    wga_work_list_contact_full_name,
    wga_work_list_contact_address,
    wga_work_list_contact_city,
    wga_work_list_contact_state_code,
    wga_work_list_contact_state_name,
    wga_work_list_contact_phone,
    wga_work_list_contact_email,
    wga_work_list_name,
    wga_work_list_created,
    wga_work_list_created_by,
    wga_work_list_updated,
    wga_work_list_updated_by,
    wga_work_list_status
) AS
    SELECT wga_work_list.id                                              AS wga_work_list_id,
           wga_work_list.company_id                                      AS wga_work_list_company_id,
           wga_work_list.company_number                                  AS wga_work_list_company_number,
           company.name                                                  AS wga_work_list_company_name,
           company.address                                               AS wga_work_list_company_address,
           company.city                                                  AS wga_work_list_company_city,
           company.state_code                                            AS wga_work_list_company_state_code,
           company_state.name                                            AS wga_work_list_company_state_name,
           company.phone                                                 AS wga_work_list_company_phone,
           company.website                                               AS wga_work_list_company_website,
           wga_work_list.week_ending                                     AS wga_work_list_week_ending,
           wga_work_list.contact_id                                      AS wga_work_list_contact_id,
        --    contact.name                                                  AS wga_work_list_contact_name,
           contact.first_name                                            AS wga_work_list_contact_first_name,
           contact.middle_name                                           AS wga_work_list_contact_middle_name,
           contact.last_name                                             AS wga_work_list_contact_last_name,
           contact.suffix                                                AS wga_work_list_contact_suffix,
           contact_get_full_name(contact.id)                             AS wga_work_list_contact_full_name,
           contact.address                                               AS wga_work_list_contact_address,
           contact.city                                                  AS wga_work_list_contact_city,
           contact.state_code                                            AS wga_work_list_contact_state_code,
           contact_state.name                                            AS wga_work_list_contact_state_name,
           contact.phone                                                 AS wga_work_list_contact_phone,
           contact.email                                                 AS wga_work_list_contact_email,
           wga_work_list.name                                            AS wga_work_list_name,
           DATE_FORMAT(wga_work_list.created,'%m/%d/%Y %H:%i:%S')        AS wga_work_list_created,
           wga_work_list.created_by                                      AS wga_work_list_created_by,
           DATE_FORMAT(wga_work_list.updated,'%m/%d/%Y %H:%i:%S')        AS wga_work_list_updated,
           wga_work_list.updated_by                                      AS wga_work_list_updated_by,
           wga_work_list.status                                          AS wga_work_list_status
      FROM wga_work_list AS wga_work_list INNER JOIN company AS company       ON company.id         = wga_work_list.company_id
                                          INNER JOIN state   AS company_state ON company_state.code = company.state_code
                                          INNER JOIN contact AS contact       ON contact.id         = wga_work_list.contact_id
                                          INNER JOIN state   AS contact_state ON contact_state.code = company.state_code;
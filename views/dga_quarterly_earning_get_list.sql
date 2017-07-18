CREATE OR REPLACE VIEW dga_quarterly_earning_get_list(
    dga_quarterly_earning_id,
    dga_quarterly_earning_quarter,
    dga_quarterly_earning_year,
    dga_quarterly_earning_company_id,
    dga_quarterly_earning_company_name,
    dga_quarterly_earning_company_address,
    dga_quarterly_earning_company_city,
    dga_quarterly_earning_company_state_code,
    dga_quarterly_earning_company_state_name,
    dga_quarterly_earning_company_phone,
    dga_quarterly_earning_company_website,
    dga_quarterly_earning_company_logo_path,
    dga_quarterly_earning_contact_id,
    dga_quarterly_earning_contact_name,
    dga_quarterly_earning_prepared_by,
    dga_quarterly_earning_phone,
    dga_quarterly_earning_created,
    dga_quarterly_earning_created_by,
    dga_quarterly_earning_updated,
    dga_quarterly_earning_updated_by,
    dga_quarterly_earning_status
) AS
    SELECT dga_quarterly_earning.id                                                       AS dga_quarterly_earning_id,
           dga_quarterly_earning.quarter                                                  AS dga_quarterly_earning_quarter,
           dga_quarterly_earning.year                                                     AS dga_quarterly_earning_year,
           dga_quarterly_earning.company_id                                               AS dga_quarterly_earning_company_id,
           company.name                                                                   AS dga_quarterly_earning_company_name,
           company.address                                                                AS dga_quarterly_earning_company_address,
           company.city                                                                   AS dga_quarterly_earning_company_city,
           company.state_code                                                             AS dga_quarterly_earning_company_state_code,
           state.name                                                                     AS dga_quarterly_earning_company_state_name,
           company.phone                                                                  AS dga_quarterly_earning_company_phone,
           company.website                                                                AS dga_quarterly_earning_company_website,
           company.logo_path                                                              AS dga_quarterly_earning_company_logo_path,
           dga_quarterly_earning.contact_id                                               AS dga_quarterly_earning_contact_id,
           contact.name                                                                   AS dga_quarterly_earning_contact_name,
           dga_quarterly_earning.prepared_by                                              AS dga_quarterly_earning_prepared_by,
           dga_quarterly_earning.phone                                                    AS dga_quarterly_earning_phone,
           DATE_FORMAT(dga_quarterly_earning.created,'%m/%d/%Y %H:%i:%S')                 AS dga_quarterly_earning_created,
           dga_quarterly_earning.created_by                                               AS dga_quarterly_earning_created_by,
           DATE_FORMAT(dga_quarterly_earning.updated,'%m/%d/%Y %H:%i:%S')                 AS dga_quarterly_earning_updated,
           dga_quarterly_earning.updated_by                                               AS dga_quarterly_earning_updated_by,
           dga_quarterly_earning.status                                                   AS dga_quarterly_earning_status
      FROM dga_quarterly_earning AS dga_quarterly_earning INNER JOIN company_contact AS company_contact ON company_contact.company_id = dga_quarterly_earning.company_id
                                                                                                       AND company_contact.contact_id = dga_quarterly_earning.contact_id
                                                        INNER JOIN company         AS company           ON company.id                 = company_contact.company_id
                                                        INNER JOIN contact         AS contact           ON contact.id                 = company_contact.contact_id
                                                        INNER JOIN state           AS state             ON company.state_code         = state.code;
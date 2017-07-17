CREATE OR REPLACE VIEW dga_quartely_earning_get_list(
    dga_quartely_earning_id,
    dga_quartely_earning_quarterly,
    dga_quartely_earning_year,
    dga_quartely_earning_company_id,
    dga_quarterly_earning_company_name,
    dga_quarterly_earning_company_address,
    dga_quarterly_earning_company_city,
    dga_quarterly_earning_company_state_code,
    dga_quarterly_earning_company_state_name,
    dga_quarterly_earning_company_phone,
    dga_quarterly_earning_company_website,
    dga_quarterly_earning_company_logo_path,
    dga_quartely_earning_contact_id,
    dga_quartely_earning_contact_name,
    dga_quartely_earning_prepared_by,
    dga_quartely_earning_phone,
    dga_quartely_earning_created,
    dga_quartely_earning_created_by,
    dga_quartely_earning_updated,
    dga_quartely_earning_updated_by,
    dga_quartely_earning_status
) AS
    SELECT dga_quartely_earning.id                                                       AS dga_quartely_earning_id,
           dga_quartely_earning.quarterly                                                AS dga_quartely_earning_quarterly,
           dga_quartely_earning.year                                                     AS dga_quartely_earning_year,
           dga_quartely_earning.company_id                                               AS dga_quartely_earning_company_id,
           company.name                                                                  AS dga_quarterly_earning_company_name,
           company.address                                                               AS dga_quarterly_earning_company_address,
           company.city                                                                  AS dga_quarterly_earning_company_city,
           company.state_code                                                            AS dga_quarterly_earning_company_state_code,
           state.name                                                                    AS dga_quarterly_earning_company_state_name,
           company.phone                                                                 AS dga_quarterly_earning_company_phone,
           company.website                                                               AS dga_quarterly_earning_company_website,
           company.logo_path                                                             AS dga_quarterly_earning_company_logo_path,
           dga_quartely_earning.contact_id                                               AS dga_quartely_earning_contact_id,
           contact.name                                                                  AS dga_quartely_earning_contact_name,
           dga_quartely_earning.prepared_by                                              AS dga_quartely_earning_prepared_by,
           dga_quartely_earning.phone                                                    AS dga_quartely_earning_phone,
           DATE_FORMAT(dga_quartely_earning.created,'%m/%d/%Y %H:%i:%S')                 AS dga_quartely_earning_created,
           dga_quartely_earning.created_by                                               AS dga_quartely_earning_created_by,
           DATE_FORMAT(dga_quartely_earning.updated,'%m/%d/%Y %H:%i:%S')                 AS dga_quartely_earning_updated,
           dga_quartely_earning.updated_by                                               AS dga_quartely_earning_updated_by,
           dga_quartely_earning.status                                                   AS dga_quartely_earning_status
      FROM dga_quartely_earning AS dga_quartely_earning INNER JOIN company_contact AS company_contact ON company_contact.company_id = dga_quartely_earning.company_id
                                                                                                     AND company_contact.contact_id = dga_quartely_earning.contact_id
                                                        INNER JOIN company         AS company         ON company.id                 = company_contact.company_id
                                                        INNER JOIN contact         AS contact         ON contact.id                 = company_contact.contact_id
                                                        INNER JOIN state           AS state           ON company.state_code         = state.code;
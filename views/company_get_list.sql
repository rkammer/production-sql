CREATE OR REPLACE VIEW company_get_list(
    company_id,
    company_name,
    company_address,
    company_city,
    company_state_code,
    company_state_name,
    company_phone,
    company_website,
    company_logo_path,
    company_media_company,
    company_production_company,
    company_payroll_company,
    company_created,
    company_created_by,
    company_updated,
    company_updated_by,
    company_status
) AS
    SELECT company.id                                            AS company_id,
           company.name                                          AS company_name,
           company.address                                       AS company_address,
           company.city                                          AS company_city,
           company.state_code                                    AS company_state_code,
           state.name                                            AS company_state_name,
           company.phone                                         AS company_phone,
           company.website                                       AS company_website,
           company.logo_path                                     AS company_logo_path,
           company.media_company                                 AS company_media_company,
           company.production_company                            AS company_production_company,
           company.payroll_company                               AS company_payroll_company,
           company.created                                       AS company_created,
           DATE_FORMAT(company.created_by,'%m/%d/%Y %H:%i:%S')   AS company_created_by,
           company.updated                                       AS company_updated,
           DATE_FORMAT(company.updated_by,'%m/%d/%Y %H:%i:%S')   AS company_updated_by,
           company.status                                        AS company_status
      FROM company AS company LEFT JOIN state AS state on state.code = company.state_code;
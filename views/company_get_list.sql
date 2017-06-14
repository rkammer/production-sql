CREATE OR REPLACE VIEW company_get_list(
    company_id,
    company_name,
    company_logo_path,
    company_created,
    company_created_by,
    company_updated,
    company_updated_by,
    company_status
) AS
    SELECT company.id                                            AS company_id,
           company.name                                          AS company_name,
           company.logo_path                                     AS company_logo_path,
           company.created                                       AS company_created,
           DATE_FORMAT(company.created_by,'%m/%d/%Y %H:%i:%S')   AS company_created_by,
           company.updated                                       AS company_updated,
           DATE_FORMAT(company.updated_by,'%m/%d/%Y %H:%i:%S')   AS company_updated_by,
           company.status                                        AS company_status
      FROM company                                               AS company;
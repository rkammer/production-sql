CREATE OR REPLACE VIEW dga_pif_tv_company_get_list(
    dga_pif_tv_company_id,
    dga_pif_tv_company_dga_pif_tv_id,
    dga_pif_tv_company_company_name,
    dga_pif_tv_company_company_phone,
    dga_pif_tv_company_created,
    dga_pif_tv_company_created_by,
    dga_pif_tv_company_updated,
    dga_pif_tv_company_updated_by,
    dga_pif_tv_company_status
) AS
    SELECT dga_pif_tv_company.id                                             AS dga_pif_tv_company_id,
           dga_pif_tv_company.dga_pif_tv_id                                  AS dga_pif_tv_company_dga_pif_tv_id,
           dga_pif_tv_company.company_name                                   AS dga_pif_tv_company_company_name,
           dga_pif_tv_company.company_phone                                  AS dga_pif_tv_company_company_phone,
           DATE_FORMAT(dga_pif_tv_company.created,'%m/%d/%Y %H:%i:%S')       AS dga_pif_tv_company_created,
           dga_pif_tv_company.created_by                                     AS dga_pif_tv_company_created_by,
           DATE_FORMAT(dga_pif_tv_company.updated,'%m/%d/%Y %H:%i:%S')       AS dga_pif_tv_company_updated,
           dga_pif_tv_company.updated_by                                     AS dga_pif_tv_company_updated_by,
           dga_pif_tv_company.status                                         AS dga_pif_tv_company_status
      FROM dga_pif_tv_company AS dga_pif_tv_company;
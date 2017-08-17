CREATE OR REPLACE VIEW business_group_get_list(
    business_group_id,
    business_group_name,
    business_group_company_id,
    business_group_company_name,
    business_group_created,
    business_group_created_by,
    business_group_updated,
    business_group_updated_by,
    business_group_status
) AS
    SELECT business_group.id                                              AS  business_group_id,
           business_group.name                                            AS  business_group_name,
           business_group.company_id                                      AS  business_group_company_id,
           company.name                                                   AS  business_group_company_name,
           DATE_FORMAT(business_group.created,'%m/%d/%Y %H:%i:%S')        AS  business_group_created,
           business_group.created_by                                      AS  business_group_created_by,
           DATE_FORMAT(business_group.updated,'%m/%d/%Y %H:%i:%S')        AS  business_group_updated,
           business_group.updated_by                                      AS  business_group_updated_by,
           business_group.status                                          AS  business_group_status
      FROM business_group AS business_group INNER JOIN company AS company ON company.id = business_group.company_id;
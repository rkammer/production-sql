CREATE OR REPLACE VIEW network_get_list(
    network_id,
    network_name,
    network_company_id,
    network_company_name,
    network_logo_path,
    network_created,
    network_created_by,
    network_updated,
    network_updated_by,
    network_status
) AS
    SELECT network.id                                            AS network_id,
           network.name                                          AS network_name,
           network.company_id                                    AS network_company_id,
           company.name                                          AS network_company_name,
           network.logo_path                                     AS network_logo_path,
           network.created                                       AS network_created,
           DATE_FORMAT(network.created_by,'%m/%d/%Y %H:%i:%S')   AS network_created_by,
           network.updated                                       AS network_updated,
           DATE_FORMAT(network.updated_by,'%m/%d/%Y %H:%i:%S')   AS network_updated_by,
           network.status                                        AS network_status
      FROM network AS network INNER JOIN company AS company ON company.id = network.company_id;
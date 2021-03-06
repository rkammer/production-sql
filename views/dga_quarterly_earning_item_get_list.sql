CREATE OR REPLACE VIEW dga_quarterly_earning_item_get_list(
    dga_quarterly_earning_item_id,
    dga_quarterly_earning_item_dga_quarterly_earning_id,
    dga_quarterly_earning_item_dga_quarterly_earning_quarterly,
    dga_quarterly_earning_item_dga_quarterly_earning_year,
    dga_quarterly_earning_item_name,
    dga_quarterly_earning_item_ssn,
    dga_quarterly_earning_item_category,
    dga_quarterly_earning_item_production_id,
    dga_quarterly_earning_item_production_title,
    dga_quarterly_earning_item_earnings,
    dga_quarterly_earning_item_created,
    dga_quarterly_earning_item_created_by,
    dga_quarterly_earning_item_updated,
    dga_quarterly_earning_item_updated_by,
    dga_quarterly_earning_item_status
) AS
    SELECT dga_quarterly_earning_item.id                                                         AS  dga_quarterly_earning_item_id,
           dga_quarterly_earning_item.dga_quarterly_earning_id                                   AS  dga_quarterly_earning_item_dga_quarterly_earning_id,
           dga_quarterly_earning.quarter                                                         AS  dga_quarterly_earning_item_dga_quarterly_earning_quarterly,
           dga_quarterly_earning.year                                                            AS  dga_quarterly_earning_item_dga_quarterly_earning_year,
           dga_quarterly_earning_item.name                                                       AS  dga_quarterly_earning_item_name,
           dga_quarterly_earning_item.ssn                                                        AS  dga_quarterly_earning_item_ssn,
           dga_quarterly_earning_item.category                                                   AS  dga_quarterly_earning_item_category,
           dga_quarterly_earning_item.production_id                                              AS  dga_quarterly_earning_item_production_id,
           production.title                                                                      AS  dga_quarterly_earning_item_production_title,
           dga_quarterly_earning_item.earnings                                                   AS  dga_quarterly_earning_item_earnings,
           DATE_FORMAT(dga_quarterly_earning_item.created,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_created,
           dga_quarterly_earning_item.created_by                                                 AS  dga_quarterly_earning_item_created_by,
           DATE_FORMAT(dga_quarterly_earning_item.updated,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_updated,
           dga_quarterly_earning_item.updated_by                                                 AS  dga_quarterly_earning_item_updated_by,
           dga_quarterly_earning_item.status                                                     AS  dga_quarterly_earning_item_status
      FROM dga_quarterly_earning_item AS dga_quarterly_earning_item INNER JOIN dga_quarterly_earning AS dga_quarterly_earning ON dga_quarterly_earning.id  = dga_quarterly_earning_item.dga_quarterly_earning_id
                                                                    INNER JOIN production            AS production            ON production.id             = dga_quarterly_earning_item.production_id;
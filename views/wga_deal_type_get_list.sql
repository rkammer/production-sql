CREATE OR REPLACE VIEW wga_deal_type_get_list(
    wga_deal_type_id,
    wga_deal_type_code,
    wga_deal_type_title,
    wga_deal_type_full_title,
    wga_deal_type_created,
    wga_deal_type_created_by,
    wga_deal_type_updated,
    wga_deal_type_updated_by,
    wga_deal_type_status
) AS
    SELECT wga_deal_type.id                                              AS  wga_deal_type_id,
           wga_deal_type.code                                            AS  wga_deal_type_code,
           wga_deal_type.title                                           AS  wga_deal_type_title,
           CASE WHEN TRIM(wga_deal_type.code) IS NULL
                  OR TRIM(wga_deal_type.code) = '' THEN
                wga_deal_type.title
           ELSE
                CONCAT(wga_deal_type.code, ' - ', wga_deal_type.title)
           END                                                           AS  wga_deal_type_full_title,
           DATE_FORMAT(wga_deal_type.created,'%m/%d/%Y %H:%i:%S')        AS  wga_deal_type_created,
           wga_deal_type.created_by                                      AS  wga_deal_type_created_by,
           DATE_FORMAT(wga_deal_type.updated,'%m/%d/%Y %H:%i:%S')        AS  wga_deal_type_updated,
           wga_deal_type.updated_by                                      AS  wga_deal_type_updated_by,
           wga_deal_type.status                                          AS  wga_deal_type_status
      FROM wga_deal_type AS wga_deal_type;
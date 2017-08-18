CREATE OR REPLACE VIEW deal_type_get_list(
    deal_type_id,
    deal_type_abreviation,
    deal_type_name,
    deal_type_created,
    deal_type_created_by,
    deal_type_updated,
    deal_type_updated_by,
    deal_type_status
) AS
    SELECT deal_type.id                                            AS deal_type_id,
           deal_type.abreviation                                   AS deal_type_abreviation,
           deal_type.name                                          AS deal_type_name,
           DATE_FORMAT(deal_type.created,'%m/%d/%Y %H:%i:%S')      AS deal_type_created,
           deal_type.created_by                                    AS deal_type_created_by,
           DATE_FORMAT(deal_type.updated,'%m/%d/%Y %H:%i:%S')      AS deal_type_updated,
           deal_type.updated_by                                    AS deal_type_updated_by,
           deal_type.status                                        AS deal_type_status
      FROM deal_type AS deal_type;
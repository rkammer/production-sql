CREATE OR REPLACE VIEW dga_weekly_work_item_get_list(
    dga_weekly_work_item_id,
    dga_weekly_work_item_dga_weekly_work_id,
    dga_weekly_work_item_name,
    dga_weekly_work_item_ssn,
    dga_weekly_work_item_category,
    dga_weekly_work_item_created,
    dga_weekly_work_item_created_by,
    dga_weekly_work_item_updated,
    dga_weekly_work_item_updated_by,
    dga_weekly_work_item_status
) AS
    SELECT dga_weekly_work_item.id                                            AS dga_weekly_work_item_id,
           dga_weekly_work_id                                                 AS dga_weekly_work_item_dga_weekly_work_id,
           name                                                               AS dga_weekly_work_item_name,
           ssn                                                                AS dga_weekly_work_item_ssn,
           category                                                           AS dga_weekly_work_item_category,
           DATE_FORMAT(dga_weekly_work_item.created,'%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_item_created,
           dga_weekly_work_item.created_by                                    AS dga_weekly_work_item_created_by,
           DATE_FORMAT(dga_weekly_work_item.updated,'%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_item_updated,
           dga_weekly_work_item.updated_by                                    AS dga_weekly_work_item_updated_by,
           dga_weekly_work_item.status                                        AS dga_weekly_work_item_status
      FROM dga_weekly_work_item AS dga_weekly_work_item;
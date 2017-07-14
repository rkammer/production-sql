CREATE OR REPLACE VIEW dga_quarter_get_list(
    dga_quarter_id,
    dga_quarter_name,
    dga_quarter_description,
    dga_quarter_created,
    dga_quarter_created_by,
    dga_quarter_updated,
    dga_quarter_updated_by,
    dga_quarter_status
) AS
    SELECT dga_quarter.id                                            AS dga_quarter_id,
           dga_quarter.name                                          AS dga_quarter_name,
           dga_quarter.description                                   AS dga_quarter_description,
           DATE_FORMAT(dga_quarter.created,'%m/%d/%Y %H:%i:%S')      AS dga_quarter_created,
           dga_quarter.created_by                                    AS dga_quarter_created_by,
           DATE_FORMAT(dga_quarter.updated,'%m/%d/%Y %H:%i:%S')      AS dga_quarter_updated,
           dga_quarter.updated_by                                    AS dga_quarter_updated_by,
           dga_quarter.status                                        AS dga_quarter_status
      FROM dga_quarter AS dga_quarter;
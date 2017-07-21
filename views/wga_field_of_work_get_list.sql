CREATE OR REPLACE VIEW wga_field_of_work_get_list(
    wga_field_of_work_id,
    wga_field_of_work_code,
    wga_field_of_work_title,
    wga_field_of_work_full_title,
    wga_field_of_work_created,
    wga_field_of_work_created_by,
    wga_field_of_work_updated,
    wga_field_of_work_updated_by,
    wga_field_of_work_status
) AS
    SELECT wga_field_of_work.id                                                             AS wga_field_of_work_id,
           wga_field_of_work.code                                                           AS wga_field_of_work_code,
           wga_field_of_work.title                                                          AS wga_field_of_work_title,
           CASE WHEN TRIM(wga_field_of_work.code) IS NULL
                  OR TRIM(wga_field_of_work.code) = '' THEN
                wga_field_of_work.title
           ELSE
                CONCAT(wga_field_of_work.code, ' - ', wga_field_of_work.title)
           END                                                                              AS wga_field_of_work_full_title,
           DATE_FORMAT(wga_field_of_work.created,'%m/%d/%Y %H:%i:%S')                       AS wga_field_of_work_created,
           wga_field_of_work.created_by                                                     AS wga_field_of_work_created_by,
           DATE_FORMAT(wga_field_of_work.updated,'%m/%d/%Y %H:%i:%S')                       AS wga_field_of_work_updated,
           wga_field_of_work.updated_by                                                     AS wga_field_of_work_updated_by,
           wga_field_of_work.status                                                         AS wga_field_of_work_status
      FROM wga_field_of_work AS wga_field_of_work;
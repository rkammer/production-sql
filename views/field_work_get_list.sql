CREATE OR REPLACE VIEW field_work_get_list(
    field_work_id,
    field_work_abreviation,
    field_work_name,
    field_work_created,
    field_work_created_by,
    field_work_updated,
    field_work_updated_by,
    field_work_status
) AS
    SELECT field_work.id                                            AS field_work_id,
           field_work.abreviation                                   AS field_work_abreviation,
           field_work.name                                          AS field_work_name,
           DATE_FORMAT(field_work.created,'%m/%d/%Y %H:%i:%S')      AS field_work_created,
           field_work.created_by                                    AS field_work_created_by,
           DATE_FORMAT(field_work.updated,'%m/%d/%Y %H:%i:%S')      AS field_work_updated,
           field_work.updated_by                                    AS field_work_updated_by,
           field_work.status                                        AS field_work_status
      FROM field_work AS field_work;
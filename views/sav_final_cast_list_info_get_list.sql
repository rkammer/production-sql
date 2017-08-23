CREATE OR REPLACE VIEW sav_final_cast_list_info_get_list(
    sav_final_cast_list_info_id,
    sav_final_cast_list_info_production_title,
    sav_final_cast_list_info_date_filled,
    sav_final_cast_list_info_production_id,
    sav_final_cast_list_info_shooting_location,
    sav_final_cast_list_info_production_company_id,
    sav_final_cast_list_info_production_company_name,
    sav_final_cast_list_info_production_company_address,
    sav_final_cast_list_info_production_company_city,
    sav_final_cast_list_info_production_company_state_code,
    sav_final_cast_list_info_production_company_state_name,
    sav_final_cast_list_info_production_company_zipcode,
    sav_final_cast_list_info_production_company_phone,
    sav_final_cast_list_info_production_company_faxnumber,
    sav_final_cast_list_info_production_company_website,
    sav_final_cast_list_info_production_company_email,
    sav_final_cast_list_info_start_date,
    sav_final_cast_list_info_end_date,
    sav_final_cast_list_info_federal_id,
    sav_final_cast_list_info_state_id,
    sav_final_cast_list_info_picture_id,
    sav_final_cast_list_info_distribuitor_id,
    sav_final_cast_list_info_sav_production_type_id,
    sav_final_cast_list_info_sav_production_type_code,
    sav_final_cast_list_info_sav_production_type_title,
    sav_final_cast_list_info_sav_production_type_full_title,
    sav_final_cast_list_info_created,
    sav_final_cast_list_info_created_by,
    sav_final_cast_list_info_updated,
    sav_final_cast_list_info_updated_by,
    sav_final_cast_list_info_status
) AS
    SELECT sav_final_cast_list_info.id                                                      AS sav_final_cast_list_info_id,
           DATE_FORMAT(sav_final_cast_list_info.date_filled,'%m/%d/%Y')                     AS sav_final_cast_list_info_date_filled,
           sav_final_cast_list_info.production_id                                           AS sav_final_cast_list_info_production_id,
           production.title                                                                 AS sav_final_cast_list_info_production_title,
           sav_final_cast_list_info.shooting_location                                       AS sav_final_cast_list_info_shooting_location,
           sav_final_cast_list_info.production_company_id                                   AS sav_final_cast_list_info_production_company_id,
           production_company.name                                                          AS sav_final_cast_list_info_production_company_name,
           production_company.address                                                       AS sav_final_cast_list_info_production_company_address,
           production_company.city                                                          AS sav_final_cast_list_info_production_company_city,
           production_company.state_code                                                    AS sav_final_cast_list_info_production_company_state_code,
           production_company_state.name                                                    AS sav_final_cast_list_info_production_company_state_name,
           production_company.zipcode                                                       AS sav_final_cast_list_info_production_company_zipcode,
           production_company.phone                                                         AS sav_final_cast_list_info_production_company_phone,
           production_company.faxnumber                                                     AS sav_final_cast_list_info_production_company_faxnumber,
           production_company.website                                                       AS sav_final_cast_list_info_production_company_website,
           production_company.email                                                         AS sav_final_cast_list_info_production_company_email,
           DATE_FORMAT(sav_final_cast_list_info.start_date,'%m/%d/%Y')                      AS sav_final_cast_list_info_start_date,
           DATE_FORMAT(sav_final_cast_list_info.end_date,  '%m/%d/%Y')                      AS sav_final_cast_list_info_end_date,
           sav_final_cast_list_info.federal_id                                              AS sav_final_cast_list_info_federal_id,
           sav_final_cast_list_info.state_id                                                AS sav_final_cast_list_info_state_id,
           sav_final_cast_list_info.picture_id                                              AS sav_final_cast_list_info_picture_id,
           sav_final_cast_list_info.distribuitor_id                                         AS sav_final_cast_list_info_distribuitor_id,
           sav_final_cast_list_info.sav_production_type_id                                  AS sav_final_cast_list_info_sav_production_type_id,
           sav_production_type.code                                                         AS sav_final_cast_list_info_sav_production_type_code,
           sav_production_type.title                                                        AS sav_final_cast_list_info_sav_production_type_title,
           CASE WHEN TRIM(sav_production_type.code) IS NULL
                  OR TRIM(sav_production_type.code) = '' THEN
                  sav_production_type.title
           ELSE
                CONCAT(TRIM(sav_production_type.code), ' - ',TRIM(sav_production_type.title))
           END                                                                              AS sav_final_cast_list_info_sav_production_type_full_title,
           DATE_FORMAT(sav_final_cast_list_info.created,'%m/%d/%Y %H:%i:%S')                AS sav_final_cast_list_info_created,
           sav_final_cast_list_info.created_by                                              AS sav_final_cast_list_info_created_by,
           DATE_FORMAT(sav_final_cast_list_info.updated,'%m/%d/%Y %H:%i:%S')                AS sav_final_cast_list_info_updated,
           sav_final_cast_list_info.updated_by                                              AS sav_final_cast_list_info_updated_by,
           sav_final_cast_list_info.status                                                  AS sav_final_cast_list_info_status
      FROM sav_final_cast_list_info AS sav_final_cast_list_info INNER JOIN production          AS production               ON production.id                 = sav_final_cast_list_info.production_id
                                                                INNER JOIN company             AS production_company       ON production_company.id         = sav_final_cast_list_info.production_company_id
                                                                INNER JOIN state               AS production_company_state ON production_company_state.code = production_company.state_code
                                                                INNER JOIN sav_production_type AS sav_production_type      ON sav_production_type.id        = sav_final_cast_list_info.sav_production_type_id;
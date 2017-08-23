CREATE OR REPLACE VIEW wga_work_list_item_get_list(
    wga_work_list_item_id,
    wga_work_list_item_wga_work_list_id,
    wga_work_list_item_contact_id,
    wga_work_list_item_contact_first_name,
    wga_work_list_item_contact_middle_name,
    wga_work_list_item_contact_last_name,
    wga_work_list_item_contact_suffix,
    wga_work_list_item_contact_address,
    wga_work_list_item_contact_city,
    wga_work_list_item_contact_state_code,
    wga_work_list_item_contact_phone,
    wga_work_list_item_contact_email,
    wga_work_list_item_contact_ssn,
    wga_work_list_item_episode_id,
    wga_work_list_item_episode_title,
    wga_work_list_item_episode_episode_number,
    wga_work_list_item_episode_episode_abbreviation,
    wga_work_list_item_deal_type_id,
    wga_work_list_item_deal_type_code,
    wga_work_list_item_deal_type_title,
    wga_work_list_item_deal_type_full_title,
    wga_work_list_item_field_of_work_id,
    wga_work_list_item_field_of_work_code,
    wga_work_list_item_field_of_work_title,
    wga_work_list_item_field_of_work_full_title,
    wga_work_list_item_date_start,
    wga_work_list_item_date_end,
    wga_work_list_item_additional_data,
    wga_work_list_item_created,
    wga_work_list_item_created_by,
    wga_work_list_item_updated,
    wga_work_list_item_updated_by,
    wga_work_list_item_status
) AS
    SELECT wga_work_list_item.id                                                                    AS wga_work_list_item_id,
           wga_work_list_item.wga_work_list_id                                                      AS wga_work_list_item_wga_work_list_id,
           wga_work_list_item.contact_id                                                            AS wga_work_list_item_contact_id,
           contact.first_name                                                                       AS wga_work_list_item_contact_first_name,
           contact.middle_name                                                                      AS wga_work_list_item_contact_middle_name,
           contact.last_name                                                                        AS wga_work_list_item_contact_last_name,
           contact.suffix                                                                           AS wga_work_list_item_contact_suffix,
           contact.address                                                                          AS wga_work_list_item_contact_address,
           contact.city                                                                             AS wga_work_list_item_contact_city,
           contact.state_code                                                                       AS wga_work_list_item_contact_state_code,
           contact.phone                                                                            AS wga_work_list_item_contact_phone,
           contact.email                                                                            AS wga_work_list_item_contact_email,
           contact.ssn                                                                              AS wga_work_list_item_contact_ssn,
           wga_work_list_item.episode_id                                                            AS wga_work_list_item_episode_id,
           episode.title                                                                            AS wga_work_list_item_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS wga_work_list_item_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS wga_work_list_item_episode_episode_abbreviation,
           wga_work_list_item.deal_type_id                                                          AS wga_work_list_item_deal_type_id,
           wga_deal_type.code                                                                       AS wga_work_list_item_deal_type_code,
           wga_deal_type.title                                                                      AS wga_work_list_item_deal_type_title,
           CASE WHEN TRIM(wga_deal_type.code) IS NULL
                  OR TRIM(wga_deal_type.code) = '' THEN
                wga_deal_type.title
           ELSE
                CONCAT(wga_deal_type.code, ' - ', wga_deal_type.title)
           END                                                                                      AS wga_work_list_deal_type_full_title,
           wga_work_list_item.field_of_work_id                                                      AS wga_work_list_item_field_of_work_id,
           wga_field_of_work.code                                                                   AS wga_work_list_item_field_of_work_code,
           wga_field_of_work.title                                                                  AS wga_work_list_item_field_of_work_title,
           CASE WHEN TRIM(wga_field_of_work.code) IS NULL
                  OR TRIM(wga_field_of_work.code) = '' THEN
                wga_field_of_work.title
           ELSE
                CONCAT(wga_field_of_work.code, ' - ', wga_field_of_work.title)
           END                                                                                      AS wga_work_list_item_field_of_work_full_title,
           DATE_FORMAT(wga_work_list_item.date_start,  '%m/%d/%Y')                                  AS wga_work_list_item_date_start,
           DATE_FORMAT(wga_work_list_item.date_end,    '%m/%d/%Y')                                  AS wga_work_list_item_date_end,
           wga_work_list_item.additional_data                                                       AS wga_work_list_item_additional_data,
           DATE_FORMAT(wga_work_list_item.created,     '%m/%d/%Y %H:%i:%S')                         AS wga_work_list_item_created,
           wga_work_list_item.created_by                                                            AS wga_work_list_item_created_by,
           DATE_FORMAT(wga_work_list_item.updated,     '%m/%d/%Y %H:%i:%S')                         AS wga_work_list_item_updated,
           wga_work_list_item.updated_by                                                            AS wga_work_list_item_updated_by,
           wga_work_list_item.status                                                                AS wga_work_list_item_status
      FROM wga_work_list_item AS wga_work_list_item INNER JOIN contact           AS contact           ON contact.id           = wga_work_list_item.contact_id
                                                    INNER JOIN episode           AS episode           ON episode.id           = wga_work_list_item.episode_id
                                                    INNER JOIN season            AS season            ON episode.season_id    = season.id
                                                    INNER JOIN wga_deal_type     AS wga_deal_type     ON wga_deal_type.id     = wga_work_list_item.deal_type_id
                                                    INNER JOIN wga_field_of_work AS wga_field_of_work ON wga_field_of_work.id = wga_work_list_item.field_of_work_id;
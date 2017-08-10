CREATE OR REPLACE VIEW dga_weekly_work_get_list(
    dga_weekly_work_id,
    dga_weekly_work_production_id,
    dga_weekly_work_production_title,
    dga_weekly_work_episode_id,
    dga_weekly_work_episode_title,
    dga_weekly_work_company_id,
    dga_weekly_work_company_name,
    dga_weekly_work_company_address,
    dga_weekly_work_company_city,
    dga_weekly_work_company_state_code,
    dga_weekly_work_company_state_name,
    dga_weekly_work_company_phone,
    dga_weekly_work_company_website,
    dga_weekly_work_company_logo_path,
    dga_weekly_work_contact_id,
    -- dga_weekly_work_contact_name,
    dga_weekly_work_contact_first_name,
    dga_weekly_work_contact_middle_name,
    dga_weekly_work_contact_last_name,
    dga_weekly_work_contact_suffix,
    dga_weekly_work_contact_full_name,
    dga_weekly_work_week_start_date,
    dga_weekly_work_week_end_date,
    dga_weekly_work_created,
    dga_weekly_work_created_by,
    dga_weekly_work_updated,
    dga_weekly_work_updated_by,
    dga_weekly_work_status
) AS
    SELECT dga_weekly_work.id                                                     AS dga_weekly_work_id,
           dga_weekly_work.production_id                                          AS dga_weekly_work_production_id,
           production.title                                                       AS dga_weekly_work_production_title,
           dga_weekly_work.episode_id                                             AS dga_weekly_work_episode_id,
           episode.title                                                          AS dga_weekly_work_episode_title,
           dga_weekly_work.company_id                                             AS dga_weekly_work_company_id,
           company.name                                                           AS dga_weekly_work_company_name,
           company.address                                                        AS dga_weekly_work_company_address,
           company.city                                                           AS dga_weekly_work_company_city,
           company.state_code                                                     AS dga_weekly_work_company_state_code,
           state.name                                                             AS dga_weekly_work_company_state_name,
           company.phone                                                          AS dga_weekly_work_company_phone,
           company.website                                                        AS dga_weekly_work_company_website,
           company.logo_path                                                      AS dga_weekly_work_company_logo_path,
           dga_weekly_work.contact_id                                             AS dga_weekly_work_contact_id,
        --    contact.name                                                           AS dga_weekly_work_contact_name,
           contact.first_name                                                     AS dga_weekly_work_contact_first_name,
           contact.middle_name                                                    AS dga_weekly_work_contact_middle_name,
           contact.last_name                                                      AS dga_weekly_work_contact_last_name,
           contact.suffix                                                         AS dga_weekly_work_contact_suffix,
           contact_get_full_name(contact.id)                                      AS dga_weekly_work_contact_full_name,
           DATE_FORMAT(dga_weekly_work.week_start_date, '%m/%d/%Y')               AS dga_weekly_work_week_start_date,
           DATE_FORMAT(dga_weekly_work.week_end_date,   '%m/%d/%Y')               AS dga_weekly_work_week_end_date,
           DATE_FORMAT(dga_weekly_work.created,         '%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_created,
           dga_weekly_work.created_by                                             AS dga_weekly_work_created_by,
           DATE_FORMAT(dga_weekly_work.updated,         '%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_updated,
           dga_weekly_work.updated_by                                             AS dga_weekly_work_updated_by,
           dga_weekly_work.status                                                 AS dga_weekly_work_status
      FROM dga_weekly_work AS dga_weekly_work INNER JOIN production AS production ON production.id       = dga_weekly_work.production_id
                                              INNER JOIN episode    AS episode    ON episode.id          = dga_weekly_work.episode_id
                                              INNER JOIN company    AS company    ON company.id          = dga_weekly_work.company_id
                                              INNER JOIN contact    AS contact    ON contact.id          = dga_weekly_work.contact_id
                                              INNER JOIN state      AS state      ON company.state_code  = state.code;
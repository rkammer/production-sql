CREATE OR REPLACE VIEW production_guild_get_list(
    production_guild_production_id,
    production_guild_production_title,
    production_guild_guild_id,
    prodcution_guild_guild_acronym,
    production_guild_guild_name,
    -- production_guild_document_name,
    production_guild_signatory_entity,
    production_guild_payroll_company_id,
    production_guild_payroll_company_name,
    production_guild_contract_number,
    production_guild_dga_sideletter_six,
    production_guild_dga_all_rights_media,
    production_guild_created,
    production_guild_created_by,
    production_guild_updated,
    production_guild_updated_by,
    production_guild_status
) AS
    SELECT production_guild.production_id                                  AS production_guild_production_id,
           production.title                                                AS production_guild_production_title,
           production_guild.guild_id                                       AS production_guild_guild_id,
           guild.acronym                                                   AS prodcution_guild_guild_acronym,
           guild.name                                                      AS production_guild_guild_name,
        --    production_guild.document_name                                  AS production_guild_document_name,
           production_guild.signatory_entity                               AS production_guild_signatory_entity,
           production_guild.payroll_company_id                             AS production_guild_payroll_company_id,
           payroll_company.name                                            AS production_guild_payroll_company_name,
           production_guild.contract_number                                AS production_guild_contract_number,
           production_guild.dga_sideletter_six                             AS production_guild_dga_sideletter_six,
           production_guild.dga_all_rights_media                           AS production_guild_dga_all_rights_media,
           DATE_FORMAT(production_guild.created,'%m/%d/%Y %H:%i:%S')       AS production_guild_created,
           production_guild.created_by                                     AS production_guild_created_by,
           DATE_FORMAT(production_guild.updated,'%m/%d/%Y %H:%i:%S')       AS production_guild_updated,
           production_guild.updated_by                                     AS production_guild_updated_by,
           production_guild.status                                         AS production_guild_status
      FROM production_guild AS production_guild INNER JOIN production AS production      ON production.id      = production_guild.production_id
                                                INNER JOIN guild      AS guild           ON guild.id           = production_guild.guild_id
                                                INNER JOIN company    AS payroll_company ON payroll_company.id = production_guild.payroll_company_id;
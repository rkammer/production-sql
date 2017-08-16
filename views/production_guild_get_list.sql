CREATE OR REPLACE VIEW production_guild_get_list(
    production_guild_production_id,
    production_guild_production_title,
    production_guild_guild_id,
    prodcution_guild_guild_acronym,
    production_guild_guild_name,
    production_guild_document_name,
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
           production_guild.document_name                                  AS production_guild_document_name,
           DATE_FORMAT(production_guild.created,'%m/%d/%Y %H:%i:%S')       AS production_guild_created,
           production_guild.created_by                                     AS production_guild_created_by,
           DATE_FORMAT(production_guild.updated,'%m/%d/%Y %H:%i:%S')       AS production_guild_updated,
           production_guild.updated_by                                     AS production_guild_updated_by,
           production_guild.status                                         AS production_guild_status
      FROM production_guild AS production_guild INNER JOIN production AS production ON production.id = production_guild.production_id
                                                INNER JOIN guild      AS guild      ON guild.id      = production_guild.guild_id;
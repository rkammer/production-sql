CREATE OR REPLACE VIEW guild_get_list(
    guild_id,
    guild_acronym,
    guild_name,
    guild_logo_path,
    guild_created,
    guild_created_by,
    guild_updated,
    guild_updated_by,
    guild_status
) AS
    SELECT guild.id                                            AS guild_id,
           guild.acronym                                       AS guild_acronym,
           guild.name                                          AS guild_name,
           guild.logo_path                                     AS guild_logo_path,
           DATE_FORMAT(guild.created,'%m/%d/%Y %H:%i:%S')      AS guild_created,
           guild.created_by                                    AS guild_created_by,
           DATE_FORMAT(guild.updated,'%m/%d/%Y %H:%i:%S')      AS guild_updated,
           guild.updated_by                                    AS guild_updated_by,
           guild.status                                        AS guild_status
      FROM guild AS guild;
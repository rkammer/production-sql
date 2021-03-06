CREATE OR REPLACE VIEW subaccount_get_list(
    subaccount_id,
    subaccount_code,
    subaccount_title,
    subaccount_media_company_id,
    subaccount_business_group_id,
    subaccount_network_id,
    subaccount_production_id,
    subaccount_season_id,
    subaccount_episode_id,
    subaccount_ledger_id,
    subaccount_account_id,
    subaccount_created,
    subaccount_created_by,
    subaccount_updated,
    subaccount_updated_by,
    subaccount_status
) AS
    SELECT subaccount.id                                        AS subaccount_id,
           subaccount.code                                      AS subaccount_code,
           subaccount.title                                     AS subaccount_title,
           subaccount.media_company_id                          AS subaccount_media_company_id,
           subaccount.business_group_id                         AS subaccount_business_group_id,
           subaccount.network_id                                AS subaccount_network_id,
           subaccount.production_id                             AS subaccount_production_id,
           subaccount.season_id                                 AS subaccount_season_id,
           subaccount.episode_id                                AS subaccount_episode_id,
           subaccount.ledger_id                                 AS subaccount_ledger_id,
           subaccount.account_id                                AS subaccount_account_id,
           DATE_FORMAT(subaccount.created,'%m/%d/%Y %H:%i:%S')  AS subaccount_created,
           subaccount.created_by                                AS subaccount_created_by,
           DATE_FORMAT(subaccount.updated,'%m/%d/%Y %H:%i:%S')  AS subaccount_updated,
           subaccount.updated_by                                AS subaccount_updated_by,
           subaccount.status                                    AS subaccount_status
      FROM subaccount AS subaccount;
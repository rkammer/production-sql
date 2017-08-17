DELIMITER //
CREATE PROCEDURE subaccount_set_list(
    IN subaccount_id                   INT,
    IN subaccount_code                 CHAR(10),
    IN subaccount_title                VARCHAR(50),
    IN subaccount_media_company_id     INT,
    IN subaccount_business_group_id    INT,
    IN subaccount_network_id           INT,
    IN subaccount_production_id        INT,
    IN subaccount_season_id            INT,
    IN subaccount_episode_id           INT,
    IN subaccount_ledger_id            INT,
    IN subaccount_account_id           INT,
    IN subaccount_created_by           VARCHAR(30),
    IN subaccount_updated_by           VARCHAR(30),
    IN subaccount_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM subaccount
     WHERE id = subaccount_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO subaccount
        (
            code,
            title,
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            ledger_id,
            account_id,
            created,
            created_by,
            updated,
            updated_by,
            status
        )
        VALUES
        (
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
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE subaccount
           SET code               = subaccount_code,
               title              = subaccount_title,
               media_company_id   = subaccount_media_company_id,
               business_group_id  = subaccount_business_group_id,
               network_id         = subaccount_network_id,
               production_id      = subaccount_production_id,
               season_id          = subaccount_season_id,
               episode_id         = subaccount_episode_id,
               ledger_id          = subaccount_ledger_id,
               account_id         = subaccount_account_id,
               created            = subaccount_created,
               created_by         = subaccount_created_by,
               updated            = subaccount_updated,
               updated_by         = subaccount_updated_by,
               status             = 'UPDATED'
         WHERE id                 = subaccount_id;

        SET return_value          = subaccount_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE account_set_list(
    IN account_id                   INT,
    IN account_code                 CHAR(10),
    IN account_title                VARCHAR(50),
    IN account_media_company_id     INT,
    IN account_business_group_id    INT,
    IN account_network_id           INT,
    IN account_production_id        INT,
    IN account_season_id            INT,
    IN account_episode_id           INT,
    IN account_ledger_id            INT,
    IN account_created_by           VARCHAR(30),
    IN account_updated_by           VARCHAR(30),
    IN account_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM account
     WHERE id = account_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO account
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
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            account_id,
            account_code,
            account_title,
            account_media_company_id,
            account_business_group_id,
            account_network_id,
            account_production_id,
            account_season_id,
            account_episode_id,
            account_ledger_id,
            account_created_by,
            account_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE account
           SET code              = account_code,
               title             = account_title,
               media_company_id  = account_media_company_id,
               business_group_id = account_business_group_id,
               network_id        = account_network_id,
               production_id     = account_production_id,
               season_id         = account_season_id,
               episode_id        = account_episode_id,
               ledger_id         = account_ledger_id,
               created           = account_created,
               created_by        = account_created_by,
               updated           = account_updated,
               updated_by        = account_updated_by,
               status            = 'UPDATED'
         WHERE id                =    account_id;

        SET return_value = account_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
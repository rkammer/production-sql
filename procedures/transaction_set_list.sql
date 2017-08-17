DELIMITER //
CREATE PROCEDURE transaction_set_list(
    IN transaction_id                   INT,
    IN transaction_media_company_id     INT,
    IN transaction_business_group_id    INT,
    IN transaction_network_id           INT,
    IN transaction_production_id        INT,
    IN transaction_season_id            INT,
    IN transaction_episode_id           INT,
    IN transaction_ledger_id            INT,
    IN transaction_account_id           INT,
    IN transaction_subaccount_id        INT,
    IN transaction_description          VARCHAR(50),
    IN transaction_budget               DECIMAL,
    IN transaction_total_budget         DECIMAL,
    IN transaction_guarantee            INT,
    IN transaction_period_id            INT,
    IN transaction_actual               DECIMAL,
    IN transaction_total_actual         DECIMAL,
    IN transaction_comment              VARCHAR(255),
    IN transaction_created_by           VARCHAR(30),
    IN transaction_updated_by           VARCHAR(30),
    IN transaction_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM transaction
     WHERE id = transaction_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO transaction
        (
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            ledger_id,
            account_id,
            subaccount_id,
            description,
            budget,
            total_budget,
            guarantee,
            period_id,
            actual,
            total_actual,
            comment,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            transaction_media_company_id,
            transaction_business_group_id,
            transaction_network_id,
            transaction_production_id,
            transaction_season_id,
            transaction_episode_id,
            transaction_ledger_id,
            transaction_account_id,
            transaction_subaccount_id,
            transaction_description,
            transaction_budget,
            transaction_total_budget,
            transaction_guarantee,
            transaction_period_id,
            transaction_actual,
            transaction_total_actual,
            transaction_comment,
            transaction_created,
            transaction_created_by,
            transaction_updated,
            transaction_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE transaction
           SET media_company_id  =    transaction_media_company_id,
               business_group_id =    transaction_business_group_id,
               network_id        =    transaction_network_id,
               production_id     =    transaction_production_id,
               season_id         =    transaction_season_id,
               episode_id        =    transaction_episode_id,
               ledger_id         =    transaction_ledger_id,
               account_id        =    transaction_account_id,
               subaccount_id     =    transaction_subaccount_id,
               description       =    transaction_description,
               budget            =    transaction_budget,
               total_budget      =    transaction_total_budget,
               guarantee         =    transaction_guarantee,
               period_id         =    transaction_period_id,
               actual            =    transaction_actual,
               total_actual      =    transaction_total_actual,
               comment           =    transaction_comment,
               created           =    transaction_created,
               created_by        =    transaction_created_by,
               updated           =    transaction_updated,
               updated_by        =    transaction_updated_by,
               status            =    'UPDATED'
         WHERE id                =    transaction_id;

        SET return_value = transaction_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
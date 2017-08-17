DELIMITER //
CREATE PROCEDURE ledger_set_list(
    IN ledger_id                  INT,
    IN ledger_code                CHAR(10),
    IN ledger_title               VARCHAR(50),
    IN ledger_media_company_id    INT,
    IN ledger_business_group_id   INT,
    IN ledger_network_id          INT,
    IN ledger_production_id       INT,
    IN ledger_season_id           INT,
    IN ledger_episode_id          INT,
    IN ledger_created_by          VARCHAR(30),
    IN ledger_updated_by          VARCHAR(30),
    IN ledger_status              VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM ledger
     WHERE id = ledger_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO ledger
        (
            code,
            title,
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            ledger_code,
            ledger_title,
            ledger_media_company_id,
            ledger_business_group_id,
            ledger_network_id,
            ledger_production_id,
            ledger_season_id,
            ledger_episode_id,
            ledger_created_by,
            ledger_updated_by,
            'UPDATE'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE ledger
           SET code              = ledger_code,
               title             = ledger_title,
               media_company_id  = ledger_media_company_id,
               business_group_id = ledger_business_group_id,
               network_id        = ledger_network_id,
               production_id     = ledger_production_id,
               season_id         = ledger_season_id,
               episode_id        = ledger_episode_id,
               created_by        = ledger_created_by,
               updated_by        = ledger_updated_by,
               status            = 'UPDATED'
         WHERE id                = ledger_id;

        SET return_value = ledger_id;
     END IF;

     COMMIT;
END //
DELIMITER ;
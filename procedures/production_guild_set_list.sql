DELIMITER //
CREATE PROCEDURE production_guild_set_list(
    IN production_guild_production_id        INT,
    IN production_guild_guild_id             INT,
    -- IN production_guild_document_name        VARCHAR(100),
    IN production_guild_signatory_entity     VARCHAR(50),
    IN production_guild_payroll_company_id   INTEGER,
    IN production_guild_contract_number      VARCHAR(20),
    IN production_guild_dga_sideletter_six   CHAR(1),
    IN production_guild_dga_all_rights_media CHAR(1),
    IN production_guild_created_by           VARCHAR(30),
    IN production_guild_updated_by           VARCHAR(30),
    IN production_guild_status               VARCHAR(30),
    OUT return_value                         INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_guild
     WHERE production_id = production_guild_production_id
       AND guild_id      = production_guild_guild_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_guild
        (
            production_id,
            guild_id,
            -- document_name,
            signatory_entity,
            payroll_company_id,
            contract_number,
            dga_sideletter_six,
            dga_all_rights_media,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_guild_production_id,
            production_guild_guild_id,
            -- production_guild_document_name,
            production_guild_signatory_entity,
            production_guild_payroll_company_id,
            production_guild_contract_number,
            production_guild_dga_sideletter_six,
            production_guild_dga_all_rights_media,
            production_guild_created_by,
            production_guild_updated_by,
            'CREATED'
        );

        SET return_value = 0;
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_guild
        --    SET document_name        = production_guild_document_name,
           SET signatory_entity     = production_guild_signatory_entity,
               payroll_company_id   = production_guild_payroll_company_id,
               contract_number      = production_guild_contract_number,
               dga_sideletter_six   = production_guild_dga_sideletter_six,
               dga_all_rights_media = production_guild_dga_all_rights_media,
               updated_by           = production_guild_updated_by,
               status               = 'UPDATED'
         WHERE production_id = production_guild_production_id
           AND guild_id      = production_guild_guild_id;

        SET return_value = 0;
     END IF;

     COMMIT;
END //
DELIMITER ;
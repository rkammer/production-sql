CREATE TABLE production_guild(
    production_id        INTEGER     NOT NULL,
    guild_id             INTEGER     NOT NULL,
    -- document_name        VARCHAR(100)  NOT NULL,
    signatory_entity     VARCHAR(50) NOT NULL,
    payroll_company_id   INTEGER     NOT NULL,
    contract_number      VARCHAR(20) NOT NULL,
    dga_sideletter_six   CHAR(1)     NOT NULL DEFAULT 'F',
    dga_all_rights_media CHAR(1)     NOT NULL DEFAULT 'F',
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_guild                 PRIMARY KEY (production_id, guild_id),
    CONSTRAINT fk_production_guild_production      FOREIGN KEY (production_id)      REFERENCES production (id),
    CONSTRAINT fk_production_guild_guild           FOREIGN KEY (guild_id)           REFERENCES guild      (id),
    CONSTRAINT fk_production_guild_payroll_company FOREIGN KEY (payroll_company_id) REFERENCES company    (id)
) ENGINE = InnoDB;
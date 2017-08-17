CREATE TABLE production_guild(
    production_id        INTEGER NOT NULL,
    guild_id             INTEGER NOT NULL,
    document_name        VARCHAR(100)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_guild PRIMARY KEY (production_id, guild_id),
    CONSTRAINT fk_production_guild_production FOREIGN KEY (production_id) REFERENCES production (id),
    CONSTRAINT fk_production_guild_guild      FOREIGN KEY (guild_id)      REFERENCES guild      (id)
) ENGINE = InnoDB;
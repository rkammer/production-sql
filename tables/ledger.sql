CREATE TABLE ledger(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10)     NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    media_company_id     INTEGER      NOT NULL,
    business_group_id    INTEGER      NOT NULL,
    network_id           INTEGER      NOT NULL,
    production_id        INTEGER      NOT NULL,
    season_id            INTEGER,
    episode_id           INTEGER,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_ledger_id             PRIMARY KEY (id),
    CONSTRAINT fk_ledger_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_ledger_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_ledger_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_ledger_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_ledger_season         FOREIGN KEY (season_id)         REFERENCES season         (id),
    CONSTRAINT fk_ledger_episode        FOREIGN KEY (episode_id)        REFERENCES episode        (id)
) ENGINE = InnoDB;
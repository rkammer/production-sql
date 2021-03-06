CREATE TABLE season(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    season_number                    INTEGER        NOT NULL,
    media_company_id                 INTEGER        NOT NULL,
    business_group_id                INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
    production_id                    INTEGER        NOT NULL,
    budget                           NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    writing_start_date               DATE,
    writing_end_date                 DATE,
    pre_production_start_date        DATE,
    pre_production_end_date          DATE,
    photography_start_date           DATE,
    photography_end_date             DATE,
    post_production_start_date       DATE,
    post_production_end_date         DATE,
    network_production_start_date    DATE,
    network_production_end_date      DATE,
    logo_path                        VARCHAR(120),
    created                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_season_id             PRIMARY KEY (id),
    CONSTRAINT fk_season_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_season_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_season_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_network_id            FOREIGN KEY (network_id)        REFERENCES network        (id)
) ENGINE = InnoDB;
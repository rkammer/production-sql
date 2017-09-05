CREATE TABLE production(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    media_company_id                 INTEGER,
    business_group_id                INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
    production_show_type_id          INT NOT NULL,
    production_stage_id              INT NOT NULL,
    season_number                    INT,
    episodes_number                  INT,
    tax_incentive                    CHAR(1)        NOT NULL DEFAULT 'F',
    series_gross_budget              NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    series_net_budget                NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    episode_gross_budget             NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    episode_net_budget               NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    writing_start_date               DATE,
    writing_end_date                 DATE,
    pre_production_start_date        DATE,
    pre_production_end_date          DATE,
    photography_start_date           DATE,
    photography_end_date             DATE,
    post_production_start_date       DATE,
    post_production_end_date         DATE,
    premiere_date                    DATE,
    production_length_id             INTEGER        NOT NULL,
    production_type_id               INTEGER        NOT NULL,
    production_company_id            INTEGER        NOT NULL,
    logo_path                        VARCHAR(120),
    created                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_production_id                  PRIMARY KEY (id),
    CONSTRAINT fk_production_network             FOREIGN KEY (network_id)                 REFERENCES network              (id),
    CONSTRAINT fk_production_production_length   FOREIGN KEY (production_length_id)       REFERENCES production_length    (id),
    CONSTRAINT fk_production_production_type     FOREIGN KEY (production_type_id)         REFERENCES production_type      (id),
    CONSTRAINT fk_production_production_company  FOREIGN KEY (production_company_id)      REFERENCES company              (id),
    CONSTRAINT fk_production_media_company       FOREIGN KEY (media_company_id)           REFERENCES company              (id),
    CONSTRAINT fk_production_business_group      FOREIGN KEY (business_group_id)          REFERENCES business_group       (id),
    CONSTRAINT fk_production_production_stage    FOREIGN KEY (production_stage_id)        REFERENCES production_stage     (id),
    CONSTRAINT fk_production_show_type           FOREIGN KEY (production_show_type_id)    REFERENCES production_show_type (id)
) ENGINE = InnoDB;
CREATE TABLE dga_weekly_work(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    production_id        INT         NOT NULL,
    episode_id           INT         NOT NULL,
    company_id           INT         NOT NULL,
    contact_id           INT         NOT NULL,
    week_start_date      DATE        NOT NULL,
    week_end_date        DATE        NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_weekly_work_id               PRIMARY KEY (id),
    CONSTRAINT fk_dga_weekly_work_production       FOREIGN KEY (production_id)          REFERENCES production (id),
    CONSTRAINT fk_dga_weekly_work_episode          FOREIGN KEY (episode_id)             REFERENCES episode    (id),
    CONSTRAINT fk_dga_weekly_work_company          FOREIGN KEY (company_id)             REFERENCES company    (id),
    CONSTRAINT fk_dga_weekly_work_contact          FOREIGN KEY (contact_id)             REFERENCES contact    (id),
    CONSTRAINT fk_dga_weekly_work_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;
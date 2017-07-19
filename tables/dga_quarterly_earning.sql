CREATE TABLE dga_quarterly_earning(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    quarter              VARCHAR(10) NOT NULL,
    year                 YEAR        NOT NULL,
    company_id           INTEGER     NOT NULL,
    contact_id           INTEGER     NOT NULL,
    prepared_by          VARCHAR(50),
    phone                VARCHAR(20),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_quarterly_earning_id       PRIMARY KEY (id),
    CONSTRAINT fk_dga_quarterly_company          FOREIGN KEY (company_id) REFERENCES company (id),
    CONSTRAINT fk_dga_quarterly_contact          FOREIGN KEY (contact_id) REFERENCES contact (id),
    CONSTRAINT fk_dga_quarterly_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;
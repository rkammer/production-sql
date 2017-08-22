CREATE TABLE wga_work_list(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    company_id           INTEGER      NOT NULL,
    week_ending          INT          NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_work_list_id               PRIMARY KEY (id),
    CONSTRAINT fk_wga_work_list_company          FOREIGN KEY (company_id)             REFERENCES company (id),
    CONSTRAINT fk_wga_work_list_contact          FOREIGN KEY (contact_id)             REFERENCES contact (id),
    CONSTRAINT fk_wga_work_list_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;
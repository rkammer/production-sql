CREATE TABLE business_group(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    company_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_business_group_id    PRIMARY KEY (id),
    CONSTRAINT fk_business_group_company FOREIGN KEY (company_id) REFERENCES company (id)
) ENGINE = InnoDB;
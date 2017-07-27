CREATE TABLE dga_pif_tv_company(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    dga_pif_tv_id        INTEGER      NOT NULL,
    company_name         VARCHAR(50)  NOT NULL,
    company_phone        VARCHAR(20)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_pif_tv_id           PRIMARY KEY (id),
    CONSTRAINT fk_dga_pif_tv_company_item FOREIGN KEY (dga_pif_tv_id) REFERENCES dga_pif_tv (id)
) ENGINE = InnoDB;
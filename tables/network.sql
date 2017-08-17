CREATE TABLE network(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50) NOT NULL,
    media_company_id     INTEGER     NOT NULL,
    business_group_id    INTEGER     NOT NULL,
    logo_path            VARCHAR(120),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_network_id             PRIMARY KEY (id),
    CONSTRAINT fk_network_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_network_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id)
) ENGINE = InnoDB;
CREATE TABLE wga_ntwc_writing_credit(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_ntwc_id          INTEGER      NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_writing_credit PRIMARY KEY (id),
    CONSTRAINT fk_wga_ntwc_writing_credit_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id),
    CONSTRAINT fk_wga_ntwc_writing_credit_contact  FOREIGN KEY (contact_id)  REFERENCES contact  (id)
) ENGINE = InnoDB;
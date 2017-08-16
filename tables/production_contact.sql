CREATE TABLE production_contact(
    production_id        INTEGER,
    contact_id           INTEGER,
    contact_role_id      INTEGER,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_contact_id    PRIMARY KEY (production_id, contact_id),
    CONSTRAINT fk_production_contact_production FOREIGN KEY (production_id)   REFERENCES production   (id),
    CONSTRAINT fk_production_contact_contact    FOREIGN KEY (contact_id)      REFERENCES contact      (id),
    CONSTRAINT fk_production_contact_role       FOREIGN KEY (contact_role_id) REFERENCES contact_role (id)
) ENGINE = InnoDB;
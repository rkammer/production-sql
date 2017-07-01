CREATE TABLE production(
    id                       INTEGER     NOT NULL AUTO_INCREMENT,
    name                     VARCHAR(50) NOT NULL,
    production_length_id     INTEGER NOT NULL,
    network_id               INTEGER NOT NULL,
    production_type_id       INTEGER NOT NULL,
    logo_path                VARCHAR(120),
    created                  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by               VARCHAR(30),
    updated                  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by               VARCHAR(30),
    status                   VARCHAR(30),
    CONSTRAINT pk_production_id                PRIMARY KEY (id),
    CONSTRAINT fk_production_network           FOREIGN KEY (network_id)           REFERENCES network           (id),
    CONSTRAINT fk_production_production_length FOREIGN KEY (production_length_id) REFERENCES production_length (id),
    CONSTRAINT fk_production_production_type   FOREIGN KEY (production_type_id)   REFERENCES production_type   (id)
);
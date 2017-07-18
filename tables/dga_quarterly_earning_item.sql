CREATE TABLE dga_quarterly_earning_item(
    id                          INTEGER        NOT NULL AUTO_INCREMENT,
    dga_quarterly_earning_id    INTEGER        NOT NULL,
    name                        VARCHAR(50)    NOT NULL,
    ssn                         VARCHAR(11),
    category                    VARCHAR(30),
    production_id               INTEGER,
    earnings                    NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    created                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                  VARCHAR(30),
    updated                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                  VARCHAR(30),
    status                      VARCHAR(30),
    CONSTRAINT pk_dga_quarterly_earning_item_id                    PRIMARY KEY (id),
    CONSTRAINT fk_dga_quarterly_earning_item_dga_quarterly_earning FOREIGN KEY (dga_quarterly_earning_id) REFERENCES dga_quarterly_earning (id),
    CONSTRAINT fk_dga_quarterly_earning_item_production            FOREIGN KEY (production_id)            REFERENCES production (id)
);
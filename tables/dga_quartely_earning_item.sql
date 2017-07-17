CREATE TABLE dga_quartely_earning_item(
    id                          INTEGER NOT NULL AUTO_INCREMENT,

    dga_quarterly_earning_id    INTEGER NOT NULL,
    created                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                  VARCHAR(30),
    updated                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                  VARCHAR(30),
    status                      VARCHAR(30),
    CONSTRAINT pk_dga_quartely_earning_item_id                   PRIMARY KEY (id),
    CONSTRAINT fk_dga_quartely_earning_item_dga_quartely_earning FOREIGN KEY (dga_quarterly_earning_id) REFERENCES dga_quarterly_earning (id)
);
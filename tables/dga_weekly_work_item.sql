CREATE TABLE dga_weekly_work_item(
    id                          INTEGER      NOT NULL AUTO_INCREMENT,
    dga_weekly_work_id          INTEGER      NOT NULL,
    name                        VARCHAR(50)  NOT NULL,
    ssn                         VARCHAR(11),
    category                    VARCHAR(30),
    created                     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by                  VARCHAR(30),
    updated                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                  VARCHAR(30),
    status                      VARCHAR(30),
    CONSTRAINT pk_dga_weekly_work_item_id              PRIMARY KEY (id),
    CONSTRAINT fk_dga_weekly_work_item_dga_weekly_work FOREIGN KEY (dga_weekly_work_id) REFERENCES dga_weekly_work (id)
) ENGINE = InnoDB;
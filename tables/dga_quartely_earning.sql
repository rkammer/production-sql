CREATE TABLE dga_quartely_earning(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_quartely_earning_id    PRIMARY KEY (id)
);
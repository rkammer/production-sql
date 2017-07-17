CREATE TABLE dga_quarter(
    id                   INTEGER  NOT NULL AUTO_INCREMENT,
    name                 CHAR(3)  NOT NULL,
    description          VARCHAR(30),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_quarter_id    PRIMARY KEY (id)
);
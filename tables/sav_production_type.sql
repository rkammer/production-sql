CREATE TABLE sav_production_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 VARCHAR(10),
    title                VARCHAR(50),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_production_type_id    PRIMARY KEY (id)
) ENGINE = InnoDB;
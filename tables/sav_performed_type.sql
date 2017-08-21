CREATE TABLE sav_performer_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(3)      NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_performer_type_id PRIMARY KEY (id)
) ENGINE = InnoDB;
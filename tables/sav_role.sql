CREATE TABLE sav_role(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10),
    title                VARCHAR(50),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_role_id    PRIMARY KEY (id)
) ENGINE = InnoDB;
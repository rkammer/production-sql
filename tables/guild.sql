CREATE TABLE guild(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    acronym              VARCHAR(50)  NOT NULL,
    name                 VARCHAR(150),
    logo_path            VARCHAR(120),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_guild_id PRIMARY KEY (id)
) ENGINE = InnoDB;
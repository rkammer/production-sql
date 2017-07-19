CREATE TABLE contact(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(100) NOT NULL,
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    phone                VARCHAR(20),
    email                VARCHAR(100),
    website              VARCHAR(100),
    picture_path         VARCHAR(120),
    created              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_contact_id    PRIMARY KEY (id),
    CONSTRAINT fk_contact_state FOREIGN KEY (state_code) REFERENCES state (CODE)
) ENGINE = InnoDB;
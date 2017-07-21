CREATE TABLE wga_field_of_work(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(1),
    title                VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_field_of_work_id    PRIMARY KEY (id)
) ENGINE = InnoDB;
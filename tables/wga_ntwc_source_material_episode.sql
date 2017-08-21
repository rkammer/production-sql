CREATE TABLE wga_ntwc_source_material_episode(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_ntwc_id          INT NOT NULL,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_source_material_episode_id       PRIMARY KEY (id),
    CONSTRAINT fk_wga_ntwc_source_material_episode_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id)
) ENGINE = InnoDB;
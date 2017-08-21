CREATE TABLE wga_ntwc_participant_writer(
    wga_ntwc_id          INTEGER      NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_participant_writer PRIMARY KEY (wga_ntwc_id, contact_id),
    CONSTRAINT fk_wga_ntwc_participant_writer_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id),
    CONSTRAINT fk_wga_ntwc_participant_writer_contact  FOREIGN KEY (contact_id)  REFERENCES contact  (id)
) ENGINE = InnoDB;
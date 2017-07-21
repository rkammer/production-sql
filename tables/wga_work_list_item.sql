CREATE TABLE wga_work_list_item(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_work_list_id     INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_work_list_item_id                 PRIMARY KEY (id),
    CONSTRAINT fk_wga_work_list_item_wga_work_list_item FOREIGN KEY (wga_work_list_id) REFERENCES wga_work_list (id)
) ENGINE = InnoDB;
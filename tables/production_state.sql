CREATE TABLE production_state(
    production_id       INTEGER NOT NULL,
    state_id            INTEGER NOT NULL,
    created             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by          VARCHAR(30),
    updated             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by          VARCHAR(30),
    status              VARCHAR(30),
    CONSTRAINT pk_production_state            PRIMARY KEY (production_id, state_id),
    CONSTRAINT fk_production_state_production FOREIGN KEY (production_id) REFERENCES production (id),
    CONSTRAINT fk_production_state_state      FOREIGN KEY (state_id)      REFERENCES state      (id)
) ENGINE = InnoDB;
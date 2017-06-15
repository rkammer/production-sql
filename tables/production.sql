CREATE TABLE production(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    network_id INTEGER     NOT NULL,
    logo_path  VARCHAR(120),
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_production_id      PRIMARY KEY (id)
    CONSTRAINT fk_production_network FOREIGN KEY (network_id) REFERENCES network (id)
);
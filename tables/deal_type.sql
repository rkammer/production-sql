CREATE TABLE deal_type(
    id              INTEGER      NOT NULL AUTO_INCREMENT,
    abreviation     CHAR(2),
    name            CHAR(50),
    created         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_deal_type_id    PRIMARY KEY (id)
);


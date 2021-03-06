CREATE TABLE business_type(
    id              INTEGER      NOT NULL AUTO_INCREMENT,
    name            VARCHAR(50)  NOT NULL,
    created         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_business_type_id    PRIMARY KEY (id)
);
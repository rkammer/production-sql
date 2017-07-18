CREATE TABLE field_work(
    id              INTEGER     NOT NULL AUTO_INCREMENT,
    abreviation     CHAR(2)     NOT NULL,
    name            VARCHAR(50) NOT NULL,
    created         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_field_work_id    PRIMARY KEY (id)
);
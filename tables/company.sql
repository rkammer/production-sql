CREATE TABLE company(
    id              INTEGER      NOT NULL AUTO_INCREMENT,
    name            VARCHAR(50)  NOT NULL,
    address         VARCHAR(100),
    city            VARCHAR(100),
    state_code      CHAR(2),
    phone           VARCHAR(20),
    website         VARCHAR(100),
    logo_path       VARCHAR(120),
    created         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_company_id    PRIMARY KEY (id),
    CONSTRAINT fk_company_state FOREIGN KEY (state) REFERENCES state (code)
);
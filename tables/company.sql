CREATE TABLE company(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    zipcode              VARCHAR(9),
    phone                VARCHAR(20),
    faxnumber            VARCHAR(20),
    email                VARCHAR(100),
    website              VARCHAR(100),
    logo_path            VARCHAR(120),
    wga_company_number   VARCHAR(50),
    media_company        CHAR(1) NOT NULL DEFAULT 'F',
    production_company   CHAR(1) NOT NULL DEFAULT 'F',
    payroll_company      CHAR(1) NOT NULL DEFAULT 'F',
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_company_id    PRIMARY KEY (id),
    CONSTRAINT fk_company_state FOREIGN KEY (state_code) REFERENCES state (code)
) ENGINE = InnoDB;